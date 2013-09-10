<?php

class WelcomeController extends CommonController
{
    public function actionIndex()
    {
        $this->renderPartial('index');
    }	 
	/*
	 * 获取用户可选择班级
	 */ 
    public function actionGetnotice()
    {
        echo "<div style='padding:5px;'>建设中...
        
        </div>";
	}   
    public function actionGetnews()
    {
        echo "<div style='padding:5px;'>建设中...</div>";
	}
}
