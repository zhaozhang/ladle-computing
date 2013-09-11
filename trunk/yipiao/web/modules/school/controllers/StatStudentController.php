<?php

class StatStudentController extends CommonController
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
    	$schoolid	= isset($_POST['SchoolID'])?$_POST['SchoolID']:0;
    	
        $this->layout = false;
        $result = array('success' => true, 'msg'=>'', 'data' => array());

        if (!isset($_POST['SchoolID']))
        {
            $result['success'] = false;
            $result['msg'] = '参数错误';
            $this->renderText(json_encode($result));
            return;
        }
        $schoolId = (int)($_POST['SchoolID']);

        // 获取所有年级
        $gradeList = InfoGrade::model()->findAllByAttributes(array('SchoolID' => $schoolId, 'State' => 1));
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
                $classInfo = array_change_key_case((array)$classRecord->getAttributes(), CASE_LOWER);
                $gradejson['children'][] = array(
                	'id' => $classInfo["classid"],
		            'text'=> $classInfo["classname"], 
		            'selected'=>false,
		            'iconCls'=>""
                );
            }
            $result['data'][] = $gradejson;
        }

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
	 * 获取用户可选择考试，按时间倒序
	 */ 
    public function actionGetexam()
    {
    	$classlid	= isset($_POST['ClassID'])?$_POST['ClassID']:0;
     	$this->layout = false;
        $result = array('success' => true, 'msg'=>'', 'data' => array());

        if (!isset($_POST['ClassID']))
        {
            $result['success'] = false;
            $result['msg'] = '参数错误';
            $this->renderText(json_encode($result));
            return;
        }
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
						
			$result['data'][] = $examjson;
		}
        $this->renderText(json_encode($result));
        /*
    	$s = '{
			  "success": true,
			  "msg": "",
			  "data": [
			    {
			      "id": "1",
			      "text": "考试1",
			      "selected": true
			    },
			    {
			      "id": "2",
			      "text": "考试2",
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
    	$classid 	= isset($_POST['ClassID'])?$_POST['ClassID']:'';
    	
    	$this->layout = false;
        $result = array('success' => true, 'msg' => '');
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
        $this->renderText(json_encode($result));
        /*
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
	 * 查询成绩
	 */ 
    public function actionGetscore()
    {
    	$classid 	= isset($_POST['ClassID'])?$_POST['ClassID']:'0';
     	$examid 	= isset($_POST['ExamID'])?$_POST['ExamID']:'0';   	
    	$uids		= isset($_POST['UIDs'])?$_POST['UIDs']:'';
    	
    	$this->layout = false;
        $result = array('success' => true, 'msg' => '');
        //先查询考试总共的科目
        $subjectids	= array();
    	$connection=Yii::app()->db; 
		$sql="select * from v_exam_subject where ExamID = ".$examid."  and state = 1";
		$rows=$connection->createCommand ($sql)->query();
		foreach ($rows as $k => $v ){
			$subjectInfo = array_change_key_case($v, CASE_LOWER);
			$subjectids[] = $subjectInfo['subjectid'].'-'.$subjectInfo['subjectname'];
		}
        $result['subjectids'] = implode(",", $subjectids);  

        //查询成绩
        if('' == $uids)
		{
        	$recordList = InfoStudent::model()->findAll("ClassID = :ClassID and State = 1",
        		array('ClassID'=>$classid));
		}else
		{ 
         	$recordList = InfoStudent::model()->findAll("ClassID = :ClassID and uid in '(".$uids.")' and State = 1",
        		array('ClassID'=>$classid));       		
		}
        foreach ($recordList as $record)
        {
        	$studentInfo = array_change_key_case((array)$record->getAttributes(), CASE_LOWER);
            $scorejson = array(
            	'uid' => $studentInfo["uid"],
	            'name' => $studentInfo["name"]
	        );
	        //成绩初始化
            foreach ($subjectids as $subjectid)
            {
            	$subjectarr = explode("-",$subjectid);  
            	$scorejson["s".$subjectarr[0]] = "";
            	$scorejson["s".$subjectarr[0]."-cr"] = "";
            	$scorejson["s".$subjectarr[0]."-gr"] = "";
            }
            
            $recordScoreList = InfoExamScore::model()->findAll("examid = :ExamID and uid = ".$studentInfo["uid"],
        		array('ExamID'=>$examid));
        	foreach ($recordScoreList as $recordScore)
        	{		
        		$scoreInfo = array_change_key_case((array)$recordScore->getAttributes(), CASE_LOWER);
        		$scorejson["s".strval($scoreInfo["subjectid"])] = $scoreInfo["score"]."-s".strval($scoreInfo["subjectid"]);
        		$scorejson["s".strval($scoreInfo["subjectid"])."-cr"] = $scoreInfo["classrank"];
        		$scorejson["s".strval($scoreInfo["subjectid"])."-gr"] = $scoreInfo["graderank"];
        	}

            $result['data'][] = array_change_key_case($scorejson, CASE_LOWER);
        }    

        $this->renderText(json_encode($result));
        /*		
    	$s = '{
			  "success": true,
			  "msg": "",
			  "data": [
			    {
			      "uid": "1",
			      "name": "学生1",
			      "s1": "117-s1",
			      "s1-cr": 18,
			      "s1-gr": 27,
			      "s2": "127-s2",
			      "s2-cr": 17,
			      "s2-gr": 21,
			      "s3": "135-s3",
			      "s3-cr": 17,
			      "s3-gr": 21
			    },
			    {
			      "uid": "2",
			      "name": "学生2",
			      "s1": "99-s1",
			      "s1-cr": 27,
			      "s1-gr": 53,
			      "s2": "137-s2",
			      "s2-cr": 8,
			      "s2-gr": 14,
			      "s3": "113-s3",
			      "s3-cr": 17,
			      "s3-gr": 21
			    }
			  ],
			  "subjectids": "1-语文,2-数学,3-英语"
			}';
        echo $s;*/
	}	
}
