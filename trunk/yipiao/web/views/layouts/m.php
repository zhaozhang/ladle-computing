<!DOCTYPE HTML>
<html>
    <!--head-->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="Cache-Control" content="no-cache" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
        <meta name="MobileOptimized" content="320"/>
        <meta name="copyright" content="Copyright &copy; 2014 ladlec.com Inc. All Rights Reserved." />
        <meta name="description" content="成绩查询分析系统" />
        <meta name="keywords" content="关键字" />
        <title>攀枝花市三中成绩查询分析系统</title>
	<!--	<link rel="stylesheet" href="/static/mobile/ladlec-blue-theme.min.css" />
		<link rel="stylesheet" href="/static/mobile/jquery.mobile.icons.min.css" />
		<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.0/jquery.mobile.structure-1.4.0.min.css" /> 
		        -->
        <link rel="stylesheet"  href="/static/mobile/jquery.mobile-1.4.0.min.css"> 
        <!-- 引入jQuery -->
		<script src="/static/mobile/jquery.js" type="text/javascript" charset="utf-8"></script>
		<script src="/static/mobile/jquery.mobile-1.4.0.min.js"></script> 
    	<?php
			$uid = Yii::app ()->user->getId ();
		
			if ((! $uid) && !(Yii::app()->request->getUrl()=="/m/login")) {
				Header ( "Location: /m/login" );
				return;
			} else  {
				$userInfo = AdminUtil::loadUserSessionInfo ( $uid ); 
				foreach ( $userInfo as $key => $value ) {
					Yii::app ()->session [$key] = $value;
				}
			}
			/*
			 * 测试用 Yii::app()->clientScript->registerCoreScript('jquery'); Yii::app()->user->id = 1; $userInfo = AdminUtil::loadUserSessionInfo(Yii::app()->user->id); foreach ($userInfo as $key => $value) { Yii::app()->session[$key] = $value; }
			 */
		?>
</head>
<body >
<?php echo $content; ?>	

</body>
</html>