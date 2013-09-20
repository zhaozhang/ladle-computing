<script type="text/javascript">
$(function(){
	var $grid_grade = $('#man_grade_grid');
	var $grid_class = $('#man_class_grid');
	var gradeid = 0;
	var gradename = '';
	var editgradeindex = -1;
	var editclassindex = -1;
	//获取年级数据
	$.ajax({            
		type:"POST",   //post提交方式默认是get
		url: '<?php echo $this->createUrl('getgrade'); ?>',
		dataType:"json",
	 // async:false,     
		data:{SchoolID: ypschoolid},  
		error:function(err) {      // 
			fun_showMsg('提示','数据请求失败('+JSON.stringify(err)+')');
		},
		success:function(resp) {
			if(resp.success)
	    	{
				$('#man_grade_grid').datagrid('loadData',resp.data);
	      	}else
	      		fun_showMsg('提示','获取年级数据错误('+resp.msg+')');
	  	}            
	});
	
	$grid_grade.datagrid({   
		border:false,
		pagination:true,
		pageSize:20,
		fit: true,
		singleSelect:true,
		idField:'gradeid',
	    toolbar:[ 
	             {text:'新增年级',iconCls:'icon-add',handler: addgraderow}
	             ], 
	    columns:[[
			{field: 'gradeid', title: '年级ID', width: 10,hidden:true},
			{field: 'gradename', title: '年级名称', width: 120,
				editor:{
					type:'validatebox',
					options:{
	 					required:true
	 				}
				}
			},
			{field:'action',title:'操作',width:120,align:'center',
	            formatter:function(value,row,index){
	                if (row.editing){
	                    var s = '<a href="#" style="color:red" onclick="saverow('+index+',0,'+row.gradeid+')">保存</a> ';
	                    var c = '<a href="#" style="color:red" onclick="cancelrow('+index+',0,'+row.gradeid+')">取消</a>  ';
	                    return s+c;
	                } else {
	                    var e = '<a href="#" style="color:red" onclick="editrow('+index+',0)">修改</a> ';
	                    var d = '<a href="#" style="color:red" onclick="deleterow('+index+',0,'+row.gradeid+')">删除</a>  ';
	                    var r = '<a href="#" style="color:red" onclick="editclass('+index+')">编辑班级</a>';
	                    return e+d+r;
	                }
	            }
	        }
		]],
		onBeforeEdit:function(index,row){
		    row.editing = true;
		    $grid_grade.datagrid('refreshRow', index);
		},
		onAfterEdit:function(index,row){
		    row.editing = false;
		    $grid_grade.datagrid('refreshRow', index);
		},
		onCancelEdit:function(index,row){
		    row.editing = false;
		    $grid_grade.datagrid('refreshRow', index);
		}
	});  

	editclass = function(index) {
		//得先选上才能获取到值,居然不能根据index获取row
		$grid_grade.datagrid("selectRow",index);
		var row = $grid_grade.datagrid('getSelected');
	    if (gradeid == row.gradeid) {
	        return;
	    }
	    var $layout = $('#man_class_layout');
	    var center = $layout.layout('panel', 'center');
	
	    center.panel("setTitle", row.gradename + "下属班级");
	    gradename = row.gradename;
	    gradeid = row.gradeid;
	
	    if (!$grid_class.data('datagrid')) {
	        $grid_class.datagrid({
	        	border:false,
	        	pagination:true,
	        	pageSize:30,
	        	checkbox : true,
	        	fit: true,
	        	idField:'classid',
	            columns: [[
					{field: 'ck', checkbox:true},
	               	{field: 'classid', title: '班级ID', width: 10,hidden:true},
	            	{field: 'classname', title: '班级名称', width: 120,
	                	editor:{
	            			type:'validatebox',
	            			options:{
	             				required:true
	             			}
	            		}
	        		},
	            	{field: 'type', title: '文理类型', width: 120,
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
	                {field: 'classlevel', title: '班级级别', width: 80,
	            		editor:{  
	                		type:'numberspinner', 
	                    	options:{  
			                	min: 0,   
			                    max: 10,   
			                    editable: false,
	                        	required:true,
	                        	panelHeight: 'auto',
	                        	precision: 0
	                    	}
	                    }
	                },						                        									
	            	{field:'action',title:'操作',width:80,align:'center',
	                    formatter:function(value,row,index){
	                        if (row.editing){
	                            var s = '<a href="#" style="color:red" onclick="saverow('+index+',1,'+row.classid+')">保存</a> ';
	                            var c = '<a href="#" style="color:red" onclick="cancelrow('+index+',1,'+row.classid+')">取消</a>';
	                            return s+c;
	                        } else {
	                            var e = '<a href="#" style="color:red" onclick="editrow('+index+',1)">修改</a> ';
	                            var d = '<a href="#" style="color:red" onclick="deleterow('+index+',1,'+row.classid+')">删除</a>';
	                            return e+d;
	                        }
	                    }
	                }
	            ]],
	            toolbar: [{
	                    text: '新增',
	                    iconCls: 'icon-add',
	                    handler: addclassrow
	                },{
	                    text: '删除选中',
	                    iconCls: 'icon-remove',
	                    handler: deleteclassrows
	            }],
	            onBeforeEdit:function(index,row){
	        	    row.editing = true;
	        	    $grid_class.datagrid('refreshRow', index);
	        	},
	        	onAfterEdit:function(index,row){
	        	    row.editing = false;
	        	    $grid_class.datagrid('refreshRow', index);
	        	},
	        	onCancelEdit:function(index,row){
	        	    row.editing = false;
	        	    $grid_class.datagrid('refreshRow', index);
	        	}
	        });
	    }else
	    {
	    	$grid_class.datagrid('uncheckAll');
	   		$grid_class.datagrid('loadData',{total:0,rows:[]});
	    }
	
	    //获取班级数据
	    $.ajax({            
	        type:"POST",   //post提交方式默认是get
	        url: '<?php echo $this->createUrl('getclass'); ?>',
	        dataType:"json",
	       // async:false,     
	        data: {GradeID: gradeid},
	        error:function(err) {      // 
	    		fun_showMsg('提示','数据请求失败('+JSON.stringify(err)+')');
	        },
	        success:function(resp) {
	            if(resp.success)
	            {
	    	    	$grid_class.datagrid('loadData',resp.data);
	            }else
	            	fun_showMsg('提示','获取班级数据错误('+resp.msg+')');
	        }            
	    });
	};
	function addgraderow(){
		$grid_grade.datagrid('appendRow',{
			gradeid: '0',
			gradename: ''
			}
		);
		options = $grid_grade.datagrid('getPager').data("pagination").options;
		number = options.total;	
		$grid_grade.datagrid('beginEdit',number-1);
		$grid_grade.datagrid("selectRow",number-1);
		if(-1 != editgradeindex)
		{
			$grid_grade.datagrid('cancelEdit', editgradeindex);
		}	
		editgradeindex = number-1;
	}
	function addclassrow(){
		$grid_class.datagrid('appendRow',{
			classid: '0',
			classname: gradename,
			type : '0',
			classlevel: '0'
			}
		);
		options = $grid_class.datagrid('getPager').data("pagination").options;
		number = options.total;	
		$grid_class.datagrid('beginEdit',number-1);
	//	$grid_class.datagrid("selectRow",number-1);
		if(-1 != editclassindex)
		{
			$grid_class.datagrid('cancelEdit', editclassindex);
		}	
		editclassindex = number-1;	
	}
	editrow = function (index,type){
		var $grid_temp;
		if(0 == type )//年级
		{
			$grid_temp = $grid_grade;
			if(-1 != editgradeindex)
			{
				$grid_temp.datagrid('cancelEdit', editgradeindex);
				$grid_temp.datagrid('selectRow',editgradeindex);
				var row = $grid_temp.datagrid('getSelected');
				$grid_temp.datagrid('unselectRow',editgradeindex);			
				if( '0' == row.gradeid )
				{
					$grid_temp.datagrid('deleteRow', editgradeindex);
				}
			}		
			editgradeindex = index;
			$grid_temp.datagrid("selectRow", index);
		}else if(1 == type)//班级
		{
			$grid_temp = $grid_class;
			if(-1 != editclassindex)
			{
				$grid_temp.datagrid('cancelEdit', editclassindex);
				$grid_temp.datagrid('selectRow',editclassindex);
				var row = $grid_temp.datagrid('getSelected');
				$grid_temp.datagrid('unselectRow',editclassindex);
				if( '0' == row.classid )
				{
					$grid_temp.datagrid('deleteRow', editclassindex);
				}
			}		
			editclassindex = index;
		}
			
		$grid_temp.datagrid('beginEdit', index);
	};
	cancelrow = function (index,type,id){
		var $grid_temp;
		if(0 == type )//年级
		{
			$grid_temp = $grid_grade;
			editgradeindex = -1;
		}
		else if(1 == type )
		{
			$grid_temp = $grid_class;
			editclassindex = -1;
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
	function deleteclassrows(){
		var ids = [];  
	    var rows = $grid_class.datagrid('getChecked');  
	    if(rows.length > 0)
	    {
	    	$.messager.confirm('提示','删除班级所属的学生也将全部删除，您确定要删除吗?',function(r)
	    	{
		        if (r){
				    for(var i=0;i<rows.length;i++)
			 			ids.push(rows[i].classid);  
				//    alert(ids.join(','));
				    $.ajax({            
			            type:"POST",   //post提交方式默认是get
			            url: '<?php echo $this->createUrl('deleteclass'); ?>',
			            dataType:"json",
			            data:  {ClassIDs: ids.join(',')},      
			            error:function(err) {      // 
			    			fun_showMsg('提示','数据请求失败('+JSON.stringify(err)+')');
			            },
			            success:function(resp) {
			            	if(resp.success)
			            	{
			            		$grid_class.datagrid('loadData',{total:0,rows:[]})
				            	$.ajax({            
				         	        type:"POST",   //post提交方式默认是get
				         	        url: '<?php echo $this->createUrl('getclass'); ?>',
				         	        dataType:"json",
				         	       // async:false,     
				         	        data: {GradeID: gradeid},
				         	        error:function(err) {      // 
				         	    		fun_showMsg('提示','数据请求失败('+JSON.stringify(err)+')');
				         	        },
				         	        success:function(resp) {
				         	            if(resp.success)
				         	            {
				         	    	    	$grid_class.datagrid('loadData',resp.data);
				         	            }else
				         	            	fun_showMsg('提示','获取班级数据错误('+resp.msg+')');
				         	        }            
				         	    });
			            	}
			            	fun_showMsg('提示',resp.msg);
			            }            
			      	}); 
		        }
	         });
	    }else
	    	fun_showMsg('提示','请先选择您要删除的班级!');
	}
	deleterow = function (index,type,id){
		var grid_temp;
		if(0 == type )//年级
		{
			$grid_temp = $grid_grade;
			if(-1 != editgradeindex)
			{
				$grid_temp.datagrid('cancelEdit', editgradeindex);
				$grid_temp.datagrid('selectRow',editgradeindex);
				var row = $grid_temp.datagrid('getSelected');
				$grid_temp.datagrid('unselectRow',editgradeindex);			
				if( '0' == row.gradeid )
				{
					$grid_temp.datagrid('deleteRow', editgradeindex);
				}
			}		
			editgradeindex = -1;
		    $.messager.confirm('提示','删除年级所属的班级也将全部删除，您确定要删除吗?',function(r){
		        if (r){
		        	$.ajax({            
		                type:"POST",   //post提交方式默认是get
	                    url: '<?php echo $this->createUrl('deletegrade'); ?>',
		                dataType:"json",
		                data:  { GradeID:id},      
		                error:function(err) {      // 
		        			fun_showMsg('提示','数据请求失败('+JSON.stringify(err)+')');
		                },
		                success:function(resp) {
			                if(resp.success)
			                {
			                	$grid_grade.datagrid('deleteRow', index);
			                }
		                	fun_showMsg('提示',resp.msg);
		                    $grid_class.datagrid('loadData',{total:0,rows:[]}); 
		                }            
		          	});       	
		        }
		    });
		}
		else if(1 == type)//班级
		{
			$grid_temp = $grid_class;
			if(-1 != editclassindex)
			{
				$grid_temp.datagrid('cancelEdit', editclassindex);
				$grid_temp.datagrid('selectRow',editclassindex);
				var row = $grid_temp.datagrid('getSelected');
				$grid_temp.datagrid('unselectRow',editclassindex);
				if( '0' == row.classid )
				{
					$grid_temp.datagrid('deleteRow', editclassindex);
				}
			}		
			editclassindex = -1;		
		    $.messager.confirm('提示','删除班级所属的学生也将全部删除，您确定要删除吗?',function(r){
		        if (r){
		        	$.ajax({            
		                type:"POST",   //post提交方式默认是get
	                    url: '<?php echo $this->createUrl('deleteclass'); ?>',
		                dataType:"json",
		                data:  {ClassIDs:id},      
		                error:function(err) {      // 
		        			fun_showMsg('提示','数据请求失败('+JSON.stringify(err)+')');
		                },
		                success:function(resp) {
		                	fun_showMsg('提示',resp.msg);
		                	$grid_class.datagrid('deleteRow', index);
		                    $grid_class.datagrid('reload');
		                }            
		          	}); 
		        }
		    });
		}
	};
	saverow = function (index,type,id){
		var $grid_temp;
		var postdata = {};
	    var posturl = '';
		if(0 == type )//年级
		{
			$grid_temp = $grid_grade;
			var ed_gradename = $grid_temp.datagrid('getEditor', {index:index,field:'gradename'});
			if(!$(ed_gradename.target).validatebox('isValid'))
			{
				fun_showMsg('提示','年级名称不能为空，请修改!');
				return;
			}
			postdata = {SchoolID: ypschoolid ,
						GradeID: id ,GradeName: $(ed_gradename.target).val()};
	        post_url = '<?php echo $this->createurl('updategrade'); ?>';
		}
		else if(1 == type)//班级
		{
			$grid_temp = $grid_class;
			var ed_classname = $grid_temp.datagrid('getEditor', {index:index,field:'classname'});
			var ed_classlevel = $grid_temp.datagrid('getEditor', {index:index,field:'classlevel'});
			if(!$(ed_classname.target).validatebox('isValid'))
			{
				fun_showMsg('提示','班级名称不能为空，请修改!');
				return;
			}
			if(!$(ed_classlevel.target).validatebox('isValid'))
			{
				fun_showMsg('提示','班级级别不能为空，请修改!');
				return;
			}		
			var ed_type = $grid_temp.datagrid('getEditor', {index:index,field:'type'});
	
			postdata = { SchoolID: ypschoolid ,GradeID :gradeid ,
						ClassID: id ,ClassName: $(ed_classname.target).val() ,
						Type: $(ed_type.target).combobox('getValues').join(','),
						ClassLevel: $(ed_classlevel.target).val()
						};
	        post_url = '<?php echo $this->createurl('updateclass'); ?>';
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
		            row = $grid_temp.datagrid('getSelected');
		            if(0 == type )//年级
		            {
		            	if(row.gradeid == 0)
		            		row.gradeid = resp.data.id;
		            }else{
		            	if(row.classid == 0)
		            		row.classid = resp.data.id;
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

<div class="easyui-layout" fit="true" id='man_class_layout' >
    <div region="west" title="年级" style="width:430px;padding:2px;" collapsed=false split=true>
        <table id="man_grade_grid"></table>
    </div>
    <div region="center"  title="班级"  >
        <table id="man_class_grid"></table>
    </div>
</div>



