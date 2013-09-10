<script type="text/javascript">
// 用全局变量保存对话框表单的提交地址
var submitUrl = "";

$(document).ready(function(){
	$("#datalist").datagrid({
		url: '<?php echo $url; ?>',
		method: 'post',			
		columns : [[
		        <?php foreach ($showColumns as $index => $name): ?>	
		   			{title: '<?php echo $columnNames[$name]; ?>', field : '<?php echo $name; ?>'
		   		<?php if (isset($columnShowConfig[$name])): ?>
			        <?php foreach($columnShowConfig[$name] as $key => $value): ?>	
				   		<?php echo ",{$key}: ${value} "; ?> 					   		
					<?php endforeach; ?>
					<?php if (!isset($columnShowConfig[$name]['width'])): ?>
						<?php echo ",width: ${columnWidth} ,sortable: true "; ?> 
					<?php endif; ?>
				<?php else: ?>
					<?php echo ",width: ${columnWidth} ,sortable: true "; ?> 
				<?php endif; ?>	
			   		}<?php echo ($index < (count($showColumns) - 1))? "," : ""; ?>				
			<?php endforeach; ?>
		]],
		
		pagination :true,
		// rownumbers: true,
		singleSelect: true, 
		pageSize: 10,	
		pageNumber: 1,		
		pageList: [10,15,20,30,50],		
		fitColumns : true,	
        idField: "<?php echo $keyColumn; ?>",
		<?php echo (0 == $width)? "" : "width: ${width}," ; ?>
		height: 350
	});
});

//当用户按下换行键的时候就可以查找啊哈
$(document).ready(function(){
	$("#searchForm :input").keyup(function(event){
		if(event.keyCode == 13) searchData();
	})
})

// 新建记录
function newRow()
{
    submitUrl = "<?php echo $this->createUrl('create'); ?>";  
    <?php if ($buttons['create']['ajax']): ?>
	$('#dlg').dialog('open').dialog('setTitle', '创建' + '<?php echo $title; ?>'); 
	setFormDisable(false);
	$('#<?php echo $keyColumn; ?>').attr('disabled', true); 
    $('#dataForm').form('clear');  
    <?php else: ?>
	window.open(submitUrl, "<?php echo empty($buttons['create']['window'])? '_self' : $buttons['view']['window']; ?>");	
    <?php endif; ?>
}

// 编辑选中行记录
function editRow()
{
    var row = $('#datalist').datagrid('getSelected');  
    if (row)
    {  
        submitUrl = "<?php echo $this->createUrl('update', array($keyColumn => '')); ?>" + row.<?php echo $keyColumn; ?>; 
    	
    	<?php if ($buttons['update']['ajax']): ?>
    	$('#dlg').dialog('open').dialog('setTitle', '编辑' + '<?php echo $title; ?>'); 
    	setFormDisable(false);
    	$('#<?php echo $keyColumn; ?>').attr('disabled', true); 
        $('#dataForm').form('load', row);  
        <?php else: ?>
    	window.open(submitUrl, "<?php echo empty($buttons['update']['window'])? '_self' : $buttons['view']['window']; ?>");	
        <?php endif; ?>      
    }  
    else
    {
    	$.messager.alert('警告', '你必须先选择一行记录');  
    } 	
}

// 查看选中行记录
function viewRow()
{
	var row = $('#datalist').datagrid('getSelected');  
    if (row)
    {  
        submitUrl = "<?php echo $this->createUrl('view', array($keyColumn => '')); ?>" + row.<?php echo $keyColumn; ?>; 
    	
    	<?php if ($buttons['view']['ajax']): ?>
    	$('#dlg').dialog('open').dialog('setTitle', '查看' + '<?php echo $title; ?>');  
        $('#dataForm').form('load', row);  
        setFormDisable(true);
        <?php else: ?>
    	window.open(submitUrl, "<?php echo empty($buttons['view']['window'])? '_self' : $buttons['view']['window']; ?>");	
        <?php endif; ?>      
    }  
    else
    {
    	$.messager.alert('警告', '你必须先选择一行记录');  
    } 	    
}

