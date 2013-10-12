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
<link id="easyuiTheme" rel="stylesheet" href="/static/jquery-easyui/themes/metro-gray/easyui.css" type="text/css">
<link rel="stylesheet" href="/static/jquery-easyui/themes/icon.css" type="text/css">
<link rel="stylesheet" type="text/css" href="/static/css/portal.css">

<script type="text/javascript" src="/static/jquery-easyui/jquery.easyui.min.js" charset="utf-8"></script>
<script type="text/javascript" src="/static/jquery-easyui/locale/easyui-lang-zh_CN.js" charset="utf-8"></script>

<script type="text/javascript" src="/static/jMask.js" ></script>
<script type="text/javascript" src="/static/cufon-yui.js" ></script>
<script type="text/javascript" src="/static/GeosansLight_500.font.js"  ></script>
<script type="text/javascript" src="/static/raphael-min.js"  ></script>
<script type="text/javascript" src="/static/custom.js"  ></script>

<style type="text/css"> 
<!-- 
body { 
background-image: url('/static/images/paper_1.png'); 
} 
@charset "utf-8";
/* CSS Document */
.active { position:absolute;z-index:10; } /* Class for element at top  */
.reset{ position:absolute;z-index:4;  } /* Class for the rest of the elements  */

#jMask-stage ul { list-style:none; display:block; margin:0px; padding:0px; float:left; }
#jMask-stage ul li { position:absolute; display:block; overflow:hidden;  }
#jMask-stage ul img { position:absolute;  }

h1 { font-size:36px; }

#container { margin-left:30px;margin-top:70px;margin-right:auto;width:100px }

#outerblock { position:relative; z-index:2; margin:50px; }

#innerblock { position:absolute; z-index:999;  }
#slideshow { padding:10px; }

#innerblock #ribbon-left { background:url('/static/css/i/ribbonleft.png') no-repeat bottom left;  width:28px; height:72px; position:absolute;  margin-top:-160px; margin-left:-18px;}

#innerblock .title { position:absolute; background:url('/static/css/i/ribbon-slice.png') repeat-x; border-right:1px solid #185381; border-top:1px solid #185381; border-bottom:1px solid #185381; padding:0px 4px 7px 0px; display:none; color:#fff;height:44px; margin-top:238px; z-index:3;
}
#innerblock p { position:absolute; width:630px; padding:10px 25px 10px 25px; text-align:justify; font-family: "Lucida Sans Unicode", "Lucida Grande", sans-serif; background:url('/static/css/i/desc-overlay.png');margin-top:300px;z-index:2; display:none; line-height: 20px; }

#shadow { margin-top:-120px;margin-left:20px }

#slideshow ul { list-style:none; }

-->
</style> 
</head>
<body>

<?php echo $content; ?>	


</body>
</html>
