<?php

class DefaultController extends Controller
{
	public function actionIndex()
	{
		$this->render('index');
	}
	/*
	 * 获取用户可编辑年级
	 */ 
    public function actionGetEditGrade($uid='',$roleid='',$schooleid){
		 $s = 
        '[
			  {
			    "gradeid": "1",
			    "gradename": "高2014级"
			  },
			  {
			    "gradeid": "2",
			    "gradename": "高2015级"
			  },
			  {
			    "gradeid": "3",
			    "gradename": "高2016级"
			  }
		]';
        echo $s;
	}	
}