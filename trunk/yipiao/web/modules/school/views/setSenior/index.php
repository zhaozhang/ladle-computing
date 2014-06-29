<script type="text/javascript">
$(function(){
	var $grid_phone = $('#set_senior_grid');
	
	var editindex = -1;
	var classids_combotree_data;
	
	//载入初始数据

        	$grid_phone.datagrid({   
        		border:true,
    		    pagination:true,
    		    striped:true,
    	//		pageList:[400,600,800,1000],
       	//		pageSize:400,
       			fit: true,
       			checkbox : true,
//    		    			singleSelect:true,
    		    idField:'seqid',
    		    toolbar: '#set_senior_tb',   
        	    columns:[[
        			{field: 'ck', checkbox:true},   
        			{field: 'seqid', title: '流水ID', width: 10,hidden:true},
        			{field: 'phone', title: '号码', width: 100,
            			editor:{
		        			type:'validatebox',
		        			validtype:'mobile',
		        			options:{
		         				required:true
		         			}
	        			}
	        		},
                    {field: 'remark', title: '备注', width: 120,
             			editor:{
 	        				type:'validatebox'
                     	}
 	        		},	        												            				            	
        			{field:'action',title:'操作',width:80,align:'center',
                    	formatter:function(value,row,index){
                        	if (row.editing){
                        		var s = '<a href="#" style="color:red" onclick="saverow('+index+','+row.seqid+')">保存</a> ';
                                var c = '<a href="#" style="color:red" onclick="cancelrow('+index+','+row.seqid+')">取消</a>';
                                return s+c;
                            } else {
                                var e = '<a href="#" style="color:red" onclick="editrow('+index+')">修改</a> ';
                                var d = '<a href="#" style="color:red" onclick="deleterow('+index+','+row.seqid+')">删除</a>';
                                return e+d;
                            }
                        }
                    }						                            												
    		    ]],
        		onBeforeEdit:function(index,row){
        		    row.editing = true;
        		    $grid_phone.datagrid('refreshRow', index);
        		},
        		onAfterEdit:function(index,row){
        		    row.editing = false;
        		    $grid_phone.datagrid('refreshRow', index);
        		},
        		onCancelEdit:function(index,row){
        		    row.editing = false;
        		    $grid_phone.datagrid('refreshRow', index);
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
	
	addphonerow = function (){
		$grid_phone.datagrid('appendRow',{
			  "seqid": "0",
		      "phone": "",
		      "remark": ""
			}
		);
		options = $grid_phone.datagrid('getPager').data("pagination").options;
		number = options.total;	
		$grid_phone.datagrid('beginEdit',number-1);
	//	$grid_phone.datagrid("selectRow",number-1);
		if(-1 != editindex)
		{
			$grid_phone.datagrid('cancelEdit', editindex);
		}
		editindex = number-1;
	};
	editrow = function (index){
		if(-1 != editindex)
		{
			$grid_phone.datagrid('cancelEdit', editindex);
			$grid_phone.datagrid('selectRow',editindex);
			var row = $grid_phone.datagrid('getSelected');
			$grid_phone.datagrid('unselectRow',editindex);
			if( '0' == row.uid )
			{
				$grid_phone.datagrid('deleteRow', editindex);
			}
		}
		editindex = index;
	
		$grid_phone.datagrid('beginEdit', index);
	//	$grid_phone.datagrid("selectRow", index);
	};
	cancelrow = function (index,id){
		$grid_phone.datagrid('cancelEdit', index);
		editindex = -1;
		//对于新加行，没有编辑保存的直接删除
		if(0 == id)
		{
			$grid_phone.datagrid('deleteRow', index);
		}
	};
	
	/*
	 * 以下涉及后台操作
	 */
	saverow = function (index,id){
		var ed_phone = $grid_phone.datagrid('getEditor', {index:index,field:'phone'});
		var ed_remark = $grid_phone.datagrid('getEditor', {index:index,field:'remark'});
		
		if(!$(ed_phone.target).validatebox('isValid'))
		{
			fun_showMsg('提示','号码不能为空，请修改!');
			return;
		}	
		
		$.ajax({            
	        type:"POST",   //post提交方式默认是get
	        url: '<?php echo $this->createUrl('updatephone'); ?>', 
	        dataType:"json",
	        data: {SeqID : id,
	        	Phone : $(ed_phone.target).val(),
	        	Remark : $(ed_remark.target).val()
	        },            
	        error:function(err) {      // 
				fun_showMsg('提示','数据请求失败('+JSON.stringify(err)+')');
				$grid_phone.datagrid('reload');
	        },
	        success:function(resp) {
	            if(resp.success)
	            {
		            $grid_phone.datagrid('reload');
		            row = $grid_phone.datagrid('getSelected');
		            if(row.seqid == 0)
			        	row.seqid = resp.data.id;
		            $grid_phone.datagrid('endEdit', index);
		            $grid_phone.datagrid('unselectRow', index);
		            editindex = -1;
	            }
	            fun_showMsg('提示',resp.msg);
	        }            
	  	}); 
	};
	queryphone = function (){	
		$grid_phone.datagrid('loadData',{total:0,rows:[]});
		$.messager.progress({
			title : '提示',
			text : '数据查询中，请稍后....'
		}); 
		$.ajax({            
			  type:"POST",   //post提交方式默认是get
			  url: '<?php echo $this->createUrl('getphone'); ?>',
			  dataType:"json",
			 // async:false,    
			  data:{
				  }, 
			  error:function(err) {      // 
				$.messager.progress('close');
				fun_showMsg('提示','号码数据请求失败('+JSON.stringify(err)+')');
			  },
			  success:function(resp) {
				  $.messager.progress('close');
			      if(resp.success)
			      {
				    	$grid_phone.datagrid('loadData',resp.data);
			      }else
			      	fun_showMsg('提示','获取号码数据错误('+resp.msg+')');
			  }            
		});
	};
	queryphone();
	deleterow = function (index,id){
		if(-1 != editindex)
		{
			$grid_phone.datagrid('cancelEdit', editindex);
			$grid_phone.datagrid('selectRow',editindex);
			var row = $grid_phone.datagrid('getSelected');
			$grid_phone.datagrid('unselectRow',editindex);
			if( '0' == row.uid )
			{
				$grid_phone.datagrid('deleteRow', editindex);
				editindex = -1;
			}
		}	
	 	$.messager.confirm('提示','您确定要删除吗?',function(r){
	        if (r){
	        	$.ajax({            
	                type:"POST",   //post提交方式默认是get
	                url: '<?php echo $this->createUrl('deletephone'); ?>',
	                dataType:"json",
	                data:  {UIDs: id },      
	                error:function(err) {      // 
	        			fun_showMsg('提示','数据请求失败('+JSON.stringify(err)+')');
	                },
	                success:function(resp) {
	                	queryphone();

	                	fun_showMsg('提示',resp.msg);
	                //    $grid_phone.datagrid('reload');
	                }            
	          	});       	
	        }
	    });
	};
	deletephonerows = function (){
		var ids = [];  
	    var rows = $grid_phone.datagrid('getChecked');  
	    if(rows.length > 0)
	    {
	    	$.messager.confirm('提示','您确定要删除吗?',function(r)
	        {
	            if (r){
	    		    for(var i=0;i<rows.length;i++)
	    	 			ids.push(rows[i].seqid);  
	    	//	    alert(ids.join(','));
	    		    $.ajax({            
	    	            type:"POST",   //post提交方式默认是get
	    	            url: '<?php echo $this->createUrl('deletephone'); ?>',
	    	            dataType:"json",
	    	            data:  {UIDs: ids.join(',')},      
	    	            error:function(err) {      // 
	    	    			fun_showMsg('提示','数据请求失败('+JSON.stringify(err)+')');
	    	            },
	    	            success:function(resp) {
	    	            	if(resp.success)
	    	            	{
	    	            		$grid_phone.datagrid('loadData',{total:0,rows:[]});
		    	        		$.ajax({            
		    	        			  type:"POST",   //post提交方式默认是get
		    	        			  url: '<?php echo $this->createUrl('getphone'); ?>',
		    	        			  dataType:"json",
		    	        			 // async:false,    
		    	        			  data:{
		    	        				  }, 
		    	        			  error:function(err) {      // 
		    	        					fun_showMsg('提示','号码数据请求失败('+JSON.stringify(err)+')');
		    	        			  },
		    	        			  success:function(resp) {
		    	        			      if(resp.success)
		    	        			      {
		    	        				    	$grid_phone.datagrid('loadData',resp.data);
		    	        			      }else
		    	        			      	fun_showMsg('提示','获取号码数据错误('+resp.msg+')');
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
	    	fun_showMsg('提示','请先选择您要删除的号码!');	
	};
	
});
</script>
<table id="set_senior_grid"></table>
<div id="set_senior_tb" style="padding:5px;height:auto">
    <div>
    	<a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-add" onclick="addphonerow()" disabled ="true">新增号码</a>
    	<a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-remove" onclick="deletephonerows()" disabled ="true">删除选中号码</a>  
    	<B>(暂未开通)接收成绩通知的手机号码添加，最多添加三个号码</B>
    </div>
</div>