// 删除该行记录
function removeRow()
{  
    var row = $('#datalist').datagrid('getSelected');  
    // var key = '<?php echo $keyColumn; ?>';
    if (row)
    {  
        $.messager.confirm('Confirm', '你确定要删除这行记录吗?', function(r){  
            if (r)
            {  
                $.post("<?php echo $this->createUrl('delete'); ?>", {<?php echo $keyColumn; ?>:row.<?php echo $keyColumn; ?>}, function(result){  
                    if (result.success)
                    {  
                        $('#datalist').datagrid('reload');    // reload the user data  
                    } 
                    else 
                    {  
                        $.messager.show({   // show error message  
                            title: '删除错误',  
                            msg: result.msg  
                        });  
                    }  
                },'json');  
            }  
        });  
    } 
    else
    {
    	$.messager.alert('警告', '你必须先选择一行记录');  
    } 
}  

// 自定义按钮的操作函数
function customButton(url)
{
	var row = $('#datalist').datagrid('getSelected');  
    if (row)
    {  
        $.messager.confirm('Confirm', '你确定要如此操作吗?', function(r){  
            if (r)
            {  
                $.post(url, {id:row.id}, function(result){  
                    if (result.success)
                    {  
                        $('#datalist').datagrid('reload');    // reload the user data  
                        $.messager.alert('提示', '操作成功');
                    } 
                    else 
                    {  
                        $.messager.show({   // show error message  
                            title: '操作错误',  
                            msg: result.msg  
                        });  
                    }  
                },'json');  
            }  
        });  
    } 
    else
    {
    	$.messager.alert('警告', '你必须先选择一行记录');  
    } 	
}

// 保存数据
function saveData()
{  
    $('#dataForm').form('submit',
   	{  
        url: submitUrl,  
        onSubmit: function(){  
            return $(this).form('validate');  
        },  
        success: function(result){  
            var result = eval('('+result+')');  
            if (result.success)
            {  
                $('#dlg').dialog('close');      // close the dialog  
                $('#datalist').datagrid('reload');    // reload the user data  
            } 
            else 
            {  
                $.messager.show({  
                    title: '失败',  
                    msg: result.msg  
                });  
            }  
        }  
    });  
} 

// 把对话框表格的所有字段置为enabled/disabled
function setFormDisable(enable)
{
	<?php foreach ($showColumns as $index => $name): ?>	
	$("#<?php echo $name; ?>").attr('disabled', enable);
	<?php endforeach; ?>
}

// 根据输入的字段进行搜索
function searchData()
{
	// alert($("#searchForm").serialize());
	var arr = $("#searchForm").serializeArray();
	var params = {};
	for (i=0; i < arr.length; i++)
	{
		params[arr[i]['name']] = arr[i]['value'];
	}
	$("#datalist").datagrid('reload', params);
}

//根据搜索条件导出所有符合条件的记录
function exportAll()
{
	$("#searchForm").attr('action', "<?php echo $this->createUrl('exportAll'); ?>");
	$("#searchForm").submit();
}
</script>

