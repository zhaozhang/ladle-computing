<!DOCTYPE HTML>
<html>
    <!--head-->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="Cache-Control" content="no-cache" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
        <meta name="MobileOptimized" content="320"/>
        <meta name="copyright" content="Copyright &copy; 2014 yipiao.com Inc. All Rights Reserved." />
        <meta name="description" content="毅瓢计算" />
        <meta name="keywords" content="关键字" />
        <title>毅瓢计算</title>
        <link rel="apple-touch-icon-precomposed" href="/images/logo-icon.png" >
        <!-- 引入jQuery -->
<script src="/static/jquery-1.8.3.js" type="text/javascript" charset="utf-8"></script>
    <?php
				$uid = Yii::app ()->user->getId ();
			//	CVarDumper::dump(Yii::app()->request->getUrl());
				
				if ((! $uid) && !(Yii::app()->request->getUrl()=="/m/login")) {
					Header ( "Location: /m/login" );
					return;
				} else {
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