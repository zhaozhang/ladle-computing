<?php
$useragent=$_SERVER['HTTP_USER_AGENT'];
if(preg_match('/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino/i',$useragent)||preg_match('/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i',substr($useragent,0,4)))
	header('Location: /m');
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>成绩查询分析系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="language" content="en" />

<!-- screen.css/print.css与jquery-easyui的css冲突, 导致datagrid列头无法显示, 故去掉 -->
<link rel="stylesheet" type="text/css" href="/static/css/main.css" />
<link rel="stylesheet" type="text/css" href="/static/css/form.css" />
<?php 
$uid = Yii::app()->user->getId();
if(!$uid){
   Header("Location: /site/login");
	return ;
}
else
{
	$userInfo = AdminUtil::loadUserSessionInfo($uid);
    foreach ($userInfo as $key => $value)
    {
		Yii::app()->session[$key] = $value;
    } 
}
/* 测试用
Yii::app()->clientScript->registerCoreScript('jquery'); 
Yii::app()->user->id = 1;
$userInfo = AdminUtil::loadUserSessionInfo(Yii::app()->user->id);
foreach ($userInfo as $key => $value)
{
	Yii::app()->session[$key] = $value;
} */
?>
<!-- 引入jQuery -->
<script src="/static/jquery-1.8.3.js" type="text/javascript" charset="utf-8"></script>

<script src="/static/Highcharts/js/highcharts.js" type="text/javascript" charset="utf-8"></script>
<script src="/static/Highcharts/js/highcharts-more.js"></script>
<script src="/static/Highcharts/js/modules/exporting.js"></script>

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

<script>
var yproleid = '<?php echo Yii::app()->session['role_id'] ?>' ;
var ypuid = '<?php echo Yii::app()->user->getId() ?>';
var ypschoolid = '<?php echo Yii::app()->session['school_id'] ?>' ;

Highcharts.setOptions({     
	colors: ['#058DC7', '#50B432', '#ED561B', '#DDDF00', '#24CBE5', 
			'#64E572', '#FF9655', '#FF34B3', '#6AF9C4','#4572A7', 
		    '#AA4643','#89A54E', '#80699B', '#3D96AE', '#DB843D', 
		    '#92A8CD', '#A47D7C', '#B5CA92','#808080','#B452CD',
		    '#CD2990','#68228B'	,'#8B2500','#FF1493','#EEE0E5'
		] 
});
</script>

