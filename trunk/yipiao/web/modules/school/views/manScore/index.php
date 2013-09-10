<script type="text/javascript">
$(function(){
	var $grid_score = $('#man_score_grid');
	var editindex = -1;

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
	    		$('#man_sco_clacombotree').combotree('loadData',resp.data);
	        }else
	        	fun_showMsg('提示','获取班级数据错误('+resp.msg+')');
	    }            
	});
	
	$grid_score.datagrid({   
		border:true,
	//	pagination:true,
	//	pageList:[400,600,800,1000],
	//	pageSize:400,
		fit: true,
		checkbox : true,
	//	singleSelect:true,
	//	idField:'seqid',
	    toolbar: '#man_score_tb',   
	    frozenColumns:[		
			{field: 'seqid', title: '流水ID'}
		],
		onBeforeEdit:function(index,row){
		    row.editing = true;
		    $grid_score.datagrid('refreshRow', index);
		},
		onAfterEdit:function(index,row){
		    row.editing = false;
		    $grid_score.datagrid('refreshRow', index);
		},
		onCancelEdit:function(index,row){
		    row.editing = false;
		    $grid_score.datagrid('refreshRow', index);
		}
	}); 
	
	editrow = function (index,id){
		if(-1 != editindex)
		{
			$grid_score.datagrid('cancelEdit', editindex);
			$grid_score.datagrid('unselectRow',editindex);
		}
		editindex = index;
	
		$grid_score.datagrid('beginEdit', index);
	//	$grid_score.datagrid("selectRow", index);
	};
	
	cancelrow = function (index,id){
		$grid_score.datagrid('cancelEdit', index);
		editindex = -1;
	};
	
	/*
	 * 以下涉及后台操作
	 */
	saverow = function (index,examid,uid,classid,gradeid){
		var subjectids = '';
		var postdata = {ExamID : examid,
				UID : uid,
				ClassID : classid,
				GradeID : gradeid
				};
		var isfirst = 1;
		var opts = $grid_score.datagrid('getColumnFields');
		for (i = 6; i < opts.length; i++) {
			if( 'action' != opts[i])
			{
				if(1 == isfirst)
				{
					subjectids = opts[i];
					isfirst = 0;
				}
				else
					subjectids = subjectids + ',' + opts[i];
				var ed = $grid_score.datagrid('getEditor', {index:index,field: opts[i]});
				postdata[opts[i]] =  $(ed.target).val();
			}
		}
		postdata['subjectids'] =  subjectids;
		$.ajax({            
	        type:"POST",   //post提交方式默认是get
	        url: '<?php echo $this->createUrl('updatescore'); ?>', 
	        dataType:"json",
	        data: postdata,            
	        error:function(err) {      // 
				fun_showMsg('提示','数据请求失败('+JSON.stringify(err)+')');
				$grid_score.datagrid('reload');
	        },
	        success:function(resp) {
	            if(resp.success)
	            {
		            $grid_score.datagrid('reload');
		            $grid_score.datagrid('endEdit', index);
		            $grid_score.datagrid('unselectRow', index);
		            editindex = -1;
	            }
	            fun_showMsg('提示',resp.msg);
	        }            
	  	}); 
	};
	queryscore = function (){
		//判断是否选择
		if(!$('#man_sco_clacombotree').combotree('isValid'))
		{
			fun_showMsg('提示','班级不能为空，请修改!');
			return;
		}
		if(!$('#man_sco_exacombobox').combobox('isValid'))
		{
			fun_showMsg('提示','考试不能为空，请修改!');
			return;
		}
		if(!$('#man_sco_subcombobox').combobox('isValid'))
		{
			fun_showMsg('提示','科目不能为空，请修改!');
			return;
		}			
		//动态定义表格列
	    var options = {};
	    options.columns = eval("[["+
				"{field: 'uid', title: '用户ID' ,hidden:true},"+
				"{field: 'classid', title: '班级ID' ,hidden:true},"+
				"{field: 'gradeid', title: '年级ID' ,hidden:true},"+
				"{field: 'examid', title: '考试ID' ,hidden:true},"+
	    		"{field: 'name', title: '姓名', width: 80},"+
	    		"{field: 'studyno', title: '学号', width: 80}"+
	    	    "]]"); 
	    var dataid = $('#man_sco_subcombobox').combobox('getValues');
	    var datatext = $('#man_sco_subcombobox').combobox('getText').split(',');
	    for(var i = 0; i < dataid.length ; i++)
	    {
	    	options.columns[0].push(
	    	    {field: 's'+dataid[i] , title: datatext[i] , width: 70,
					editor:{
						type:'numberbox',
						options:{
				        	min:-1,   
				            precision:0
		 				}
					}
				}
			);
	    }
	    options.columns[0].push(
		    {field:'action',title:'操作',width:60,align:'center',
		        formatter:function(value,row,index){
		            if (row.editing){
		                var s = '<a href="#" style="color:red" onclick="saverow('+index+','+row.examid+','+row.uid+','+row.classid+','+row.gradeid+')">保存</a> ';
		                var c = '<a href="#" style="color:red" onclick="cancelrow('+index+','+row.seqid+')">取消</a>  ';
		                return s+c;
		            } else {
		                var e = '<a href="#" style="color:red" onclick="editrow('+index+','+row.seqid+')">修改</a> ';
		                return e;
		            }
		        }
	    	}
	    );
		$grid_score.datagrid(options);
		
		//查询数据
		$.ajax({            
			  type:"POST",   //post提交方式默认是get
			  url: '<?php echo $this->createUrl('getscore'); ?>',
			  dataType:"json",
			 // async:false,    
			  data:{classid: $('#man_sco_clacombotree').combotree('getValues').join(','),
				  examid: $('#man_sco_exacombobox').combobox('getValues').join(','),
				  subjectids: $('#man_sco_subcombobox').combobox('getValues').join(','),
				  name: $('#man_sco_namebox').val()
				  }, 
			  error:function(err) {      // 
					fun_showMsg('提示','成绩数据请求失败('+JSON.stringify(err)+')');
			  },
			  success:function(resp) {
			      if(resp.success)
			      {
				    	$grid_score.datagrid('loadData',resp.data);
			      }else
			      	fun_showMsg('提示','获取成绩数据错误('+resp.msg+')');
			  }            
		});
	};
	
	importfile = function (){
		if(!$('#man_sco_exacombobox').combobox('isValid'))
		{
			fun_showMsg('提示','考试不能为空，请修改!');
			return;
		};
		$('#fileupload').fileupload({
	        url: '<?php echo $this->createUrl('import'); ?>',
	        dataType: 'json',
	        formData:{examid:$('#man_sco_exacombobox').combobox('getValues').join(',')
		        },
	        done: function (e, data) {
				fun_showMsg('提示',data.result.msg);
	        }
	    }).prop('disabled', !$.support.fileInput)
	        .parent().addClass($.support.fileInput ? undefined : 'disabled');
	};
	exportfile = function (){
		//判断是否选择
		if(!$('#man_sco_exacombobox').combobox('isValid'))
		{
			fun_showMsg('提示','考试不能为空，请修改!');
			return;
		}		
		if(!$('#man_sco_subcombobox').combobox('isValid'))
		{
			fun_showMsg('提示','科目不能为空，请修改!');
			return;
		}
		$.ajax({            
			  type:"POST",   //post提交方式默认是get
			  url: '<?php echo $this->createUrl('export'); ?>',
			  dataType:"json",
			 // async:false,    
			  data:{examid: $('#man_sco_exacombobox').combobox('getValues').join(','),
				  subjectids: $('#man_sco_subcombobox').combobox('getValues').join(',')
				  }, 
			  error:function(err) {      // 
					fun_showMsg('提示','模板下载请求失败('+JSON.stringify(err)+')');
			  },
			  success:function(resp) {
			      if(resp.success)
			      {
			    	  fun_showMsg('提示','模板调用成功');
			      }else
			      	fun_showMsg('提示','模板下载错误('+resp.msg+')');
			  }            
		});
	};
});
</script>
<table id="man_score_grid"></table>
<div id="man_score_tb" style="padding:5px;height:auto">   
	<div style="margin-bottom:5px">    
		班级: 
		<input class="easyui-combotree"   
            id="man_sco_clacombotree"  
            style="width:150px;height:26px;"
            data-options="  
            		valueField:'id',
                    textField:'text', 
                    multiple: false , 
                    required : true,
                    panelHeight:'auto',
                    onLoadSuccess : function(node, data){
                    	for(var i=0;i < data.length;i++)
                    	{
                    		for(var j=0;j < data[i].children.length;j++ )
                    		{
                    			if(data[i].children[j].selected)
                    			{
                    				$('#man_sco_clacombotree').combotree('setValue', data[i].children[j].id);
                    				return;
                    			}
                    		}
                    	}
                    },
                    onBeforeSelect: function(node) 
	                {            
                    	if (!$(this).tree('isLeaf', node.target)) 
                    	{                
                        	return false;            
                        }              		
                   },
                   onSelect : function(node)
                   {
                   		$.ajax({            
						    type:'POST',   
						    url: '<?php echo $this->createUrl('getexam'); ?>',
						    dataType:'json',    
						    data:{ClassID: node.id},
						    error:function(err) {      // 
								fun_showMsg('提示','考试数据请求失败('+JSON.stringify(err)+')');
						    },
						    success:function(resp) {
						    	if(resp.success)
						        {
						    		$('#man_sco_exacombobox').combobox('loadData',resp.data);
						        }else
						        	fun_showMsg('提示','获取考试数据错误('+resp.msg+')');
						    }            
						});
                   }
            ">
		&nbsp;&nbsp;考试名称: 
	    <input class="easyui-combobox"   
            id="man_sco_exacombobox"  
            style="width:150px;height:26px;"
            data-options="  
                    valueField:'id',  
                    textField:'text',  
                    editable:false,
                    required : true,
                    multiple: false,
                    panelHeight:'auto',
                    onSelect : function(node)
                    {
                    	$('#man_sco_subcombobox').combobox('clear');
                    	$('#man_sco_subcombobox').combobox('loadData',node.subject);
                    },
                    onLoadSuccess : function()
                    {
                   		var data = $('#man_sco_exacombobox').combobox('getData');
                   		for(var i=0;i< data.length;i++)
                   		{
                   			if(data[i].selected)
                   			{
                    			$('#man_sco_exacombobox').combobox('select', data[i].id);
                    			return;
                    		}
                    	}
                    }
            ">             
	    &nbsp;&nbsp;科目: 
	    <input class="easyui-combobox"   
            id="man_sco_subcombobox"  
            style="width:100px;height:26px;"
            data-options="  
                    valueField:'id',  
                    textField:'text',  
                    editable:false,
                    required : true,
                    multiple:true,  
                    panelHeight:'auto'  
            "> 
		&nbsp;&nbsp;姓名: 
	    <input class="easyui-validatebox" 
	    		id="man_sco_namebox"  
	    		style="width:100px;height:18px; "
	    		data-options="  
	    			required : false
	    	">
	    <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="queryscore()">查询</a>
	    &nbsp;&nbsp;
	    <a href="./static/download/分数导入模板.xls" class="easyui-linkbutton" iconCls="" >模板下载</a>  
	    &nbsp;&nbsp;文件上传:  
	    <span class="btn btn-success fileinput-button">
            <i class="icon-plus icon-white"></i>
            <span>选择</span>
            <!-- The file input field used as target for the file upload widget -->
            <input id="fileupload" type="file" name="file" onclick="importfile()">
        </span>
    </div>
</div>
