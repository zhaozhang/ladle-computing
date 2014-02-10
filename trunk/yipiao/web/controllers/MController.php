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
	            'iconCls'=>"",
	            'children' => array());

            // 获取年级下的班级
            $classList = InfoClass::model()->findAllByAttributes(array('GradeID' => $gradeRecord->GradeID, 'State' => 1));
            foreach ($classList as $classRecord)
            {
                $iconCls = "";
                $classInfo = array_change_key_case((array)$classRecord->getAttributes(), CASE_LOWER);
                if( $classInfo["type"] == 1)
                	$iconCls = "icon-tip";
                else if($classInfo["type"] == 2)
                	$iconCls = "icon-sum";
                $gradejson['children'][] = array(
                	'id' => $classInfo["classid"],
		            'text'=> $classInfo["classname"], 
		            'selected'=>false,
		            'iconCls'=>$iconCls
                );
            }
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
    	
    	$classlid	= isset($_POST['ClassID'])?$_POST['ClassID']:0;

    	$connection=Yii::app()->db; 
		$sql="select * from v_class_exam where ClassIDq = ".$classlid." and State = 1 order by ExamTime desc";
		$rows=$connection->createCommand ($sql)->query();
		$isfirst = true;
		foreach ($rows as $k => $v ){
			$examInfo = array_change_key_case($v, CASE_LOWER);
			$examjson = array(
            	'id' => $examInfo["examid"],
	            'text'=> $examInfo["examname"], 
	            'selected'=>$isfirst,
	            'subject' => array());
			$isfirst = false;
			
			// 获取考试下的科目
			$connection=Yii::app()->db; 
			$sql="select * from v_exam_subject where ExamID = ".$examInfo["examid"]." and refersubjectid = '' and State = 1 order by subjectID";
			$rows=$connection->createCommand ($sql)->query();
			foreach ($rows as $k => $v ){
				$subjectInfo = array_change_key_case($v, CASE_LOWER);
				
				if($subjectid == $subjectInfo["subjectid"])
					$examjson['subject'][] = array(
	                	'id' => $subjectInfo["subjectid"],
			            'text'=> $subjectInfo["subjectname"], 
			            'selected'=>true,
	                );
				else if($roleid > 2)
					$examjson['subject'][] = array(
	                	'id' => $subjectInfo["subjectid"],
			            'text'=> $subjectInfo["subjectname"], 
			            'selected'=>false,
	                );
			}
						
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
    	
    	$classid 	= isset($_POST['classid'])?$_POST['classid']:'';
     	$examid 	= isset($_POST['examid'])?$_POST['examid']:'';   	
    	$subjectids	= isset($_POST['subjectids'])?$_POST['subjectids']:'';
    	$name		= isset($_POST['name'])?$_POST['name']:'';
    
		if('' == $name)
		{
        	$recordList = InfoStudent::model()->findAll("ClassID = :ClassID and State = 1",
        		array('ClassID'=>$classid));
		}else
		{ 
         	$recordList = InfoStudent::model()->findAll("ClassID = :ClassID and Name like '%".$name."%' and State = 1",
        		array('ClassID'=>$classid));       		
		}
        foreach ($recordList as $record)
        {
        	$studentInfo = array_change_key_case((array)$record->getAttributes(), CASE_LOWER);
            $scorejson = array(
            	'name' => $studentInfo["name"],
	            'studyno' => $studentInfo["studyno"],
            	'uid' => $studentInfo["uid"],
            	'classid' => $studentInfo["classid"],
            	'gradeid' => $studentInfo["gradeid"],
            	'examid' => $examid,
            	'seqid' => strval($studentInfo["uid"])."-".strval($examid)
	        );
            $subjectarr = explode(",",$subjectids);  
            foreach ($subjectarr as $subjectid)
            {
            	$scorejson["s".strval($subjectid)] = "";
            	$recordScoreList = InfoExamScore::model()->findAll("examid = :ExamID and subjectid = ".$subjectid." and uid = ".$studentInfo["uid"],
        			array('ExamID'=>$examid));
        		foreach ($recordScoreList as $recordScore)
        		{		
        			$scoreInfo = array_change_key_case((array)$recordScore->getAttributes(), CASE_LOWER);
        			$scorejson["s".strval($subjectid)] = $scoreInfo["score"];
        		}
            }
            
            $result['data'][] = array_change_key_case($scorejson, CASE_LOWER);
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