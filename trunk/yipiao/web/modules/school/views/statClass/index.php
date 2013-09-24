<script type="text/javascript">
$(function(){
	var $grid_class_score = $('#stat_class_grid');
	var subjecttemp;
	var scorerangetemp;
	//载入初始数据
	$.ajax({            
	    type:"POST",   //post提交方式默认是get
	    url: '<?php echo $this->createUrl('getgrade'); ?>',
	    dataType:"json",    
	    data:{SchoolID: ypschoolid},  
	    error:function(err) {      // 
			fun_showMsg('提示','年级数据请求失败('+JSON.stringify(err)+')');
	    },
	    success:function(resp) {
	    	if(resp.success)
	        {
	    		$('#stat_class_clacombotree').combotree('loadData',resp.data);
	        }else
	        	fun_showMsg('提示','获取年级数据错误('+resp.msg+')');
	    }            
	});
	
	$grid_class_score.datagrid({   
		border:true,
		fit: true,
		checkbox : true,
		sortName: 'cname',  
	    sortOrder: 'desc',  
	    remoteSort: false, 
		singleSelect: false,
	//	onRowContextMenu: onRowContextMenu,	
	    toolbar: '#stat_class_tb',
	    onLoadSuccess:function(){
		    //所有列进行合并操作
		    //$(this).datagrid("autoMergeCells");
		    //指定列进行合并操作
	    	$(this).datagrid("autoMergeCells",['sname']);
	  	},
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
	createchart = function (){
		var colors = Highcharts.getOptions().colors;
		var rows = $grid_class_score.datagrid('getSelections');
	/*	if(rows.length > 0 )
			$('#stat_class_layout').layout('expand', 'south'); 
		else
			$('#stat_class_layout').layout('collapse', 'south'); 	*/
		if(0 == $('#stat_class_typecombobox').combobox('getValue'))//平均分
		{
			var options = {
				chart: {
					renderTo: 'stat_class_charts',
					zoomType: 'xy',
					margin: [50]
				},
				title: {
				    text: $('#stat_class_clacombotree').combobox('getText')+'('+$('#stat_class_exacombobox').combobox('getText')+')'
				},
				subtitle: {
				    text: $('#stat_class_subcombobox').combobox('getText')+'-各班平均分对比图'
				},		
				xAxis: {
				    categories: [],
				    labels: { 
		            	rotation: 45 
		            } 
				},
				legend: {
					align : 'right',
					verticalAlign : 'middle',
					layout: 'vertical'
				},
				yAxis: {
					min:0,
				    title: {
				        text: '平均分'
				    }
				},
				credits: {
					text:'毅瓢计算'
				},
				tooltip: {
					shared: true
				},
				legend: {
					enabled : false
				},
				plotOptions: {
			        column: {
			            pointPadding: 0.2,
			            borderWidth: 0,
			            dataLabels: {
				            enabled: true
				        }
			        }
			    },
				series: []
			};
			var tempSeriesdata = [];
			var tempSeriesdata1 = [];
			for(var i = 0 ;i < rows.length;i++)
			{
				var temp = [];
				var rowdata = rows[i];
				options.xAxis.categories.push(rowdata['cname']);
				tempSeriesdata.push({
					y:parseFloat(rowdata['avg']),
					color: colors[i]
				});	
				temp.push(parseFloat(rowdata['min']));
				temp.push(parseFloat(rowdata['max']));
				tempSeriesdata1.push(temp);
			}
			options.series.push({
			    name: '班级',
			    type: 'column',
			    data: tempSeriesdata,
			    color: 'white',
			    tooltip: {
					pointFormat: '<span style="font-weight: bold; color: {series.color}">{series.name}</span>平均分:{point.y:.1f} '
				},
				dataLabels: {
	                enabled: true,
	       //         rotation: -90,
	                x: -20,
	                style: {
	                    fontSize: '13px',
	                    fontFamily: 'Verdana, sans-serif'
	                }
	            }
			});
			options.series.push({
			    name: '班级',
			    type: 'errorbar',
			    data: tempSeriesdata1,
			    tooltip: {
					pointFormat: '最低分:{point.low} 最高分:{point.high}<br/>'
				}
			});
			var chart = new Highcharts.Chart(options);
	
		}else if(1 == $('#stat_class_typecombobox').combobox('getValue'))//及格率
		{
			var options = {
				chart: {
					renderTo: 'stat_class_charts',
					defaultSeriesType: 'column'
				},
				title: {
				    text: $('#stat_class_clacombotree').combobox('getText')+'('+$('#stat_class_exacombobox').combobox('getText')+')'
				},
				subtitle: {
				    text: $('#stat_class_subcombobox').combobox('getText')+'-各班及格率对比图'
				},		
				xAxis: {
				    categories: [],
				    labels: { 
		            	rotation: 45 
		            } 
				},
				yAxis: {
					min:0,
					max:100,
				    title: {
				        text: '及格率'
				    }
				},
				credits: {
					text:'毅瓢计算'
				},
				tooltip: {
					enabled : false
				},
				legend: {
					enabled : false
				},
				plotOptions: {
			        column: {
			            pointPadding: 0.2,
			            borderWidth: 0,
			            dataLabels: {
				            enabled: true,
				            formatter: function() {
	                            return this.y +'%';
	                        }
				        }
			        }
			    },
				series: [
			    ]
			};
			var tempSeriesdata = [];
			for(var i = 0 ;i < rows.length;i++)
			{
				var rowdata = rows[i];
				options.xAxis.categories.push(rowdata['cname']);
				tempSeriesdata.push({
					y:parseFloat(rowdata['passrate']),
					color: colors[i]
				});
			}
			options.series.push({
			    name: '班级',
			    data: tempSeriesdata,
			    color: 'white'
			});
			var chart = new Highcharts.Chart(options);	
		}else if(2 == $('#stat_class_typecombobox').combobox('getValue'))//人数
		{
			var options = {
				chart: {
					renderTo: 'stat_class_charts',
					defaultSeriesType: 'column'
				},
				title: {
				    text: $('#stat_class_clacombotree').combobox('getText')+'('+$('#stat_class_exacombobox').combobox('getText')+')'
				},
				subtitle: {
				    text: $('#stat_class_subcombobox').combobox('getText')+'-各班分数段人数对比图'
				},		
				xAxis: {
				    categories: [],
					    labels: { 
		            	rotation: 45 
		            } 
				},
				yAxis: {
					min:0,
				    title: {
				        text: '人数'
				    }
				},
				credits: {
					text:'毅瓢计算'
				},
				tooltip: {
					formatter: function() {
		                var point = this.point;
		                if (point.drilldown) {
		                    s = '点击查看 '+ point.category +'分数段班级人数对比';
		                } else {
		                    s = '点击返回年级总计';
		                }
		                return s;
		            }
				},
				legend: {
					enabled : true
				},
	            plotOptions: {
	                column: {
	                    cursor: 'pointer',
	                    point: {
	                        events: {
	                            click: function() {
	                                var drilldown = this.drilldown;
	                                if (drilldown) { // drill down
	                                	chart.xAxis[0].setCategories(drilldown.categories, false);
	                                	chart.series[0].remove(false);
	                                	chart.addSeries({
	                                		name: drilldown.name+' 分数段各班人数对比',
	                                		data: drilldown.data,
	                                		color: drilldown.color || 'white'
	                                	}, false);
	                                	chart.redraw();
	                                } else { // restore
	                                	chart.xAxis[0].setCategories(tempcategories, false);
	                                	chart.series[0].remove(false);
	                                	chart.addSeries({
	                            		    name: '年级总计',
	                            		    data: tempSeriesdata,
	                            		    color: 'white'
	                            		}, false);
	                                	chart.redraw();
	                                }
	                            }
	                        }
	                    },
	                    dataLabels: {
	                        enabled: true,
	                        formatter: function() {
	                            return this.y +'人';
	                        }
	                    }
	                }
	            },
				series: []
			};
			var tempcategories = [];
			var tempSeriesdata = [];
			var arr = scorerangetemp.split(',');
			for(var j = 0 ;j < arr.length;j++)
			{    
			//	options.xAxis.categories.push(arr[j]);
				var tempcategories1 = [];
				var tempSeriesdata1 = [];
				var total = 0;
				for(var i = 0 ;i < rows.length;i++)
				{
					var rowdata = rows[i];
					if(rowdata['clevel'] == "-1")
						total = parseInt(rowdata[arr[j]]);
					else
					{
						tempSeriesdata1.push({
							y:parseInt(rowdata[arr[j]]),
							color: colors[i]
						});
						tempcategories1.push(rowdata['cname']);
					}
				}
				tempcategories.push(arr[j]);
				tempSeriesdata.push({
					y:total,
					color: colors[j],
					drilldown: {
	                    name: arr[j],
	                    categories: tempcategories1,
	                    data: tempSeriesdata1,
	                    color: colors[j]
	                }
				});
			}
			options.xAxis.categories = tempcategories;
			options.series.push({
			    name: '年级总计',
			    data: tempSeriesdata,
			    color: 'white'
			});
			var chart = new Highcharts.Chart(options);		
		}
	};
	setChart = function (name, categories, data, color) {
		chart.xAxis[0].setCategories(categories, false);
		chart.series[0].remove(false);
		chart.addSeries({
			name: name,
			data: data,
			color: color || 'white'
		}, false);
		chart.redraw();
	};
	//添加右击菜单内容 
	function onRowContextMenu(e, rowIndex, rowData){ 
	   e.preventDefault(); 
	   var selected=$grid_class_score.datagrid('getRows'); //获取所有行集合对象 
	  //  selected[rowIndex].id; //index为当前右键行的索引，指向当前行对象 
	    $('#stat_class_grid_mm').menu('show', { 
	        left:e.pageX, 
	        top:e.pageY 
	    });         
	} 
	/*
	 * 以下涉及后台操作
	 */
	queryclassscore = function (){
		//判断是否选择
		if(!$('#stat_class_clacombotree').combotree('isValid'))
		{
			fun_showMsg('提示','年级不能为空，请修改!');
			return;
		}
		if(!$('#stat_class_exacombobox').combobox('isValid'))
		{
			fun_showMsg('提示','考试不能为空，请修改!');
			return;
		}	
		if(!$('#stat_class_subcombobox').combobox('isValid'))
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
			  url: '<?php echo $this->createUrl('getscore'); ?>',
			  dataType:"json",
			 // async:false,    
			  data:{GradeID: $('#stat_class_clacombotree').combotree('getValues').join(','),
				  ExamID: $('#stat_class_exacombobox').combobox('getValues').join(','),
				  SubjectID: $('#stat_class_subcombobox').combobox('getValues').join(',')
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
			    	     		"{field: 'sname', title: '科目', width: 60},"+
			    	    		"{field: 'cname', title: '班级', width: 80,sortable:true},"+
			    	    		"{field: 'clevel', title: '班级层次', width: 60,hidden:true,sortable:true},"+
			    	    		"{field: 'tname', title: '授课教师', width: 60},"+
			    	    		"{field: 'avg', title: '平均分', width: 60,sortable:true},"+
			    	    		"{field: 'avg-r', title: '年级排名', width: 80,sortable:true},"+
			    	    	//	"{field: 'avg-r1', title: '同层次排名', width: 80, hidden:true},"+
			    	    		"{field: 'max', title: '最高分', width: 60,sortable:true},"+
			    	    		"{field: 'max-r', title: '年级排名', width: 80,sortable:true},"+
			    	    	//	"{field: 'max-r1', title: '同层次排名', width: 80,hidden:true},"+
			    	    		"{field: 'min', title: '最低分', width: 60,sortable:true},"+
			    	    		"{field: 'min-r', title: '年级排名', width: 80,sortable:true},"+
			    	    	//	"{field: 'min-r1', title: '同层次排名', width: 80,hidden:true},"+
			    	    		"{field: 'passrate', title: '及格率', width: 60,sortable:true},"+
			    	    		"{field: 'passrate-r', title: '年级排名', width: 80,sortable:true},"+
			    	    	//	"{field: 'passrate-r1', title: '同层次排名', width: 80,hidden:true}"+
			    	     	    "]]"); 
			    	     scorerangetemp = resp.scorerange;
			    	     var dataid = resp.scorerange.split(',');   
			    	     for(var i = 0; i < dataid.length ; i++)
			    	     {
			    	    	 options.columns[0].push(
			    	    	    	    {field: dataid[i] , title: dataid[i] , width: 70}
			    	    			); 
				    	 }    
			    	  	$grid_class_score.datagrid(options);
				  		$grid_class_score.datagrid('loadData',resp.data);
			      }else
			      	fun_showMsg('提示','获取成绩数据错误('+resp.msg+')');
			  }            
		});	
	};
	exportscore = function (){
		if(!$('#stat_class_clacombotree').combotree('isValid'))
		{
			fun_showMsg('提示','年级不能为空，请修改!');
			return;
		}
		if(!$('#stat_class_exacombobox').combobox('isValid'))
		{
			fun_showMsg('提示','考试不能为空，请修改!');
			return;
		}	
		fun_showMsg('提示','导出年级ID('+$('#stat_class_clacombotree').combotree('getValues').join(',')+')excel');
	};
});
</script>
<div class="easyui-layout" fit="true" id='stat_class_layout' >
	<div region="center" title=""  >
		<table id="stat_class_grid" data-options="fit:true"></table>
		<div id="stat_class_grid_mm" class="easyui-menu" style="width:120px;"> 
		    <div onClick="setgradecompair()" data-options="iconCls:''">设置年级为比较</div> 
		    <div onClick="setclasscompair()" data-options="iconCls:''">设置该班级为比较</div> 
		</div>
		<div id="stat_class_tb" style="padding:5px;height:auto">   
			<div style="margin-bottom:5px">
				年级: 
				<input class="easyui-combotree"   
		            id="stat_class_clacombotree"  
		            style="width:100px;height:26px;"
		            data-options="  
		            		valueField:'id',
		                    textField:'text', 
		                    multiple: false , 
		                    required : true,
		                    panelHeight:'auto',
		                    onLoadSuccess : function(node, data){
		                    	for(var i=0;i < data.length;i++)
		                    	{
		                    		$('#stat_class_clacombotree').combotree('setValue', data[i].id);
		                    		return;
		                    	}
		                    },
		                    onSelect : function(node)
		                   {
		                   		$('#stat_class_exacombobox').combobox('setValues','');
		                   		$.ajax({            
								    type:'POST',   
								    url: '<?php echo $this->createUrl('getexam'); ?>',
								    dataType:'json',    
								    data : {GradeID : node.id},
								    error:function(err) {      
										fun_showMsg('提示','考试数据请求失败('+JSON.stringify(err)+')');
								    },
								    success:function(resp) {
								    	if(resp.success)
								        {
								    		$('#stat_class_exacombobox').combobox('loadData',resp.data);
								        }else
								        	fun_showMsg('提示','获取考试数据错误('+resp.msg+')');
								    }            
								});
		                   }
		            ">
				&nbsp;&nbsp;考试名称: 
			    <input class="easyui-combobox"   
		            id="stat_class_exacombobox"  
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
		                    	$('#stat_class_subcombobox').combobox('clear');
		                    	$('#stat_class_subcombobox').combobox('loadData',node.subject);
		                    	subjecttemp = node.subject;
		                    },
		                    onLoadSuccess : function()
		                    {
		                   		var data = $('#stat_class_exacombobox').combobox('getData');
		                   		for(var i=0;i< data.length;i++)
		                   		{
		                   			if(data[i].selected)
		                   			{
		                    			$('#stat_class_exacombobox').combobox('select', data[i].id);
		                    			return;
		                    		}
		                    	}
		                    }
		            ">  
			    &nbsp;&nbsp;科目: 
			    <input class="easyui-combobox"   
		            id="stat_class_subcombobox"  
		            style="width:100px;height:26px;"
		            data-options="  
		                    valueField:'id',  
		                    textField:'text',  
		                    editable:false,
		                    multiple:false,
		                    required : true,  
		                    panelHeight:'auto'  
		            ">                        
			    <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="queryclassscore()">查询</a>
			    &nbsp;&nbsp;
	<!--		    <a id="stat_class_mb" class="easyui-menubutton"    
		        data-options="menu:'#stat_class_mm',iconCls:''">导出Excel</a>  
					<div id="stat_class_mm" style="width:150px;">  
					    <div data-options="iconCls:''" onclick="exportscore()">单个科目</div>  
					    <div data-options="iconCls:''" onclick="exportallscore()">所有科目</div>  
					</div> 
			    </a> -->
			    &nbsp;&nbsp;图表类型: 
			    <input class="easyui-combobox"   
		            id="stat_class_typecombobox"  
		            style="width:100px;height:26px;"
		            data-options="  
		                    valueField:'id',  
		                    textField:'text',  
		                    editable:false,
		                    multiple:false,
		                    required : true,  
		                    panelHeight:'auto',
		                    data:[  
			                    {id:'0',text:'平均分',selected:true},  
			                    {id:'1',text:'及格率',selected:false},  
			                    {id:'2',text:'分数段人数',selected:false}
			                ],
			                onSelect : function(record){
			                	if(record.id == '2')
			                		fun_showMsg('提示','分数段人数对比图形需勾选年级总计数据');
			                	createchart();
			                	
			                } 
		            "> 
		    </div>
		</div>
	</div>	
    <div id="stat_class_charts"
     	data-options="region:'south',split:true" title="图形对比" style="height:320px;padding:0px;" collapsed=false>
	</div>
</div>
