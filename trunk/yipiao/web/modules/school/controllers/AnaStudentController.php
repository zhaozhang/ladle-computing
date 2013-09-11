<?php

class AnaStudentController extends CommonController
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
    	//iconCls 根据文理科配置成不一样的
    /*	$s = '{
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
    	$classid 	= isset($_POST['ClassID'])?$_POST['ClassID']:'0';
    	$this->layout = false;
        $result = array('success' => true, 'msg'=>'', 'data' => array());
    	//查询班级类型
    	$classRecord = InfoClass::model()->findByPk($classid, 'State =1');
        if(!$classRecord)
        {
        	$result['success'] = false;
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
    		$subjectList = InfoSubject::model()->findAll("(SchoolID = 0 OR SchoolID = :SchoolID) and (Type = ".$type." OR Type = 0) and State = 1",array('SchoolID'=>$schoolid));
        foreach ($subjectList as $subjectRecord)
    	{
    		$subjectInfo = array_change_key_case((array)$subjectRecord->getAttributes(), CASE_LOWER);
    		$subjectjson = array(
            	'id' => $subjectInfo["subjectid"],
	            'text'=> $subjectInfo["subjectname"], 
	            'selected'=>false
    		);
    		$result['data'][] = $subjectjson;
    	}
    	$this->renderText(json_encode($result));
    	/*
    	$classid 	= isset($_POST['ClassID'])?$_POST['ClassID']:'';
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
	 * 查询能力值
	 */ 
    public function actionGetyscore()
    {
    	$classid 	= isset($_POST['ClassID'])?$_POST['ClassID']:'';	
    	$SubjectID 	= isset($_POST['SubjectID'])?$_POST['SubjectID']:'';
    	$uids		= isset($_POST['UIDs'])?$_POST['UIDs']:'';
    	
    	$this->layout = false;
        $result = array('success' => true, 'msg' => '');
        //先查询总共的考试
    	$recordclass = InfoClass::model()->findByPk($classid, "State = 1");
		if (empty($recordclass))
		{
			$result['success'] = false;
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
        	$recordstu = InfoStudent::model()->findByPk($uid, "State = 1");
			if (!empty($recordstu))
			{	
				$studentInfo = array_change_key_case((array)$recordstu->getAttributes(), CASE_LOWER);
	            $scorejson = array(
	            	'uid' => $studentInfo["uid"],
		            'name' => $studentInfo["name"]
		        );
		        
		        $connection=Yii::app()->db; 
				$sql="select es.*,e.examname,e.examtime from info_exam_yscore es,info_exam e where es.examid = e.examid and e.state = 1
					and es.uid = ".$studentInfo["uid"]." 
					and es.subjectid = ".$SubjectID." order by e.examtime";
				$rows=$connection->createCommand ($sql)->query();
				foreach ($rows as $k => $v ){
					$scoreInfo = array_change_key_case($v, CASE_LOWER);	
	        //		$scoreInfo = array_change_key_case((array)$recordScore->getAttributes(), CASE_LOWER);
	        		$scorejson[substr($scoreInfo["examtime"],0,10)] = $scoreInfo["examid"]."|".$scoreInfo["examname"]."|"
	        			.strval($scoreInfo["cyscore"])."|"
	        			.strval($scoreInfo["cyclarank"])."|"
	        			.strval($scoreInfo["cygrarank"])."|"
	        			.strval($scoreInfo["stability"])."|"
	        			.strval($scoreInfo["improve"]);
	        	}
	
	            $result['data'][] = array_change_key_case($scorejson, CASE_LOWER);
			}
        }
        $this->renderText(json_encode($result));
        
    	/*
    	 * examid|examname|能力值|班级排名|年级排名|稳定性|进步值
    	 */
    	/*
    	$s = '{
			  "success": true,
			  "msg": "",
			  "data": [
			    {
			      "uid": "1",
			      "name": "学生1",
			      "2013-09-01": "1|中考|84|7|16|0|0",
			      "2013-10-01": "2|第一次月考|89|9|16|4|7",
			      "2013-11-01": "3|半期考试|97|4|12|5|9",
			      "2013-12-01": "4|第三次月考|85|4|12|6|2"
			    },
			    {
			      "uid": "2",
			      "name": "学生2",
			      "2013-09-01": "1|中考|63|13|24|0|0",
			      "2013-10-01": "2|第一次月考|56|15|27|4|7",
			      "2013-11-01": "3|半期考试|82|24|43|5|9",
			      "2013-12-01": "4|第三次月考|71|34|52|6|2"
			    }
			  ],
			  "examdates": "2013-09-01,2013-10-01,2013-11-01,2013-12-01"
			}';
        echo $s;*/
	}	
		/*
	 * 查询考试详细能力值
	 */ 
    public function actionGetyscorebyexam()
    {
    	$uid 	= isset($_POST['UID'])?$_POST['UID']:'';	
    	$examIid	= isset($_POST['ExamID'])?$_POST['ExamID']:'';
    	$this->layout = false;
        $result = array('success' => true, 'msg' => '');
        //先查询考试总共的基础科目
        $subjectids	= array();
    	$connection=Yii::app()->db; 
		$sql="select vs.* from v_exam_subject vs,info_subject s where vs.examid = s.examid and vs.ExamID = ".$examid." and vs.state = 1 and s.ReferSubjectID = ''";
		$rows=$connection->createCommand ($sql)->query();
		foreach ($rows as $k => $v ){
			$subjectInfo = array_change_key_case($v, CASE_LOWER);
			$subjectids[] = $subjectInfo['subjectid'].'-'.$subjectInfo['subjectname'];
		}
        $result['subjectids'] = implode(",", $subjectids); 
         
    	//查询数值
    	$sql="select es.*,e.examname,e.examtime,s.name from info_exam_yscore es,info_exam e,info_student s where es.examid = e.examid and s.uid = es.uid and e.state = 1
				and es.uid = ".$uid." 
				and es.examid = ".$examIid;
    	$rows=$connection->createCommand ($sql)->query();
    	$isfirst = 1;
		foreach ($rows as $k => $v ){
			$examInfo = array_change_key_case($v, CASE_LOWER);
			if($isfirst == 1)
				$scorejson = array(
	            	'id' => $examInfo["uid"].'-'.$examInfo["examid"],
		            'name' => $examInfo["name"],
					'examname' => $examInfo["examname"],
					'examtime' => substr($examInfo["examtime"],0,10)
		        );
		    $isfirst = 0;
	        $scorejson['s'.$examInfo["subjectid"]] = $scoreInfo["cyscore"];
	        $scorejson['s'.$examInfo["subjectid"].'-cr'] = $scoreInfo["cyclarank"];
	        $scorejson['s'.$examInfo["subjectid"].'-gr'] = $scoreInfo["cygrarank"];
	        $scorejson['s'.$examInfo["subjectid"].'-s'] = $scoreInfo["stability"];
	        $scorejson['s'.$examInfo["subjectid"].'-i'] = $scoreInfo["improve"];
		}    		
		$result['data'][] = array_change_key_case($scorejson, CASE_LOWER);
		/*
    	$s = '';
    	if('1' == $uid)
	    	$s = '{
				  "success": true,
				  "msg": "",
				  "data": [
				    {
				      "id":"1-4",
				      "name": "学生1",
				      "examname": "考试1",
				      "examtime": "2013-5-1",
				      "s1": "117-s1",
				      "s1-cr": 18,
				      "s1-gr": 27,
				      "s1-s": "3",
				      "s1-i": "3",
				      "s2": "127-s2",
				      "s2-cr": 17,
				      "s2-gr": 21,
				      "s2-s": "3",
				      "s2-i": "3",
				      "s3": "135-s3",
				      "s3-cr": 17,
				      "s3-gr": 21,
				      "s3-s": "3",
				      "s3-i": "3"
				    }
				  ],
				  "subjectids": "1-语文,2-数学,3-英语"
				}';
	    if('2' == $uid)
	    	$s = '{
				  "success": true,
				  "msg": "",
				  "data": [
				    {
				      "id":"2-4",
				      "name": "学生2",
				      "examname": "考试1",
				      "examtime": "2013-5-1",
				      "s1": "117-s1",
				      "s1-cr": 18,
				      "s1-gr": 27,
				      "s1-s": "3",
				      "s1-i": "3",
				      "s2": "127-s2",
				      "s2-cr": 17,
				      "s2-gr": 21,
				      "s2-s": "3",
				      "s2-i": "3",
				      "s3": "135-s3",
				      "s3-cr": 17,
				      "s3-gr": 21,
				      "s3-s": "3",
				      "s3-i": "3"
				    }
				  ],
				  "subjectids": "1-语文,2-数学,3-英语"
				}';	
        echo $s;*/
    }
}