<script type="text/javascript" charset="utf-8">/*north.js*/
	/*
	 * 
	 * @requires jQuery,EasyUI,jQuery cookie plugin
	 * 
	 * 更换EasyUI主题的方法
	 * 
	 * @param themeName
	 *            主题名称
	 */
	function changeThemeFun(themeName) {
		if ($.cookie('easyuiThemeName')) {
			$('#layout_north_pfMenu').menu('setIcon', {
				target : $('#layout_north_pfMenu div[title=' + $.cookie('easyuiThemeName') + ']')[0],
				iconCls : 'emptyIcon'
			});
		}
		$('#layout_north_pfMenu').menu('setIcon', {
			target : $('#layout_north_pfMenu div[title=' + themeName + ']')[0],
			iconCls : 'tick'
		});

		var $easyuiTheme = $('#easyuiTheme');
		var url = $easyuiTheme.attr('href');
		var href = url.substring(0, url.indexOf('themes')) + 'themes/' + themeName + '/easyui.css';
		$easyuiTheme.attr('href', href);

		var $iframe = $('iframe');
		if ($iframe.length > 0) {
			for ( var i = 0; i < $iframe.length; i++) {
				var ifr = $iframe[i];
				try {
					$(ifr).contents().find('#easyuiTheme').attr('href', href);
				} catch (e) {
					try {
						ifr.contentWindow.document.getElementById('easyuiTheme').href = href;
					} catch (e) {
					}
				}
			}
		}
		$.cookie('easyuiThemeName', themeName, {
			expires : 365
		});
	};

	function logOut(b) {
		$.ajax({            
              type:"POST",   //post提交方式默认是get
              url: '<?php echo $this->createUrl('/site/logout'); ?>',
              dataType:"json",    
              error:function(err) {      // 
            	  window.location = "/"; 
              },
              success:function(resp) {
            	  window.location = "/"; 
              }        	    
          });
	/*	$.getJSON('${pageContext.request.contextPath}/userController/logout', {
			t : new Date()
		}, function(result) {
			if (b) {
				location.replace('${pageContext.request.contextPath}/');
			} else {
				$('#sessionInfoDiv').html('');
				$('#loginDialog').dialog('open');
			}
		});*/
	};
	function editUserPwd() {
		$('#layout_editpwd_dlg').dialog({  
			title : '修改密码',
			onClose:function(){
				top.document.getElementsByName("oldpassword")[0].value="";
				top.document.getElementsByName("password")[0].value="";
				top.document.getElementsByName("repassword")[0].value="";
			},
	       	buttons:[{  
	           	text:'保存',  
	           	iconCls:'icon-save',  
	           	handler:function(){  
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
		       		    url: '<?php echo $this->createUrl('/common/edituserpwd'); ?>',
		       		    dataType:"json",    
		       		    data:{
			       		    uid:ypuid,
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
		       		    		top.document.getElementsByName("oldpassword")[0].value="";
		       					top.document.getElementsByName("password")[0].value="";
		       					top.document.getElementsByName("repassword")[0].value="";
		       		        }else
		       		        	fun_showMsg('提示','修改密码失败('+resp.msg+')');
		       		    }            
		       		});
	           	}  
	       	},{  
	           text:'取消',  
	           handler:function(){
	               $('#layout_editpwd_dlg').dialog('close');  
	           }   
	       	}]  
	   	}); 
	};
	function editUserInfo() {
		$.ajax({            
   		    type:"POST",   //post提交方式默认是get
   		    url: '<?php echo $this->createUrl('/common/getuserinfo'); ?>',
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
   		    		top.document.getElementsByName("email")[0].value=resp.data.email;
   					top.document.getElementsByName("telephone")[0].value= resp.data.phone;
   		        }else
   		        	fun_showMsg('提示','获取用户信息失败('+resp.msg+')');
		        	
   		    	$('#layout_editinfo_dlg').dialog({  
   					title : '修改资料',
   			       	buttons:[{  
   			           	text:'保存',  
   			           	iconCls:'icon-save',  
   			           	handler:function(){  
   			       			$.ajax({            
   				       		    type:"POST",   //post提交方式默认是get
   				       		    url: '<?php echo $this->createUrl('/common/edituserinfo'); ?>',
   				       		    dataType:"json",    
   				       		    data:{
   				       		  		uid:ypuid,
   				       		  		email:$('#email').val(),
   				       				phone:$('#telephone').val()
   					       		},
   				       		    error:function(err) {      // 
   				       				fun_showMsg('提示','修改信息失败('+JSON.stringify(err)+')');
   				       		    },
   				       		    success:function(resp) {
   				       		    	if(resp.success)
   				       		        {
   				       		    		fun_showMsg('提示',resp.msg);
   				       		        }else
   				       		        	fun_showMsg('提示','修改信息失败('+resp.msg+')');
   				       		    }            
   				       		});
   			           	}  
   			       	},{  
   			           text:'取消',  
   			           handler:function(){
   			               $('#layout_editinfo_dlg').dialog('close');  
   			           }   
   			       	}]  
   			   	}); 
   		    }            
   		});

	}
