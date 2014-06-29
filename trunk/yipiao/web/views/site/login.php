
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
	$("#showMsg").html("");
    $('#LoginForm').form('clear');
};
function login(){
	 $("#showMsg").html("");
     if($("input[id='username']").val()=="" || $("input[id='password']").val()==""){
         $("#showMsg").html("用户名或密码为空，请输入");
         $("input[id='username']").focus();
    }else{
          $("#LoginForm").submit();
        } 
};
function changetype(type1,type2){
	document.getElementById(type1).style.display="";
	document.getElementById(type2).style.display="none";
};
function forgetpwd(){
	document.getElementById("layout_forgetpwd_dlg").style.display="";
	$('#layout_forgetpwd_dlg').dialog({  
		title : '重置密码',
       	buttons:[{  
           	text:'提交',  
           	iconCls:'icon-ok',  
           	handler:function(){  
       			$("#showfindMsg").html("");
	       		if(!$('#username1').validatebox('isValid'))
				{
					$("#showfindMsg").html("用户名不能为空，请输入");
					return;
				}
	   			var val=$('input:radio[name="findtype"]:checked').val();
	   			var param = "";
				if(val == "email")
				{
					param = $('#email').val();
					if(!$('#email').validatebox('isValid'))
					{
						$("#showfindMsg").html("邮箱格式错误，请修改");
						return;
					}
				}
				else if(val == "mobile")
				{
					param = $('#mobile').val();
					if(!$('#mobile').validatebox('isValid'))
					{
						$("#showfindMsg").html("手机号格式错误，请修改");
						return;
					}
				}
				$.ajax({            
	       		    type:"POST",   //post提交方式默认是get
	       		    url: '<?php echo $this->createUrl('/common/resetuserpwd'); ?>',
	       		    dataType:"json",    
	       		    data:{
		       		    type: val,
		       		    username: $('#username1').val(),
		       		    param: param
		       		},
	       		    error:function(err) {      // 
		       			$("#showfindMsg").html('密码重置失败('+JSON.stringify(err)+')');
	       		    },
	       		    success:function(resp) {
	       		    	if(resp.success)
	       		        {
	       		    		$("#showfindMsg").html(resp.msg);
	       		    		top.document.getElementById("username1").value="";
	       		    		top.document.getElementById("email").value="";
	       		    		top.document.getElementById("mobile").value="";
	       		    //		top.document.getElementsByName("username1")[0].value="";
	       			//		top.document.getElementsByName("email")[0].value="";
	       			//		top.document.getElementsByName("mobile")[0].value="";
	       		        }else
	       		        	$("#showfindMsg").html(resp.msg);
	       		    }            
	       		});
   			
       		}
       	},{  
           text:'取消',  
           handler:function(){
       		  $("#showfindMsg").html("");
               $('#layout_forgetpwd_dlg').dialog('close');  
           }   
       	}]  
   	}); 
};
</script>
<div>
	<br><br><br><br>
	<div style="text-align:center;"><b><font face='微软雅黑' size='6'>攀枝花市第三高级中学校成绩查询分析系统</font></b></div> 
	<br>
	<div id="content" class="wrap clearfix">
		<div class="imgSliderContainer">
		    <div class="imgSlider">
				<div class="imgSliderC">
					<div>
						<img src="/static/login/contents/slider_image_1.jpg" alt="slider 1" />
						<section>
							<h2>成绩查询</h2>
							<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							你可以在这里查询到每次考试各科的成绩以及班级和年级的统计</p>
						</section>
						<a href="#" class="imgSliderPrev imgSliderTextPrev"></a>
						<a href="#" class="imgSliderNext imgSliderTextNext"></a>
					</div>
					<div>
						<img src="/static/login/contents/slider_image_2.jpg" alt="slider 2" />
						<section>
							<h2>成绩分析</h2>
							<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							成绩分析为你各个学科的学习情况提供了三个参数值，包括：能力值、稳定指数、进步指数</p>
						</section>
						<a href="#" class="imgSliderPrev imgSliderTextPrev"></a>
						<a href="#" class="imgSliderNext imgSliderTextNext"></a>
					</div>
					<div>
						<img src="/static/login/contents/slider_image_3.jpg" alt="slider 3" />
						<section>
							<h2>能力值</h2>
							<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							能力值表示该学科你的学习成绩在全年级的一个位置，值越大说明该学科你的学习成绩越好</p>
						</section>
						<a href="#" class="imgSliderPrev imgSliderTextPrev"></a>
						<a href="#" class="imgSliderNext imgSliderTextNext"></a>
					</div>
					<div>
						<img src="/static/login/contents/slider_image_4.jpg" alt="slider 4" />
						<section>
							<h2>稳定指数</h2>
							<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							稳定指数表示该学科你的最近学习成绩的稳定性，值越小说明该学科你最近的成绩稳定性越好</p>
						</section>
						<a href="#" class="imgSliderPrev imgSliderTextPrev"></a>
						<a href="#" class="imgSliderNext imgSliderTextNext"></a>
					</div>
					<div>
						<img src="/static/login/contents/slider_image_5.jpg" alt="slider 5" />
						<section>
							<h2>进步指数</h2>
							<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							进步指数表示该学科你的最近学习成绩的起伏，正数表示进步，负数表示退步，值越大说明该学科你最近的成绩进步越大</p>
						</section>
						<a href="#" class="imgSliderPrev imgSliderTextPrev"></a>
						<a href="#" class="imgSliderNext imgSliderTextNext"></a>
					</div>
				</div>
				
				<a class="imgSliderPrev" href="#">Prev</a>
				<a class="imgSliderNext" href="#">Next</a>
				
				<div class="imgSliderPaginationContainer clearfix" style="margin-left: -95px;">
					<div class="imgSliderPaginationContainerLeft"></div>
					<div class="imgSliderPaginationContainerCenter">
						<ul class="imgSliderPagination clearfix">
							<li class="imgSliderCurrent"><a href="#0">1</a></li>
							<li><a href="#1">2</a></li>
							<li><a href="#2">3</a></li>
							<li><a href="#3">4</a></li>
							<li><a href="#4">5</a></li>
						</ul>
					</div>	
					<div class="imgSliderPaginationContainerRight"></div>
				</div>
				
			</div>
		</div>
		<div class="sliderBottomPattern"></div>
	<div id="loginWin" class="easyui-window" title="登录" style="width:370px;height:270px;padding:2px;"
		data-options="left:'54%',top:'170px'" 
		shadow = "false" minimizable="false" maximizable="false" resizable="false" collapsible="false" closable="false"
   		>
		<div style="float:left;width:320px;padding-left:30px;">
		    <form id="LoginForm" method="post" action="#">
		        <div style="padding:1px 0;">
		            <label for="login">用户名:</label>
		            <input type="text" name="LoginForm[username]" id="username" style="width:260px;"  value="请输入学号" onfocus="this.value=''" onblur="if(this.value==''){this.value='请输入学号/邮箱/手机'}" ></input>
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
				<a class="easyui-linkbutton" iconCls="icon-help" href="javascript:forgetpwd();" >忘记密码</a>
		    </div>
		</div>
	</div>
