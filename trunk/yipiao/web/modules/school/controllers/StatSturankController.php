<?php

class StatSturankController extends CommonController
{
    public function actionIndex()
    {
        $this->renderPartial('index');
    }	 
	/*
	 * 获取用户可选择班级
	 */ 
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
            $gradejson = array(
            	'id' => 'g-'.$gradeInfo["gradeid"],
	            'text'=> $gradeInfo["gradename"], 
	            'selected'=>false,
	            'iconCls'=>"",
	            'children' => array());

            // 获取年级下的班级
            if($roleid == 1 || $roleid == 6)
            	$classList = InfoClass::model()->findAllByAttributes(array('ClassID' => $classid, 'State' => 1));
            else
            	$classList = InfoClass::model()->findAllByAttributes(array('GradeID' => $gradeRecord->GradeID, 'State' => 1));
            foreach ($classList as $classRecord)
            {
            	$selected = false;
                $classInfo = array_change_key_case((array)$classRecord->getAttributes(), CASE_LOWER);
                $iconCls = "";
                $classInfo = array_change_key_case((array)$classRecord->getAttributes(), CASE_LOWER);
                if( $classInfo["type"] == 1)
                	$iconCls = "icon-tip";
                else if($classInfo["type"] == 2)
                	$iconCls = "icon-sum";
                if($classid == $classInfo["classid"])
            		$selected = true;
                $gradejson['children'][] = array(
                	'id' => $classInfo["classid"],
		            'text'=> $classInfo["classname"], 
		            'selected'=>$selected,
		            'iconCls'=>$iconCls
                );
            }
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
			      "iconCls": "",
			      "children": [
			        {
			          "id": "1",
			          "text": "高2014级1班",
			          "selected": false,
			          "iconCls": ""
			        },
			        {
			          "id": "2",		          
			          "text": "高2014级2班",
			          "selected": false,
			          "iconCls": ""
			        }
			      ]
			    },
			    {
			      "id": "2",
			      "text": "高2015级",
			      "iconCls": "",
			      "children": [
			        {
			          "id": "3",		          
			          "text": "高2015级1班",
			          "selected": true,
			          "iconCls": ""
			        },
			        {
			          "id": "4",		          
			          "text": "高2015级2班",
			          "selected": false,
			          "iconCls": ""
			        }
			      ]
			    }
			  ]
			}';

        echo $s;*/
	}   
	/*
	 * 获取用户可选择科目
	 */ 
    public function actionGetsubject()
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
    	
    	    	
    	$classid 	= isset($_POST['ClassID'])?$_POST['ClassID']:'0';

    	//查询班级类型
    	$classRecord = InfoClass::model()->findByPk($classid, 'State =1');
        if(!$classRecord)
        {
        	$result['msg'] = '班级不存在';
        	$this->renderText(json_encode($result));
        	return;
        }
        $type = $classRecord['Type'];
        $schoolid = $classRecord['SchoolID'];
    	//查询科目
    	if(0 == $type)
    		$subjectList = InfoSubject::model()->findAll("(SchoolID = 0 OR SchoolID = :SchoolID) and State = 1",array('SchoolID'=>$schoolid));
        else 
    		$subjectList = InfoSubject::model()->findAll("(SchoolID = 0 OR SchoolID = :SchoolID) and (Type = ".$type." or Type = 0) and State = 1",array('SchoolID'=>$schoolid));
        foreach ($subjectList as $subjectRecord)
    	{
    		$subjectInfo = array_change_key_case((array)$subjectRecord->getAttributes(), CASE_LOWER);
    		$selected = false;
    		if( $subjectInfo["subjectid"]== $subject_id)
    			$selected = true;
    		$subjectjson = array(
            	'id' => $subjectInfo["subjectid"],
	            'text'=> $subjectInfo["subjectname"], 
	            'selected'=>$selected
    		);
    		$result['data'][] = $subjectjson;
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
		      "text": "语文",
		      "selected": true
		    },
		    {
		      "id": "2",
		      "text": "数学",
		      "selected": false
		    },
		    {
		      "id": "3",
		      "text": "英语",
		      "selected": false
		    }
		  ]
		}';

        echo $s;*/
	}   
	/*
	 * 查询学生
	 */ 
    public function actionGetstudent()
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
    	$selected = false;
    	
    	$classid 	= isset($_POST['ClassID'])?$_POST['ClassID']:'';
    	
		if($roleid == 1 || $roleid == 6)
		{
			$selected = true;
			$recordList = InfoStudent::model()->findAll("UID = :UID and State = 1",
	        	array('UID'=>$uid));
		}
		else 
			$recordList = InfoStudent::model()->findAll("ClassID = :ClassID and State = 1",
	        	array('ClassID'=>$classid));
        	
        foreach ($recordList as $record)
        {
        	$studentInfo = array_change_key_case((array)$record->getAttributes(), CASE_LOWER);
        	$stujson = array(
        		'uid' => $studentInfo["uid"],
            	'name' => $studentInfo["name"],
	            'studyno' => $studentInfo["studyno"]
	        );
        	$result['data'][] = array_change_key_case($stujson, CASE_LOWER);
        }
        $result['success'] = true;
        $this->renderText(json_encode($result));
        /*
    	$classid 	= isset($_POST['ClassID'])?$_POST['ClassID']:'';

    	$s = '{
			  "success": true,
			  "msg": "",
			  "data": [
			    {
			      "uid": "1",
			      "studyno" :"001",
			      "name": "学生1"
			    },
			    {
			      "uid": "2",
			      "studyno" :"002",
			      "name": "学生2"
			    },
			    {
			      "uid": "3",
			      "studyno" :"003",
			      "name": "学生3"
			    },
			    {
			      "uid": "4",
			      "studyno" :"004",
			      "name": "学生4"
			    },
			    {
			      "uid": "5",
			      "studyno" :"005",
			      "name": "学生5"
			    },
			    {
			      "uid": "6",
			      "studyno" :"006",
			      "name": "学生6"
			    },
			    {
			      "uid": "7",
			      "studyno" :"007",
			      "name": "学生7"
			    },
			    {
			      "uid": "8",
			      "studyno" :"008",
			      "name": "学生8"
			    },
			    {
			      "uid": "9",
			      "studyno" :"009",
			      "name": "学生9"
			    },
			    {
			      "uid": "10",
			      "studyno" :"010",
			      "name": "学生10"
			    },
			    {
			      "uid": "11",
			      "studyno" :"011",
			      "name": "学生11"
			    }
			  ]
			}';
        echo $s;*/
	}		    
	/*
	 * 查询排名
	 */ 
    public function actionGetscore()
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
    	$school_id = $sessionInfo['school_id'];
    	$role_id = $sessionInfo['role_id'];
    	
    	$classid 	= isset($_POST['ClassID'])?$_POST['ClassID']:'';
     	$SubjectID 	= isset($_POST['SubjectID'])?$_POST['SubjectID']:'';   	
    	$uids		= isset($_POST['UIDs'])?$_POST['UIDs']:'';
    	
        //先查询总共的考试
    	$recordclass = InfoClass::model()->findByPk($classid, "State = 1");
		if (empty($recordclass))
		{
			$this->renderText(json_encode($result));
			return;
		}
        $examdates	= array();
    	$connection=Yii::app()->db; 
		$sql="select * from info_exam where gradeid = ".$recordclass['GradeID']."  
											and type = ".$recordclass['Type']."
											and state = 1
											order by examtime";
	//	echo $sql;
		$rows=$connection->createCommand ($sql)->query();
		foreach ($rows as $k => $v ){
			$examInfo = array_change_key_case($v, CASE_LOWER);
			$examdates[] = substr($examInfo['examtime'],0,10);
		}
        $result['examdates'] = implode(",", $examdates);  
        
        $uidarr = explode(',',$uids);
        foreach ($uidarr as $uid)
        {
        	$record = InfoStudent::model()->findByPk($uid, "State = 1");
			if (!empty($record))
			{
				$studentInfo = array_change_key_case((array)$record->getAttributes(), CASE_LOWER);
	            $scorejson = array(
	            	'uid' => $studentInfo["uid"],
		            'name' => $studentInfo["name"]
		        );
		        
		        $connection=Yii::app()->db; 
				$sql="select es.*,e.examname,e.examtime from info_exam_score es,info_exam e where es.examid = e.examid and e.state = 1
					and es.uid = ".$studentInfo["uid"]." 
					and es.subjectid = ".$SubjectID." order by e.examtime";
				$rows=$connection->createCommand ($sql)->query();
				foreach ($rows as $k => $v ){
					$scoreInfo = array_change_key_case($v, CASE_LOWER);	
	        //		$scoreInfo = array_change_key_case((array)$recordScore->getAttributes(), CASE_LOWER);
	        		$scorejson[substr($scoreInfo["examtime"],0,10)] = $scoreInfo["examname"]."|".strval($scoreInfo["classrank"])."|".strval($scoreInfo["graderank"]);
	        	}
	
	            $result['data'][] = array_change_key_case($scorejson, CASE_LOWER);
			}
        }
		$result['success'] = true;
        $this->renderText(json_encode($result));
  /*  	$s = '{
			  "success": true,
			  "msg": "",
			  "data": [
			    {
			      "uid": "1",
			      "name": "学生1",
			      "2013-09-01": "中考|2|17",
			      "2013-10-01": "第一次月考|5|28",
			      "2013-11-01": "半期考试|15|68",
			      "2013-12-01": "第三次月考|3|8",
			      "2014-01-01": "期末考试|8|13"
			    },
			    {
			      "uid": "2",
			      "name": "学生2",
			      "2013-09-01": "||",
			      "2013-10-01": "第一次月考|34|128",
			      "2013-11-01": "半期考试|9|48",
			      "2013-12-01": "第三次月考|23|53",
			      "2014-01-01": "期末考试|4|27"
			    }
			  ],
			  "examdates": "2013-09-01,2013-10-01,2013-11-01,2013-12-01,2014-01-01"
			}';
        echo $s;*/
	}	
}
