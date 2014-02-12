<?php

class MController extends Controller
{
	public $layout = "//layouts/m";
	
	public function actionLogin()
	{
		$model=new LoginForm;
        $msg = "";

        if (!Yii::app()->user->isGuest)
        {
            $this->redirect(Yii::app()->getHomeUrl());
        }

		// if it is ajax validation request
		if(isset($_POST['ajax']) && $_POST['ajax']==='login-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}

		// collect user input data
		if(isset($_POST['LoginForm']))
		{
			$model->attributes=$_POST['LoginForm'];
			// validate user input and redirect to the previous page if valid
			if($model->validate() && $model->login())
            {
			 
                $url = isset($_GET['returnUrl'])? $_GET['returnUrl'] : "/m";
				$this->redirect($url);
            }
            else
            {
                $msg = "用户名或密码错误";        
            }
		}

		// display the login form
		$this->render('login',array('model'=>$model, 'msg' => $msg));
	}

	public function actionIndex()
	{		
		$this->render('index');
	}
	/*
	 * 获取用户可选择学年
	 */ 
    public function actionGetterm()
    {
    	$this->layout = false;
    	$result = array('success' => false, 'data' => array());
    	$uid = Yii::app()->user->getId();
    	if(!$uid){
    		$result['msg'] = '用户未登录';
    		$this->renderText(json_encode($result));
    		return;
    	}
    	$sessionInfo = AdminUtil::getUserSessionInfo($uid);
    	$schoolid = $sessionInfo['school_id'];
    	$roleid = $sessionInfo['role_id'];
    	$classid =  $sessionInfo['class_id'];

    	//查询用户入学时间       
    	$connection=Yii::app()->db;
		$sql="select min(examtime) as mintime,max(examtime) as maxtime from v_class_exam where ClassIDq = ".$classid." and State = 1";
		$rows=$connection->createCommand ($sql)->query();
		$isfirst = true;
		foreach ($rows as $k => $v ){
			$examInfo = array_change_key_case($v, CASE_LOWER);
			$mintime=strtotime($examInfo["mintime"]);
			$month=date("m",$mintime);
			$year=date("Y",$mintime);
			$maxtime=strtotime($examInfo["maxtime"]);
			$month_now=date("m",$maxtime);
			$year_now=date("Y",$maxtime);
			if($month_now > 8)
				$year_now = $year_now + 1;
			if($month < 9)
				$year = $year - 1;
			while($year < $year_now)
			{			
				$examjson = array(
	            	'id' => ($year_now-1)."-".$year_now,
		            'text'=> ($year_now-1)."-".$year_now, 
		            'selected'=>$isfirst
				);
				$isfirst = false;
				$year_now = $year_now - 1;
				
				$result['data'][] = $examjson;
			}
		/*	
			// 获取考试下的科目
			$connection=Yii::app()->db; 
			$sql="select * from v_exam_subject where ExamID = ".$examInfo["examid"]." and State = 1 order by subjectID";
			$rows=$connection->createCommand ($sql)->query();
			foreach ($rows as $k => $v ){
				$subjectInfo = array_change_key_case($v, CASE_LOWER);
				$examjson['subject'][] = array(
                	'id' => $subjectInfo["subjectid"],
		            'text'=> $subjectInfo["subjectname"], 
		            'selected'=>false,
                );
			}
						
			*/
		}
		$result['success'] = true;
        $this->renderText(json_encode($result));
	}   	
	public function actionGetclass()
    {
    	$this->layout = false;
    	$result = array('success' => false, 'data' => array());
    	$uid = Yii::app()->user->getId();
    	if(!$uid){
    		$result['msg'] = '用户未登录';
    		$this->renderText(json_encode($result));
    		return;
    	}
    	$sessionInfo = AdminUtil::getUserSessionInfo($uid);
    	$schoolid = $sessionInfo['school_id'];
    	$roleid = $sessionInfo['role_id'];
    	$gradeid = $sessionInfo['grade_id'];
    	$gradeidt = $sessionInfo['t_grade_id'];
		$selected = false;
    	
       	$gradeList = InfoGrade::model()->findAllByAttributes(array('GradeID' => $gradeidt, 'State' => 1));
        	
        foreach ($gradeList as $gradeRecord)
        {
            $gradeInfo = array_change_key_case((array)$gradeRecord->getAttributes(), CASE_LOWER);
            
            $gradejson = array(
            	'id' => 'g-'.$gradeInfo["gradeid"],
	            'text'=> $gradeInfo["gradename"], 
	            'selected'=>false,
	            'iconCls'=>"");

            $result['data'][] = $gradejson;
        }
		$result['success'] = true;
        $this->renderText(json_encode($result));
    }   
	/*
	 * 获取用户可选择考试
	 */ 
    public function actionGetexam()
    {
    	$this->layout = false;
    	$result = array('success' => false, 'data' => array());
    	$uid = Yii::app()->user->getId();
    	if(!$uid){
    		$result['msg'] = '用户未登录';
    		$this->renderText(json_encode($result));
    		return;
    	}
    	$sessionInfo = AdminUtil::getUserSessionInfo($uid);
    	$schoolid = $sessionInfo['school_id'];
    	$roleid = $sessionInfo['role_id'];
    	$subjectid = $sessionInfo['subject_id'];
    	$classid =  $sessionInfo['class_id'];
    	
    	$term 	= isset($_POST['Term'])?$_POST['Term']:'0';
		$termarr = explode('-', $term);
    	$connection=Yii::app()->db; 
		$sql="select distinct examID,ExamName from v_class_exam where ClassIDq = ".$classid." and examtime > '".$termarr[0]."-9-1"."' and examtime < '".$termarr[1]."-8-1"."' and State = 1 order by ExamTime desc";
		$rows=$connection->createCommand ($sql)->query();
		$isfirst = true;
		foreach ($rows as $k => $v ){
			$examInfo = array_change_key_case($v, CASE_LOWER);
			$examjson = array(
            	'id' => $examInfo["examid"],
	            'text'=> $examInfo["examname"], 
	            'selected'=>$isfirst
	            );
			$isfirst = false;
								
			$result['data'][] = $examjson;
		}
		$result['success'] = true;
        $this->renderText(json_encode($result));
    }   	    
	/*
	 * 查询分数
	 */ 
    public function actionGetscore()
    {
    	$this->layout = false;
    	$result = array('success' => false, 'data' => array());
    	$uid = Yii::app()->user->getId();
    	if(!$uid){
    		$result['msg'] = '用户未登录';
    		$this->renderText(json_encode($result));
    		return;
    	}
    	
    	$examid 	= isset($_POST['examid'])?$_POST['examid']:'';   	
    	$connection=Yii::app()->db;
    	$sql="SELECT SeqID,Score,SubjectName,ClassRank,GradeRank FROM hsoa.info_exam_score sc inner join hsoa.info_subject su on sc.SubjectId=su.SubjectId where examid = ".$examid." and uid = ".$uid;
    	$rows=$connection->createCommand ($sql)->query();

    	foreach ($rows as $k => $v ){
    		$examInfo = array_change_key_case($v, CASE_LOWER);
    		$examjson = array(
    				'id'=>$examInfo["seqid"],
    				'score' => $examInfo["score"],
    				'subjectname'=> $examInfo["subjectname"],
    				'classrank'=>$examInfo["classrank"],
    				'graderank'=>$examInfo["graderank"]				
    		);
    	
    		$result['data'][] = $examjson;
    	}
          
		$result['success'] = true;
        $this->renderText(json_encode($result));
	}	
	
	// -----------------------------------------------------------
	// Uncomment the following methods and override them if needed
	/*
	public function filters()
	{
		// return the filter configuration for this controller, e.g.:
		return array(
			'inlineFilterName',
			array(
				'class'=>'path.to.FilterClass',
				'propertyName'=>'propertyValue',
			),
		);
	}

	public function actions()
	{
		// return external action classes, e.g.:
		return array(
			'action1'=>'path.to.ActionClass',
			'action2'=>array(
				'class'=>'path.to.AnotherActionClass',
				'propertyName'=>'propertyValue',
			),
		);
	}
	*/
}