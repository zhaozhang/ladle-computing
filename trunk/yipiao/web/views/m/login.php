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
<div data-role="page">
<div data-role="header" data-position="fixed"><h1>成绩查询分析系统</h1></div>
  <div data-role="content" class="content"> 
		<form method="post" id="LoginForm"> 
			<label for="username">用户名</label> 
			<input type="text" name="LoginForm[username]" id="username" value=""/><br> 
			<label for="password">密码</label> 
            <input type="password" name="LoginForm[password]" id="password" value="" /> 
                    <fieldset data-role="controlgroup"> 
                        <input type="checkbox" name="LoginForm[rememberMe]" value ="1" id="checkbox-1" class="custom" /> 
                        <label for="checkbox-1">记住我</label> 
                    </fieldset> 
            <span style="padding:0px 0;text-align: left;color: red;" id="showMsg"><?php echo $msg; ?></span>
            <a data-role="button" href="javascript:login();" data-theme="a">登录</a> 
        </form> 
  </div> 
  <div data-role="footer" data-position="fixed"><h1>版权所有 毅瓢计算</h1></div> 
</div> 