<?php

class AnaGradeController extends CommonController
{
    public function actionIndex()
    {
        $this->renderPartial('index');
    }	 
	/*
	 * 获取用户可选择班级
	 */ 
    public function actionGetgrade()
    {
    	$this->layout = false;
    	$result = array('success' => false, 'data' => array());
    	$u_id = Yii::app()->user->getId();
    	if(!$u_id){
    		$result['msg'] = '用户未登录';
    		$this->renderText(json_encode($result));
    		return;
    	}
    	$sessionInfo = AdminUtil::getUserSessionInfo($u_id);
    	$schoolid = $sessionInfo['school_id'];
    	$roleid = $sessionInfo['role_id'];
    	$classid =  $sessionInfo['class_id'];
		$gradeid = 0;
        // 获取所有年级
        if($roleid == 1 || $roleid == 6)
        {
        	$gradeid = $sessionInfo['grade_id'];
        	$gradeList = InfoGrade::model()->findAllByAttributes(array('GradeID' => $gradeid, 'State' => 1));
        }else
        { 
        	$gradeid = $sessionInfo['t_grade_id'];
        	$gradeList = InfoGrade::model()->findAllByAttributes(array('SchoolID' => $schoolid, 'State' => 1));
        }
        foreach ($gradeList as $gradeRecord)
        {
            $gradeInfo = array_change_key_case((array)$gradeRecord->getAttributes(), CASE_LOWER);
            $selected = false;
            if($gradeid == $gradeInfo["gradeid"])
            	$selected = true;
            $gradejson = array(
            	'id' => $gradeInfo["gradeid"],
	            'text'=> $gradeInfo["gradename"], 
	            'selected'=>$selected);

            $result['data'][] = $gradejson;
        }
		$result['success'] = true;
        $this->renderText(json_encode($result));
       	/*
    	//iconCls 根据文理科配置成不一样的
    	$s = '{
			  "success": true,
			  "msg": "",
			  "data": [
			    {
			      "id": "1",
			      "text": "高2014级",
			      "selected": false
			    },
			    {
			      "id": "2",
			      "text": "高2015级",
			      "selected": true
			    }
			  ]
			}';

        echo $s;*/
	}   
	/*
	 * 获取用户可选择考试，按时间倒序
	 */ 
    public function actionGetexam()
    {
    	$this->layout = false;
    	$result = array('success' => false, 'data' => array());
    	$u_id = Yii::app()->user->getId();
    	if(!$u_id){
    		$result['msg'] = '用户未登录';
    		$this->renderText(json_encode($result));
    		return;
    	}
    	$sessionInfo = AdminUtil::getUserSessionInfo($u_id);
    	$school_id =  $sessionInfo['school_id'];
    	$subject_id = $sessionInfo['subject_id'];
    	$role_id = $sessionInfo['role_id'];
    	$class_id =  $sessionInfo['class_id'];
    	
    	$gradeid 	= isset($_POST['GradeID'])?$_POST['GradeID']:'';

        if (!isset($_POST['GradeID']))
        {
            $result['success'] = false;
            $result['msg'] = '参数错误';
            $this->renderText(json_encode($result));
            return;
        }
    	//查询用户入学时间       
    	$connection=Yii::app()->db;
		$sql="select min(examtime) as mintime,max(examtime) as maxtime from v_class_exam where GradeID = ".$gradeid." and State = 1";
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
		            'selected'=>false,
		            'iconCls'=>"",
		            'children' => array()
				);
				if(1 == $role_id || $role_id == 6)
		    	{
		    		$subject_id = 1;
		    		$sql="select * from v_class_exam where classidq = ".$class_id." and examtime >= '".($year_now-1)."-8-1"."' and examtime < '".$year_now."-8-1"."' and State = 1 order by ExamTime desc";
		    	}else 
					$sql="select * from info_exam where gradeid = ".$gradeid." and examtime >= '".($year_now-1)."-8-1"."' and examtime < '".$year_now."-8-1"."' and State = 1 order by ExamTime desc";
		
