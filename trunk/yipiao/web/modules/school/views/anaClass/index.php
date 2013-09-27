<script type="text/javascript">
$(function(){
	var $grid_score = $('#ana_class_grid');
	var grid_data = [];
	var suject_data;
	var examdate_data;
	var setrowindex = -1;
	var iscompair = 0;
	
	//载入初始数据
	$grid_score.datagrid({   
		border:true,
		fit: true,
		checkbox : true,
	    idField:'id',  
		singleSelect: false,
	  //  toolbar: '#ana_class_tb',
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
	//创建图表
	function createchart(){
		var colors = Highcharts.getOptions().colors;	
		var rows = $grid_score.datagrid('getChecked');
		 //添加到图形
		var options = {
			chart: {
			  	renderTo: 'ana_class_spidercharts',
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
	  	        lineWidth: 0,
	  	        min: 0
	  	    },
	  	    
	  	    tooltip: {
	  	    	shared: true,
	  	        pointFormat: '<span style="color:{series.color}">[能力值]{point.y:,.0f}[稳定性]{point.s:,.0f}[进步值]{point.i:,.0f}<br/>'
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
			    name: rows[i]['name']+'('+rows[i]['examname']+')',
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
	querydatabysubject = function (){
		//判断是否选择
		if(!$('#ana_class_typecombobox').combobox('isValid'))
		{
			fun_showMsg('提示','班级类型不能为空，请修改!');
			return;
		}		
		if(!$('#ana_class_clacombotree').combotree('isValid'))
		{
			fun_showMsg('提示','班级不能为空，请修改!');
			return;
		}
		if(!$('#ana_class_subcombobox').combobox('isValid'))
		{
			fun_showMsg('提示','科目不能为空，请修改!');
			return;
		}		
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
			  data:{ClassIDs: $('#ana_class_clacombotree').combotree('getValues').join(','),
				  SubjectID: $('#ana_class_subcombobox').combobox('getValues').join(',')
			  }, 
			  error:function(err) {      // 
				  $.messager.progress('close');
					fun_showMsg('提示','数据请求失败('+JSON.stringify(err)+')');
			  },
			  success:function(resp) {
				  $.messager.progress('close');
			      if(resp.success)
			      {
			    	  var options = {
	    				chart: {
	    					renderTo: 'ana_class_charts',
	    					defaultSeriesType: 'line',
	    			    	zoomType: 'xy'  //******  这句是实现局部放大的关键处  ******
	    				},
	    				title: {
	    				    text: $('#ana_class_subcombobox').combobox('getText')+'能力值曲线图'
	    				},
	    				xAxis: {
	    				    categories: []
	    				},
	    				yAxis: {
	    					min:0,
	    				//    reversed:true,
	    				    title: {
	    				        text: '名次'
	    				    }
	    				},
	    				credits: {
	    					text:'毅瓢计算'
	    				},
	    				tooltip: {
	    				    crosshairs: true,
	    				    formatter: function() {   
	    						return '<span style="color:'+this.series.color+';font-weight:bold">'+ this.series.name +'('+this.point.data.split('|')[1]+')</span><br/>'+
	    							'<span style="color:'+this.series.color+'">能力值:'+ this.y+' 排名:'+this.point.data.split('|')[3]+'</span><br/>'+
	    							'<span style="color:'+this.series.color+'">稳定指数:'+ this.point.data.split('|')[4]+' 进步指数:'+this.point.data.split('|')[5]+'</span>';
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
	    			            cursor: 'pointer',  
	    			            events: {  
	    			                click: function(e) {  
				                		querydatabyexam(e.point.data.split('|')[0],e.point.id);
	    			                }  
	    			            }  
	    			        }  
	    				},
	    				series: []
	    			};
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
		    				    	id : rowdata['id'],
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
		    		};
			    	var chart = new Highcharts.Chart(options);
			    	 
			      }else
			      	fun_showMsg('提示','获取数据错误('+resp.msg+')');
			  }            
		});	
	};
	
	function querydatabyexam(examid,classid){
		//查询是否存在
		var id = classid+'-'+examid;
		for(var k=0;k < grid_data.length;k++)
		{
			if(grid_data[k]['id'] == id)
			{
				fun_showMsg('提示','该项数据已存在!');
				return;
			}
		}
	
		var colors = Highcharts.getOptions().colors;
		$.messager.progress({
			title : '提示',
			text : '数据查询中，请稍后....'
		}); 
		//查询数据
		$.ajax({            
			type:"POST",   //post提交方式默认是get
			url: '<?php echo $this->createUrl('getyscorebyexam'); ?>',
			dataType:"json",
			 // async:false,    
			data:{ExamID: examid,
				ClassID: classid
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
		    	     		"{field: 'name', title: '班级名称',sortable:true},"+
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
									if(1 == iscompair && setrowindex !=  index)
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
									}
									var tip = '排名:'+ row[arrvalue[1]+'-cr'];
									var content = '<span title="' + tip + '">' + showvalue + '</span>';  
				                    return content;
		    	                }  	    	    
		    	    	   	}
		    			);
			    	    options_grid.columns[0].push(
		    	    	    {field: 's'+temp[0]+'-cr' , title: temp[1]+'班排名' ,sortable:true,hidden:true}
		    			);
		    	    	options_grid.columns[0].push(
		    	    	    {field: 's'+temp[0]+'-max' , title: temp[1]+'最大能力值' ,sortable:true,hidden:true}
		    			);
		    	    	options_grid.columns[0].push(
		    	    	    {field: 's'+temp[0]+'-min' , title: temp[1]+'最小能力值' ,sortable:true,hidden:true}
		    			);
		    	    	options_grid.columns[0].push(
		    	    	    {field: 's'+temp[0]+'-s' , title: temp[1]+'稳定指数' ,sortable:true,hidden:true}
		    			);
		    	    	options_grid.columns[0].push(
		    	    	    {field: 's'+temp[0]+'-s-max' , title: temp[1]+'稳定指数'+'最大能力值' ,sortable:true,hidden:true}
		    			);
		    	    	options_grid.columns[0].push(
		    	    	    {field: 's'+temp[0]+'-s-min' , title: temp[1]+'稳定指数'+'最小能力值' ,sortable:true,hidden:true}
		    			);
		    	    	options_grid.columns[0].push(
		    	    	    {field: 's'+temp[0]+'-i' , title: temp[1]+'进步指数' ,sortable:true,hidden:true}
		    			);
		    	    	options_grid.columns[0].push(
		    	    	    {field: 's'+temp[0]+'-i-max' , title: temp[1]+'进步指数'+'最大能力值' ,sortable:true,hidden:true}
		    			);
		    	    	options_grid.columns[0].push(
		    	    	    {field: 's'+temp[0]+'-i-min' , title: temp[1]+'进步指数'+'最小能力值' ,sortable:true,hidden:true}
		    			);
			    	};
			    	grid_data.push(resp.data[0]);
		    	  	$grid_score.datagrid(options_grid);
			  		$grid_score.datagrid('loadData',grid_data);
			  		$grid_score.datagrid('checkRow',grid_data.length-1);
				   
						   
				}else
					fun_showMsg('提示','获取数据错误('+resp.msg+')');
			  }
		});
	}
});
</script>
<div id="ana_class_tb" style="padding:4px;height:26px" >   
	<div style="margin-bottom:2px">
	           班级类型: 
	    <input class="easyui-combobox"   
            id="ana_class_typecombobox"  
            style="width:100px;"
            data-options="  
                    valueField:'id',  
                    textField:'text',  
                    editable:false,
                    required : true,
                    multiple: false,  
                    panelHeight:'auto',
                    data:[  
                      {id:'0',text:'不区分'},  
                      {id:'1',text:'文科'},  
                      {id:'2',text:'理科'}
                  	],
                   	onSelect : function(node)
                   	{
                   		$('#ana_class_clacombotree').combotree('setValues','');
                   		$('#ana_class_subcombobox').combobox('setValues','');
                   		$.ajax({            
						    type:'POST',  
						    url: '<?php echo $this->createUrl('getclass'); ?>',
						    data : {ClassType : node.id,SchoolID: ypschoolid},
						    dataType:'json',    
						    error:function(err) {      // 
								fun_showMsg('提示','班级数据请求失败('+JSON.stringify(err)+')');
						    },
						    success:function(resp) {
						    	if(resp.success)
						        {
						    		$('#ana_class_clacombotree').combotree('loadData',resp.data);
						        }else
						        	fun_showMsg('提示','获取班级数据错误('+resp.msg+')');
						    }            
						});
						$.ajax({            
							    type:'POST',   
							    url: '<?php echo $this->createUrl('getsubject'); ?>',
							    dataType:'json',    
							    data : {ClassType : node.id,SchoolID: ypschoolid},
							    error:function(err) {      
									fun_showMsg('提示','科目数据请求失败('+JSON.stringify(err)+')');
							    },
							    success:function(resp) {
							    	if(resp.success)
							        {
							    		$('#ana_class_subcombobox').combobox('loadData',resp.data);
							        }else
							        	fun_showMsg('提示','获取科目数据错误('+resp.msg+')');
							    }            
						});
                   	}
            ">    
		&nbsp;&nbsp;班级:  
		<input class="easyui-combotree"   
	            id="ana_class_clacombotree"  
	            style="width:150px;"
	            data-options="  
	            		valueField:'id',
	                    textField:'text', 
	                    multiple: true , 
	                    required : true,
	                    panelHeight:'auto',
	                    onLoadSuccess : function(node, data){
	                    	for(var i=0;i < data.length;i++)
	                    	{
	                    		for(var j=0;j < data[i].children.length;j++ )
	                    		{
	                    			if(data[i].children[j].selected)
	                    			{
	                    				$('#ana_class_clacombotree').combotree('setValue', data[i].children[j].id);
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
	                   onCheck : function(node, checked)
	                   {
	                   		//实现只能选择同一年级下班级
	                   		if(checked)
	                   		{
	                   			var curparn = $(this).tree('getParent', node.target);
	                   			var checknodes = $(this).tree('getChecked');	
	                   			for(var i=0;i < checknodes.length;i++)
	                   			{
	                   				var curparntempid = 0;
	                   				if (!$(this).tree('isLeaf',checknodes[i].target)) 
	                   					curparntempid =  checknodes[i].id;
	                   				else
	                   					curparntempid =  $(this).tree('getParent', checknodes[i].target).id;

	                   				if(curparn.id != curparntempid)
	                   					$(this).tree('uncheck', checknodes[i].target);
	                   			}
	                   		}
	                   }
	            ">  		            
	        &nbsp;&nbsp;科目: 
		    <input class="easyui-combobox"   
	            id="ana_class_subcombobox"  
	            style="width:100px;"
	            data-options="  
	                    valueField:'id',  
	                    textField:'text',  
	                    editable:false,
	                    required : true,
	                    multiple: false,  
	                    panelHeight:'auto'  
	            ">                        
	    </select>
	    <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="querydatabysubject()">查询</a>
    </div>
</div>
<div class="easyui-layout" fit="true" id='ana_class_layout' >
	<div region="north" id="ana_class_charts" title="" split=true style="height:220px;padding:0px;" collapsed=false >
	</div>
    <div data-options="region:'center'">
    	<table id="ana_class_grid" data-options="fit:true"></table>
	</div>
	<div data-options="region:'east'" id="ana_class_spidercharts" split=true style="width:500px;padding:0px;">
    	
	</div>
</div>
