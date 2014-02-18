<?php

if(isset($_SERVER['HTTP_USER_AGENT'])) {
    $userAgent = strtolower($_SERVER['HTTP_USER_AGENT']);
    $clientkeywords = array(
      'nokia', 'sony', 'ericsson', 'mot', 'samsung', 'htc', 'sgh', 'lg', 'sharp', 'sie-'
      ,'philips', 'panasonic', 'alcatel', 'lenovo', 'iphone', 'ipod', 'blackberry', 'meizu', 
      'android', 'netfront', 'symbian', 'ucweb', 'windowsce', 'palm', 'operamini', 
      'operamobi', 'opera mobi', 'openwave', 'nexusone', 'cldc', 'midp', 'wap', 'mobile'
    );
    // 从HTTP_USER_AGENT中查找手机浏览器的关键字
    if(preg_match("/(".implode('|',$clientkeywords).")/i",$userAgent)&&strpos($userAgent,'ipad') === false)
    {
      header('Location: /m');
    }
  }
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>成绩查询分析系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- 引入jQuery -->
<script src="/static/jquery-1.8.3.js" type="text/javascript" charset="utf-8"></script>

<!-- 引入bootstrap样式 -->
<link href="/static/bootstrap-2.3.1/css/bootstrap.min.css" rel="stylesheet" media="screen">
<!--<script charset="utf-8" src="/static/bootstrap-2.3.1/js/bootstrap.min.js" charset="utf-8"></script>-->

<!-- 引入EasyUI -->
<link id="easyuiTheme" rel="stylesheet" href="/static/jquery-easyui/themes/metro-blue/easyui.css" type="text/css">
<link rel="stylesheet" href="/static/jquery-easyui/themes/icon.css" type="text/css">
<link rel="stylesheet" type="text/css" href="/static/css/portal.css">

<script type="text/javascript" src="/static/jquery-easyui/jquery.easyui.min.js" charset="utf-8"></script>
<script type="text/javascript" src="/static/jquery-easyui/locale/easyui-lang-zh_CN.js" charset="utf-8"></script>

<link media="screen,projection" rel="stylesheet" type="text/css" href="/static/login/styles/screen.css" />
<script type="text/javascript" src="/static/login/scripts/slides.min.jquery.js"></script>
<script type="text/javascript" src="/static/login/scripts/jquery.prettyPhoto.js"></script>
<script type="text/javascript" src="/static/login/scripts/global.js"></script>
<script>
document.createElement("section");
document.createElement("article");
document.createElement("footer");
document.createElement("header");
document.createElement("hgroup");
document.createElement("nav");
document.createElement("menu");
</script>
<style type="text/css"> 
body {
	margin: 0;
	background: url(/static/images/bg.jpg) center no-repeat;
	-ms-behavior: url(/static/backgroundsize.min.htc);
	behavior: url(/static/backgroundsize.min.htc);
	background-size:cover;
}
html, body {
	height: 100%;
}
</style> 
</head>
<body >

<?php echo $content; ?>	


</body>
</html>
