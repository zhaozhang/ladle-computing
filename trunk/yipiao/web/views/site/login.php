
<div style="padding:100 0 0 100px;">
	<div align=center>
		<img src="/static/images/login_back.jpg" alt="" style="width:100%;height:100%;"/>
	</div>
	<div id="loginWin" class="easyui-window" title="登录" style="width:370px;height:270px;padding:2px;"
		data-options="left:'60%',top:'100px'" 
		shadow = "true" minimizable="false" maximizable="false" resizable="false" collapsible="false" closable="false"
   		>
		<div style="float:left;width:320px;padding-left:30px;">
		    <form id="LoginForm" method="post" action="#">
		        <div style="padding:1px 0;">
		            <label for="login">用户名:</label>
		            <input type="text" name="LoginForm[username]" id="username" style="width:260px;"></input>
		        </div>
		        <div style="padding:0px 0;">
		            <label for="password">密码:</label>
		            <input type="password" name="LoginForm[password]" id="password" style="width:260px;"></input>
		        </div>
		        <input type="checkbox" name="LoginForm[rememberMe]" value ="1">记住我<br>
	            <span style="padding:0px 0;text-align: left;color: red;" id="showMsg"><?php echo $msg; ?></span>
		    </form>
		    <div style="text-align:right;padding:5px 0;">
				<a class="easyui-linkbutton" iconCls="icon-ok" href="javascript:login();" >登录</a>
				<a class="easyui-linkbutton" iconCls="icon-cancel" href="javascript:cleardata();" >重置</a>
		    </div>
		</div>
	</div>
</div>


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
     if($("input[id='username']").val()=="" || $("input[id='password']").val()==""){
         $("#showMsg").html("用户名或密码为空，请输入");
         $("input[id='username']").focus();
    }else{
          $("#LoginForm").submit();
        } 
}
</script>
</html>