				$rows=$connection->createCommand ($sql)->query();
				$isfirst = true;
				$i = 0;
				foreach ($rows as $k => $v ){
					$examInfo = array_change_key_case($v, CASE_LOWER);
					$examjson['children'][] = array(
		            	'id' => $examInfo["examid"],
			            'text'=> $examInfo["examname"], 
			            'selected'=>$isfirst,
			            'subject' => array());
					$isfirst = false;
					
					// 获取考试下的科目
					$connection=Yii::app()->db; 
					$sql="select * from v_exam_subject where ExamID = ".$examInfo["examid"]." and State = 1 order by subjectID";
					$rows=$connection->createCommand ($sql)->query();
					foreach ($rows as $k => $v ){
						$subjectInfo = array_change_key_case($v, CASE_LOWER);
					//	$selected = false;
			    	//	if( $subjectInfo["subjectid"]== $subject_id)
			    		$selected = true;
						$examjson['children'][$i]['subject'][] = array(
		                	'id' => $subjectInfo["subjectid"],
				            'text'=> $subjectInfo["subjectname"], 
				            'selected'=>$selected,
		                );
					}
					$i++;
				}
				$isfirst = false;
				$year_now = $year_now - 1;
				
				$result['data'][] = $examjson;
			}
		}
        
    	
		$result['success'] = true;
        $this->renderText(json_encode($result));
        /*
    	$s = '{
			  "success": true,
			  "msg": "",
			  "data": [
			    {
			      "id": "1",
			      "text": "考试1",
			      "selected": true,
			      "subject": [
			        {
			          "id": "1",
			          "text": "语文",
			          "selected": true
			        },
			        {
			          "id": "2",		          
			          "text": "数学",
			          "selected": true
			        }
			      ]
			    },
			    {
			      "id": "2",
			      "text": "考试2",
			      "selected": false,
			      "subject": [
			         {
			          "id": "1",
			          "text": "语文",
			          "selected": true
			        },
			        {
			          "id": "3",		          
			          "text": "英语",
			          "selected": true
			        }
			      ]
			    }
			  ]
			}';

        echo $s;*/
	}       
	/*
	 * 查询成绩
	 */ 
    public function actionGetscore()
    {
    	$this->layout = false;
    	$result = array('success' => false, 'data' => array('other'=>array() ,'me'=>array(),'ms'=>0));
    	$u_id = Yii::app()->user->getId();
    	if(!$u_id){
    		$result['msg'] = '用户未登录';
    		$this->renderText(json_encode($result));
    		return;
    	}
    	$sessionInfo = AdminUtil::getUserSessionInfo($u_id);
    	$school_id = $sessionInfo['school_id'];
    	$role_id = $sessionInfo['role_id'];
    	$class_id = $sessionInfo['class_id'];
    	
    //	if($role_id == 1)
    //		$classid = $class_id;
    //	else
    	$gradeid = isset($_POST['GradeID'])?$_POST['GradeID']:'';	
    	$subjectid = isset($_POST['SubjectID'])?$_POST['SubjectID']:'';		
    	$examid = isset($_POST['ExamID'])?$_POST['ExamID']:'';
    	
    	$this->layout = false;
        $result = array('success' => true, 'msg' => '');
        
        //查询统计
    	$connection=Yii::app()->db; 
		$sql="SELECT ecs.*,c.ClassName,c.ClassLevel,t.`Name`,s.subjectname
			 FROM info_exam_class_yscore ecs 
			 LEFT JOIN info_teacher t ON ecs.UID = t.UID 
			 JOIN info_class c ON ecs.ClassID = c.ClassID
			 JOIN info_subject s ON ecs.subjectid = s.subjectid
				where  ecs.examid = ".$examid." and ecs.subjectid = ".$subjectid." 
					order by c.ClassID";
		$rows=$connection->createCommand ($sql)->query();
		$i = 0;
		foreach ($rows as $k => $v ){
			$examInfo = array_change_key_case($v, CASE_LOWER);
			$examjson["cid"] = intval($examInfo["classid"]);
			$examjson["sname"] = $examInfo["subjectname"];
			$examjson["cname"] = $examInfo["classname"];
			$examjson["clevel"] = $examInfo["classlevel"];
			$examjson["tname"] = $examInfo["name"];
			$examjson["avgcyscore"] = floatval($examInfo["avgcyscore"]);
			$examjson["avgcyscore-r"] = intval($examInfo["avgcyscorerank"]);
			$examjson["maxcyscore"] = floatval($examInfo["maxcyscore"]);
			$examjson["maxcyscore-r"] = intval($examInfo["maxcyscorerank"]);
			$examjson["mincyscore"] = floatval($examInfo["mincyscore"]);
			$examjson["mincyscore-r"] = intval($examInfo["mincyscorerank"]);
			$examjson["avgsta"] = floatval($examInfo["avgsta"]);
			$examjson["avgsta-r"] = intval($examInfo["avgstarank"]);
			$examjson["maxsta"] = floatval($examInfo["maxsta"]);
			$examjson["maxsta-r"] = intval($examInfo["maxstarank"]);
			$examjson["minsta"] = floatval($examInfo["minsta"]);
			$examjson["minsta-r"] = intval($examInfo["minstarank"]);
			$examjson["avgimp"] = floatval($examInfo["avgimp"]);
			$examjson["avgimp-r"] = intval($examInfo["avgimprank"]);
			$examjson["maximp"] = floatval($examInfo["maximp"]);
			$examjson["maximp-r"] = intval($examInfo["maximprank"]);
			$examjson["minimp"] = floatval($examInfo["minimp"]);
			$examjson["minimp-r"] = intval($examInfo["minimprank"]);
			
			if($class_id == intval($examInfo["classid"]))
				$examjson["visiable"] = true;
			else 
				$examjson["visiable"] = false;
			//成绩初始化
			$connection=Yii::app()->db; 
			$sql="select *  from info_exam_yscore where ExamID = ".$examid." and SubjectID = ".$subjectid." and ClassID = ".$examInfo["classid"]." and YScore IS NOT NULL";
			$rowslist=$connection->createCommand ($sql)->query();
			$examjson['listdata'] =  array();
			foreach ($rowslist as $klist => $vlist ){
				$subjectInfo = array_change_key_case($vlist, CASE_LOWER);
				$examjson['listdata'][] = array(floatval($subjectInfo["cyscore"]),floatval($subjectInfo["improve"]),floatval($subjectInfo["stability"]));	
			}
            $result['data'][] = $examjson; 
			//查询明细
		}  
        
  /*  	$connection=Yii::app()->db; 
		$sql="select *  from info_exam_yscore where ExamID = ".$examid." and SubjectID = ".$subjectid." and ClassID = ".$classid." and YScore IS NOT NULL";
		$rows=$connection->createCommand ($sql)->query();

		foreach ($rows as $k => $v ){
			$subjectInfo = array_change_key_case($v, CASE_LOWER);
			$result['data']['ms'] = floatval($subjectInfo["stability"])>$result['data']['ms']?floatval($subjectInfo["stability"]):$result['data']['ms'];
			if($u_id == $subjectInfo["uid"])
			{
				$result['data']['me'][] = array(floatval($subjectInfo["cyscore"]),floatval($subjectInfo["improve"]),floatval($subjectInfo["stability"]));	
			}else
			{
				$result['data']['class'][] = array(floatval($subjectInfo["cyscore"]),floatval($subjectInfo["improve"]),floatval($subjectInfo["stability"]));	
			}
		} */
		$result['success'] = true;
        $this->renderText(json_encode($result));
	}	
}
