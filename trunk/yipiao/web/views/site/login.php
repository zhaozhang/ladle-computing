<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎登录</title>
<script src="/static/jquery-1.8.3.js" type="text/javascript" charset="utf-8"></script>


<!-- 引入EasyUI -->
<link id="easyuiTheme" rel="stylesheet" href="/static/jquery-easyui/themes/<?php echo isset($_COOKIE['easyuiThemeName'])?$_COOKIE['easyuiThemeName']:'default'; ?>/easyui.css" type="text/css">
<link rel="stylesheet" href="/static/jquery-easyui/themes/icon.css" type="text/css">

<script type="text/javascript" src="/static/jquery-easyui/jquery.easyui.min.js" charset="utf-8"></script>
<script type="text/javascript" src="/static/jquery-easyui/locale/easyui-lang-zh_CN.js" charset="utf-8"></script>

<STYLE TYPE="text/CSS">
<!--
BODY {background-image: URL();
background-position: center;
background-repeat: no-repeat;
background-attachment: fixed;}
-->
</STYLE>
</head>

<body>
<div id="loginWin" class="easyui-window" title="登录" style="width:310px;height:240px;padding:5px;"
   minimizable="false" maximizable="false" resizable="false" collapsible="false" closable="false">
    <div class="easyui-layout" fit="true">
            <div region="center" border="false" style="padding:5px;background:#fff;border:1px solid #ccc;">
        <form id="LoginForm" method="post">
            <div style="padding:5px 0;">
                <label for="login">用户名:</label>
                <input type="text" name="username" style="width:260px;"></input>
            </div>
            <div style="padding:5px 0;">
                <label for="password">密码:</label>
                <input type="password" name="password" style="width:260px;"></input>
            </div>
            <input type="checkbox" name="rememberMe" value ="1">记住我<br>
            <div style="padding:5px 0;text-align: left;color: red;" id="showMsg"></div>
        </form>
            </div>
            <div region="south" border="false" style="text-align:right;padding:5px 0;">
                <a class="easyui-linkbutton" iconCls="icon-ok" href="javascript:void(0)" onclick="login()">登录</a>
                <a class="easyui-linkbutton" iconCls="icon-cancel" href="javascript:void(0)" onclick="cleardata()">重置</a>
            </div>
    </div>
</div>
</body>

<script type="text/javascript">
document.onkeydown = function(e){
    var event = e || window.event;  
    var code = event.keyCode || event.which || event.charCode;
    if (code == 13) {
        login();
    }
}
$(function(){
    $("input[name='username']").focus();
});
function cleardata(){
    $('#LoginForm').form('clear');
}
function login(){
     if($("input[name='username']").val()=="" || $("input[name='password']").val()==""){
         $("#showMsg").html("用户名或密码为空，请输入");
         $("input[name='username']").focus();
    }else{
            //ajax异步提交  
           $.ajax({            
                  type:"POST",   //post提交方式默认是get
                  url:'<?php echo $this->createUrl('/site/login'); ?>',
                  data:$("#LoginForm").serialize(),   //序列化               
                  error:function(err) {      // 设置表单提交出错                 
                      $("#showMsg").html(err);  //登录错误提示信息
                  },
                  success:function(resp) {
                  	if(resp.success)
			        {
                  		window.location.href = 'index.php';
			        }else
			        	$("#showMsg").html(resp.msg); 
                   //   document.location = "index.action";
                  }            
            });       
        } 
}
</script>
</html>