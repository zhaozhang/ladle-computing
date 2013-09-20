<script type="text/javascript">
$(function(){
	
	var $grid_exam = $('#man_exam_grid');
	var $grid_subject = $('#man_exa_subject_grid');
	var examid = 0;
	var gradeid_combobox_data;
	var subjectid_combobox_data;
	
	var editexamindex = -1;
	var editsubjectindex = -1;

	
	//载入数据
	$.ajax({            
		type:"POST",   //post提交方式默认是get
		url: '<?php echo $this->createUrl('getgrade'); ?>',
		dataType:"json",
	 // async:false,     
		data:{SchoolID: ypschoolid},  
		error:function(err) {      // 
			fun_showMsg('提示','年级数据请求失败('+JSON.stringify(err)+')');
	  	},
	  	success:function(resp) {
	    	if(resp.success)
	    	{
				gradeid_combobox_data = resp.data;
	    		$('#man_exa_gracombobox').combobox('loadData',gradeid_combobox_data);  
	    		$grid_exam.datagrid({   
	    	        border:false,
	    	        pagination:true,
	    	        pageSize:50,
	    	        fit: true,
	    	        singleSelect:true,
	    	        idField:'examid',
	    	        toolbar: '#man_exam_tb',
	    	            columns:[[
	    	        	{field: 'examid', title: '考试ID', width: 10,hidden:true},
	    	        	{field: 'fromexamid', title: '考试ID', width: 10,hidden:true},
	    	        	{field: 'schoolid', title: '学校ID', width: 10,hidden:true},
	    	        	{field: 'examname', title: '考试名称', width: 120,
	    	        		editor:{
	    	        			type:'validatebox',
	    	        			options:{
	    	        			 	required:true
	    	        			}
	    	        		}
	    	        	},
	    	        	{field: 'examtime', title: '考试时间', width: 120,
	    	        		editor:{
	    	            		type:'datebox',
	    	            		options:{
	    	        				editable: false,  
	    	        				required:true
	    	             		}
	    	        		}
	    	        	}, 
	    	        	{field: 'gradeid', title: '年级', width: 120,
	    	        		formatter : function(text){  
	    	        		 	for(var i=0; i< gradeid_combobox_data.length; i++){  
	    	                        if (gradeid_combobox_data[i].id == text) 
	    	        	                return gradeid_combobox_data[i].text;  
	    	                    }  
	    	                    return text;  
	    	            	},
	    	                  editor:{
	    	                        type:'combobox',  
	    	                        options:{  
	    	                            valueField:'id',
	    	                            textField:'text',  
	    	                            editable: false,  
	    	                            multiple: false, 
	    	                            required:true,
	    	                            data: gradeid_combobox_data,
	    	                            panelHeight: 'auto'
	    	                        }
	    	                }
	    	        	},
	    	        	{field: 'type', title: '文理类型', width: 70,
	    	        		formatter : function(text){  
	    	                    for(var i=0; i< data_classtype.length; i++){  
	    	                        if (data_classtype[i].id == text) 
	    	        	                return data_classtype[i].text;  
	    	                    }  
	    	                    return text;  
	    	            	},
	    	              	editor:{  
	    	                    type:'combobox',  
	    	                    options:{  
	    	            			multiple:false,  
	    	            			editable: false,  
	    	                        valueField:'id',  
	    	                        textField:'text',  
	    	                 	    data : data_classtype,  
	    	                        required:true ,
	    	                        panelHeight: 'auto'
	    	                    }
	    	                }
	    	        	},
	    	       /* 	{field: 'Rank1', title: '一本参考排名', width: 85,
	    	        		editor:{
	    	            		type:'numberbox',
	    	            		options:{
	    	        				min:0,   
	    	        	    		precision:0
	    	             		}
	    	        		}
	    	        	},
	    	        	{field: 'Rank2', title: '二本参考排名', width: 85,
	    	        		editor:{
	    	            		type:'numberbox',
	    	            		options:{
	    	        				min:0,   
	    	        	    		precision:0
	    	             		}
	    	        		}
	    	        	},
	    	        	{field: 'Rank3', title: '三本参考排名', width: 85,
	    	        		editor:{
	    	            		type:'numberbox',
	    	            		options:{
	    	        				min:0,   
	    	        	    		precision:0
	    	             		}
	    	        		}
	    	        	},*/
	    	        	{field:'action',title:'操作',width:120,align:'center',
	    	                    formatter:function(value,row,index){
	    	                        if (row.editing){
	    	                            var s = '<a href="#" style="color:red" onclick="saverow('+index+',0,'+row.examid+',0)">保存</a> ';
	    	                            var c = '<a href="#" style="color:red" onclick="cancelrow('+index+',0,'+row.examid+')">取消</a>  ';
	    	                            return s+c;
	    	                        } else {
	    	                            var e = '<a href="#" style="color:red" onclick="editrow('+index+',0)">修改</a> ';
	    	                            var d = '<a href="#" style="color:red" onclick="deleterow('+index+','+row.examid+')">删除</a>  ';
	    	                            var r = '<a href="#" style="color:red" onclick="editsubject('+index+')">编辑科目</a>';
	    	                            return e+d+r;
	    	                        }
	    	                    }
	    	                }
	    	        ]],
	    	        onBeforeEdit:function(index,row){
	    	            row.editing = true;
	    	            $grid_exam.datagrid('refreshRow', index);
	    	        },
	    	        onAfterEdit:function(index,row){
	    	            row.editing = false;
	    	            $grid_exam.datagrid('refreshRow', index);
	    	        },
	    	        onCancelEdit:function(index,row){
	    	            row.editing = false;
	    	            $grid_exam.datagrid('refreshRow', index);
	    	        },
	    	        onClickRow:function(){
	    	        	$('#man_exam_layout').layout('collapse', 'east');
	    	        }
	    	    });  		
	      	}else
	      		fun_showMsg('提示','获取年级数据错误('+resp.msg+')');
	  	}            
	});
	queryexam = function(){
		if(!$('#man_exa_gracombobox').combobox('isValid'))
		{
			fun_showMsg('提示','年级不能为空，请修改!');
			return;
		};
		$grid_exam.datagrid('loadData',{total:0,rows:[]});
		$.ajax({            
			type:"POST",   //post提交方式默认是get
			url: '<?php echo $this->createUrl('getexam'); ?>',
			dataType:"json",
		 // async:false,     
			data:{SchoolID: ypschoolid,
				GradeID: $('#man_exa_gracombobox').combobox('getValue'),
				Type:	 $('#man_exa_typecombobox').combobox('getValue')
			},  
			error:function(err) {      // 
				fun_showMsg('提示','考试数据请求失败('+JSON.stringify(err)+')');
		  	},
		  	success:function(resp) {
		    	if(resp.success)
		    	{
		    		$grid_exam.datagrid('loadData',resp.data);
		      	}else
		      		fun_showMsg('提示','获取考试数据错误('+resp.msg+')');
		  	}            
		});
	};
	editsubject = function (index) {
		//得先选上才能获取到值,居然不能根据index获取row
		var queryexamid;
		$grid_exam.datagrid("selectRow",index);
		var row = $grid_exam.datagrid('getSelected');
	    if (examid == row.examid) {
	        return;
	    }
	    examid = row.examid;
	    queryexamid = examid;
	    if(row.fromexamid != 0)
	    	queryexamid = row.fromexamid;
	    var $layout = $('#man_exam_layout');
	    var east = $layout.layout('panel', 'east');
	
	    east.panel("setTitle", row.examname + "包含科目");
	
	    if (!$grid_subject.data('datagrid')) {
	        $grid_subject.datagrid({
	        	border:false,
	        	rowStyler:function(index,row){           
	        		if (1 == row.isuse ){               
	            		return 'background-color:#8FBC8F;';           
	            	}       
	        	},
	        	singleSelect:true,
	        	pagination:true,
	        	pageSize:20,
	        	fit: true,
	        	idField:'subjectid',
	            columns: [[
					{field: 'examid', title: '考试ID', width: 10,hidden:true},
	               	{field: 'subjectid', title: '科目ID', width: 10,hidden:true},
	            	{field: 'subjectname', title: '科目名称', width: 70},
	            	{field: 'state', title: '是否选择', width: 65,
	        	   		formatter : function(text){  
		                    for(var i=0; i< data_is.length; i++){  
		                        if (data_is[i].id == text) 
		                            return data_is[i].text;  
		                    }
		                    return text;  
		            	},
		    		    editor:{  
		                	type:'combobox',  
		                    options:{  
		                    	valueField:'id',  
		                    	textField:'text',  
		                        data : data_is,  
		                        required:true ,
		                        editable: false,
		                        panelHeight: 'auto'
		                	}
		             	}
		            },		
	            	{field: 'fullscore', title: '总分', width: 50,
						editor:{
			    			type:'numberbox',
			    			options:{
								min:0,   
					    		precision:0,
					    		required:true 
			     			}
						}
					},		
	            	{field: 'passscore', title: '及格分数', width: 70,
						editor:{
			    			type:'numberbox',
			    			options:{
								min:0,   
					    		precision:0,
					    		required:true 
			     			}
						}
					},		
	            	{field: 'scorerange', title: '分数区间设置', width: 220,
						editor:{
		        			type:'validatebox',
		        			options:{
	
		         			}
		    			}
			        },	
	            	{field:'action',title:'操作',width:80,align:'center',
	                        formatter:function(value,row,index){
	                            if (row.editing){
	                                var s = '<a href="#" style="color:red" onclick="saverow('+index+',1,'+row.subjectid+','+row.examid+')">保存</a> ';
	                                var c = '<a href="#" style="color:red" onclick="cancelrow('+index+',1,'+row.subjectid+')">取消</a>';
	                                return s+c;
	                            } else {
	                                var e = '<a href="#" style="color:red" onclick="editrow('+index+',1)">修改</a> ';
	                                return e;
	                            }
	                        }
	                    }
	            ]],
	            onBeforeEdit:function(index,row){
	        	    row.editing = true;
	        	    $grid_subject.datagrid('refreshRow', index);
	        	},
	        	onAfterEdit:function(index,row){
	        	    row.editing = false;
	        	    $grid_subject.datagrid('refreshRow', index);
	        	},
	        	onCancelEdit:function(index,row){
	        	    row.editing = false;
	        	    $grid_subject.datagrid('refreshRow', index);
	        	}
	        });
	    }else
	   		$grid_subject.datagrid('loadData',{total:0,rows:[]});
			
	    $.ajax({            
	        type:"POST",   //post提交方式默认是get
	        url: '<?php echo $this->createUrl('getsubject'); ?>',
	        dataType:"json",
	       // async:false,     
	        data: {ExamID: queryexamid},
	        error:function(err) {      // 
	    		fun_showMsg('提示','科目数据请求失败('+JSON.stringify(err)+')');
	        },
	        success:function(resp) {
	            if(resp.success)
	            {
	            	$('#man_exam_layout').layout('expand', 'east'); 
	    	    	$grid_subject.datagrid('loadData',resp.data);
	            }else
	            	fun_showMsg('提示','获取科目数据错误('+resp.msg+')');
	        }            
	    });
	};
	addexamrow = function (){
		$grid_exam.datagrid('appendRow',{
			  examid: '0',
		      fromexamid : '0',
		      schoolid: ypschoolid ,
		      examname: '',
		      examtime: '<?php echo date('Y-m-d'); ?>',
		      gradeid: '',
		      type: '0',
		      Rank1: '',
		      Rank2: '',
		      Rank3: ''
			}
		);
		options = $grid_exam.datagrid('getPager').data("pagination").options;
		number = options.total;	
		$grid_exam.datagrid('beginEdit',number-1);
		$grid_exam.datagrid("selectRow",number-1);
		if(-1 != editexamindex)
		{
			$grid_exam.datagrid('cancelEdit', editexamindex);
		}	
		editexamindex = number-1;
	};
	copexamyrow = function (){
		var ids = [];  
	    var row = $grid_exam.datagrid('getSelected');  
	    if(row)
	    {	
			$grid_exam.datagrid('appendRow',{
				  examid: '0',
			      fromexamid : row.examid ,
			      schoolid: row.schoolid ,
			      examname: '',
			      examtime: '<?php echo date('Y-m-d'); ?>',
			      gradeid: row.gradeid,
			      type: row.type,
			      Rank1: row.Rank1,
			      Rank2: row.Rank2,
			      Rank3: row.Rank3
				}
			);
			options = $grid_exam.datagrid('getPager').data("pagination").options;
			number = options.total;	
			$grid_exam.datagrid('beginEdit',number-1);
			$grid_exam.datagrid("selectRow",number-1);
			if(-1 != editexamindex)
			{
				$grid_exam.datagrid('cancelEdit', editexamindex);
			}	
			editexamindex = number-1;
	    }else
	    	fun_showMsg('提示','请先选择您要复制的考试数据!');
	};
	editrow = function (index,type){
		var $grid_temp;
		if(0 == type )//考试
		{
			$grid_temp = $grid_exam;
			if(-1 != editexamindex)
			{
				$grid_temp.datagrid('cancelEdit', editexamindex);
				$grid_temp.datagrid('selectRow',editexamindex);
				var row = $grid_temp.datagrid('getSelected');
				$grid_temp.datagrid('unselectRow',editexamindex);			
				if( '0' == row.examid )
				{
					$grid_temp.datagrid('deleteRow', editexamindex);
				}
			}		
			editexamindex = index;
			$grid_temp.datagrid("selectRow", index);
		}else if(1 == type)//科目
		{
			$grid_temp = $grid_subject;
			if(-1 != editsubjectindex)
			{
				$grid_temp.datagrid('cancelEdit', editsubjectindex);
				$grid_temp.datagrid('selectRow',editsubjectindex);
				var row = $grid_temp.datagrid('getSelected');
				$grid_temp.datagrid('unselectRow',editsubjectindex);
			}		
			editsubjectindex = index;
		}		
		$grid_temp.datagrid('beginEdit', index);
	};
	cancelrow = function (index,type,id){
		var $grid_temp;
		if(0 == type )//
		{
			$grid_temp = $grid_exam;
			editexamindex = -1;
		}
		else if(1 == type )
		{
			$grid_temp = $grid_subject;
			editsubjectindex = -1;
		}
			
		$grid_temp.datagrid('cancelEdit', index);
		//对于新加行，没有编辑保存的直接删除
		if(0 == id)
		{
			$grid_temp.datagrid('deleteRow', index);
		}
	};
	
	/*
	 * 以下涉及后台操作
	 */
	deleterow = function (index,id){
		var grid_temp;
	
		$grid_temp = $grid_exam;
		if(-1 != editexamindex)
		{
			$grid_temp.datagrid('cancelEdit', editexamindex);
			$grid_temp.datagrid('selectRow',editexamindex);
			var row = $grid_temp.datagrid('getSelected');
			$grid_temp.datagrid('unselectRow',editexamindex);			
			if( '0' == row.examid )
			{
				$grid_temp.datagrid('deleteRow', editexamindex);
			}
		}		
		editexamindex = -1;
	    $.messager.confirm('提示','您确定要删除吗?',function(r){
	        if (r){
	        	$.ajax({            
	                type:"POST",   //post提交方式默认是get
	                    url: '<?php echo $this->createUrl('deleteexam'); ?>',
	                dataType:"json",
	                data:  { ExamID : id},      
	                error:function(err) {      // 
	        			fun_showMsg('提示','数据请求失败('+JSON.stringify(err)+')');
	                },
	                success:function(resp) {
	                	if(resp.success)
		                {
		                	$grid_exam.datagrid('deleteRow', index);
		                }
	                	fun_showMsg('提示',resp.msg);
	                    $grid_subject.datagrid('loadData',{total:0,rows:[]}); 
	                }            
	          	});       	
	        }
	    });
	};
	saverow = function (index,type,id,idex){
		var $grid_temp;
		var postdata = {};
		var method = '';
	    var posturl = '';
		if(0 == type )//考试
		{
			$grid_temp = $grid_exam;
			var ed_examname = $grid_temp.datagrid('getEditor', {index:index,field:'examname'});
			var ed_examtime = $grid_temp.datagrid('getEditor', {index:index,field:'examtime'});
			var ed_gradeid = $grid_temp.datagrid('getEditor', {index:index,field:'gradeid'});
			var ed_type = $grid_temp.datagrid('getEditor', {index:index,field:'type'});
			var ed_Rank1 = $grid_temp.datagrid('getEditor', {index:index,field:'Rank1'});
			var ed_Rank2 = $grid_temp.datagrid('getEditor', {index:index,field:'Rank2'});
			var ed_Rank3 = $grid_temp.datagrid('getEditor', {index:index,field:'Rank3'});	
			if(!$(ed_examname.target).validatebox('isValid'))
			{
				fun_showMsg('提示','考试名称不能为空，请修改!');
				return;
			}		
			if(!$(ed_gradeid.target).combo('isValid'))
			{
				fun_showMsg('提示','年级不能为空，请修改!');
				return;
			}			
			postdata = {SchoolID: ypschoolid ,
						ExamID: id ,
						ExamName: $(ed_examname.target).val(),
						ExamTime: $(ed_examtime.target).combobox('getValues').join(','),
						GradeID: $(ed_gradeid.target).combobox('getValues').join(','),
						Type: $(ed_type.target).combobox('getValues').join(','),
						Rank1 : $(ed_Rank1.target).val(),
						Rank2 : $(ed_Rank2.target).val(),
						Rank3 : $(ed_Rank3.target).val()
			};
	        post_url = '<?php echo $this->createurl('updateexam'); ?>';
		}
		else if(1 == type)//科目
		{
			$grid_temp = $grid_subject;
			var ed_isuse = $grid_temp.datagrid('getEditor', {index:index,field:'state'});
			var ed_fullscore = $grid_temp.datagrid('getEditor', {index:index,field:'fullscore'});
			var ed_passscore = $grid_temp.datagrid('getEditor', {index:index,field:'passscore'});
			var ed_scorerange = $grid_temp.datagrid('getEditor', {index:index,field:'scorerange'});
	
			if(!$(ed_fullscore.target).validatebox('isValid'))
			{
				fun_showMsg('提示','总分不能为空，请修改!');
				return;
			}
			if(!$(ed_passscore.target).validatebox('isValid'))
			{
				fun_showMsg('提示','及格分数不能为空，请修改!');
				return;
			}
			postdata = {ExamID :idex ,
						SubjectID: id ,
						State: $(ed_isuse.target).combobox('getValues').join(','),
						FullScore: $(ed_fullscore.target).val(),
						PassScore: $(ed_passscore.target).val(),
						ScoreRange: $(ed_scorerange.target).val()
						};
			
	        post_url = '<?php echo $this->createurl('updatesubject'); ?>';
		}
		$.ajax({            
	        type:"POST",   //post提交方式默认是get
	        url: post_url, 
	        dataType:"json",
	        data:  postdata,            
	        error:function(err) {      // 
				fun_showMsg('提示','数据请求失败('+JSON.stringify(err)+')');
				$grid_temp.datagrid('reload');
	        },
	        success:function(resp) {
	            if(resp.success)
	            {
		            $grid_temp.datagrid('reload');
		            
		            if(0 == type )//
		            {	
		            	row = $grid_temp.datagrid('getSelected');
			            if(row.examid == 0)
			            {
			            	row.examid = resp.data.id;
			            }
		            }
		            $grid_temp.datagrid('endEdit', index);
		            $grid_temp.datagrid('unselectRow', index);
	            }
	            fun_showMsg('提示',resp.msg);
	        }            
	  	}); 
	};
});
</script>

