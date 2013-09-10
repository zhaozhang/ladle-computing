<script type="text/javascript">
$(function(){
	var $grid_teacher = $('#man_teacher_grid');
	var gradeid = 0;
	
	var editindex = -1;
	var subject_combobox_data_ex;
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
	    		$('#man_tea_clacombotree').combotree('loadData',classids_combotree_data);
	    		
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
	    		    		$('#man_tea_subcombobox').combobox('loadData',resp.data);
	    		    		subject_combobox_data_ex = resp.data;
	    		    		var temp= {
	    		    			      "id": "",
	    		    			      "text": "无"
	    		    			    };
	    		    		subject_combobox_data_ex.push(temp);   		
	    		    		
	    		    		$grid_teacher.datagrid({   
	    		    			border:true,
	    		    			pagination:true,
	    		    			pageList:[400,600,800,1000],
	    		    			pageSize:400,
	    		    			fit: true,
	    		    			checkbox : true,
	//    		    			singleSelect:true,
	    		    			idField:'uid',
	    		    		    toolbar: '#man_teacher_tb',   
	    		    		    columns:[[
	    		    				{field: 'ck', checkbox:true},      
	    		    				{field: 'uid', title: '用户ID', width: 10,hidden:true},
	    		    				{field: 'name', title: '姓名', width: 120,
	        		    				editor:{
	        								type:'validatebox',
	        								options:{
	         									required:true
	         								}
	        							}
	    							},
	    							{field: 'username', title: '用户名', width: 120,
	        		    				editor:{
	        								type:'validatebox',
	        								options:{
	         									required:true
	         								}
	        							}
	    							},
	    		    				{field: 'sex', title: '性别', width: 120,
	        		    		   		formatter : function(text){  
		        		                    for(var i=0; i< data_sex.length; i++){  
	        			                        if (data_sex[i].id == text) 
	        			                            return data_sex[i].text;  
	        			                    }  
	        			                    return text;  
	        		            		},
	        	    		        	editor:{  
	                                        type:'combobox',  
	                                        options:{  
	                                            valueField:'id',
	                                            editable: false,
	                                            textField:'text',  
	                                            data : data_sex,  
	                                            required:true ,
	                                            panelHeight: 'auto'
	                                        }
	        	                        }
	            	                },	
	    		    				{field: 'subjectid', title: '科目', width: 120,
	                					formatter : function(text){  
	        		                    	for(var i=0; i< subject_combobox_data_ex.length; i++){  
	        			                        if (subject_combobox_data_ex[i].id == text) 
	        			                            return subject_combobox_data_ex[i].text;  
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
	                                            data: subject_combobox_data_ex,
	                                            panelHeight: 'auto'
	                                        }
		        		            	}
		        		            },
	    		    				{field: 'classids', title: '任课班级', width: 180,
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
		        	            		},
		            	              	editor:{
		                                        type:'combotree',  
		                                        options:{  
		                                            valueField:'id',  
		                                            textField:'text',  
		                                            multiple:true,
		                                            editable: false,
		                                            data: classids_combotree_data,
		                                            panelHeight: 'auto',
		                                            onCheck:function(node,checked){
	                                        			//判断是否选择科目
	                                        			var ed_subjectid = $grid_teacher.datagrid('getEditor', {index:editindex,field:'subjectid'});
	                                        			if('' == $(ed_subjectid.target).combobox('getValues').join(','))
	                                        			{
	                                        				fun_showMsg('提示','请先设置任课科目，否则该项设置无效');
	                                        			}
		        	            					}
		                                        }
		        		            	}},  
	    		    				{field: 'roleid', title: '角色', width: 90,
		        		    			formatter : function(text){  
	        			                    for(var i=0; i< data_teacherrole.length; i++){  
	    				                        if (data_teacherrole[i].id == text) 
	    				                            return data_teacherrole[i].text;  
	    				                    }  
	    				                    return text;  
	    			            		},
		        		                editor:{  
		                                    type:'combobox',
		                                    options:{  
		                                        valueField:'id',  
		                                        textField:'text',  
		                                        editable: false,
		                                        multiple:false, 
		                                        data: data_teacherrole,
		                                        panelHeight: 'auto'
		                                    }
		    			            	}
		    			            },	
			    					{field: 'manclassids', title: '管理班级', width: 170,
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
		        	            		},
		            	              	editor:{
	                                        type:'combotree',  
	                                        options:{  
	                                            valueField:'id',  
	                                            textField:'text',  
	                                            multiple: true, 
	                                            editable: false,
	                                            data: classids_combotree_data,
	                                            panelHeight: 'auto',
	                                            onCheck:function(node,checked){
	                                        		var ed_roleid = $grid_teacher.datagrid('getEditor', {index:editindex,field:'roleid'});
	                                        		if('3' != $(ed_roleid.target).combobox('getValues').join(','))
	                                        		{
	                                        			fun_showMsg('提示','请先设置用户为班级管理人，否则该项设置无效');
	                                        		}
	        	            					}
	                                        }
		        		            	}
		    		    			},	
			    					{field: 'mangradeids', title: '管理年级', width: 120,
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
		        		            				if (classids_combotree_data[i].gid == arr[k]) 
		        		            				{
		        		            					iscompair = 1;
	        			            					if(1 == isfirst)
	        			            					{
	        			            						isfirst = 0;
	        			            						temp =  classids_combotree_data[i].text;
	        			            					}else
	        				            					temp =  temp+','+classids_combotree_data[i].text;
	        											break;
		        		            				}
		        		            			}
		        		            		}
		        		                    return temp;  
		        	            		},
		            	              	editor:{
	                                        type:'combobox',  
	                                        options:{  
	                                            valueField:'gid',
	                                            textField:'text',  
	                                            multiple: false,
	                                            editable: false,
	                                            data: classids_combotree_data,
	                                            panelHeight: 'auto',
	                                            onSelect:function(node){
			                                		var ed_roleid = $grid_teacher.datagrid('getEditor', {index:editindex,field:'roleid'});
			                                		if('4' != $(ed_roleid.target).combobox('getValues').join(','))
			                                		{
			                                			fun_showMsg('提示','请先设置用户为年级管理人，否则该项设置无效');
			                                		}
				            					}
	                                        }
		        		            	}
					    			},		    											            				            	
	    		    				{field:'action',title:'操作',width:80,align:'center',
	                                        formatter:function(value,row,index){
	                                            if (row.editing){
	                                                var s = '<a href="#" style="color:red" onclick="saverow('+index+','+row.uid+')">保存</a> ';
	                                                var c = '<a href="#" style="color:red" onclick="cancelrow('+index+','+row.uid+')">取消</a>';
	                                                return s+c;
	                                            } else {
	                                                var e = '<a href="#" style="color:red" onclick="editrow('+index+')">修改</a> ';
	                                                var d = '<a href="#" style="color:red" onclick="deleterow('+index+','+row.uid+')">删除</a>';
	                                                return e+d;
	                                            }
	                                        }
	                                    }						                            												
	    		    			]],
	    		    			onBeforeEdit:function(index,row){
	    		    			    row.editing = true;
	    		    			    $grid_teacher.datagrid('refreshRow', index);
	    		    			},
	    		    			onAfterEdit:function(index,row){
	    		    			    row.editing = false;
	    		    			    $grid_teacher.datagrid('refreshRow', index);
	    		    			},
	    		    			onCancelEdit:function(index,row){
	    		    			    row.editing = false;
	    		    			    $grid_teacher.datagrid('refreshRow', index);
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
	
	addteacherrow = function (){
		$grid_teacher.datagrid('appendRow',{
				uid: "0",
				name: "",
				sex: "1",
				subjectid: "",
				classids: "",
				roleid : "2",
				manclassids : "",
				mangradeids : ""
			}
		);
		options = $grid_teacher.datagrid('getPager').data("pagination").options;
		number = options.total;	
		$grid_teacher.datagrid('beginEdit',number-1);
	//	$grid_teacher.datagrid("selectRow",number-1);
		if(-1 != editindex)
		{
			$grid_teacher.datagrid('cancelEdit', editindex);
		}
		editindex = number-1;
	};
	editrow = function (index){
		if(-1 != editindex)
		{
			$grid_teacher.datagrid('cancelEdit', editindex);
			$grid_teacher.datagrid('selectRow',editindex);
			var row = $grid_teacher.datagrid('getSelected');
			$grid_teacher.datagrid('unselectRow',editindex);
			if( '0' == row.uid )
			{
				$grid_teacher.datagrid('deleteRow', editindex);
			}
		}
		editindex = index;
	
		$grid_teacher.datagrid('beginEdit', index);
	//	$grid_teacher.datagrid("selectRow", index);
	};
	cancelrow = function (index,id){
		$grid_teacher.datagrid('cancelEdit', index);
		editindex = -1;
		//对于新加行，没有编辑保存的直接删除
		if(0 == id)
		{
			$grid_teacher.datagrid('deleteRow', index);
		}
	};
	
	/*
	 * 以下涉及后台操作
	 */
	saverow = function (index,id){
	
		var ed_name = $grid_teacher.datagrid('getEditor', {index:index,field:'name'});
		var ed_username = $grid_teacher.datagrid('getEditor', {index:index,field:'username'});
		var ed_sex = $grid_teacher.datagrid('getEditor', {index:index,field:'sex'});
		var ed_subjectid = $grid_teacher.datagrid('getEditor', {index:index,field:'subjectid'});
		var ed_classids = $grid_teacher.datagrid('getEditor', {index:index,field:'classids'});
		var ed_roleid = $grid_teacher.datagrid('getEditor', {index:index,field:'roleid'});	
		var ed_manclassids = $grid_teacher.datagrid('getEditor', {index:index,field:'manclassids'});	
		var ed_mangradeids = $grid_teacher.datagrid('getEditor', {index:index,field:'mangradeids'});	
		if(!$(ed_name.target).validatebox('isValid'))
		{
			fun_showMsg('提示','姓名不能为空，请修改!');
			return;
		}
		if(!$(ed_username.target).validatebox('isValid'))
		{
			fun_showMsg('提示','用户名不能为空，请修改!');
			return;
		}
		$.ajax({            
	        type:"POST",   //post提交方式默认是get
	        url: '<?php echo $this->createUrl('updateteacher'); ?>', 
	        dataType:"json",
	        data: {UID : id,
		        SchoolID : ypschoolid,
	        	Name : $(ed_name.target).val(),
	        	UserName : $(ed_username.target).val(),
	            Sex : $(ed_sex.target).combobox('getValues').join(','),
	            SubjectID : $(ed_subjectid.target).combobox('getValues').join(','),
	            ClassIDs:$(ed_classids.target).combotree('getValues').join(','),
	            RoleID:$(ed_roleid.target).combobox('getValues').join(','),
	            ManClassIDs:$(ed_manclassids.target).combotree('getValues').join(','),
	            ManGradeIDs:$(ed_mangradeids.target).combobox('getValues').join(',')
	        },            
	        error:function(err) {      // 
				fun_showMsg('提示','数据请求失败('+JSON.stringify(err)+')');
				$grid_teacher.datagrid('reload');
	        },
	        success:function(resp) {
	            if(resp.success)
	            {
		            $grid_teacher.datagrid('reload');
		            row = $grid_teacher.datagrid('getSelected');
		            if(row.uid == 0)
			        	row.uid = resp.data.id;
		            $grid_teacher.datagrid('endEdit', index);
		            $grid_teacher.datagrid('unselectRow', index);
		            editindex = -1;
	            }
	            fun_showMsg('提示',resp.msg);
	        }            
	  	}); 
	};
	queryteacher = function (){
		$grid_teacher.datagrid('loadData',{total:0,rows:[]});
		$.ajax({            
			  type:"POST",   //post提交方式默认是get
			  url: '<?php echo $this->createUrl('getteacher'); ?>',
			  dataType:"json",
			 // async:false,    
			  data:{ClassID: $('#man_tea_clacombotree').combotree('getValues').join(','),
				  SubjectIDs: $('#man_tea_subcombobox').combobox('getValues').join(','),
				  Name: $('#man_tea_namebox').val()
				  }, 
			  error:function(err) {      // 
					fun_showMsg('提示','教师数据请求失败('+JSON.stringify(err)+')');
			  },
			  success:function(resp) {
			      if(resp.success)
			      {
				    	$grid_teacher.datagrid('loadData',resp.data);
			      }else
			      	fun_showMsg('提示','获取教师数据错误('+resp.msg+')');
			  }            
		});
	};
	deleterow = function (index,id){
		if(-1 != editindex)
		{
			$grid_teacher.datagrid('cancelEdit', editindex);
			$grid_teacher.datagrid('selectRow',editindex);
			var row = $grid_teacher.datagrid('getSelected');
			$grid_teacher.datagrid('unselectRow',editindex);
			if( '0' == row.uid )
			{
				$grid_teacher.datagrid('deleteRow', editindex);
			}
		}
		editindex = -1;	
	 	$.messager.confirm('提示','您确定要删除吗?',function(r){
	        if (r){
	        	$.ajax({            
	                type:"POST",   //post提交方式默认是get
	                 url: '<?php echo $this->createUrl('deleteteacher'); ?>',
	                dataType:"json",
	                data:  {UIDs : id },      
	                error:function(err) {      // 
	        			fun_showMsg('提示','数据请求失败('+JSON.stringify(err)+')');
	                },
	                success:function(resp) {
	                	if(resp.success)
		                {
		                	$grid_teacher.datagrid('deleteRow', index);
		                }
	                	fun_showMsg('提示',resp.msg);
	                    $grid_teacher.datagrid('reload');
	                }            
	          	});       	
	        }
	    });
	};
	deleteteacherrows = function (){
		var ids = [];  
	    var rows = $grid_teacher.datagrid('getChecked');  
	    if(rows.length > 0)
	    {
	    	$.messager.confirm('提示','您确定要删除吗?',function(r)
	        {
	            if (r){
	    		    for(var i=0;i<rows.length;i++)
	    	 			ids.push(rows[i].uid);  
	    	//	    alert(ids.join(','));
	    		    $.ajax({            
	    	            type:"POST",   //post提交方式默认是get
	    	            url: '<?php echo $this->createUrl('deleteteacher'); ?>',
	    	            dataType:"json",
	    	            data:  {UIDs: ids.join(',')},      
	    	            error:function(err) {      // 
	    	    			fun_showMsg('提示','数据请求失败('+JSON.stringify(err)+')');
	    	            },
	    	            success:function(resp) {
	    	            	if(resp.success)
	    	            	{
	    	            		$grid_teacher.datagrid('loadData',{total:0,rows:[]});
		    	            	$.ajax({            
		    	      			  type:"POST",   //post提交方式默认是get
		    	      			  url: '<?php echo $this->createUrl('getteacher'); ?>',
		    	      			  dataType:"json",
		    	      			 // async:false,    
		    	      			  data:{ClassID: $('#man_tea_clacombotree').combotree('getValues').join(','),
		    	      				  SubjectIDs: $('#man_tea_subcombobox').combobox('getValues').join(','),
		    	      				  Name: $('#man_tea_namebox').val()
		    	      				  }, 
		    	      			  error:function(err) {      // 
		    	      					fun_showMsg('提示','教师数据请求失败('+JSON.stringify(err)+')');
		    	      			  },
		    	      			  success:function(resp) {
		    	      			      if(resp.success)
		    	      			      {
		    	      				    	$grid_teacher.datagrid('loadData',resp.data);
		    	      			      }else
		    	      			      	fun_showMsg('提示','获取教师数据错误('+resp.msg+')');
		    	      			  }            
		    	      			});
	    	            	}
	    	            	fun_showMsg('提示',resp.msg);
	    	            }            
	    	      	}); 
	            }
			});        
	    }
	    else
	    	fun_showMsg('提示','请先选择您要删除的教师!');	
	};
	
	importfile = function (){
		$('#fileupload').fileupload({
	        url: '<?php echo $this->createUrl('import'); ?>',
	        dataType: 'json',
	  //      formData:{ClassID: $('#man_stu_clacombotree').combotree('getValues').join(',')},//如果需要额外添加参数可以在这里添加   
	        done: function (e, data) {
				fun_showMsg('提示',data.result.msg);
	        }
	    }).prop('disabled', !$.support.fileInput)
	        .parent().addClass($.support.fileInput ? undefined : 'disabled');
	};

	exportfile = function (){
        $("#form").attr('action', '<?php echo $this->createUrl("/school/manTeacher/export"); ?>');
        $("#form").submit();
	};
});
</script>
<table id="man_teacher_grid"></table>
<div id="man_teacher_tb" style="padding:5px;height:auto">   
    <form id="form" methd="post" action="">
	<div style="margin-bottom:5px">    
		年级/班级: 
		<input class="easyui-combotree"   
            id="man_tea_clacombotree"  
            style="width:180px;height:26px;"
            data-options="  
            		valueField:'id',
                    textField:'text', 
                    multiple: false , 
                    required :false,
                    panelHeight:'auto',
                    onLoadSuccess : function(node, data){
                    	for(var i=0;i < data.length;i++)
                    	{
                    		if(data[i].selected)
                    		{
                    			$('#man_tea_clacombotree').combotree('setValue', data[i].id);
                    			return;
                    		}
                    		for(var j=0;j < data[i].children.length;j++ )
                    		{
                    			if(data[i].children[j].selected)
                    			{
                    				$('#man_tea_clacombotree').combotree('setValue', data[i].children[j].id);
                    				return;
                    			}
                    		}
                    	}
                    }
            ">
	    &nbsp;&nbsp;科目: 
	    <input class="easyui-combobox"   
            id="man_tea_subcombobox"  
            style="width:100px;height:26px;"
            data-options="  
                    valueField:'id',  
                    textField:'text',  
                    editable:false,
                    required :false,
                    multiple:true,  
                    panelHeight:'auto'  
            "> 
		&nbsp;&nbsp;姓名: 
	    <input class="easyui-validatebox" 
	    		id="man_tea_namebox"  
	    		style="width:100px;height:18px; "
	    		data-options="  
	    			required : false
	    	">
	    <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="queryteacher()">查询</a>
	    &nbsp;&nbsp;
	    <a href="./static/download/教师导入模板.xls" class="easyui-linkbutton" iconCls="" >模板下载</a>  
	    &nbsp;&nbsp;文件上传:  
	    <span class="btn btn-success fileinput-button">
            <i class="icon-plus icon-white"></i>
            <span>选择</span>
            <!-- The file input field used as target for the file upload widget -->
            <input id="fileupload" type="file" name="file" onclick="importfile()">
        </span> 
    </div>
    <div>
    	<a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-add" onclick="addteacherrow()">新增教师</a>
    	<a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-remove" onclick="deleteteacherrows()">删除选中教师</a>  
    </div>
    </form>
</div>
