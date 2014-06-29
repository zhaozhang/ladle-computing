<script type="text/javascript">
var email = "";
var phone = "";
var emailver = "";
var phonever = "";
$.ajax({            
	    type:"POST",   //post提交方式默认是get
	    url: '<?php echo $this->createUrl('getuserinfo'); ?>',
	    dataType:"json",  
	 	data:{
		    uid:ypuid
		},  
	    error:function(err) {      // 
			fun_showMsg('提示','获取用户信息失败('+JSON.stringify(err)+')');
	    },
	    success:function(resp) {
	    	if(resp.success)
	        {

	    		top.document.getElementById("email").value=resp.data.email;
	    		email =resp.data.email;
	    		emailver = resp.data.emailver;
	    		if(resp.data.emailver == "1")
	    		{
	    			$("#emailver").html("已验证");
	    		}
	    		else
	    			$("#emailver").html("未验证(修改，验证后可用于登录和找回密码)");

	    		top.document.getElementById("telephone").value= resp.data.phone;
	    		if(resp.data.phonever == "1")
	    			$("#mobilever").html("已验证");
	    		else
	    			$("#mobilever").html("未验证(修改，验证后可用于登录和找回密码)");
				phone = resp.data.phone;
				phonever = resp.data.phonever;
	        }else
	        	fun_showMsg('提示','获取用户信息失败('+resp.msg+')');
	    }
});

editUserPwd = function() { 
	if(!$('#oldpassword').validatebox('isValid')
	|| !$('#password').validatebox('isValid')
	|| !$('#repassword').validatebox('isValid')
	   	)
	{
		fun_showMsg('提示','数据不符合要求，请修改');
		return;
	}
	$.ajax({            
	    type:"POST",   //post提交方式默认是get
	    url: '<?php echo $this->createUrl('edituserpwd'); ?>',
	    dataType:"json",    
	    data:{
	       oldpwd:$('#oldpassword').val(),
	       newpwd:$('#password').val()
	   },
	    error:function(err) {      // 
			fun_showMsg('提示','修改密码失败('+JSON.stringify(err)+')');
	    },
	    success:function(resp) {
	    	if(resp.success)
	        {
	    		fun_showMsg('提示',resp.msg);
	    		top.document.getElementById("oldpassword").value="";
	    		top.document.getElementById("password").value="";
	    		top.document.getElementById("repassword").value="";
	        }else
	        	fun_showMsg('提示','修改密码失败('+resp.msg+')');
	    }            
	});
}  

editEmail = function() { 
	top.document.getElementsByName("email")[0].disabled = false;
	$("#emailstep").empty();
	$("#emailstep").append(
			"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
			+"请输入邮箱地址&nbsp;&nbsp;&nbsp;&nbsp;<input id='btnSendEmail' type='button' value='验证' onclick='javascript:verifyEmail();' />"
	);
//	$("#email").removeAttr("disabled");
}
verifyEmail= function() { 
	if($('#email').validatebox('isValid'))
	{
		if(email != $('#email').val() || emailver == "0")
		{
			//后台操作
			//向后台发送处理数据
			$.ajax({            
			    type:"POST",   //post提交方式默认是get
			    url: '<?php echo $this->createUrl('sendverifyemail'); ?>',
			    dataType:"json",    
			    data:{
				    email : $('#email').val()
			   	},
			    error:function(err) {      // 
					fun_showMsg('提示','验证码发送失败('+JSON.stringify(err)+')');
			    },
			    success:function(resp) {
			    	if(resp.success)
			        {
			    		top.document.getElementById("email").disabled = true;
			    	//	top.document.getElementsByName("email")[0].disabled = true;	
			    		$("#emailstep").empty();
			    		$("#emailstep").append(
			    				'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
			    			    +'<a href="javascript:editEmail();" class="easyui-linkbutton" iconCls="icon-ok">修改</a>'
			    		);
			    		fun_showMsg('提示',"验证邮件已发送，请登录您的邮箱确认");
			        }else
			        	fun_showMsg('提示',resp.msg);
			    } 
			});      
		}else
			fun_showMsg('提示',"您未修改邮箱");
	}
//	$("#email").removeAttr("disabled");
}
if(InterValObj)
	clearInterval(InterValObj);
