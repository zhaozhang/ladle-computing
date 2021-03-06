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
<script src="/static/Highcharts/js/highcharts-3d.js"></script>
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
		],
	lang: {
			months: ['Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin',  'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'Décembre'],
			weekdays: ['Dimanche', 'Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi'],
			downloadJPEG:'下载JPEG 图片',
	        downloadPDF:'下载PDF文档',
	        downloadPNG:'下载PNG 图片',
	        downloadSVG:'下载SVG 矢量图',
	        printChart:'打印图表'
		}	
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
	
	function changeversion(type) {
	//	alert(type);
		$.ajax({            
              type:"POST",   //post提交方式默认是get
              url: '<?php echo $this->createUrl('/common/changeversion'); ?>',
              dataType:"json",    
              data:{
            	  type : type
	       		},
              error:function(err) {      // 
            	  window.location = "/"; 
              },
              success:function(resp) {
            	  window.location = "/"; 
              }        	    
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
	<div data-options="region:'north',split:true" style="height: 90px; overflow: hidden;background-image:url(/static/images/logo.jpg);background-repeat: no-repeat;background-color:#c9e3fa" >
		<div id="sessionInfoDiv" style="position: absolute; right: 0px; top: 0px;" class="alert alert-info">
		<strong>[<?php $sessionInfo = AdminUtil::getUserSessionInfo(Yii::app()->user->id); echo $sessionInfo['name'];?>]</strong>欢迎您登录
		</div>
		<div style="position: absolute; right: 0px; bottom: 0px;">
			<?php $sessionInfo = AdminUtil::getUserSessionInfo(Yii::app()->user->id); 
			if($sessionInfo['role_id'] == 1)
				echo "<a href='javascript:changeversion(6);' ><font color='red'>免费切换至高级版(试用)</font></a>";
			else if($sessionInfo['role_id'] == 6)
				echo "<a href='javascript:changeversion(1);' ><font color='red'>切换至基础版</font></a>"?>
			<a href="javascript:void(0);" class="easyui-menubutton" data-options="menu:'#layout_north_pfMenu',iconCls:'cog'">更换皮肤</a>
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

	<div data-options="region:'south',split:true" style="height: 50px;text-align: center;overflow: hidden;">
    Copyright © 2014 ladlec.com Inc. All Rights Reserved.</br>
    	联系我们：contact@ladlec.com 苏ICP备14018938号
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