<div>
	
	<?php //如果$partialUrl不空，表示需要渲染别的页面
		if($partialUrl != ''):
	?>
	<?php $this->renderPartial($partialUrl,$partialData);?>
	<?php endif;?>
	
	<form id="searchForm" method="post" action=""> 
        <table width="100%" border="1">
            <tr>
            <?php foreach ($queryColumns as $index => $obj): ?>
            	<?php 
            	    if(is_array($obj)) 
            	    {
            	        $name = $obj['name'];
            	        $html = $obj['html'];  
            	    }
            	    else 
            	    {
            	        $name = $obj;
            	    }
            	?>	
                <td><?php echo CHtml::label($columnNames[$name], "search[" . $name . "]"); ?></td>
                <td>
                <?php if(is_array($obj)): ?>
                <?php echo $html; ?>
                <?php elseif (isset($columnCustomConfig[$name]['control'])): ?>
                    <?php if ($columnCustomConfig[$name]['control'] == "textarea"): ?>
                        <?php echo CHtml::textArea("search[" . $name . "]", ""); ?>
                    <?php elseif ($columnCustomConfig[$name]['control'] == "dropdown"): ?>
                        <?php echo CHtml::dropDownList("search[" . $name . "]", "", $columnCustomConfig[$name]['value']); ?>
                    <?php elseif ($columnCustomConfig[$name]['control'] == "checkbox"): ?>
                        <?php echo CHtml::checkBox("search[" . $name . "]", false); ?>
                    <?php elseif ($columnCustomConfig[$name]['control'] == "datetime"): ?>
                    	<?php if ($columnCustomConfig[$name]['range'] === true): ?>
                    		<?php $this->widget('application.extensions.DateTimeWidget', array(
	                        					'id' => "search_${name}_0",
	                        					'name' => "search[$name][0]",	                        					
	                        		)); 
	                        ?>
	                        </td><td>
	                        <?php $this->widget('application.extensions.DateTimeWidget', array(
	                        					'id' => "search_${name}_1",
	                        					'name' => "search[$name][1]",	                        					
	                        		)); 
	                        ?>
                    	<?php else: ?>
	                        <?php $this->widget('application.extensions.DateTimeWidget', array(
	                        					'id' => "search_name",
	                        					'name' => "search[$name]",	                        					
	                        		)); 
	                        ?>
                        <?php endif; ?>
                    <?php elseif ($columnCustomConfig[$name]['control'] == "date"): ?>
                    	<?php if ($columnCustomConfig[$name]['range'] === true): ?>
                    		<?php
								//$this->widget('zii.widgets.jui.CJuiDatePicker', array(
								$this->widget('application.extensions.EasyuiDateWidget', array(
								    'name' => "search[$name][0]",
								    // additional javascript options for the date picker plugin
								    'options'=>array(
								        //'showAnim'=>'fold',
								    ),
								    //'language' => 'zh_cn',
								    'htmlOptions'=>array(
								        'class'=>'text $name',
									),
//									'options' => array(
//										'dateFormat' => 'yy-mm-dd',
//										'changeYear'  => 'true',
//										'yearRange' => '1990:2020'
//									),
									'options' => array(
										'formatter' => 'js:function(d){var m = d.getMonth(), dd = d.getDate(); return d.getFullYear()+"-"+(m+1)+"-"+dd;}',
									),
								));
							?>	
							<?php
								//$this->widget('zii.widgets.jui.CJuiDatePicker', array(
								$this->widget('application.extensions.EasyuiDateWidget', array(
								    'name' => "search[$name][1]",
								    // additional javascript options for the date picker plugin
								    'options'=>array(
								        'showAnim'=>'fold',
								    ),
								    //'language' => 'zh_cn',
								    'htmlOptions'=>array(
								        'class'=>'text $name',
									),
//									'options' => array(
//										'dateFormat' => 'yy-mm-dd',
//										'changeYear'  => 'true',
//										'yearRange' => '1990:2020'
//									),
									'options' => array(
										'formatter' => 'js:function(d){var m = d.getMonth(), dd = d.getDate(); return d.getFullYear()+"-"+(m+1)+"-"+dd;}',
									),
								));
							?>	
                    	<?php else: ?>
                        	<?php
								//$this->widget('zii.widgets.jui.CJuiDatePicker', array(
								$this->widget('application.extensions.EasyuiDateWidget', array(
								    'name' => "search[$name]",
								    // additional javascript options for the date picker plugin
								    'options'=>array(
								        //'showAnim'=>'fold',
								    ),
								    //'language' => 'zh_cn',
								    'htmlOptions'=>array(
								        'class'=>'text $name',
									),
									'options' => array(
									    'formatter' => 'js:function(d){var m = d.getMonth(), dd = d.getDate(); return d.getFullYear()+"-"+(m+1)+"-"+dd;}',
//										'dateFormat' => 'yymm',
//										'changeYear'  => 'true',
//										'yearRange' => '1990:2020'
									),
								));
							?>	
						<?php endif; ?>
                    <?php endif; ?>
                <?php else: ?>
                    <?php echo CHtml::textField("search[" . $name . "]", ""); ?>	
                <?php endif; ?>
                </td>

                <?php if (($index + 1) % 3 == 0): ?>
                    <?php echo "</tr><tr>"; ?>
                <?php endif;?>
           <?php endforeach; ?>
           </tr>
       </table>
	</form>
	
    <div style="padding:5px;background:#fafafa;width:500px;">   
    	<a id="submitButton" class="easyui-linkbutton" iconCls="icon-search" onclick="searchData()">查询</a>  
    	<a class="easyui-linkbutton" onclick="exportAll()">导出</a>  
    </div>  