<div class="easyui-layout" fit="true" id='man_exam_layout' >
    <div region="center" title="考试"  split=true style="padding:2px;">
        <table id="man_exam_grid"></table>
        <div id="man_exam_tb" style="padding:5px;height:auto">   
			<div style="margin-bottom:5px">    
				年级: 
				<input class="easyui-combobox"   
		            id="man_exa_gracombobox"  
		            style="width:180px;"
		            data-options="  
		            		valueField:'id',
		                    textField:'text', 
		                    multiple: false, 
		                    required :true,
		                    panelHeight:'auto'
		            ">
				&nbsp;&nbsp;类别: 
			    <input class="easyui-combobox" 
			    		id="man_exa_typecombobox"  
			    		style="width:100px;"
			    		data-options="  
		            		valueField:'id',
		                    textField:'text', 
		                    multiple: false, 
		                    data : data_classtype,
		                    required : false,
		                    panelHeight:'auto'
			    	">
			    <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="queryexam()">查询</a>  
		    </div>
		    <div>
		    	<a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-add" onclick="addexamrow()">新增考试</a> 
		    	<a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-add" onclick="copexamyrow()">复制考试</a> 	
		    </div>
		</div>
    </div>
    <div region="east"  title="科目" style="width:600px;padding:2px;"  collapsed=true>
        <table id="man_exa_subject_grid"></table>
    </div>
</div>



