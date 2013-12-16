<script type="text/javascript">
$(function(){
	var $grid_score = $('#stat_class_grid');
	
	var classids_combotree_data;
	var grid_data;
	var examsubject_data;
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
	    	{field: 'uid', title: 'UID',rowspan:2}			                            												
		],
		onClickRow:function(rowIndex,rowData){
			createchart(rowData);
		}
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

	//创建图表
	createchart = function (rowData){	
		var colors = Highcharts.getOptions().colors;	
		
		var options = {
			chart: {
				renderTo: 'stat_sturank_charts',
				defaultSeriesType: 'column',
		    	zoomType: 'xy'  //******  这句是实现局部放大的关键处  ******
			},
			title: {
			    text: '各科成绩对比图'
			},
			subtitle: {
			    text: '考试名称'
			},	
			xAxis: {
			    categories: []
			},
			yAxis: {
			//	min:0,
			//	allowDecimals:false,
			//    reversed:true,
			    title: {
			        text: '分数'
			    }
			},
			credits: {
				text:'毅瓢计算'
			},
			tooltip: {
				 headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                    '<td style="padding:0"><b>{point.y:.2f} </b></td></tr>',
                footerFormat: '</table>',
                shared: true,
                useHTML: true
			},
			plotOptions: {
				column: {
					groupPadding:0.1,
	                pointPadding: 0.1,
	                borderWidth: 0,
	                shadow: 'color',
	    			dataLabels: {
	                    enabled: true,
	                    rotation: -45,
	                    x: 0,
	                    y: -15,
	                    style: {
	                        fontSize: '13px',
	                        fontFamily: 'Verdana, sans-serif'
	                    }
	                }
            	}
			},
			series: []
		};
		var dataid = examsubject_data.split(',');
		var visible = false;
		var nametemp = '';
		var tempSeriesdata1 ={
	    	name: '我的成绩',
			data: []
    	};
		var tempSeriesdata2 = {
	    	name: '班级平均分',
			data: []
    	};		
    	var tempSeriesdata3 = {
	    	name: '年级平均分',
			data: []
    	};   	
		for(var j = 0; j < dataid.length ; j++)
	    {
		    var temp = dataid[j].split('-');
		//    alert(rowData['s1']);
			if(parseInt(temp[0])< 10 || parseInt(temp[0])> 14)
			{
				options.xAxis.categories.push(temp[1]);
				tempSeriesdata1.data.push(parseFloat(rowData['s'+temp[0]]));
				tempSeriesdata2.data.push(parseFloat(rowData['s'+temp[0]+'-c']));
				tempSeriesdata3.data.push(parseFloat(rowData['s'+temp[0]+'-g']));	
			}
	    }
		 
		options.series.push(tempSeriesdata1);
		options.series.push(tempSeriesdata2);
		options.series.push(tempSeriesdata3);
	
	    var chart = new Highcharts.Chart(options);
	    chart.setTitle({text: 
	    	$('#stat_stu_clacombotree').combobox('getText')
			+ '各科成绩对比图'},
			{text:rowData['examname']
				});
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
			fun_showMsg('提示','学年不能为空，请修改!');
			return;
		}	
	/*	if(!$('#stat_stu_name_combogird').combobox('isValid'))
		{
			fun_showMsg('提示','姓名不能为空，请修改!');
			return;
		}	*/
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
				  Term: $('#stat_stu_exacombobox').combobox('getValues').join(',')
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
			    	     		"{field: 'examname', title: '考试名称',sortable:true,rowspan:2},"+
			    	     		"{field: 'examtime', title: '考试时间',sortable:true,rowspan:2}"+
			    	     	    "],[]]"); 
			    	    examsubject_data = resp.subjectids;
			    	    var dataid = resp.subjectids.split(',');   
			    	    for(var i = 0; i < dataid.length ; i++)
			    	    {
				    	    var temp = dataid[i].split('-');
				    	    options.columns[0].push(
		    	    	    	    {title: temp[1] ,colspan:3}
		    	    			);
			    	    	options.columns[1].push(
					    	    {field: 's'+temp[0] , title: '我的成绩' , sortable:true,
					    	    	formatter: function(value, row, index){
						    	    	var arrvalue = value.split('-');
										var showvalue = arrvalue[0];
										if(parseFloat(showvalue) < parseFloat(row[arrvalue[1]+'-g']))
										{
											var diff = parseFloat(row[arrvalue[1]+'-g']) - parseFloat(showvalue);
											showvalue += '  <font color="green">▼'+ formatFloat(diff,2)+'</font>';
										}else if(parseFloat(showvalue) > parseFloat(row[arrvalue[1]+'-g']))
										{
											var diff = parseFloat(showvalue) -parseFloat(row[arrvalue[1]+'-g']);
											showvalue += '  <font color="red">▲'+ formatFloat(diff,2)+'</font>';
										}
					                    return showvalue;
					    	    	}
			    	    	   	}
	    	    			);
				    	    options.columns[1].push(
	    	    	    	    {field: 's'+temp[0]+'-c' , title: '班级平均分' ,sortable:true,
					    	    	formatter: function(value, row, index){
						    	    	var arrvalue = value.split('-');
										var showvalue = arrvalue[0];
										if(parseFloat(showvalue) < parseFloat(row[arrvalue[1]+'-g']))
										{
											var diff = parseFloat(row[arrvalue[1]+'-g']) - parseFloat(showvalue);
											showvalue += '  <font color="green">▼'+ formatFloat(diff,2)+'</font>';
										}else if(parseFloat(showvalue) > parseFloat(row[arrvalue[1]+'-g']))
										{
											var diff = parseFloat(showvalue) -parseFloat(row[arrvalue[1]+'-g']);
											showvalue += '  <font color="red">▲'+ formatFloat(diff,2)+'</font>';
										}
					                    return showvalue;
				    	    		}
				    	    	}
	    	    			);
			    	    	options.columns[1].push(
	    	    	    	    {field: 's'+temp[0]+'-g' , title: '年级平均分' ,sortable:true}
	    	    			);
				    	}
			    	  	$grid_score.datagrid(options);
						grid_data = resp.data;
				  		$grid_score.datagrid('loadData',grid_data);
				  		$grid_score.datagrid("selectRow", 0);
				  		var row = $grid_score.datagrid('getSelected');
				  		createchart(row);
			      }else
			      	fun_showMsg('提示','获取成绩数据错误('+resp.msg+')');
			  }            
		});	
	};
	function formatFloat(src, pos)
	{
		return Math.round(src*Math.pow(10, pos))/Math.pow(10, pos);
	}
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
<div class="easyui-layout" fit="true" id='stat_sturank_layout' >
	<div region="center" title=""  >
		<table id="stat_class_grid" data-options="fit:true"></table>
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
		                   		$.ajax({            
								    type:'POST',   
								    url: '<?php echo $this->createUrl('getterm'); ?>',
								    dataType:'json',    
								    data : {ClassID : node.id},
								    error:function(err) {      
										fun_showMsg('提示','年度数据请求失败('+JSON.stringify(err)+')');
								    },
								    success:function(resp) {
								    	if(resp.success)
								        {
								    		$('#stat_stu_exacombobox').combobox('loadData',resp.data);
								        }else
								        	fun_showMsg('提示','获取年度数据错误('+resp.msg+')');
								    }            
								});
								
		                   }
		            ">
				&nbsp;&nbsp;学年: 
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
		                    },
		                    onSelect : function(node)
		                   {
		                   		queryscore();
		                   }
		            ">             
		<!--    <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="queryscore()">查询</a>
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
		            ">	-->
		<!--	    <a id="mb" class="easyui-menubutton"    
		        data-options="menu:'#mm',iconCls:''">导出Excel</a>  
					<div id="mm" style="width:150px;">  
					    <div data-options="iconCls:''" onclick="exportclassscore()">班级成绩</div>  
					    <div data-options="iconCls:''" onclick="exportgradescore()">年级成绩</div>  
					</div> 
			    </a> -->
		    </div> 
		</div>
	</div>
    <div id="stat_sturank_charts"  
    	data-options="region:'south',split:true" title="图形对比" style="height:320px;padding:0px;" collapsed=false>
	</div>
</div>
