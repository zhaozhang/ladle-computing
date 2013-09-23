<?php

class WelcomeController extends CommonController
{
    public function actionIndex()
    {
        $this->renderPartial('index');
    }	 

    public function actionGetnotice()
    {
   //     echo "<div style='padding:5px;'>建设中...</div>";
   		echo "<div style='padding:5px;'>[2013-9-23] 系统测试版本beta1.0发布</div>";
	}   
    public function actionGetintro()
    {
        echo "<div style='padding:5px;'>系统简要说明</div>";
	}
}
