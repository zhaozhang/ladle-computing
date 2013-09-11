<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>成绩查询分析系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="language" content="en" />

<!-- screen.css/print.css与jquery-easyui的css冲突, 导致datagrid列头无法显示, 故去掉 -->
<link rel="stylesheet" type="text/css" href="/static/css/main.css" />
<link rel="stylesheet" type="text/css" href="/static/css/form.css" />
<!-- 引入jQuery -->
<script src="/static/jquery-1.8.3.js" type="text/javascript" charset="utf-8"></script>


<!-- 引入bootstrap样式 -->
<link href="/static/bootstrap-2.3.1/css/bootstrap.min.css" rel="stylesheet" media="screen">
<!--<script charset="utf-8" src="/static/bootstrap-2.3.1/js/bootstrap.min.js" charset="utf-8"></script>-->

<!-- 引入EasyUI -->
<link id="easyuiTheme" rel="stylesheet" href="/static/jquery-easyui/themes/<?php echo isset($_COOKIE['easyuiThemeName'])?$_COOKIE['easyuiThemeName']:'default'; ?>/easyui.css" type="text/css">
<link rel="stylesheet" href="/static/jquery-easyui/themes/icon.css" type="text/css">
<link rel="stylesheet" type="text/css" href="/static/css/portal.css">

<script type="text/javascript" src="/static/jquery-easyui/jquery.easyui.min.js" charset="utf-8"></script>
<script type="text/javascript" src="/static/jquery-easyui/locale/easyui-lang-zh_CN.js" charset="utf-8"></script>
<!-- 修复EasyUI1.3.3中layout组件的BUG -->
<script type="text/javascript" src="/static/jquery-easyui/plugins/jquery.layout.js" charset="utf-8"></script>
<script type="text/javascript" src="/static/jquery.portal.js"></script>
<!-- 扩展EasyUI -->
<script type="text/javascript" src="/static/extEasyUI.js?v=201306231044" charset="utf-8"></script>

<!-- 扩展EasyUI Icon -->
<link rel="stylesheet" href="/static/css/style/extEasyUIIcon.css?v=201306231906" type="text/css">

<!-- 扩展jQuery -->
<script type="text/javascript" src="/static/extJquery.js?v=201306231341" charset="utf-8"></script>
<script src="/static/js/common.js"></script>
<script src="/static/js/easyuiCommon.js"></script>

<link rel="stylesheet" href="/static/jQuery-File-Upload/css/style.css">
<!-- CSS to style the file input field as button and adjust the Bootstrap progress bars -->
<link rel="stylesheet" href="/static/jQuery-File-Upload/css/jquery.fileupload-ui.css">
<script src="/static/jQuery-File-Upload/js/vendor/jquery.ui.widget.js"></script>
<script src="/static/jQuery-File-Upload/js/jquery.iframe-transport.js"></script>
<script src="/static/jQuery-File-Upload/js/jquery.fileupload.js"></script>

</head>

<body>
<div class="easyui-layout" fit="true" style="width:100%;" id="easyui-layout">
	<div data-options="region:'west',split:true" title="导航菜单"  style="width:300px;height:100%;">
        <img src="/static/images/banner.jpg" />
	</div>
    <div id="layout_center_index" region="center" title="登陆" style="padding:2px;">
        <?php echo $content; ?>	
    </div> 

	<div data-options="region:'south',split:true" style="height: 30px;text-align: center;overflow: hidden;">
            版权所有 毅瓢计算
    </div>
</div><!-- page -->
<script>
function setPageHeight()
{
    var size = bevaGetPageSize();
    document.getElementById("easyui-layout").style.height = size.windowH + "px";
}
setPageHeight();
</script>

</body>
</html>
