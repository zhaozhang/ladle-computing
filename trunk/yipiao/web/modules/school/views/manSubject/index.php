<script type="text/javascript">
$(function(){
	
	var $grid_subject = $('#man_subject_grid');
	
	var subject_combotree_data;
	
	var editindex = -1;
	//载入数据
	$.ajax({            
	  type:"POST",   //post提交方式默认是get
	  url: '<?php echo $this->createUrl('getsubject'); ?>',
	  dataType:"json",
	 // async:false,     
	  data:{SchoolID: ypschoolid},  
	  error:function(err) {      // 
			fun_showMsg('提示','基本科目数据请求失败('+JSON.stringify(err)+')');
	  },
	  success:function(resp) {
	      if(resp.success)
	      {
	    	  	subject_combotree_data = resp.data;
		    	$.ajax({            
	    		  type:"POST",   //post提交方式默认是get
	    		  url: '<?php echo $this->createUrl('getsubjectall'); ?>',
	    		  dataType:"json",
	    		 // async:false,     
	    		  data:{SchoolID: ypschoolid},  
	    		  error:function(err) {      // 
	    				fun_showMsg('提示','科目数据请求失败('+JSON.stringify(err)+')');
	    		  },
	    		  success:function(resp) {
	    		      if(resp.success)
	    		      {
	    		    	  $grid_subject.datagrid({   
	    		    			border:false,
	    		    			striped:true,
	    		    			pagination:true,
	    		    			pageSize:20,
	    		    			fit: true,
	    		    			singleSelect:true,
	    		    			idField:'subjectid',
	    		    		    toolbar:[ 
	    		    		             {text:'新增科目',iconCls:'icon-add',handler: addsubjectrow}
	    		    		             ], 
	    		    		    columns:[[
	    		    				{field: 'subjectid', title: '科目ID', width: 10,hidden:true},
	    		    				{field: 'schoolid', title: '学校ID', width: 10,hidden:true},
	    		    				{field: 'subjectname', title: '科目名称', width: 120,
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
	    		    				{field: 'refersubjectid', title: '关联科目', width: 120,
	    		    					formatter : function(text){  
	    		    						var temp = '';
	    		    			    		var isfirst = 1;
	    		    						var arr = text.split(',');
	    		    			    		for(var k = 0 ;k <arr.length ; k++)
	    		    			    		{
	    		    			    			for(var i=0; i< subject_combotree_data.length; i++)
	    		    			    			{
	    		    			    				if (subject_combotree_data[i].id == arr[k]) 
	    		    		    					{
	    		    		        					if(1 == isfirst)
	    		    		        					{
	    		    		        						isfirst = 0;
	    		    		        						temp =  subject_combotree_data[i].text;
	    		    		        					}else
	    		    		            					temp =  temp+','+subject_combotree_data[i].text;
	    		    									break;
	    		    		    					}
	    		    			    			}
	    		    			    		}
	    		    			            return temp; 
	    		    		            },
	    		    					editor:{  
	    		    						type:'combotree',  
	    		    						options:{  
	    		    							valueField:'id',  
	    		    							textField:'text', 
	    		    							editable: false,
	    		    							multiple: true, 
	    		    							data: subject_combotree_data,
	    		    							panelHeight: 'auto'
	    		    						}
	    		    		            }
	    		    		        },
	    		    				{field: 'fullscore', title: '初始总分', width: 80,
	    		    					editor:{
	    		    						type:'numberbox',
	    		    						options:{
	    		    				        	min:0,   
	    		    				            precision:0
	    		    		 				}
	    		    					}
	    		    				},  
	    		    				{field: 'passscore', title: '初始及格分', width: 80,
	    		    					editor:{
	    		    						type:'numberbox',
	    		    						options:{
	    		    							min:0,   
	    		    		            		precision:0
	    		    		 				}
	    		    					}
	    		    				}, 		      
	    		    				{field:'action',title:'操作',width:120,align:'center',
	    		    		            formatter:function(value,row,index){
	    		    		                if (row.editing){
	    		    		                    var s = '<a href="#" style="color:red" onclick="saverow('+index+','+row.subjectid+')">保存</a> ';
	    		    		                    var c = '<a href="#" style="color:red" onclick="cancelrow('+index+','+row.subjectid+')">取消</a>  ';
	    		    		                    return s+c;
	    		    		                } else {
	    		    		                    var e = '<a href="#" style="color:red" onclick="editrow('+index+','+row.schoolid+')">修改</a> ';
	    		    		                    var d = '<a href="#" style="color:red" onclick="deleterow('+index+','+row.subjectid+')">删除</a>  ';
	    		    		                    return e+d;
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
	    			  		$grid_subject.datagrid('loadData',resp.data);
	    		      }else
	    		      	fun_showMsg('提示','获取科目数据错误('+resp.msg+')');
	    		  }            
	    		});
	      }else
	      	fun_showMsg('提示','获取基本科目数据错误('+resp.msg+')');
	  }            
	});
	
	
	function addsubjectrow(){
		$grid_subject.datagrid('appendRow',{
			  "subjectid": "0",
		      "schoolid": ypschoolid,
		      "refersubjectid": "",
		      "subjectname": "",
		      "type" : "0",
		      "fullscore": "100",
		      "passscore" : "60"
			}
		);
		options = $grid_subject.datagrid('getPager').data("pagination").options;
		number = options.total;	
		$grid_subject.datagrid('beginEdit',number-1);
		$grid_subject.datagrid("selectRow",number-1);
		if(-1 != editindex)
		{
			$grid_subject.datagrid('cancelEdit', editindex);
		}	
		editindex = number-1;
	}
	
	editrow = function (index,schoolid){
		if(-1 != editindex)
		{
			$grid_subject.datagrid('cancelEdit', editindex);
			$grid_subject.datagrid('selectRow',editindex);
			var row = $grid_subject.datagrid('getSelected');
			$grid_subject.datagrid('unselectRow',editindex);			
			if( '0' == row.subjectid )
			{
				$grid_subject.datagrid('deleteRow', editindex);
			}
		}		
		if( 0 == schoolid)
		{
			fun_showMsg('提示','基本科目数据不允许编辑');			
			return;
		}
		editindex = index;
		$grid_subject.datagrid("selectRow", index);
		$grid_subject.datagrid('beginEdit', index);
	};
	cancelrow = function (index,id){
		$grid_subject.datagrid('cancelEdit', index);
		editindex = -1;
		//对于新加行，没有编辑保存的直接删除
		if(0 == id)
		{
			$grid_subject.datagrid('deleteRow', index);
		}
	};
	
	/*
	 * 以下涉及后台操作
	 */
	deleterow = function (index,id){
		if(-1 != editindex)
		{
			$grid_subject.datagrid('cancelEdit', editindex);
			$grid_subject.datagrid('selectRow',editindex);
			var row = $grid_subject.datagrid('getSelected');
			$grid_subject.datagrid('unselectRow',editindex);			
			if( '0' == row.subjectid )
			{
				$grid_subject.datagrid('deleteRow', editindex);
				editindex = -1;
			}
		}	
	    $.messager.confirm('提示','您确定要删除吗?',function(r){
	        if (r){
	        	$.ajax({            
	                type:"POST",   //post提交方式默认是get
	                url: '<?php echo $this->createUrl('deletesubject'); ?>',
	                dataType:"json",
	                data:  { SubjectID :id},      
	                error:function(err) {      // 
	        			fun_showMsg('提示','数据请求失败('+JSON.stringify(err)+')');
	                },
	                success:function(resp) {
	                	fun_showMsg('提示',resp.msg);
	                	$grid_subject.datagrid('deleteRow', index);
	                    $grid_subject.datagrid('reload');
	                }            
	          	});       	
	        }
	    });
	};
	saverow = function (index,id){
		var ed_subjectname = $grid_subject.datagrid('getEditor', {index:index,field:'subjectname'});
		var ed_refersubjectid = $grid_subject.datagrid('getEditor', {index:index,field:'refersubjectid'});
		var ed_type = $grid_subject.datagrid('getEditor', {index:index,field:'type'});
		var ed_fullscore = $grid_subject.datagrid('getEditor', {index:index,field:'fullscore'});
		var ed_passscore = $grid_subject.datagrid('getEditor', {index:index,field:'passscore'});
		if(!$(ed_subjectname.target).validatebox('isValid'))
		{
			fun_showMsg('提示','科目名称不能为空，请修改!');
			return;
		}
		$.ajax({            
	        type:"POST",   //post提交方式默认是get
	        url: '<?php echo $this->createUrl('updatesubject'); ?>', 
	        dataType:"json",
	        data: {SubjectID : id,
	        	SchoolID : ypschoolid,
	        	SubjectName : $(ed_subjectname.target).val(),
	        	Type : $(ed_type.target).combobox('getValues').join(','),
	            ReferSubjectID :$(ed_refersubjectid.target).combobox('getValues').join(','),
	            FullScore: $(ed_fullscore.target).val(),
	            PassScore: $(ed_passscore.target).val()
	        },            
	        error:function(err) {      // 
				fun_showMsg('提示','数据请求失败('+JSON.stringify(err)+')');
				$grid_subject.datagrid('reload');
	        },
	        success:function(resp) {
	            if(resp.success)
	            {
		            $grid_subject.datagrid('reload');
		            row = $grid_subject.datagrid('getSelected');
		            if(0 == row.subjectid)
			        	row.subjectid = resp.data.id;
		            $grid_subject.datagrid('endEdit', index);
		            $grid_subject.datagrid('unselectRow', index);
		            editindex = -1;
	            }
	            fun_showMsg('提示',resp.msg);
	        }            
	  	}); 
	};

});

</script>
<table id="man_subject_grid"></table>





