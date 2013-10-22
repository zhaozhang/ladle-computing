<script type="text/javascript">
$(function(){
	var $grid_score = $('#ana_student_grid');

	var grid_data = [];
	var suject_data;
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
	    		$('#ana_stu_clacombotree').combotree('loadData',resp.data);
	        }else
	        	fun_showMsg('提示','获取班级数据错误('+resp.msg+')');
	    }            
	});
	
	$grid_score.datagrid({   
		border:true,
		fit: true,
		striped:true,
		checkbox : true,
	    idField:'id',  
		singleSelect: false,
	  //  toolbar: '#ana_student_tb',
	    frozenColumns:[
	    	{field: 'id', title: 'ID', hidden:true}              												
		],
		onCheckAll:function(rows){
			createchart();
		},
		onCheck:function(rowindex,rowdata){
			createchart();
		},
		onUncheck:function(rowindex,rowdata){
			createchart();
		}
	}); 
	
	function createchartline(){
		var colors = Highcharts.getOptions().colors;	
		var rows = $grid_score.datagrid('getRows');
		var options = {
			chart: {
				renderTo: 'ana_student_charts',
				defaultSeriesType: 'line',
		    	zoomType: 'xy'  //******  这句是实现局部放大的关键处  ******
			},
			title: {
			    text: '各科能力值曲线图(点击图例可以增删曲线)'
			},
			xAxis: {
			    categories: []
			},
			yAxis: {
			//	min:0,
			//    reversed:true,
			    title: {
			        text: '能力值'
			    }
			},
			credits: {
				text:'毅瓢计算'
			},
			tooltip: {
			    crosshairs: true,
			    formatter: function() {   
					return '<span style="color:'+this.series.color+';font-weight:bold">'+ this.series.name +'('+this.point.data.split('|')[0]+')</span><br/>'+
						'<span style="color:'+this.series.color+'">能力值:'+ this.y+' 排名:'+this.point.data.split('|')[1]+'('+this.point.data.split('|')[2]+')</span><br/>'+
						'<span style="color:'+this.series.color+'">稳定指数:'+ this.point.data.split('|')[3]+' 进步指数:'+this.point.data.split('|')[4]+'</span>';
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
			            enabled: false
			        }
			    },
			    series: {  
		            cursor: 'pointer'
		        }  
			},
			series: []
		};

		var dataid = suject_data.split(',');
		var visible = true;
		for(var j = 0; j < dataid.length ; j++)
	    {
			var tempSeriesdata = [];
			for(var i = rows.length-1 ;i > -1; i--)
			{
				var rowdata = rows[i];
				if(0==j)
		    		options.xAxis.categories.push(rowdata['examname']);

				var subjectid = dataid[j].split('-')[0];
	    		var y = rowdata['s'+subjectid].split('-')[0];
	    		if('' == y)
	        		y=0;
		    	tempSeriesdata.push({
				    	y: parseFloat(y),
						data:rowdata['examtime']+'|'+rowdata['s'+dataid[j].split('-')[0]+'-cr']
								+'|'+rowdata['s'+dataid[j].split('-')[0]+'-gr']
		    					+'|'+rowdata['s'+dataid[j].split('-')[0]+'-s']
		    					+'|'+rowdata['s'+dataid[j].split('-')[0]+'-i']
			    	}
		    	);
			}
			options.series.push({
			    name: dataid[j].split('-')[1],
			    marker: {
			        symbol: 'circle'
			    },
			    visible: visible,
			    data: tempSeriesdata
			});
			visible = false;
	    }	
		/*
	    examdate_data = resp.examdates;
	    for(var i = 0 ;i < resp.data.length;i++)
	    {
	    	var rowdata =  resp.data[i];
	    	var dataid = examdate_data.split(',');
	    	var tempSeriesdata = [];
	        for(var j = 0; j < dataid.length ; j++)
	        {
	        	if(0==i)
	        		options.xAxis.categories.push(dataid[j]);
	    		var y = '';
	        	if(rowdata[dataid[j]])
	        		y = rowdata[dataid[j]].split('|')[2];
	        	if('' == y)
	            	y=0;
	        	tempSeriesdata.push({
	    		    	y: parseFloat(y),
	    		    	uid:rowdata['uid'],
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
	    }*/
	    var chart = new Highcharts.Chart(options);
	}
	//创建图表
	function createchart(){
		var colors = Highcharts.getOptions().colors;	
		var rows = $grid_score.datagrid('getChecked');
		 //添加到图形
		var options = {
			chart: {
			  	renderTo: 'ana_student_spidercharts',
	  	        polar: true,
	  	        type: 'line'
	  	    },
	  	    
	  	    title: {
	  	        text: '',
	  	        x: -80
	  	    },
	  	    
	  	    pane: {
	  	    	size: '80%'
	  	    },
	  	    
	  	    xAxis: {
	  	        categories: [],
	  	        tickmarkPlacement: 'on',
	  	        lineWidth: 0
	  	    },
	  	        
	  	    yAxis: {
	  	        gridLineInterpolation: 'polygon',
	  	        lineWidth: 0
	  	    },
	  	    
	  	    tooltip: {
	  	    	shared: true,
	  	    	pointFormat: '<span style="color:{series.color}">[能力值]{point.y}[稳定性]{point.s}[进步值]{point.i}<br/>'
	  	    },
	  	    
	  	    legend: {
	  	        align: 'right',
	  	        verticalAlign: 'top',
	  	        y: 100,
	  	        layout: 'vertical'
	  	    },
		    series: []
		};
		for(var i = 0 ;i < rows.length;i++)
		{
			var dataid = suject_data.split(',');
			var tempSeriesdata = [];
			for(var j = 0; j < dataid.length ; j++)
			{
				var temp = dataid[j].split('-');	
				options.xAxis.categories.push(temp[1]);
				tempSeriesdata.push({
			    	y: parseFloat(rows[i]['s'+temp[0]].split('-')[0]),
			    	s: parseFloat(rows[i]['s'+temp[0]+'-s']),
			    	i: parseFloat(rows[i]['s'+temp[0]+'-i'])
				});
			}
			options.series.push({
			    name: rows[i]['examname'],
			    pointPlacement: 'on',
			    data: tempSeriesdata,
			    colors: colors[i]
			});
		}
		var chart = new Highcharts.Chart(options);
	};
	
	/*
	 * 以下涉及后台操作
	 */
	querydatabyterm = function (){
		//判断是否选择
		if(!$('#ana_stu_clacombotree').combotree('isValid'))
		{
			fun_showMsg('提示','班级不能为空，请修改!');
			return;
		}
		if(!$('#stat_stu_exacombobox').combobox('isValid'))
		{
			fun_showMsg('提示','学年不能为空，请修改!');
			return;
		}		
	/*	if(!$('#ana_stu_namecombogird').combobox('isValid'))
		{
			fun_showMsg('提示','学生不能为空，请修改!');
			return;
		}*/
		$.messager.progress({
			title : '提示',
			text : '数据查询中，请稍后....'
		}); 
		//查询数据
		$.ajax({            
			  type:"POST",   //post提交方式默认是get
			  url: '<?php echo $this->createUrl('getyscore'); ?>',
			  dataType:"json",
			 // async:false,    
			  data:{ClassID: $('#ana_stu_clacombotree').combotree('getValues').join(','),
				  Term: $('#stat_stu_exacombobox').combobox('getValues').join(','),
				  UIDs: $('#ana_stu_namecombogird').combogrid('getValues').join(',')
			  }, 
			  error:function(err) {      // 
				  $.messager.progress('close');
					fun_showMsg('提示','数据请求失败('+JSON.stringify(err)+')');
			  },
			  success:function(resp) {
				  $.messager.progress('close');
			      if(resp.success)
			      {
			    	//添加到列表
						var options_grid = {};
						options_grid.columns = eval("[["+
								"{field: 'ck', checkbox:true},"+
								"{field: 'id', title: 'id',hidden:true},"+
			    	     		"{field: 'name', title: '姓名',hidden:true},"+
			    	     		"{field: 'examname', title: '考试名称'},"+
			    	     		"{field: 'examtime', title: '考试时间'}"+
			    	     	    "]]"); 
						suject_data = resp.subjectids;
						var dataid = resp.subjectids.split(',');   
			    	    for(var i = 0; i < dataid.length ; i++)
			    	    {
				    	    var temp = dataid[i].split('-');
			    	    	options_grid.columns[0].push(
					    	    {field: 's'+temp[0] , title: temp[1] , sortable:true,
			    	                formatter: function(value, row, index){
					    	    		var arrvalue = value.split('-');
										var showvalue = arrvalue[0];
									/*	if(1 == iscompair && setrowindex !=  index)
										{		
											var Rows=$grid_score.datagrid('getRows'); //获取所有行集合对象 		
										//	alert(showvalue);
										//	alert(Rows[setrowindex][arrvalue[1]].split('-')[0]);
											if(parseInt(showvalue) < parseInt(Rows[setrowindex][arrvalue[1]].split('-')[0]))
											{
												var diff = Rows[setrowindex][arrvalue[1]].split('-')[0] - showvalue;
												showvalue += '  <font color="green">▼'+ diff+'</font>';
											}else if(parseInt(showvalue) > parseInt(Rows[setrowindex][arrvalue[1]].split('-')[0]))
											{
												var diff = showvalue -Rows[setrowindex][arrvalue[1]].split('-')[0];
												showvalue += '  <font color="red">▲'+ diff+'</font>';
											}
											
										}*/
										
										var tip = '班排名:'+ row[arrvalue[1]+'-cr'] + ' 年排名:' + row[arrvalue[1]+'-gr'];
										var content = '<span title="' + tip + '">' + showvalue + '</span>';  
					                    return content;
			    	                }  	    	   
			    	    	   	}
			    			);
				    	    options_grid.columns[0].push(
			    	    	    {field: 's'+temp[0]+'-cr' , title: temp[1]+'班排名' ,sortable:true,hidden:true}
			    			);
			    	    	options_grid.columns[0].push(
			    	    	    {field: 's'+temp[0]+'-gr' , title: temp[1]+'年排名' ,sortable:true,hidden:true}
			    			);
			    	    	options_grid.columns[0].push(
			    	    	    {field: 's'+temp[0]+'-s' , title: temp[1]+'稳定指数' ,sortable:true,hidden:true}
			    			);
			    	    	options_grid.columns[0].push(
			    	    	    {field: 's'+temp[0]+'-i' , title: temp[1]+'进步指数' ,sortable:true,hidden:true}
			    			);
				    	};
				    	grid_data=resp.data;
			    	  	$grid_score.datagrid(options_grid);
				  		$grid_score.datagrid('loadData',grid_data);
				  		$grid_score.datagrid('checkRow',0);
				  		createchartline();
			      }else
			      	fun_showMsg('提示','获取数据错误('+resp.msg+')');
			  }            
		});	
	};
});
</script>
<div id="ana_student_tb" style="padding:4px;height:26px" >   
	<div style="margin-bottom:2px">
		班级: 
		<input class="easyui-combotree"   
	            id="ana_stu_clacombotree"  
	            style="width:150px;"
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
	                    				$('#ana_stu_clacombotree').combotree('setValue', data[i].children[j].id);
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
	                   		$('#ana_stu_namecombogird').combogrid('setValues','');
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
								    		$('#ana_stu_namecombogird').combogrid('grid').datagrid('loadData',resp.data);
								    		$('#ana_stu_namecombogird').combogrid('grid').datagrid('selectRecord', <?php echo Yii::app()->user->getId();?>);
								        }else
								        	fun_showMsg('提示','获取学生数据错误('+resp.msg+')');
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
	                   		querydatabyterm();
	                   }
	            ">                        
		&nbsp;&nbsp;姓名: 
	    <select id="ana_stu_namecombogird" class="easyui-combogrid" name="dept" style="width:220px;"  
	        data-options="   
	            panelWidth:220,   
	            multiple : true,
	            editable:false,
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
	 <!--   <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="querydatabyterm()">查询</a>-->
    </div>
</div>
<div class="easyui-layout" fit="true" id='ana_student_layout' >
	<div region="north" id="ana_student_charts" title="" split=true style="height:250px;padding:0px;" collapsed=false >
	</div>
    <div data-options="region:'center'" >
    	<table id="ana_student_grid" data-options="fit:true" ></table>
	</div>
	<div data-options="region:'east'" id="ana_student_spidercharts" split=true style="width:500px" collapsed= false>
    	
	</div>
</div>
