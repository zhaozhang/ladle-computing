<script type="text/javascript">
$(function(){
	var $grid_score = $('#stat_sturank_grid');
	var examdate_data;
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
	    		$('#stat_sturank_clacombotree').combotree('loadData',resp.data);
	        }else
	        	fun_showMsg('提示','获取班级数据错误('+resp.msg+')');
	    }            
	});
	
	$grid_score.datagrid({   
		border:true,
		fit: true,
		striped:true,
		checkbox : true,
	//	singleSelect: true,
	    toolbar: '#stat_sturank_tb',   
	    frozenColumns:[
	    	{field: 'uid', title: 'UID', width: 10,hidden:true}			                            												
		],
		onCheckAll:function(rows){
			if(rows.length > 5)
			{
				$grid_score.datagrid('uncheckAll');
				fun_showMsg('提示','不允许选择超过5人进行图形比较');
				return;
			}
			createchart();
		},
		onCheck:function(rowindex,rowdata){
			createchart();
		},
		onUncheck:function(rowindex,rowdata){
			createchart();
		}
	}); 
	//创建图表
	createchart = function (){
		var colors = Highcharts.getOptions().colors;	
		var rows = $grid_score.datagrid('getSelections');
		var index;
		if(0 == $('#stat_sco_subcombobox').combobox('getValues'))
		{
			index = 1;
		}else
		{
			index = 2;
		}
		var options = {
			chart: {
				renderTo: 'stat_sturank_charts',
				defaultSeriesType: 'line',
		    	zoomType: 'xy'  //******  这句是实现局部放大的关键处  ******
			},
			title: {
			    text: $('#stat_sco_subcombobox').combobox('getText')+'曲线图'
			},
			xAxis: {
			    categories: []
			},
			yAxis: {
				min:0,
			    reversed:true,
			    title: {
			        text: '名次'
			    }
			},
			credits: {
				text:'一瓢计算',
				href:''
			},
			tooltip: {
			    crosshairs: true,
			    formatter: function() {   
					return '<span style="color:'+this.series.color+';font-weight:bold">'+ this.series.name +'('+this.point.data.split('|')[0]+')</span><br/>'+
						'<span style="color:'+this.series.color+'">名次:'+ this.y+'</span>';   
				} 
			},
			legend: {
				align : 'right',
				verticalAlign : 'middle',
				layout: 'vertical'
			},
			plotOptions: {
				line: {
			        dataLabels: {
			            enabled: true
			        }
			    }
			},
			series: []
		};
	
	//	alert($('#stat_sturank_layout').layout('panel', 'south')['collapsed']);
	/*	if(rows.length > 0 )
			$('#stat_sturank_layout').layout('expand', 'south'); 
		else
			$('#stat_sturank_layout').layout('collapse', 'south'); */
		for(var i = 0 ;i < rows.length;i++)
		{
			var rowdata = rows[i];
			var dataid = examdate_data.split(',');
			var tempCategories = [];
			var tempSeriesdata = [];
		    for(var j = 0; j < dataid.length ; j++)
		    {
		    	if(0==i)
		    		options.xAxis.categories.push(dataid[j]);
	    		var y = rowdata[dataid[j]].split('|')[index];
	    		if('' == y)
	        		y=0;
		    	tempSeriesdata.push({
				    	y: parseInt(y),
						data:rowdata[dataid[j]]
			    	}
		    	);
		    }
			options.series.push({
			    name: rowdata['name'],
			    marker: {
			        symbol: 'circle'
			    },
			    data: tempSeriesdata
			});
		}
	    var chart = new Highcharts.Chart(options);
	};
	
	/*
	 * 以下涉及后台操作
	 */
	queryscore = function (){
		//判断是否选择
		if(!$('#stat_sturank_clacombotree').combotree('isValid'))
		{
			fun_showMsg('提示','班级不能为空，请修改!');
			return;
		}
		if(!$('#stat_sturank_subcombobox').combobox('isValid'))
		{
			fun_showMsg('提示','科目不能为空，请修改!');
			return;
		}
		if(!$('#stat_sturank_namecombogird').combobox('isValid'))
		{
			fun_showMsg('提示','学生不能为空，请修改!');
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
			  data:{ClassID: $('#stat_sturank_clacombotree').combotree('getValues').join(','),
				  SubjectID: $('#stat_sturank_subcombobox').combobox('getValues').join(','),
				  UIDs: $('#stat_sturank_namecombogird').combogrid('getValues').join(',')
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
			    	    		"{field: 'ck', checkbox:true},"+
			    	     		"{field: 'name', title: '姓名',sortable:true}"+
			    	     	    "]]"); 
			    	    examdate_data = resp.examdates;
			    	    var dataid = resp.examdates.split(',');
			    	    for(var i = 0; i < dataid.length ; i++)
			    	    {
			    	    	options.columns[0].push(
					    	    {field: dataid[i] , title: dataid[i] ,
	    	    	                formatter: function(value, row, index){
										var arrvalue = value.split('|');
										var showvalue = arrvalue[1]+'('+arrvalue[2]+')';
										var tip = arrvalue[0];
										var content = '<span title="' + tip + '">' + showvalue + '</span>';  
					                    return content;
			    	                }  	    	    
			    	    	   	}
	    	    			);
				    	}
			    	  	$grid_score.datagrid(options);
				  		$grid_score.datagrid('loadData',resp.data);
			      }else
			      	fun_showMsg('提示','获取排名数据错误('+resp.msg+')');
			  }            
		});	
	}
});
</script>
<div class="easyui-layout" fit="true" id='stat_sturank_layout' >
	<div region="center" title=""  >
		<table id="stat_sturank_grid" data-options="fit:true"></table>
		<div id="stat_sturank_grid_rm1" class="easyui-menu" style="width:120px;"> 
		    <div onClick="setstucompair()" data-options="iconCls:''">设置该生成绩为比较</div> 
		</div>
		<div id="stat_sturank_grid_rm2" class="easyui-menu" style="width:120px;">
			<div onClick="setstucompair()" data-options="iconCls:''">设置该生成绩为比较</div>  
		    <div onClick="cancelcompair()" data-options="iconCls:''">去除比较</div> 
		</div>
		<div id="stat_sturank_tb" style="padding:5px;height:auto">   
			<div style="margin-bottom:5px">
				班级: 
				<input class="easyui-combotree"   
		            id="stat_sturank_clacombotree"  
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
		                    				$('#stat_sturank_clacombotree').combotree('setValue', data[i].children[j].id);
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
		                   		$('#stat_sturank_namecombogird').combogrid('setValues','');
		                   		$('#stat_sturank_subcombobox').combobox('setValues','');
		                   		$.ajax({            
								    type:'POST',   
								    url: '<?php echo $this->createUrl('getsubject'); ?>',
								    dataType:'json',    
								    data : {ClassID : node.id},
								    error:function(err) {      
										fun_showMsg('提示','科目数据请求失败('+JSON.stringify(err)+')');
								    },
								    success:function(resp) {
								    	if(resp.success)
								        {
								    		$('#stat_sturank_subcombobox').combobox('loadData',resp.data);
								        }else
								        	fun_showMsg('提示','获取科目数据错误('+resp.msg+')');
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
								    		$('#stat_sturank_namecombogird').combogrid('grid').datagrid('loadData',resp.data);
								    		$('#stat_sturank_namecombogird').combogrid('grid').datagrid('selectRecord', <?php echo Yii::app()->user->getId();?>);
								        }else
								        	fun_showMsg('提示','获取学生数据错误('+resp.msg+')');
								    }            
								});
		                   }
		            ">
		        &nbsp;&nbsp;科目: 
			    <input class="easyui-combobox"   
		            id="stat_sturank_subcombobox"  
		            style="width:100px;height:26px;"
		            data-options="  
		                    valueField:'id',  
		                    textField:'text',  
		                    editable:false,
		                    required : true,
		                    multiple: false,  
		                    panelHeight:'auto'  
		            ">         	                     
				&nbsp;&nbsp;姓名: 
			    <select id="stat_sturank_namecombogird" class="easyui-combogrid" name="dept" style="width:220px;"  
			        data-options="   
			            panelWidth:220,   
			            multiple : true,
			            required : true,
			            idField:'uid',  
			            textField:'name',  
			            columns:[[   
			                {field:'uid',title:'uid',hidden:true},   
			                {field:'studyno',title:'学号',width:80},   
			                {field:'name',title:'姓名',width:80}   
			            ]]   
			        ">
			    </select>  
			    <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="queryscore()">查询</a>
			    &nbsp;&nbsp;&nbsp;&nbsp;图表数据: 
			    <input class="easyui-combobox"   
		            id="stat_sco_subcombobox"  
		            style="width:100px;height:26px;"
		            data-options="  
		                    valueField:'id',  
		                    textField:'text',  
		                    editable:false,
		                    required : true,
		                    multiple: false ,
		                    panelHeight:'auto'  ,
		                    data:[  
			                    {id:'0',text:'班级排名',selected:false},  
			                    {id:'1',text:'年级排名',selected:true}
			                ],
			                onSelect : function(){
			                	createchart();
			                } 
		            ">	
		    </div>
		</div>
	</div>
    <div id="stat_sturank_charts"  
    	data-options="region:'south',split:true" title="图形对比" style="height:320px;padding:0px;" collapsed=false>
	</div>
</div>
