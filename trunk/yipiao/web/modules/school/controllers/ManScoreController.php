<?php

class ManScoreController extends CommonController
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
    	$gradeid = $sessionInfo['grade_id'];
    	$gradeidt = $sessionInfo['t_grade_id'];
		$selected = false;
    	if($roleid == 5)
        	// 获取所有年级
        	$gradeList = InfoGrade::model()->findAllByAttributes(array('SchoolID' => $schoolid, 'State' => 1));
        else if($roleid == 4)
        	$gradeList = InfoGrade::model()->findAllByAttributes(array('GradeID' => $gradeid, 'State' => 1));	
        else
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
    	/*
    	//iconCls 根据文理科配置成不一样的
    	$s = '{
			  "success": true,
			  "msg": "",
			  "data": [
			    {
			      "id": "g-1",
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
			      "id": "g-2",
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
    	/*
    	//iconCls 根据文理科配置成不一样的
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
			          "selected": false
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
			          "selected": false
			        }
			      ]
			    }
			  ]
			}';

        echo $s;*/
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
        	//	$scorejson[''] = 
            }
            
            $result['data'][] = array_change_key_case($scorejson, CASE_LOWER);
        }    
		$result['success'] = true;
        $this->renderText(json_encode($result));
    	/*
    	$s = '{
			  "success": true,
			  "msg": "",
			  "data": [
			    {
			      "seqid": 1,
			      "name": "学生1",
			      "studyno" :"001",
			      "s1": "123",
			      "s2": "98"
			    },
			    {
			      "seqid": 2,
			      "name": "学生2",
			      "studyno" :"002",
			      "s1": "75",
			      "s2": "127"
			    }
			  ]
			}';
        echo $s;*/
	}	
    /*
     * 更新分数
     */
	public function actionUpdatescore()
	{
		$this->layout = false;
    	$result = array('success' => false, 'data' => array());
    	$uid = Yii::app()->user->getId();
    	if(!$uid){
    		$result['msg'] = '用户未登录';
    		$this->renderText(json_encode($result));
    		return;
    	}
		$fields = array();
		
		$msg = '成绩修改失败';
		$result = array('msg' => '成绩修改失败', 'data' => array());
		$success = false;
		
		//uid-examid
		if (!isset($_POST['ExamID']) || !isset($_POST['UID']))
        {
            $result['success'] = false;
            $result['msg'] = '参数错误';
            $this->renderText(json_encode($result));
            return;
        }   	 	
		if (isset($_POST['ExamID']))
		{
			$fields['ExamID'] = intval($_POST['ExamID']);
		}
		if (isset($_POST['UID']))
		{
			$fields['UID'] = intval($_POST['UID']);
		}
		if (isset($_POST['ClassID']))
		{
			$fields['ClassID'] = intval($_POST['ClassID']);
		}
		if (isset($_POST['GradeID']))
		{
			$fields['GradeID'] = intval($_POST['GradeID']);
		}
		$subjectids	= isset($_POST['subjectids'])?$_POST['subjectids']:'';
		$ismodify = 0;
		
		$subjectarr = explode(",",str_replace('s','',$subjectids)); 
		$trans = Yii::app()->db->beginTransaction();    
        foreach ($subjectarr as $subjectid)
        {
			try { 
		        $record = InfoExamScore::model()->findAll("examid = ".$fields['ExamID']." and subjectid = ".$subjectid." and uid = ".$fields['UID']);
				if (empty($record))//添加
				{
					$ismodify = 1;
					$record = new InfoExamScore();
					$record->SubjectID= $subjectid;
					$record->Score = $_POST['s'.strval($subjectid)];
					foreach ($fields as $key => $value)
					{
						$record->$key = $value;
					}
					if (!$record->save() || !$record->validate())
					{
						$trans->rollback();	
						break;
					}
				}else//更新 
				{						
					$fieldsupdate = array();
					$fieldsupdate = $fields;
					$fieldsupdate['SubjectID'] = $subjectid;
					$fieldsupdate['Score'] = $_POST['s'.strval($subjectid)];
					$fieldsupdate['SeqID'] = $record[0]["SeqID"];
					$affectedRow = $record[0]->updateByPk($record[0]["SeqID"], $fieldsupdate);			
					if($affectedRow == 1)
						$ismodify = 1;
				}
				
			} catch (Exception $e) {   
		    	$trans->rollback();     
			}
        }
        $success = true;
		$msg = '成绩更新成功!';
		//写入更新日志
		if($ismodify)
		{
			$connection=Yii::app()->db; 
	    	$sql="update info_examupdatetime set isdeal = 1 and lastupdatetime = now() where examid = ".intval($_POST['ExamID']);
		//	echo $sql;
			$rows=$connection->createCommand ($sql)->query();
		}
		$trans->commit(); 
		
		$result['success'] = $success;
		$result['msg'] = $msg;
		$this->renderText(json_encode($result));
		
	/*	$s = '
			{
				"success":true,
				"msg":"成绩更新成功!"
			}';
	
		echo $s;*/
	}   

	public function actionExport()
    {
    	$result = array('success' => false, 'data' => array());
    	$u_id = Yii::app()->user->getId();
    	if(!$u_id){
    		$result['msg'] = '用户未登录';
    		echo json_encode($result);
    		return;
    	}
    	$sessionInfo = AdminUtil::getUserSessionInfo($u_id);
    	$schoolid = $sessionInfo['school_id'];
    	$roleid = $sessionInfo['role_id'];
    	$subjectid = $sessionInfo['subject_id'];
    	
     	$examid = isset($_GET['ExamID'])?$_GET['ExamID']:0;   	

        $excel = ExcelExport::getInstance();
        $excel->setTemplate();
        $columns = array('姓名', '学号','性别','班级','入学时间');
        
		$connection=Yii::app()->db; 
		$sql="select * from v_exam_subject where ExamID = ".$examid." and state = 1 and ReferSubjectID = '' order by ExamID";
		$subjectinfos=$connection->createCommand ($sql)->query();
		foreach ($subjectinfos as $k => $v ){
			if($subjectid == $v['SubjectID'] || $roleid > 2)
				$columns[] = $v['subjectname'];
		}
		       
        $rows = array();
        $excel->render($rows, $columns);       
        $excel->download();
    }	
	/**
     * @desc 导入excel
     */
    public static function actionImport()
    {
    	$result = array('success' => false, 'data' => array());
    	$u_id = Yii::app()->user->getId();
    	if(!$u_id){
    		$result['msg'] = '用户未登录';
    		echo json_encode($result);
    		return;
    	}
    	$sessionInfo = AdminUtil::getUserSessionInfo($u_id);
    	$schoolid = $sessionInfo['school_id'];
    	$roleid = $sessionInfo['role_id'];
    	$subjectid = $sessionInfo['subject_id'];
    	
    	$examid = isset($_POST['examid'])?$_POST['examid']:0;

    	ini_set('memory_limit', '256m');
        $total = 0; 
        if (isset($_FILES['userfile']))
        {    
            if ($_FILES['userfile']['type'] != 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
            && $_FILES['userfile']['type'] != 'application/kset'
            )
            {    
                header('Content-type: text/html; charset=utf-8');
                die('您上传的不是excel 2007 格式的文件。');
            }    
			
            $excel = ExcelImport::getInstance();
            $subjectids = array();
            $columns = array('Name', 'StudyNo','Sex','ClassName','EntryTime');
	        $connection=Yii::app()->db;
			$sql="select * from v_exam_subject where ExamID = ".$examid." and state = 1 and ReferSubjectID = '' order by ExamID";
			$subjectinfos=$connection->createCommand ($sql)->query();
			foreach ($subjectinfos as $k => $v ){
				if($subjectid == $v['SubjectID'] || $roleid > 2)
				{
					$columns[] = 's'.strval($v['SubjectID']);
					$subjectids[] = $v['SubjectID'];
				}
			}

            // 每一列的列名
            $excel->init(array('columnNames' => $columns));
            $excel->load($_FILES['userfile']['tmp_name']);
			
            // rows为导入的数据行, 每一行为key => value的数据
            $rows = $excel->getValues();
            $total = count($rows);
            $succCount = 0;
            $ismodify = 0;

            foreach ($rows as $row)
            {
            	$trans = Yii::app()->db->beginTransaction(); 
            	//根据学号查找UID
				$record_user = InfoStudent::model()->findByAttributes(array('StudyNo' => $row['StudyNo']));
				if(empty($record_user))//新建用户
				{
					$classList = array(); 
		            if($roleid == 5)
		            	$schoolClassList = SchoolUtil::getClassList($schoolid);
		            else if($roleid == 4)
		           		$schoolClassList = SchoolUtil::getClassList($schoolid,$gradeid);
		            foreach ($schoolClassList as $classInfo)
		            {
		            	$classList[$classInfo['ClassName']] = $classInfo;	
		            }
		            
		            // 给学生添加对应用户, 密码默认为学号后六位
	            	$uid = AdminUtil::createUser($row['StudyNo'], substr($row['StudyNo'],-6), 1);
	            	if (0 == $uid)	// 创建用户失败
	            	{
	            		$trans->rollback();
	            		continue;
	            	}
	
	            	$fields = array('UID' => $uid, 'Name' => $row['Name'], 'StudyNo' => $row['StudyNo']
	            		,'CreateTime' => date("Y-m-d H:i:s"),'State' =>1,'CreatorID'=>Yii::app()->user->getId());
	            	$fields['Sex'] = ($row['Sex'] == '男')? 1 : 0;
	            //	$fields['Type'] = ($row['TypeName'] == '应届')? 0 : 1;
	            //	$fields['IsLocal'] = ($row['LocalName'] == '是')? 1 : 0;
	            	$fields['EntryTime' ] = ($row['EntryTime'] == '')?date("Y-m-d H:i:s"):date('Y-m-d H:i:s', strtotime($row['EntryTime']));
	            	$fields['SchoolID'] = $schoolid;
	            	
	            	foreach ($classList as $classInfo)
	            	{
	            		if($classInfo['ClassName'] == $row['ClassName'])
	            		{
	            			$fields['ClassID'] = $classInfo['ClassID'];
	            			$fields['GradeID'] = $classInfo['GradeID'];	
	            			break;
	            		}
	            	}
	            /*	if(isset($classList[$row['ClassName']]))
	            	{                       		
	            		$fields['ClassID'] = $classList[$row['ClassName']]['ClassID'];
	            		$fields['GradeID'] = $classList[$row['ClassName']]['GradeID'];	
	            	}
	            		*/
	            	//先更新所在班级
	            	
	            	$record_stu = new InfoStudent();
	            	$record_stu->setAttributes($fields);
	            	if (!$record_stu->save())
	            	{
	            		$trans->rollback();	
						continue;
	            	} 
	            	$record_user['UID'] = $uid;
	            	$record_user['GradeID'] = $fields['ClassID'];
	            	$record_user['ClassID'] = $fields['GradeID'];
				}else//有数据的话更新班级
				{
					$classList = array(); 
		            if($roleid == 5)
		            	$schoolClassList = SchoolUtil::getClassList($schoolid);
		            else if($roleid == 4)
		           		$schoolClassList = SchoolUtil::getClassList($schoolid,$gradeid);
		            foreach ($schoolClassList as $classInfo)
		            {
		            	if($classInfo['ClassName'] == $row['ClassName'])
		            	{
		            		$fields['ClassID'] = $classInfo['ClassID'];
	            			$fields['GradeID'] = $classInfo['GradeID'];	
	            			InfoStudent::model()->updateByPk($record_user['UID'], $fields);	
	            			break;
		            	}
		            }
				}
	            foreach ($subjectids as $subjectidinfo )
		        {
					try { 
				        $record = InfoExamScore::model()->findAll("examid = ".$examid." and subjectid = ".$subjectidinfo." and uid = ".$record_user['UID']);
						if (empty($record))//添加
						{
							$ismodify = 1;
							$record = new InfoExamScore();
							$record->UID = $record_user['UID'];
							$record->ExamID = $examid;
							$record->GradeID = $record_user['GradeID'];
							$record->ClassID = $record_user['ClassID'];
							$record->SubjectID= $subjectidinfo;
							$record->Score = $row['s'.strval($subjectidinfo)];
							if (!$record->save() || !$record->validate())
							{
								$trans->rollback();	
								break;
							}
						}else//更新 
						{						
							$fieldsupdate = array();
							$fieldsupdate['Score'] = $row['s'.strval($subjectidinfo)];
							$affectedRow = $record[0]->updateByPk($record[0]["SeqID"], $fieldsupdate);			
							if($affectedRow == 1)
								$ismodify = 1;
						}
						$succCount++;
						
					} catch (Exception $e) {   
				    	$trans->rollback();     
					}
		        }
		       	$trans->commit(); 
            }
        	//写入更新日志
			if($ismodify == 1)
			{
				$connection=Yii::app()->db; 
		    	$sql="insert into info_examupdatetime(ExamID,LastUpdateTime,IsDeal) values(".$examid.",now(),0)";
			//	echo $sql;
				$rows=$connection->createCommand ($sql)->query();
			}
            $result = array('success' => true, 'msg' => '文件导入成功,一共'.$succCount.'条记录', 'total' => $total, 'succ' => $succCount);
            echo json_encode($result);
        }
    }
}