</div>
	
<div style="margin:20px 0 0 20px;">
	<table id="datalist" title="<?php echo $title; ?>" toolbar="#toolbar" >
	</table>
</div>
<div id="toolbar">  
	<?php foreach ($buttons as $name => $buttonInfo): ?>
		<?php if (in_array($name, $defaultButtons) || !empty($buttonInfo['function'])): ?>
    		<a href="#" class="easyui-linkbutton" iconCls="<?php echo $buttonInfo['class']; ?>" plain="true" onclick="<?php echo ($buttonInfo['function'] == 'customButton')? 'customButton(\'' . $buttonInfo['url'] . '\')' : $buttonInfo['function'] . '()'; ?>"><?php echo $buttonInfo['name']; ?></a>  
		<?php else: ?>
			<a target="<?php echo empty($buttonInfo['window'])? '_blank' : $buttonInfo['window'];?>" href="<?php echo $buttonInfo['url']; ?>" class="easyui-linkbutton" iconCls="<?php echo $buttonInfo['class']; ?>" plain="true"><?php echo $buttonInfo['name']; ?></a> 
		<?php endif; ?>
	<?php endforeach; ?> 
</div>  

<div id="dlg" class="easyui-dialog" style="width:<?php echo $dialogWidth; ?>px;height:<?php echo $dialogHeight; ?>px;padding:10px 20px" closed="true" buttons="#dlg-buttons">  
    <form id="dataForm" method="post">  
    	<table border="0" align="center"  cellpadding="0" cellspacing="0">  
               <?php foreach ($showColumns as $index => $name): ?>	
               	<tr>			    
		   			<td><?php echo $columnNames[$name]; ?></td>
		   			<td class="easyui-validatebox">
		   			<?php if (isset($columnCustomConfig[$name]['control'])): ?>
		   				<?php if ($columnCustomConfig[$name]['control'] == "textarea"): ?>
		   					<?php echo CHtml::textArea($name, ""); ?>
		   				<?php elseif ($columnCustomConfig[$name]['control'] == "dropdown"): ?>
		   						<?php echo CHtml::dropDownList($name, "", $columnCustomConfig[$name]['value']); ?>			
		   				<?php elseif ($columnCustomConfig[$name]['control'] == "checkbox"): ?>
		   					<?php echo CHtml::checkBox($name, false); ?>		   				
		   				<?php elseif ($columnCustomConfig[$name]['control'] == "date"): ?>
		   					<?php
								//$this->widget('zii.widgets.jui.CJuiDatePicker', array(
								$this->widget('application.extensions.EasyuiDateWidget', array(
								    'name' => "$name",
								    // additional javascript options for the date picker plugin
								    'options'=>array(
								        //'showAnim'=>'fold',
								    ),
								    //'language' => 'zh_cn',
								    'htmlOptions'=>array(
								        'class'=>'text $name',
									),
//									'options' => array(
//										'dateFormat' => 'yy-mm-dd',
//										'changeYear'  => 'true',
//										'yearRange' => '1990:2020'
//									),
                                    'options' => array(
										'formatter' => 'js:function(d){var m = d.getMonth(), dd = d.getDate(); return d.getFullYear()+"-"+(m+1)+"-"+dd;}',
									),
								));
							?>
						<?php elseif ($columnCustomConfig[$name]['control'] == "upload"): ?>
							<?php $this->widget('application.extensions.FileUpload', array(
							    'divId' => $name,
							    'paramName' => $name,
							));?>
		   				<?php endif; ?>
		   			<?php else: ?>
		   				<?php echo CHtml::textField($name, "", ($name == $keyColumn)? array('disabled' => true) : array()); ?>	
		   			<?php endif; ?>
		   			</td>			   			
				</tr>
			<?php endforeach; ?>
           </table>  
    	
    </form>  
</div>  
<div id="dlg-buttons">  
    <a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveData()">保存</a>  
    <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>  
</div>  
