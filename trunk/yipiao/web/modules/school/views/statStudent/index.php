<script type="text/javascript">
$(function(){
	var $grid_score = $('#stat_student_grid');
	
	var classids_combotree_data;
	var grid_data;
	var setrowindex = -1;
	var iscompair = 0;
	
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
	    		$('#stat_stu_clacombotree').combotree('loadData',resp.data);
	        }else
	        	fun_showMsg('提示','获取班级数据错误('+resp.msg+')');
	    }            
	});
	
	$grid_score.datagrid({   
		border:true,
		fit: true,
		striped:true,
	//	checkbox : true,
		sortName: 'name',  
	    sortOrder: 'asc',  
	    remoteSort: false, 
//	    onRowContextMenu: onRowContextMenu,
		singleSelect: true,
	    toolbar: '#stat_student_tb',   
	    frozenColumns:[
	    	{field: 'uid', title: 'UID'}			                            												
		]
	}); 
	
	//添加右击菜单内容 
	function onRowContextMenu(e, rowIndex, rowData){
		if(yproleid == 1)
	        return;
		setrowindex = rowIndex;
	   	e.preventDefault(); 
	 //  	var selected=$grid_score.datagrid('getRows'); //获取所有行集合对象 
	 //   selected[rowIndex].uid; //index为当前右键行的索引，指向当前行对象 
	 	if(0==iscompair)
		    $('#stat_stu_grid_rm1').menu('show', { 
		        left:e.pageX, 
		        top:e.pageY 
		    });       
	 	else  
		    $('#stat_stu_grid_rm2').menu('show', { 
		        left:e.pageX, 
		        top:e.pageY 
		    });   
	};
	setstucompair = function (){
		iscompair = 1;
		$grid_score.datagrid('loadData',grid_data);
	};
	cancelcompair = function (){
		iscompair = 0;
		$grid_score.datagrid('loadData',grid_data);
	};
	/*
	 * 以下涉及后台操作
	 */
	queryscore = function (){
		//判断是否选择
		if(!$('#stat_stu_clacombotree').combotree('isValid'))
		{
			fun_showMsg('提示','班级不能为空，请修改!');
			return;
		}
		if(!$('#stat_stu_exacombobox').combobox('isValid'))
		{
			fun_showMsg('提示','考试不能为空，请修改!');
			return;
		}	
		if(!$('#stat_stu_name_combogird').combobox('isValid'))
		{
			fun_showMsg('提示','姓名不能为空，请修改!');
			return;
		}	
		$.messager.progress({
			title : '提示',
			text : '数据查询中，请稍后....'
		}); 
		//查询数据
		$.ajax({            
			  type:"POST",   //post提交方式默认是get
			  url: '<?php echo $this->createUrl('getscore'); ?>',
			  dataType:"json",
			 // async:false,    
			  data:{ClassID: $('#stat_stu_clacombotree').combotree('getValues').join(','),
				  ExamID: $('#stat_stu_exacombobox').combobox('getValues').join(','),
				  UIDs: $('#stat_stu_name_combogird').combogrid('getValues').join(',')
			  }, 
			  error:function(err) {      // 
				  $.messager.progress('close');
					fun_showMsg('提示','成绩数据请求失败('+JSON.stringify(err)+')');
			  },
			  success:function(resp) {
				  $.messager.progress('close');
			      if(resp.success)
			      {
			    	  	var options = {};
			    	    options.columns = eval("[["+
			    	     		"{field: 'name', title: '姓名',sortable:true}"+
			    	     	    "]]"); 
			    	    var dataid = resp.subjectids.split(',');   
			    	    for(var i = 0; i < dataid.length ; i++)
			    	    {
				    	    var temp = dataid[i].split('-');
			    	    	options.columns[0].push(
					    	    {field: 's'+temp[0] , title: temp[1] , sortable:true//,
	    	    	            /*    formatter: function(value, row, index){
										var arrvalue = value.split('-');
										var showvalue = arrvalue[0];
										if(1 == iscompair && setrowindex !=  index)
										{		
											var Rows=$grid_score.datagrid('getRows'); //获取所有行集合对象 		
											if(parseFloat(showvalue) < parseFloat(Rows[setrowindex][arrvalue[1]].split('-')[0]))
											{
												var diff = parseFloat(Rows[setrowindex][arrvalue[1]].split('-')[0]) - parseFloat(showvalue);
												showvalue += '  <font color="green">▼'+ diff+'</font>';
											}else if(parseFloat(showvalue) > parseFloat(Rows[setrowindex][arrvalue[1]].split('-')[0]))
											{
												var diff = parseFloat(showvalue) -parseFloat(Rows[setrowindex][arrvalue[1]].split('-')[0]);
												showvalue += '  <font color="red">▲'+ diff+'</font>';
											}
										}
									//	alert(showvalue);
										var tip = '班排名:'+ row[arrvalue[1]+'-cr'] + ' 年排名:' + row[arrvalue[1]+'-gr'];
										var content = '<span title="' + tip + '">' + showvalue + '</span>';  
					                    return content;
			    	                }  	    	  */  
			    	    	   	}
	    	    			);
				    	    options.columns[0].push(
	    	    	    	    {field: 's'+temp[0]+'-r' , title: temp[1]+'排名' ,sortable:true}
	    	    			);
			    	    /*	options.columns[0].push(
	    	    	    	    {field: 's'+temp[0]+'-gr' , title: temp[1]+'年排名' ,sortable:true}
	    	    			);*/
				    	}
			    	  	$grid_score.datagrid(options);
						grid_data = resp.data;
				  		$grid_score.datagrid('loadData',grid_data);
			      }else
			      	fun_showMsg('提示','获取成绩数据错误('+resp.msg+')');
			  }            
		});	
	};
	exportclassscore = function (){
		if(!$('#stat_stu_clacombotree').combotree('isValid'))
		{
			fun_showMsg('提示','班级不能为空，请修改!');
			return;
		}
		if(!$('#stat_stu_exacombobox').combobox('isValid'))
		{
			fun_showMsg('提示','考试不能为空，请修改!');
			return;
		}	
		fun_showMsg('提示','导出班级ID('+$('#stat_stu_clacombotree').combotree('getValues').join(',')+')excel');
	};
	exportgradescore = function (){
		if(!$('#stat_stu_clacombotree').combotree('isValid'))
		{
			fun_showMsg('提示','班级不能为空，请修改!');
			return;
		}
		if(!$('#stat_stu_exacombobox').combobox('isValid'))
		{
			fun_showMsg('提示','考试不能为空，请修改!');
			return;
		}	
		var gradeid = 0;
		var iscompair = 0;
		for(var i = 0;i < classids_combotree_data.length;i++)
		{
			gradeid = classids_combotree_data[i].id;
			for(var j = 0;j < classids_combotree_data[i].children.length;j++)
			{
				if(classids_combotree_data[i].children[j].id == $('#stat_stu_clacombotree').combotree('getValues').join(','))
				{
					iscompair = 1;
					break;
				}
			}
			if(1 == iscompair)
				break;
		}
		fun_showMsg('提示','导出年级ID('+gradeid+')excel');
	};
});


