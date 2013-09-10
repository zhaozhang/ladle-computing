<script type="text/javascript">
function submitForm()
{
	$("#contentForm").submit();
}
</script>

<style type="text/css">
label{width:100px; float:left;}
</style>

<div class="form" style="margin-left: 20px;position:relative">
	<form id="contentForm" method="post" action="#">	
	
		<?php echo CHtml::errorSummary($model); ?>
	
		<?php foreach (array('SchoolName', 'Province', 'City', 'Address', 'Phone', 'PostCode', 'Home', 'Email') as $fieldName): ?>
		<div class="row">
			<?php echo CHtml::activeLabel($model, $fieldName); ?>
            <?php $size = ($fieldName == "SchoolName" || $fieldName == "Address" || $fieldName == "Home")? 128 : 32; ?>
			<?php echo CHtml::activeTextField($model, $fieldName, array('size'=> $size)); ?>
			<?php echo CHtml::error($model, $fieldName); ?>
		</div>
		<?php endforeach; ?>
		
		<div class="row buttons">
			<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="submitForm()">提交</a>
			<a href="<?php echo $this->createUrl('/school/school/index'); ?>" class="easyui-linkbutton" iconCls="icon-back">返回列表</a>
		</div>
	</form>
</div>