</script>
<script type="text/javascript">/*west.js*/
$(function() {
    //菜单树处理
    $('#layout_west_menu_tree').tree({
     //   lines: true,
        onSelect: function(node) {
            if (node.attributes.isleaf == 0) {
                $(this).tree('unSelect', node.target);
            } else {
                $('#layout_center_index').panel('setTitle', node.text);

                $('#layout_center_index').panel('refresh', node.attributes.href);
            }
        },
    	onLoadSuccess:function(node, data){
        	$('#layout_center_index').panel('setTitle', data[0].text);
            $('#layout_center_index').panel('refresh', data[0].attributes.href);
        }
    });
    
    $.ajax({            
        type:"POST",   //post提交方式默认是get
        url: '<?php echo $this->createUrl('/common/layoutgetmenu'); ?>',
        dataType:"json",
        data:{
  	  		uid:ypuid,
  	  		roleid: yproleid
      	},
       // async:false,     
        error:function(err) {      // 
    		fun_showMsg('提示','菜单数据请求失败('+JSON.stringify(err)+')');
        },
        success:function(resp) {
            if(resp.success)
            {
    	    	$('#layout_west_menu_tree').tree('loadData',resp.data);
            }else
            	fun_showMsg('提示','获取菜单数据错误('+resp.msg+')');
        }            
    });
});
</script>
</head>
<body>
<div class="easyui-layout" fit="true" style="width:100%;" id="easyui-layout">
	<div id="layout_editpwd_dlg" style="padding:10px;width:360px;height:220px;" >  
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
	</div>
	<div id="layout_editinfo_dlg" style="padding:10px;width:360px;height:180px;" >  
		Email：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    <input class="easyui-validatebox" 
	    	id="email" 
	    	name="email"
	    	/>
	    <br/>
	    <br/>
		联系电话：
		<input id="telephone" 
			name="telephone" 
			class="easyui-validatebox" 
			/>
		<br/>
	</div>
	<div data-options="region:'north',split:true" style="height: 90px; overflow: hidden;background-image:url(/static/images/logo.jpg);background-repeat: no-repeat;background-color:#c9e3fa" >
		<div id="sessionInfoDiv" style="position: absolute; right: 0px; top: 0px;" class="alert alert-info">
		<strong>[<?php $sessionInfo = AdminUtil::getUserSessionInfo(Yii::app()->user->id); echo $sessionInfo['name'];?>]</strong>欢迎您登录
		</div>
		<div style="position: absolute; right: 0px; bottom: 0px;">
			<a href="javascript:void(0);" class="easyui-menubutton" data-options="menu:'#layout_north_pfMenu',iconCls:'cog'">更换皮肤</a> <a href="javascript:void(0);" class="easyui-menubutton" data-options="menu:'#layout_north_kzmbMenu',iconCls:'cog'">控制面板</a> 
		</div>
		<div id="layout_north_pfMenu" style="width: 120px; display: none;">
			<div onclick="changeThemeFun('default');" title="default">default</div>
			<div onclick="changeThemeFun('gray');" title="gray">gray</div>
			<div onclick="changeThemeFun('metro');" title="metro">metro</div>
			<div onclick="changeThemeFun('bootstrap');" title="bootstrap">bootstrap</div>
			<div onclick="changeThemeFun('black');" title="black">black</div>
			<!--
			<div class="menu-sep"></div>
			<div onclick="changeThemeFun('cupertino');" title="cupertino">cupertino</div>
			<div onclick="changeThemeFun('dark-hive');" title="dark-hive">dark-hive</div>
			<div onclick="changeThemeFun('pepper-grinder');" title="pepper-grinder">pepper-grinder</div>
			<div onclick="changeThemeFun('sunny');" title="sunny">sunny</div>
			-->
			<div class="menu-sep"></div>
			<div onclick="changeThemeFun('metro-blue');" title="metro-blue">metro-blue</div>
			<div onclick="changeThemeFun('metro-gray');" title="metro-gray">metro-gray</div>
			<div onclick="changeThemeFun('metro-green');" title="metro-green">metro-green</div>
			<div onclick="changeThemeFun('metro-orange');" title="metro-orange">metro-orange</div>
			<div onclick="changeThemeFun('metro-red');" title="metro-red">metro-red</div>
		</div>
		<div id="layout_north_kzmbMenu" style="width: 100px; display: none;">
			<div onclick="editUserPwd();">修改密码</div>
			<div class="menu-sep"></div>
			<div onclick="editUserInfo();">修改资料</div>
			<div class="menu-sep"></div>
			<div onclick="logOut(true);">退出系统</div>
		</div>
	</div>
	<div data-options="region:'west',split:true" title="导航菜单"  style="width:150px;height:100%;">
	<ul id="layout_west_menu_tree"></ul>
	</div>
	<!--<div region="west" split="true" title="导航菜单" style="width:200px;height:100%;">
	        <ul class="easyui-tree">
	        	<li>
	            	<span>个人中心</span>
	            	<ul>
	            		<li><span><a href="<?php echo $this->createUrl('/admin/user/modifyPassword');?>">修改密码</a></span></li>
	            		<li><span><a href="<?php echo $this->createUrl('/admin/user/modifyProfile');?>">修改个人资料</a></span></li>
	            		<li><span><a href="<?php echo $this->createUrl('/admin/user/view');?>">查看个人信息</a></span></li>
	            	</ul>
	            </li>
	        	<li>
	            	<span>系统管理</span>
	            	<ul>
	            		<li><span><a href="<?php echo $this->createUrl('/school/school/index');?>">学校管理</a></span></li>
	            		<li><span><a href="<?php echo $this->createUrl('/school/grade/index');?>">年级管理</a></span></li>
	            		<li><span><a href="<?php echo $this->createUrl('/school/class/index');?>">班级管理</a></span></li>
	            		<li><span><a href="<?php echo $this->createUrl('/school/subject/index');?>">科目管理</a></span></li>
	            		<li><span><a href="<?php echo $this->createUrl('/school/teacher/index');?>">老师管理</a></span></li>
	            		<li><span><a href="<?php echo $this->createUrl('/school/student/index');?>">学生管理</a></span></li>
	            	</ul>
	            </li>
	        	<li>
	            	<span>考试成绩</span>
	            	<ul>
	            		<li><span><a href="<?php echo $this->createUrl('/score/exam/index');?>">考试管理</a></span></li>
	            	</ul>
	            </li>
	       </ul>
    </div>
    -->
    <div id="layout_center_index" region="center" title="欢迎" style="padding:2px;">
    	
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