</script>

<table id="stat_student_grid" data-options="fit:true"></table>
<div id="stat_stu_grid_rm1" class="easyui-menu" style="width:120px;"> 
    <div onClick="setstucompair()" data-options="iconCls:''">设置该生成绩为比较</div> 
</div>
<div id="stat_stu_grid_rm2" class="easyui-menu" style="width:120px;">
	<div onClick="setstucompair()" data-options="iconCls:''">设置该生成绩为比较</div>  
    <div onClick="cancelcompair()" data-options="iconCls:''">去除比较</div> 
</div>
<div id="stat_student_tb" style="padding:5px;height:auto">   
	<div style="margin-bottom:5px">
		班级: 
		<input class="easyui-combotree"   
            id="stat_stu_clacombotree"  
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
                    				$('#stat_stu_clacombotree').combotree('setValue', data[i].children[j].id);
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
                   		$('#stat_stu_exacombobox').combobox('setValues','');
                   		$('#stat_stu_name_combogird').combogrid('setValues','');
                   		$.ajax({            
						    type:'POST',   
						    url: '<?php echo $this->createUrl('getexam'); ?>',
						    dataType:'json',    
						    data : {ClassID : node.id},
						    error:function(err) {      
								fun_showMsg('提示','考试数据请求失败('+JSON.stringify(err)+')');
						    },
						    success:function(resp) {
						    	if(resp.success)
						        {
						    		$('#stat_stu_exacombobox').combobox('loadData',resp.data);
						        }else
						        	fun_showMsg('提示','获取考试数据错误('+resp.msg+')');
						    }            
						});
						$.ajax({            
						    type:'POST',   
						    url: '<?php echo $this->createUrl('getstudent'); ?>',
						    dataType:'json',    
						    data : {ClassID : node.id},
						    error:function(err) {      
								fun_showMsg('提示','学生数据请求失败('+JSON.stringify(err)+')');
						    },
						    success:function(resp) {
						    	if(resp.success)
						        {
						    		$('#stat_stu_name_combogird').combogrid('grid').datagrid('loadData',resp.data);
						    		$('#stat_stu_name_combogird').combogrid('grid').datagrid('selectRecord', <?php echo Yii::app()->user->getId();?>);
						        }else
						        	fun_showMsg('提示','获取学生数据错误('+resp.msg+')');
						    }            
						});
                   }
            ">
		&nbsp;&nbsp;考试名称: 
	    <input class="easyui-combobox"   
            id="stat_stu_exacombobox"  
            style="width:150px;height:26px;"
            data-options="  
                    valueField:'id',  
                    textField:'text',  
                    editable:false,
                    required : true,
                    multiple: false,
                    panelHeight:'auto',
                    onLoadSuccess : function()
                    {
                   		var data = $('#stat_stu_exacombobox').combobox('getData');
                   		for(var i=0;i< data.length;i++)
                   		{
                   			if(data[i].selected)
                   			{
                    			$('#stat_stu_exacombobox').combobox('select', data[i].id);
                    			return;
                    		}
                    	}
                    }
            ">             
		&nbsp;&nbsp;姓名: 
	    <select id="stat_stu_name_combogird" class="easyui-combogrid" name="dept" style="width:220px;"  
	        data-options="   
	            panelWidth:220,   
	            multiple : true,
	            idField:'uid',  
	            required : true,
	            textField:'name',  
	            columns:[[   
	                {field:'uid',title:'uid',hidden:true},   
	                {field:'studyno',title:'学号',width:80},   
	                {field:'name',title:'姓名',width:80}   
	            ]]   
	        ">
	    </select>  
	    <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="queryscore()">查询</a>
	    &nbsp;&nbsp;
<!--	    <a id="mb" class="easyui-menubutton"    
        data-options="menu:'#mm',iconCls:''">导出Excel</a>  
			<div id="mm" style="width:150px;">  
			    <div data-options="iconCls:''" onclick="exportclassscore()">班级成绩</div>  
			    <div data-options="iconCls:''" onclick="exportgradescore()">年级成绩</div>  
			</div> 
	    </a> -->
    </div> 
</div>

