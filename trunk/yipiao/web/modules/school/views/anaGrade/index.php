<script type="text/javascript">
$(function(){
	var $grid_class_score = $('#stat_class_grid');
	var subjecttemp;
	var examtemp;
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
		striped:true,
		checkbox : true,
		sortName: 'cid',  
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
		var colors = Highcharts.getOptions().colors;
		if(0 == $('#stat_class_typecombobox').combobox('getValue'))//柱状图
		{
			var options = {
				chart: {
					renderTo: 'stat_class_charts',
					zoomType: 'xy',
					margin: [50]
				},
				title: {
		            text: $('#stat_class_clacombotree').combotree('getText')+'('+$('#stat_class_exacombotree').combotree('getText')+')'
		        },
		        subtitle: {
		            text: $('#stat_class_subcombobox').combobox('getText')+'各班能力值对比图'
		        },		
				xAxis: {
				    categories: [],
				    labels: { 
						rotation:-60, 
						align: 'right' 
		            } 
				},
				legend: {
					align : 'right',
					verticalAlign : 'middle',
					layout: 'vertical'
				},
				yAxis: {
					maxPadding : 0,
					minPadding : 0,
				    title: {
				        text: ''
				    }
				},
				credits: {
					text:'一瓢计算',
					href:''
				},
				tooltip: {
					shared: true
				},
				plotOptions: {
			        column: {
					 	pointPadding: 0.1,
		                borderWidth: 1,
		                shadow: 'color'
			        },
			        series: {
	                    events: {
	                        //控制图标的图例legend不允许切换
	                        legendItemClick: function (event) {   
	                    		for(var i = 0;i<chart.series.length;i++)   
	                    		{
	                        		if(chart.series[i].visible == true)
	                        		{
	                        			chart.series[i].visible = false;
	                        			chart.series[i].hide();
	                        		}
	                    		}  
	                    		chart.setTitle({text: 
	                    			$('#stat_class_clacombotree').combotree('getText')+'('+$('#stat_class_exacombotree').combotree('getText')+')'},
	                        		{text:
	                        			$('#stat_class_subcombobox').combobox('getText')+'各班'+this.name+'对比图'});
	                            return true; //return  true 则表示允许切换
	                        }
	                    }
	                }
			    },
				series: []
			};
			var tempSeriesdata = [];
			var tempSeriesdata1 = [];
			var tempSeriesdatasta = [];
			var tempSeriesdatasta1 = [];
			var tempSeriesdataimp = [];
			var tempSeriesdataimp1 = [];
			for(var i = 0 ;i < rows.length;i++)
			{
				var temp = [];
				var rowdata = rows[i];
				options.xAxis.categories.push(rowdata['cname']);
				tempSeriesdata.push({
					y:parseFloat(rowdata['avgcyscore']),
					color: colors[i]
				});	
				tempSeriesdatasta.push({
					y:parseFloat(rowdata['avgsta']),
					color: colors[i]
				});
				tempSeriesdataimp.push({
					y:parseFloat(rowdata['avgimp']),
					color: colors[i]
				});
				temp.push(parseFloat(rowdata['mincyscore']));
				temp.push(parseFloat(rowdata['maxcyscore']));
				tempSeriesdata1.push(temp);
				temp = [];
				temp.push(parseFloat(rowdata['minsta']));
				temp.push(parseFloat(rowdata['maxsta']));
				tempSeriesdatasta1.push(temp);
				temp = [];
				temp.push(parseFloat(rowdata['minimp']));
				temp.push(parseFloat(rowdata['maximp']));
				tempSeriesdataimp1.push(temp);
			}
			options.series.push({
			    name: '能力值',
			    type: 'column',
			    data: tempSeriesdata,
			    tooltip: {
					pointFormat: '<span style="font-weight: bold; color: {series.color}">{series.name}</span>能力值:{point.y:.1f} '
				},
				dataLabels: {
	                enabled: true,
	                rotation: -45,
	                x: 0,
	                y:-18,
	                style: {
	                    fontSize: '13px',
	                    fontFamily: 'Verdana, sans-serif'
	                }
	            }
			});
			options.series.push({
			    name: '能力值',
			    type: 'errorbar',
			    data: tempSeriesdata1,
			    tooltip: {
					pointFormat: '最小值:{point.low} 最大值:{point.high}<br/>'
				}
			});
			options.series.push({
			    name: '稳定性',
			    type: 'column',
			    data: tempSeriesdatasta,
			    visible:false,
			    tooltip: {
					pointFormat: '<span style="font-weight: bold; color: {series.color}">{series.name}</span>稳定性:{point.y:.1f} '
				},
				dataLabels: {
	                enabled: true,
	                rotation: -45,
	                x: 0,
	                y:-18,
	                style: {
	                    fontSize: '13px',
	                    fontFamily: 'Verdana, sans-serif'
	                }
	            }
			});
			
			options.series.push({
			    name: '稳定性',
			    type: 'errorbar',
			    visible:false,
			    data: tempSeriesdatasta1,
			    tooltip: {
					pointFormat: '最小值:{point.low} 最大值:{point.high}<br/>'
				}
			});

			options.series.push({
			    name: '进步值',
			    type: 'column',
			    data: tempSeriesdataimp,
			    visible:false,
			    tooltip: {
					pointFormat: '<span style="font-weight: bold; color: {series.color}">{series.name}</span>进步值:{point.y:.1f} '
				},
				dataLabels: {
	                enabled: true,
	                rotation: -45,
	                x: 0,
	                y:-18,
	                style: {
	                    fontSize: '13px',
	                    fontFamily: 'Verdana, sans-serif'
	                }
	            }
			});
			options.series.push({
			    name: '进步值',
			    type: 'errorbar',
			    visible:false,
			    data: tempSeriesdataimp1,
			    tooltip: {
					pointFormat: '最小值:{point.low} 最大值:{point.high}<br/>'
				}
			});
			var chart = new Highcharts.Chart(options);
		}
		else if(1 == $('#stat_class_typecombobox').combobox('getValue'))//散列图
		{
			var data =  new Array();
			var maxms = 0;
			for(var i = 0 ;i < rows.length;i++)
			{
				var temp = [];
				var rowdata = rows[i];
				data.push({
				    name: rowdata['cname'],
				    colors: colors[i],
				    data:rowdata['listdata'],
				    visible: rowdata['visiable']
				});
				maxms = rowdata['maxsta']>maxms?rowdata['maxsta']:maxms;
			}
	
			 //添加到图形
			var options = {
				chart: {
		    		renderTo: 'stat_class_charts',
		            margin: 100,
		            type: 'scatter',
		            options3d: {
		                enabled: true,
		                alpha: 10,
		                beta: 30,
		                depth: 250,
		                viewDistance: 5,
		                frame: {
		                    bottom: { size: 1, color: 'rgba(0,0,0,0.02)' },
		                    back: { size: 1, color: 'rgba(0,0,0,0.04)' },
		                    side: { size: 1, color: 'rgba(0,0,0,0.06)' }
		                }
		            }
		        },
		        
		        title: {
		            text: $('#stat_class_clacombotree').combotree('getText')+'('+$('#stat_class_exacombotree').combotree('getText')+')'
		        },
		        subtitle: {
		            text: $('#stat_class_subcombobox').combobox('getText')+'-各班对比图'
		        },
		        credits: {
					text:'一瓢计算',
					href:''
				}, 
		        xAxis: {
		            title: {
				        text: '能力值'
				    }
		        },
		        yAxis: {
		            title: {
				        text: '进步值'
				    }
		        },
		        zAxis: {
		        	min: 0,
		            max: maxms+1
		        }, 
		        series: data
			};
	
			var chart = new Highcharts.Chart(options);
	
		    // Add mouse events for rotation
		    $(chart.container).bind('mousedown.hc touchstart.hc', function (e) {
		        e = chart.pointer.normalize(e);
	
		        var posX = e.pageX,
		            posY = e.pageY,
		            alpha = chart.options.chart.options3d.alpha,
		            beta = chart.options.chart.options3d.beta,
		            newAlpha,
		            newBeta,
		            sensitivity = 5; // lower is more sensitive
	
		        $(document).bind({
		            'mousemove.hc touchdrag.hc': function (e) {
		                // Run beta
		                newBeta = beta + (posX - e.pageX) / sensitivity;
		                newBeta = Math.min(100, Math.max(-100, newBeta));
		                chart.options.chart.options3d.beta = newBeta;
	
		                // Run alpha
		                newAlpha = alpha + (e.pageY - posY) / sensitivity;
		                newAlpha = Math.min(100, Math.max(-100, newAlpha));
		                chart.options.chart.options3d.alpha = newAlpha;
	
		                chart.redraw(false);
		            },                            
		            'mouseup touchend': function () { 
		                $(document).unbind('.hc');
		            }
		        });
		    });
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
		if(!$('#stat_class_exacombotree').combobox('isValid'))
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
				  ExamID: $('#stat_class_exacombotree').combobox('getValues').join(','),
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
			    	    		"{field: 'cname', title: '班级', width: 90,sortable:true},"+
			    	    		"{field: 'clevel', title: '班级层次', width: 60,hidden:true,sortable:true},"+
			    	    		"{field: 'tname', title: '授课教师', width: 60},"+
			    	    		"{field: 'avgcyscore', title: '平均能力值', width: 80,sortable:true},"+
			    	    		"{field: 'avgcyscore-r', title: '排名', width: 50,sortable:true},"+
			    	    		"{field: 'maxcyscore', title: '最高能力值', width: 80,sortable:true},"+
			    	    		"{field: 'maxcyscore-r', title: '排名', width: 50,sortable:true},"+
			    	    		"{field: 'mincyscore', title: '最低能力值', width: 80,sortable:true},"+
			    	    		"{field: 'mincyscore-r', title: '排名', width: 50,sortable:true},"+
			    	    		"{field: 'avgsta', title: '平均稳定性', width: 80,sortable:true},"+
			    	    		"{field: 'avgsta-r', title: '排名', width: 50,sortable:true},"+
			    	    		"{field: 'maxsta', title: '最高稳定性', width: 80,sortable:true},"+
			    	    		"{field: 'maxsta-r', title: '排名', width: 50,sortable:true},"+
			    	    		"{field: 'minsta', title: '最低稳定性', width: 80,sortable:true},"+
			    	    		"{field: 'minsta-r', title: '排名', width: 50,sortable:true},"+
			    	    		"{field: 'avgimp', title: '平均进步值', width: 80,sortable:true},"+
			    	    		"{field: 'avgimp-r', title: '排名', width: 50,sortable:true},"+
			    	    		"{field: 'maximp', title: '最高进步值', width: 80,sortable:true},"+
			    	    		"{field: 'maximp-r', title: '排名', width: 50,sortable:true},"+
			    	    		"{field: 'minimp', title: '最低进步值', width: 80,sortable:true},"+
			    	    		"{field: 'minimp-r', title: '排名', width: 50,sortable:true}"+
			    	     	    "]]"); 
			    	     
			    	  	$grid_class_score.datagrid(options);
			    	  	
				  		$grid_class_score.datagrid('loadData',resp.data);
				  		$grid_class_score.datagrid('selectAll');
				  		createchart();
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
		if(!$('#stat_class_exacombotree').combobox('isValid'))
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
		                   		$('#stat_class_exacombotree').combotree('setValues','');
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
								       		examtemp = resp.data;
								    		$('#stat_class_exacombotree').combotree('loadData',resp.data);
								        }else
								        	fun_showMsg('提示','获取考试数据错误('+resp.msg+')');
								    }            
								});
		                   }
		            ">
				&nbsp;&nbsp;考试名称: 
			    <input class="easyui-combotree"   
		            id="stat_class_exacombotree"  
		            style="width:220px;height:26px;"
		            data-options="  
		                    valueField:'id',  
		                    textField:'text',  
		                    editable:false,
		                    required : true,
		                    multiple: false,
		                    panelHeight:'auto',
		                    onSelect : function(node)
		                    {
		                    	var data = examtemp;
		                    	
		                    	for(var i=0;i < data.length;i++)
		                    	{
		                    		for(var j=0;j < data[i].children.length;j++ )
		                    		{
		                    		
		                    			if(data[i].children[j].id == node.id)
		                    			{
		                    				$('#stat_class_subcombobox').combobox('clear');
					                    	$('#stat_class_subcombobox').combobox('loadData',data[i].children[j].subject);
					                    	subjecttemp = data[i].children[j].subject;
					                    	
		                    				break;
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
		                    onLoadSuccess : function(node, data)
		                    {
		                    	for(var i=0;i < data.length;i++)
		                    	{
		                    		for(var j=0;j < data[i].children.length;j++ )
		                    		{
		                    			if(data[i].children[j].selected)
		                    			{
		                    				$('#stat_class_exacombotree').combotree('setValue', data[i].children[j].id);
		                    				return;
		                    			}
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
		                    panelHeight:'auto',
		                    onSelect : function(node)
		                    {
		              		    queryclassscore();
		                    }
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
			                    {id:'0',text:'柱状图',selected:true},  
			                    {id:'1',text:'散列图',selected:false}
			                ],
			                onSelect : function(record){
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
