<style type="text/css">
#name{width:105px;}
tr{height:30px;}
</style>

<div style="width:94%; margin-left:20px;">
    <table>
        <tr>
            <td><?php echo CHtml::activeLabel($model,"SchoolID")?></td>
            <td><?php echo $model->SchoolID; ?></td>
        </tr>

        <tr>
            <td><?php echo CHtml::activeLabel($model,"SchoolName")?></td>
            <td><?php echo $model->SchoolName; ?></td>
        </tr>

        <tr>
            <td><?php echo CHtml::activeLabel($model,"Province")?></td>
            <td><?php echo $model->Province; ?></td>
        </tr>

        <tr>
            <td><?php echo CHtml::activeLabel($model,"City")?></td>
            <td><?php echo $model->City; ?></td>
        </tr>

        <tr>
            <td><?php echo CHtml::activeLabel($model,"Address")?></td>
            <td><?php echo $model->Address; ?></td>
        </tr>

        <tr>
            <td><?php echo CHtml::activeLabel($model,"PostCode")?></td>
            <td><?php echo $model->PostCode; ?></td>
        </tr>

        <tr>
            <td><?php echo CHtml::activeLabel($model,"Phone")?></td>
            <td><?php echo $model->Phone; ?></td>
        </tr>

        <tr>
            <td><?php echo CHtml::activeLabel($model,"Home")?></td>
            <td><?php echo $model->Home; ?></td>
        </tr>

        <tr>
            <td><?php echo CHtml::activeLabel($model,"Email")?></td>
            <td><?php echo $model->Email; ?></td>
        </tr>

        <tr>
            <td><?php echo CHtml::activeLabel($model,"CreateTime")?></td>
            <td><?php echo $model->CreateTime; ?></td>
        </tr>

    </table>

    <a href="<?php echo $this->createUrl('/school/school/update', array('SchoolID' => $_GET['SchoolID'])); ?>" class="easyui-linkbutton" iconCl
s="icon-edit">编辑</a>
    <a href="<?php echo $this->createUrl('/school/school/index'); ?>" class="easyui-linkbutton" iconCls="icon-back">返回列
表</a>

</div>