</div>
<div id="layout_forgetpwd_dlg" style="padding:10px;width:400px;height:260px;display:none;" >  
	找回方式:
	&nbsp;&nbsp;<input type="radio" name="findtype" value="email" checked="checked" onclick="changetype('layout_forgetpwd_dlg_email','layout_forgetpwd_dlg_mobile')" />&nbsp;&nbsp;邮箱 
	&nbsp;&nbsp;<input type="radio" name="findtype" value="mobile" onclick="changetype('layout_forgetpwd_dlg_mobile','layout_forgetpwd_dlg_email')" />&nbsp;&nbsp;手机 
	<br/>
	<br/>
	用&nbsp;户&nbsp;名：
    <input class="easyui-validatebox" 
    	id="username1" 
    	name="username1"
    	required="true" 
    	type="text"
    	value=""
    />
    <br/>
    <br/>
    <div id="layout_forgetpwd_dlg_email" style="display:'';">
          邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：
    <input class="easyui-validatebox" 
		id="email" 
    	name="email"
    	required="true"
    	validtype="email"
    	missingMessage="不能为空" 
    	invalidMessage="邮箱格式不正确" 
    	type="text"
    	value=""
    />
    </div>
    <div id="layout_forgetpwd_dlg_mobile" style="display:none;">
          手&nbsp;机&nbsp;号：
    <input class="easyui-validatebox" 
		id="mobile" 
		name="mobile" 
		type="text"
		validtype="mobile"
		missingMessage="不能为空" 
    	invalidMessage="手机格式不正确" 
    	value=""
    />
    </div>    
    <span style="padding:0px 0;text-align: left;color: red;" id="showfindMsg"><?php echo $findmsg; ?></span>
</div>

