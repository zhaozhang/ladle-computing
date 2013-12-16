<?php

class StatClassController extends CommonController
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
        if($roleid == 1)
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
    	$connection=Yii::app()->db; 
    	if(1 == $role_id)
    	{
    		$subject_id = 1;
    		$sql="select * from v_class_exam where classidq = ".$class_id." and State = 1 order by ExamTime desc";
    	}else 
			$sql="select * from info_exam where gradeid = ".$gradeid." and State = 1 order by ExamTime desc";

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
			$sql="select * from v_exam_subject where ExamID = ".$examInfo["examid"]." and State = 1 order by subjectID";
			$rows=$connection->createCommand ($sql)->query();
			foreach ($rows as $k => $v ){
				$subjectInfo = array_change_key_case($v, CASE_LOWER);
			//	$selected = false;
	    	//	if( $subjectInfo["subjectid"]== $subject_id)
	    			$selected = true;
				$examjson['subject'][] = array(
                	'id' => $subjectInfo["subjectid"],
		            'text'=> $subjectInfo["subjectname"], 
		            'selected'=>$selected,
                );
			}
						
			$result['data'][] = $examjson;
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
    	$result = array('success' => false, 'data' => array());
    	$uid = Yii::app()->user->getId();
    	if(!$uid){
    		$result['msg'] = '用户未登录';
    		$this->renderText(json_encode($result));
    		return;
    	}
    	
    	$gradeid 	= isset($_POST['GradeID'])?$_POST['GradeID']:'';
     	$examid 	= isset($_POST['ExamID'])?$_POST['ExamID']:'';   	
    	$subjectid	= isset($_POST['SubjectID'])?$_POST['SubjectID']:'';

        //查询分数段信息
        $scorerange	= array();
    	$connection=Yii::app()->db; 
		$sql="select * from info_exam_subject where ExamID = ".$examid."  and subjectid = ".$subjectid;
		$rows=$connection->createCommand ($sql)->query();
		foreach ($rows as $k => $v ){
			//如果是数值
			$subjectInfo = array_change_key_case($v, CASE_LOWER);
			if(strpos($subjectInfo['scorerange'],',',0) == false && (int)$subjectInfo['scorerange'] > 0)
			{
				for($i = 0;$i<(int)$subjectInfo['fullscore'];$i= $i+(int)$subjectInfo['scorerange'])
				{
					if($i+(int)$subjectInfo['scorerange'] <= (int)$subjectInfo['fullscore'])
						$scorerange[] = strval($i+1).'-'.strval($i+(int)$subjectInfo['scorerange']);
					else	
						$scorerange[] = strval($i+1).'-'.strval((int)$subjectInfo['fullscore']);
				}
       			$result['scorerange'] = implode(",", $scorerange);  
			}else if((int)$subjectInfo['scorerange'] == 0 )
			{
				$result['scorerange'] = '';
			}else 
				$result['scorerange'] = $subjectInfo['scorerange'];
		}

        //查询班级数据
        $connection=Yii::app()->db; 
		$sql="SELECT ecs.*,c.ClassName,c.ClassLevel,t.`Name`,s.subjectname,CAST(ecs.passcount/ecs.Count AS DECIMAL(8,4))*100 AS passrate
			 FROM info_exam_class_stat ecs,info_class c,info_teacher t,info_subject s
				where ecs.ClassID = c.ClassID and ecs.UID = t.UID and ecs.subjectid = s.subjectid
					and ecs.examid = ".$examid." and ecs.subjectid = ".$subjectid." 
					order by c.ClassName";
		$rows=$connection->createCommand ($sql)->query();
		foreach ($rows as $k => $v ){
			$examInfo = array_change_key_case($v, CASE_LOWER);
			$examjson["sname"] = $examInfo["subjectname"];
			$examjson["cname"] = $examInfo["classname"];
			$examjson["clevel"] = $examInfo["classlevel"];
			$examjson["tname"] = $examInfo["name"];
			$examjson["avg"] = floatval($examInfo["avg"]);
			$examjson["avg-r"] = intval($examInfo["avgrank"]);
			$examjson["max"] = floatval($examInfo["max"]);
			$examjson["max-r"] = intval($examInfo["maxrank"]);
			$examjson["min"] = floatval($examInfo["min"]);
			$examjson["min-r"] = intval($examInfo["minrank"]);
			$examjson["passrate"] = floatval($examInfo["passrate"])."%";
			$examjson["passrate-r"] = intval($examInfo["passrank"]);
			//成绩初始化
			$scoreranges = explode(",",$result['scorerange']);
			$rangecounts = explode(",",$examInfo['scorerange']);
			foreach($scoreranges as $key=>$a){
				$examjson[$a] = isset($rangecounts[$key])?$rangecounts[$key]:'';
			} 
            $result['data'][] = $examjson; 
		}
		//查询年级数据
    	$connection=Yii::app()->db; 
		$sql="SELECT ecs.*,c.GradeName,s.subjectname,CAST(ecs.passcount/ecs.Count AS DECIMAL(8,4))*100 AS passrate
			 FROM info_exam_grade_stat ecs,info_grade c,info_subject s
				where ecs.GradeID = c.GradeID and ecs.subjectid = s.subjectid
					and ecs.examid = ".$examid." and ecs.subjectid = ".$subjectid;
		$rows=$connection->createCommand ($sql)->query();
		foreach ($rows as $k => $v ){
			$examInfo = array_change_key_case($v, CASE_LOWER);
			$examjson["sname"] = $examInfo["subjectname"];
			$examjson["cname"] = $examInfo["gradename"];
			$examjson["clevel"] = '-1';
			$examjson["tname"] = '';
			$examjson["avg"] = floatval($examInfo["avg"]);
			$examjson["avg-r"] = 0;
			$examjson["max"] = floatval($examInfo["max"]);
			$examjson["max-r"] = 0;
			$examjson["min"] = floatval($examInfo["min"]);
			$examjson["min-r"] = 0;
			$examjson["passrate"] = floatval($examInfo["passrate"])."%";
			$examjson["passrate-r"] = 0;
			//成绩初始化
			$scoreranges = explode(",",$result['scorerange']);
			$rangecounts = explode(",",$examInfo['scorerange']);
			foreach($scoreranges as $key=>$a){
				$examjson[$a] = isset($rangecounts[$key])?$rangecounts[$key]:'';
			} 
            $result['data'][] = $examjson; 
		}
		$result['success'] = true;
        $this->renderText(json_encode($result));
    /*	$s = '{
			  "success": true,
			  "msg": "",
			  "data": [
			    {
			      "sname": "语文",
			      "cname": "高2016级1班",
			      "clevel" : "1",
			      "tname": "教师1",
			      "avg": "97.76",
			      "avg-r": "1",
			      "avg-r1": "1",
			      "max" : "127",
			      "max-r": "1",
			      "max-r1": "1",
				  "min" : "67",
			      "min-r":"1",
			      "min-r1":	"1",		      
				  "passrate" : "63.67%",
			      "passrate-r":"1",
			      "passrate-r1": "1",
			      "150-141": "7",
			      "140-131": "4",
			      "130-121": "9"
			    },
			    {
			      "sname": "语文",
			      "cname": "高2016级2班",
			      "clevel" : "2",
			      "tname": "教师2",
			      "avg": "86.56",
			      "avg-r": "2",
			      "avg-r1": "2",
			      "max" : "122",
			      "max-r": "2",
			      "max-r1": "2",
				  "min" : "56",
			      "min-r":"2",
			      "min-r1":	"2",		      
				  "passrate" : "54.78%",
			      "passrate-r":"2",
			      "passrate-r1": "2",
			      "150-141": "3",
			      "140-131": "1",
			      "130-121": "6"
			    },
			    {
			      "sname": "语文",
			      "cname": "高2016级",
			      "clevel" : "-1",
			      "tname": "",
			      "avg": "96.43",
			      "avg-r": "",
			      "avg-r1": "",
			      "max" : "122",
			      "max-r": "",
			      "max-r1": "",
				  "min" : "56",
			      "min-r":"",
			      "min-r1":	"",		      
				  "passrate" : "62.49%",
			      "passrate-r":"",
			      "passrate-r1": "",
			      "150-141": "10",
			      "140-131": "5",
			      "130-121": "15"
			    }
			  ],
			  "scorerange": "150-141,140-131,130-121"
			}';
        echo $s;*/
	}	
}
