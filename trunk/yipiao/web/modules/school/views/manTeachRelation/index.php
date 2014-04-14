<script type="text/javascript">
$(function(){
	var $grid_teachrelation = $('#man_terchrelation_grid');
	var gradeid = 0;
	
	var editindex = -1;
	var subject_combobox_data_ex;
	var teacher_combobox_data_ex;
	var classids_combotree_data;
	
	//载入初始数据
	$.ajax({            
	    type:"POST",   //post提交方式默认是get
	    url: '<?php echo $this->createUrl('getclass'); ?>',
	    dataType:"json",    
	    data:{SchoolID: ypschoolid},  
	    error:function(err) {      // 
			fun_showMsg('提示','班级数据请求失败('+JSON.stringify(err)+')');
	    },
	    success:function(resp) {
	    	if(resp.success)
	        {
	    		classids_combotree_data = resp.data;
	    		$('#man_ter_clacombotree').combotree('loadData',classids_combotree_data);
	    		
	    		$.ajax({            
	    		    type:"POST",   //post提交方式默认是get
	    		    url: '<?php echo $this->createUrl('getsubject'); ?>',
	    		    dataType:"json",
	    		    data:{SchoolID: ypschoolid},  
	    		  //  async:false,         
	    		    error:function(err) {      // 
	    				fun_showMsg('提示','科目数据请求失败('+JSON.stringify(err)+')');
	    		    },
	    		    success:function(resp) {
	    		    	if(resp.success)
	    		        {	
	    		    		$('#man_ter_subcombobox').combobox('loadData',resp.data);
	    		    		subject_combobox_data_ex = resp.data;
	    		    		var temp= {
	    		    			      "id": "",
	    		    			      "text": "无"
	    		    			    };
	    		    		subject_combobox_data_ex.push(temp);   		
	    		    		
	    		    		$grid_teachrelation.datagrid({   
	    		    			border:true,
	    		    			pagination:true,
	    		    			pageList:[400,600,800,1000],
	    		    			pageSize:400,
	    		    			fit: true,
	    		    			striped:true,
	//    		    			singleSelect:true,
	    		    			idField:'teachid',
	    		    		    toolbar: '#man_terchrelation_tb',   
	    		    		    columns:[[
	        
	    		    				{field: 'teachid', title: '授课ID', width: 10,hidden:true},
	    		    				{field: 'classid', title: '班级', width: 180,
	        	    		    		formatter : function(text){  
		        		            		var temp = '';
		        		            		var isfirst = 1;
		        		            		var iscompair = 0;
		        							var arr = text.split(',');
		        		            		for(var k = 0 ;k <arr.length ; k++)
		        		            		{
		        		            			iscompair = 0;
		        		            			for(var i=0; i< classids_combotree_data.length; i++)
		        		            			{
		        		            				for(var j=0; j< classids_combotree_data[i].children.length; j++)
		        		            				{
		        		            					if (classids_combotree_data[i].children[j].id == arr[k]) 
		        		            					{
		        		            						iscompair = 1;
		        			            					if(1 == isfirst)
		        			            					{
		        			            						isfirst = 0;
		        			            						temp =  classids_combotree_data[i].children[j].text;
		        			            					}else
		        				            					temp =  temp+','+classids_combotree_data[i].children[j].text;
		        											break;
		        		            					}
		        			            			}
		        			            			if(1 == iscompair)
		        				            			break;
		        		            			}
		        		            		}
		        		                    return temp;  
		        	            		}
		        		            },	
		        		            {field: 'subjectid', title: '科目', width: 120,
	                					formatter : function(text){  
	        		                    	for(var i=0; i< subject_combobox_data_ex.length; i++){  
	        			                        if (subject_combobox_data_ex[i].id == text) 
	        			                            return subject_combobox_data_ex[i].text;  
	        			                    }  
	        			                    return text;  
	        		            		}
		        		            },
	    		    				{field: 'uid', title: '任课教师', width: 120,
		        		            	formatter : function(text){  
	        		                    	for(var i=0; i< teacher_combobox_data_ex.length; i++){  
	        			                        if (teacher_combobox_data_ex[i].id == text) 
	        			                            return teacher_combobox_data_ex[i].text;  
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
	                                            data: teacher_combobox_data_ex,
	                                            panelHeight: 'auto'
	                                        }
		        		            	}
	    							},   											            				            	
	    		    				{field:'action',title:'操作',width:80,align:'center',
	                                        formatter:function(value,row,index){
	                                            if (row.editing){
	                                                var s = '<a href="#" style="color:red" onclick="saverow('+index+')">保存</a> ';
	                                                var c = '<a href="#" style="color:red" onclick="cancelrow('+index+')">取消</a>';
	                                                return s+c;
	                                            } else {
	                                                var e = '<a href="#" style="color:red" onclick="editrow('+index+')">修改</a> ';
	                                                
	                                                return e;
	                                            }
	                                        }
	                                    }						                            												
	    		    			]],
	    		    			onBeforeEdit:function(index,row){
	    		    			    row.editing = true;
	    		    			    $grid_teachrelation.datagrid('refreshRow', index);
	    		    			},
	    		    			onAfterEdit:function(index,row){
	    		    			    row.editing = false;
	    		    			    $grid_teachrelation.datagrid('refreshRow', index);
	    		    			},
	    		    			onCancelEdit:function(index,row){
	    		    			    row.editing = false;
	    		    			    $grid_teachrelation.datagrid('refreshRow', index);
	    		    			}
	    		    		}); 
	    		    		
	    		    		
	    		        }else
	    		        	fun_showMsg('提示','获取科目数据错误('+resp.msg+')');
	    		    }            
	    		});
	        }else
	        	fun_showMsg('提示','获取班级数据错误('+resp.msg+')');
	    }            
	});
	
	editrow = function (index){
		if(-1 != editindex)
		{
			$grid_teachrelation.datagrid('cancelEdit', editindex);
			$grid_teachrelation.datagrid('selectRow',editindex);
			var row = $grid_teachrelation.datagrid('getSelected');
			$grid_teachrelation.datagrid('unselectRow',editindex);
			
		}
		editindex = index;
		$grid_teachrelation.datagrid('beginEdit', index);
		$grid_teachrelation.datagrid("selectRow", index);
	};
	cancelrow = function (index){
		$grid_teachrelation.datagrid('cancelEdit', index);
		editindex = -1;
	};
	
	/*
	 * 以下涉及后台操作
	 */
	saverow = function (index){	
		var classid = $grid_teachrelation.datagrid('getSelected')['classid'];
		var subjectid = $grid_teachrelation.datagrid('getSelected')['subjectid'];
		var ed_uid = $grid_teachrelation.datagrid('getEditor', {index:index,field:'uid'});
		$.ajax({            
	        type:"POST",   //post提交方式默认是get
	        url: '<?php echo $this->createUrl('updaterelation'); ?>', 
	        dataType:"json",
	        data: {classid :  classid,
	        	subjectid : subjectid,
	        	uid : $(ed_uid.target).combobox('getValues').join(',')
	        },            
	        error:function(err) {      // 
				fun_showMsg('提示','数据请求失败('+JSON.stringify(err)+')');
				$grid_teachrelation.datagrid('reload');
	        },
	        success:function(resp) {
	            if(resp.success)
	            {
		            $grid_teachrelation.datagrid('reload');;
		            $grid_teachrelation.datagrid('endEdit', index);
		            $grid_teachrelation.datagrid('unselectRow', index);
		            editindex = -1;
	            }
	            fun_showMsg('提示',resp.msg);
	        }            
	  	}); 
	};
	queryteachrelation = function (){
		if(!$('#man_ter_clacombotree').combotree('isValid'))
		{
			fun_showMsg('提示','班级不能为空，请修改!');
			return;
		}
		if(!$('#man_ter_subcombobox').combotree('isValid'))
		{
			fun_showMsg('提示','科目不能为空，请修改!');
			return;
		}
		$grid_teachrelation.datagrid('loadData',{total:0,rows:[]});
		$.messager.progress({
			title : '提示',
			text : '数据查询中，请稍后....'
		}); 
		$.ajax({            
			  type:"POST",   //post提交方式默认是get
			  url: '<?php echo $this->createUrl('getteacher'); ?>',
			  dataType:"json",
			 // async:false,    
			  data:{ClassID: $('#man_ter_clacombotree').combotree('getValues').join(','),
				  SubjectID: $('#man_ter_subcombobox').combobox('getValues').join(',')
				  }, 
			  error:function(err) {      // 
			  	$.messager.progress('close');
				fun_showMsg('提示','教师数据请求失败('+JSON.stringify(err)+')');
			  },
			  success:function(resp) {
				  $.messager.progress('close');
			      if(resp.success)
			      {
			    	  	teacher_combobox_data_ex = resp.data2;

			    	  	$grid_teachrelation.datagrid('removeEditor', 'uid');
			    	  	$grid_teachrelation.datagrid('addEditor', [
			    	  	  { field : 'uid',
				    	  	   editor : {
                                   type:'combobox',  
                                   options:{  
                                       valueField:'id',  
                                       textField:'text',
                                       editable: false,  
                                       multiple: false, 
                                       data: teacher_combobox_data_ex,
                                       panelHeight: 'auto'
                                   } 
			    	  	  		}
				    	  }
				    	]);
				    	$grid_teachrelation.datagrid('loadData',resp.data);
			      }else
			      	fun_showMsg('提示','获取教师数据错误('+resp.msg+')');
			  }            
		});
	};
	importfile = function (){
		$('#fileupload').fileupload({
			add: function (e, data) { 
				data.submit(); 
				$.messager.progress({
					title : '提示',
					text : '数据导入中，请稍后....'
				}); 
			},
	        url: '<?php echo $this->createUrl('import'); ?>',
	        dataType: 'json',
	  //      formData:{ClassID: $('#man_stu_clacombotree').combotree('getValues').join(',')},//如果需要额外添加参数可以在这里添加   
	        done: function (e, data) {
		  		$.messager.progress('close');
		  		$.messager.show({  
		  	        title: '提示',  
		  	        msg: data.result.msg,  
		  	        showType:'slide',
		  	        height : 'auto',
		  	        style:{
		  				right:'',
		  				top:document.body.scrollTop+document.documentElement.scrollTop,
		  				bottom:''
		  			}
		  	    });		
			//	fun_showMsg('提示',data.result.msg);
	        }
	    }).prop('disabled', !$.support.fileInput)
	        .parent().addClass($.support.fileInput ? undefined : 'disabled');
	};

	exportfile = function (){
 //       $("#form").attr('action', '<?php echo $this->createUrl("/school/manTeacher/export"); ?>');
   //     $("#form").submit();
	};
});
</script>
<table id="man_terchrelation_grid"></table>
<div id="man_terchrelation_tb" style="padding:5px;height:auto">   
	<div style="margin-bottom:5px">    
		年级/班级: 
		<input class="easyui-combotree"   
            id="man_ter_clacombotree"  
            style="width:180px;height:26px;"
            data-options="  
            		valueField:'id',
                    textField:'text', 
                    multiple: false , 
                    required :true,
                    panelHeight:'auto',
                    onLoadSuccess : function(node, data){
                    	for(var i=0;i < data.length;i++)
                    	{
                    		if(data[i].selected)
                    		{
                    			$('#man_ter_clacombotree').combotree('setValue', data[i].id);
                    			return;
                    		}
                    		for(var j=0;j < data[i].children.length;j++ )
                    		{
                    			if(data[i].children[j].selected)
                    			{
                    				$('#man_ter_clacombotree').combotree('setValue', data[i].children[j].id);
                    				return;
                    			}
                    		}
                    	}
                    }
            ">
	    &nbsp;&nbsp;科目: 
	    <input class="easyui-combobox"   
            id="man_ter_subcombobox"  
            style="width:100px;height:26px;"
            data-options="  
                    valueField:'id',  
                    textField:'text',  
                    editable:false,
                    required :true,
                    multiple:false,  
                    panelHeight:'auto'  
            "> 
	    <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="queryteachrelation()">查询</a>
	    &nbsp;&nbsp;
	    <a href="./static/download/授课导入模板.xlsx" class="easyui-linkbutton" iconCls="" >模板下载</a>  
	    &nbsp;&nbsp;文件上传:  
	    <span class="btn btn-success fileinput-button">
            <i class="icon-plus icon-white"></i>
            <span>选择</span>
            <!-- The file input field used as target for the file upload widget -->
            <input id="fileupload" type="file" name="userfile" onclick="importfile()">
        </span> 
    </div>
</div>