var InterValObj; //timer变量，控制时间
var count = 180; //间隔函数，1秒执行
var curCount;//当前剩余秒数
editPhone = function() { 
	if(InterValObj)
		clearInterval(InterValObj);
	top.document.getElementById("telephone").disabled = false;
//	top.document.getElementsByName("telephone")[0].disabled = false;
	$("#telephonestep").empty();
	$("#telephonestep").append(
			"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
			+"请输入手机号&nbsp;&nbsp;&nbsp;&nbsp;<input id='btnSendCode' type='button' value='发送验证码' onclick='sendMessage()' />"
	);
//	$("#email").removeAttr("disabled");
}
function sendMessage() {
	if($('#telephone').validatebox('isValid'))
	{
		if(phone != $('#telephone').val() || phonever == "0")
		{
			//向后台发送处理数据
			$.ajax({            
			    type:"POST",   //post提交方式默认是get
			    url: '<?php echo $this->createUrl('sendverifycode'); ?>',
			    dataType:"json",    
			    data:{
				    telephone : $('#telephone').val()
			   	},
			    error:function(err) {      // 
					fun_showMsg('提示','验证码发送失败('+JSON.stringify(err)+')');
			    },
			    success:function(resp) {
			    	if(resp.success)
			        {
			    		top.document.getElementById("telephone").disabled = true;
			    	//	top.document.getElementsByName("telephone")[0].disabled = true;
			    	    curCount = count;
			    	
			    	    //设置button效果，开始计时
			    	    $("#btnSendCode").attr("disabled", "true");
			    	    $("#btnSendCode").val("请在" + curCount + "秒内输入验证码");
			    	    InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次
					    $("#telephonestep2").empty();
					    $("#telephonestep2").append(
					    		"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
					    		+"请输入验证码&nbsp;&nbsp;&nbsp;&nbsp;"
					    		+"<input  class='easyui-validatebox' id='verifycode' name='verifycode' type='text' style='width:60px;' />&nbsp;&nbsp;&nbsp;&nbsp;"
					    		+"<input type='button' value='提交' onclick='submitPhone()' />"
					    );
			        }else
			        	fun_showMsg('提示',resp.msg);
			    }            
			});
		}else
			fun_showMsg('提示',"您未修改手机号码");
	}
};
submitPhone= function() {
	$.ajax({            
	    type:"POST",   //post提交方式默认是get
	    url: '<?php echo $this->createUrl('submitphone'); ?>',
	    dataType:"json",    
	    data:{
	    	verifycode : $('#verifycode').val()
	   	},
	    error:function(err) {      // 
			fun_showMsg('提示','操作失败('+JSON.stringify(err)+')');
	    },
	    success:function(resp) {
	    	if(resp.success)
	        {
	    		$("#telephonestep").empty();
	    		$("#telephonestep2").empty();
	    		$("#telephonestep").append(
    			    '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
    			    +'<a href="javascript:editPhone();" class="easyui-linkbutton" iconCls="icon-ok">修改</a>'
	    		);
	    		fun_showMsg('提示',resp.msg);
	    		$("#mobilever").html("已验证");
	        }else
	        	fun_showMsg('提示',resp.msg);
	    }            
	});
}
//timer处理函数
function SetRemainTime() {
    if (curCount == 0) {              
    	top.document.getElementsByName("telephone")[0].disabled = false;  
        window.clearInterval(InterValObj);//停止计时器
        $("#btnSendCode").removeAttr("disabled");//启用按钮
        $("#btnSendCode").val("重新发送验证码");
        code = ""; //清除验证码。如果不清除，过时间后，输入收到的验证码依然有效    
    }
    else {
        curCount--;
        $("#btnSendCode").val("请在" + curCount + "秒内输入验证码");
    }
}
</script>
<div style="height:auto;padding:5px;">
	<div class="easyui-panel" title="密码修改" collapsible="true" style="height:auto;padding:10px;">
		原&nbsp;&nbsp;密&nbsp;&nbsp;码：
	    <input class="easyui-validatebox" 
	    	id="oldpassword" 
	    	name="oldpassword" 
	    	required="true" 
	    	type="password"
	    	value=""
	    />
	    <br/>
		新&nbsp;&nbsp;密&nbsp;&nbsp;码：
		<input id="password" 
			name="password" 
			validType="length[6,32]" 
			class="easyui-validatebox" 
			required="true" type="password" value=""/>
		<br/>
		确认密码：
		<input type="password" 
			name="repassword" id="repassword" 
			required="true" class="easyui-validatebox"  
			validType="eqPwd['#password']" 
			invalidMessage="两次输入密码不匹配"/>
		<br/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="javascript:editUserPwd();" class="easyui-linkbutton" iconCls="icon-ok">确认</a>  
	</div>
	<br/>
	<div class="easyui-panel" title="资料修改" collapsible="true" style="height:auto;padding:10px;">
		Email：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    <input class="easyui-validatebox" 
	    	id="email" 
	    	name="email"
	    	required="true"
	    	validtype="email"
	    	missingMessage="不能为空" 
	    	invalidMessage="邮箱格式不正确" 
	    	type="text"
	    	disabled = true
	    	/>
	    &nbsp;&nbsp;&nbsp;&nbsp;<span style="padding:0px 0;text-align: left;" id="emailver" ></span>
	    <div  id="emailstep" >
	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    <a href="javascript:editEmail();" class="easyui-linkbutton" iconCls="icon-ok" disabled ="true">修改</a>&nbsp;&nbsp;暂未开通  
	    </div>
	    <br/>
		手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机：
		<input class="easyui-validatebox" 
			id="telephone" 
			name="telephone" 
			type="text"
			validtype="mobile"
			missingMessage="不能为空" 
	    	invalidMessage="手机格式不正确" 
			disabled = true
			/>
		&nbsp;&nbsp;&nbsp;&nbsp;<span style="padding:0px 0;text-align: left;" id="mobilever"></span>
		<div  id="telephonestep" >
	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    <a href="javascript:editPhone();" class="easyui-linkbutton" iconCls="icon-ok" disabled ="true">修改</a>&nbsp;&nbsp;暂未开通	
	    </div>
	    <br/>
	    <div  id="telephonestep2" >
	    </div>
		<br/>
	</div>
	<br/>
</div>
