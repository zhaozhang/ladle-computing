<script type="text/javascript">
$(function(){
	var $grid_student = $('#man_student_grid');
	
	var editindex = -1;
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
	    		$('#man_stu_clacombotree').combotree('loadData',classids_combotree_data);
	    		
	        	$grid_student.datagrid({   
	        		border:true,
	    		    pagination:true,
	    			pageList:[400,600,800,1000],
	       			pageSize:400,
	       			fit: true,
	       			checkbox : true,
	//    		    			singleSelect:true,
	    		    idField:'uid',
	    		    toolbar: '#man_student_tb',   
	        	    columns:[[
	        			{field: 'ck', checkbox:true},      
	        			{field: 'uid', title: '用户ID', width: 10,hidden:true},
	        			{field: 'name', title: '姓名', width: 100,
	            			editor:{
			        			type:'validatebox',
			        			options:{
			         				required:true
			         			}
		        			}
		        		},
	        			{field: 'sex', title: '性别', width: 50,
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
		                        	textField:'text',  
		                            data : data_sex,  
		                            required:true ,
		                            editable: false,
		                            panelHeight: 'auto'
	                        	}
	                     	}
	                    },	
	                    {field: 'studyno', title: '学号', width: 120,
	             			editor:{
	 	        				type:'validatebox',
			        			options:{
			         				required:true
			         			}
	                     	}
	 	        		},	        		
	        			{field: 'classid', title: '班级', width: 120,
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
		                            multiple:false, 
		                            editable: false,
		                            data: classids_combotree_data,
		                            panelHeight: 'auto',
		                            onBeforeSelect: function(node) 
		                            {            
	                            		if (!$(this).tree('isLeaf', node.target)) 
	                                	{                
	                                    	return false;            
	                                    }         
	                                    if($(this).tree('getSelected'))
	                                    {
	                                        if(node.id == $(this).tree('getSelected').id)
	                                        {
	                                        	var node = $(this).tree('find', 0);
	                                        	$(this).tree('select', node);
	                                        	return false;     
	                                        }
	                                    }                 		
	                                }
	                            }
	                    	}
	                    },	
	 	        		{field: 'type', title: '应届/往届', width: 80,
	            	   		formatter : function(text){  
	                            for(var i=0; i< data_stutype.length; i++){  
	                                if (data_stutype[i].id == text) 
	                                    return data_stutype[i].text;  
	                            }
	                            return text;  
	                    	},
	            		    editor:{  
	                        	type:'combobox',  
	                            options:{  
		                        	valueField:'id',  
		                        	textField:'text',  
		                            data : data_stutype,  
		                            required:true ,
		                            editable: false,
		                            panelHeight: 'auto'
	                        	}
	                     	}
	                    },	
	 	        		{field: 'islocal', title: '是否本地高考', width: 80,
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
	                    {field: 'graschool', title: '毕业学校', width: 120,
	            			editor:{
			        			type:'validatebox',
			        			options:{
			         			}
		        			}
		        		},
	                    {field: 'entrytime', title: '入学时间', width: 120,
	            			editor:{
			        			type:'datebox',
			        			options:{
		        					editable: false
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
	        		    $grid_student.datagrid('refreshRow', index);
	        		},
	        		onAfterEdit:function(index,row){
	        		    row.editing = false;
	        		    $grid_student.datagrid('refreshRow', index);
	        		},
	        		onCancelEdit:function(index,row){
	        		    row.editing = false;
	        		    $grid_student.datagrid('refreshRow', index);
	        		}
	        	}); 
	        }else
	        	fun_showMsg('提示','获取班级数据错误('+resp.msg+')');
	    }            
	});

	getgradeid = function (classid){
		for(var i=0; i< classids_combotree_data.length; i++)
		{
			for(var j=0; j< classids_combotree_data[i].children.length; j++)
			{
				if (classids_combotree_data[i].children[j].id == classid) 
				{
					return classids_combotree_data[i].children[j].gid;
				}
			}
		}
		return 0;
	}
	
	addstudentrow = function (){
		$grid_student.datagrid('appendRow',{
			  "uid": "0",
		      "name": "",
		      "sex": "1",
		      "studyno": "",
		      "classid": "",
		      "type": "0",
		      "islocal" : "1",
		      "graschool" : "",
		      "entrytime" : "<?php echo date('Y-m-d'); ?>"
			}
		);
		options = $grid_student.datagrid('getPager').data("pagination").options;
		number = options.total;	
		$grid_student.datagrid('beginEdit',number-1);
	//	$grid_student.datagrid("selectRow",number-1);
		if(-1 != editindex)
		{
			$grid_student.datagrid('cancelEdit', editindex);
		}
		editindex = number-1;
	};
	editrow = function (index){
		if(-1 != editindex)
		{
			$grid_student.datagrid('cancelEdit', editindex);
			$grid_student.datagrid('selectRow',editindex);
			var row = $grid_student.datagrid('getSelected');
			$grid_student.datagrid('unselectRow',editindex);
			if( '0' == row.uid )
			{
				$grid_student.datagrid('deleteRow', editindex);
			}
		}
		editindex = index;
	
		$grid_student.datagrid('beginEdit', index);
	//	$grid_student.datagrid("selectRow", index);
	};
	cancelrow = function (index,id){
		$grid_student.datagrid('cancelEdit', index);
		editindex = -1;
		//对于新加行，没有编辑保存的直接删除
		if(0 == id)
		{
			$grid_student.datagrid('deleteRow', index);
		}
	};
	
	/*
	 * 以下涉及后台操作
	 */
	saverow = function (index,id){
		var ed_name = $grid_student.datagrid('getEditor', {index:index,field:'name'});
		var ed_sex = $grid_student.datagrid('getEditor', {index:index,field:'sex'});
		var ed_studyno = $grid_student.datagrid('getEditor', {index:index,field:'studyno'});
		var ed_classid = $grid_student.datagrid('getEditor', {index:index,field:'classid'});
		var ed_type = $grid_student.datagrid('getEditor', {index:index,field:'type'});	
		var ed_islocal = $grid_student.datagrid('getEditor', {index:index,field:'islocal'});	
		var ed_graschool = $grid_student.datagrid('getEditor', {index:index,field:'graschool'});	
		var ed_entrytime = $grid_student.datagrid('getEditor', {index:index,field:'entrytime'});	
		if(!$(ed_name.target).validatebox('isValid'))
		{
			fun_showMsg('提示','姓名不能为空，请修改!');
			return;
		}	
		if(!$(ed_studyno.target).validatebox('isValid'))
		{
			fun_showMsg('提示','学号不能为空，请修改!');
			return;
		}	
		$.ajax({            
	        type:"POST",   //post提交方式默认是get
	        url: '<?php echo $this->createUrl('updatestudent'); ?>', 
	        dataType:"json",
	        data: {UID : id,
	        	SchoolID: ypschoolid,
	        	GradeID: getgradeid($(ed_classid.target).combotree('getValues').join(',')),
	        	Name : $(ed_name.target).val(),
	        	Sex : $(ed_sex.target).combobox('getValues').join(','),
	            StudyNo : $(ed_studyno.target).val(),
	            ClassID :$(ed_classid.target).combotree('getValues').join(','),
	            Type:$(ed_type.target).combobox('getValues').join(','),
	            IsLocal: $(ed_islocal.target).combobox('getValues').join(','),
	            GraSchool: $(ed_graschool.target).val(),
	            EntryTime: $(ed_entrytime.target).combobox('getValues').join(',')
	        },            
	        error:function(err) {      // 
				fun_showMsg('提示','数据请求失败('+JSON.stringify(err)+')');
				$grid_student.datagrid('reload');
	        },
	        success:function(resp) {
	            if(resp.success)
	            {
		            $grid_student.datagrid('reload');
		            row = $grid_student.datagrid('getSelected');
		            if(row.uid == 0)
			        	row.uid = resp.data.id;
		            $grid_student.datagrid('endEdit', index);
		            $grid_student.datagrid('unselectRow', index);
		            editindex = -1;
	            }
	            fun_showMsg('提示',resp.msg);
	        }            
	  	}); 
	};
	querystudent = function (){	
		$grid_student.datagrid('loadData',{total:0,rows:[]});
		$.ajax({            
			  type:"POST",   //post提交方式默认是get
			  url: '<?php echo $this->createUrl('getstudent'); ?>',
			  dataType:"json",
			 // async:false,    
			  data:{ClassID: $('#man_stu_clacombotree').combotree('getValues').join(','),
				  Name: $('#man_stu_namebox').val()
				  }, 
			  error:function(err) {      // 
					fun_showMsg('提示','学生数据请求失败('+JSON.stringify(err)+')');
			  },
			  success:function(resp) {
			      if(resp.success)
			      {
				    	$grid_student.datagrid('loadData',resp.data);
			      }else
			      	fun_showMsg('提示','获取学生数据错误('+resp.msg+')');
			  }            
		});
	};
	deleterow = function (index,id){
		if(-1 != editindex)
		{
			$grid_student.datagrid('cancelEdit', editindex);
			$grid_student.datagrid('selectRow',editindex);
			var row = $grid_student.datagrid('getSelected');
			$grid_student.datagrid('unselectRow',editindex);
			if( '0' == row.uid )
			{
				$grid_student.datagrid('deleteRow', editindex);
				editindex = -1;
			}
		}	
	 	$.messager.confirm('提示','您确定要删除吗?',function(r){
	        if (r){
	        	$.ajax({            
	                type:"POST",   //post提交方式默认是get
	                url: '<?php echo $this->createUrl('deletestudent'); ?>',
	                dataType:"json",
	                data:  {UIDs: id },      
	                error:function(err) {      // 
	        			fun_showMsg('提示','数据请求失败('+JSON.stringify(err)+')');
	                },
	                success:function(resp) {
	                	if(resp.success)
		                {
		                	$grid_student.datagrid('deleteRow', index);
		                }
	                	fun_showMsg('提示',resp.msg);
	                    $grid_student.datagrid('reload');
	                }            
	          	});       	
	        }
	    });
	};
	deletestudentrows = function (){
		var ids = [];  
	    var rows = $grid_student.datagrid('getChecked');  
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
	    	            url: '<?php echo $this->createUrl('deletestudent'); ?>',
	    	            dataType:"json",
	    	            data:  {UIDs: ids.join(',')},      
	    	            error:function(err) {      // 
	    	    			fun_showMsg('提示','数据请求失败('+JSON.stringify(err)+')');
	    	            },
	    	            success:function(resp) {
	    	            	if(resp.success)
	    	            	{
	    	            		$grid_student.datagrid('loadData',{total:0,rows:[]});
		    	        		$.ajax({            
		    	        			  type:"POST",   //post提交方式默认是get
		    	        			  url: '<?php echo $this->createUrl('getstudent'); ?>',
		    	        			  dataType:"json",
		    	        			 // async:false,    
		    	        			  data:{ClassID: $('#man_stu_clacombotree').combotree('getValues').join(','),
		    	        				  Name: $('#man_stu_namebox').val()
		    	        				  }, 
		    	        			  error:function(err) {      // 
		    	        					fun_showMsg('提示','学生数据请求失败('+JSON.stringify(err)+')');
		    	        			  },
		    	        			  success:function(resp) {
		    	        			      if(resp.success)
		    	        			      {
		    	        				    	$grid_student.datagrid('loadData',resp.data);
		    	        			      }else
		    	        			      	fun_showMsg('提示','获取学生数据错误('+resp.msg+')');
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
	    	fun_showMsg('提示','请先选择您要删除的学生!');	
	};
	
	importfile = function (){
		$('#fileupload').fileupload({
	        url: '<?php echo $this->createUrl('import'); ?>',
	        dataType: 'json',
	        formData:{ClassID: $('#man_stu_clacombotree').combotree('getValues').join(',')},//如果需要额外添加参数可以在这里添加   
	        done: function (e, data) {
				fun_showMsg('提示',data.result.msg);
	        }
	    }).prop('disabled', !$.support.fileInput)
	        .parent().addClass($.support.fileInput ? undefined : 'disabled');
	};

    exportfile = function() {
        $('#ClassID').val( $('#man_stu_clacombotree').combotree('getValues').join(',') );
        $("#form").attr('action', '<?php echo $this->createUrl("/school/manStudent/export"); ?>');
        $("#form").submit();
    };

});
</script>
<table id="man_student_grid"></table>
<div id="man_student_tb" style="padding:5px;height:auto">
    <form id="form" method="POST" action="">
	<div style="margin-bottom:5px">    
		年级/班级: 
		<input class="easyui-combotree"   
            id="man_stu_clacombotree"  
            style="width:180px;height:26px;"
            data-options="  
            		valueField:'id',
                    textField:'text', 
                    multiple: false, 
                    required : false,
                    panelHeight:'auto',
                    onBeforeSelect: function(node) 
	                {            
                    	if (!$(this).tree('isLeaf', node.target)) 
                    	{                
                        	return false;            
                        }              		
                    },
                    onLoadSuccess : function(node, data){
                    	for(var i=0;i < data.length;i++)
                    	{
                    		if(data[i].selected)
                    		{
                    			$('#man_stu_clacombotree').combotree('setValue', data[i].id);
                    			return;
                    		}
                    		for(var j=0;j < data[i].children.length;j++)
                    		{
                    			if(data[i].children[j].selected)
	                    		{
	                    			$('#man_stu_clacombotree').combotree('setValue', data[i].children[j].id);
	                    			return;
	                    		}
                    		}
                    	}
                    }
            ">
		&nbsp;&nbsp;姓名: 
	    <input class="easyui-validatebox" 
	    		id="man_stu_namebox"  
	    		style="width:100px;height:18px; "
	    		data-options="  
	    			required : false
	    	">
        <input type="hidden" name="ClassID" id="ClassID" />
	    <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="querystudent()">查询</a>
	    &nbsp;&nbsp;
	    <a href="./static/download/学生导入模板.xls" class="easyui-linkbutton" iconCls="" >模板下载</a>  
	    &nbsp;&nbsp;文件上传:  
	    <span class="btn btn-success fileinput-button">
            <i class="icon-plus icon-white"></i>
            <span>选择</span>
            <!-- The file input field used as target for the file upload widget -->
            <input id="fileupload" type="file" name="userfile" onclick="importfile()">
        </span>   
    </div>
    </form>
    <div>
    	<a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-add" onclick="addstudentrow()">新增学生</a>
    	<a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-remove" onclick="deletestudentrows()">删除选中学生</a>  
    </div>
</div>
