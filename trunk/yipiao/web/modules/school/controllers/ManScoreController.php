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
    	$classid 	= isset($_POST['classid'])?$_POST['classid']:'';
     	$examid 	= isset($_POST['examid'])?$_POST['examid']:'';   	
    	$subjectids	= isset($_POST['subjectids'])?$_POST['subjectids']:'';
    	$name		= isset($_POST['name'])?$_POST['name']:'';
    	
    	$this->layout = false;
        $result = array('success' => true, 'msg' => '');
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
		
		
		$subjectarr = explode(",",str_replace('s','',$subjectids));  
        foreach ($subjectarr as $subjectid)
        {
        	$trans = Yii::app()->db->beginTransaction();   
			try { 
		        $record = InfoExamScore::model()->findAll("examid = ".$fields['ExamID']." and subjectid = ".$subjectid." and uid = ".$fields['UID']);
				if (empty($record))//添加
				{
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
					
					if (0 == $affectedRow)
					{
						$trans->rollback();	
						break;
					}
				}
				$success = true;
				$msg = '成绩更新成功!';
				$trans->commit(); 
			} catch (Exception $e) {   
		    	$trans->rollback();     
			}
        }
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
     	$examid 	= isset($_POST['examid'])?$_POST['examid']:'';   	
     	$subjectids	= isset($_POST['subjectids'])?$_POST['subjectids']:'';
		$schoolId = Yii::app()->session->get('SchoolId');
    	
        $excel = ExcelExport::getInstance();
        $excel->setTemplate();
        
     /*   $subjectarr = explode(",",$subjectids);  
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
        */
        $columns = array('姓名', '学号');
        $fields = array_keys($columns);
        
        $rows = array();
       

        $excel->render($rows, $columns);
        $excel->download();
    	

        // TODO: columns 表示列头数组, rows表示数据行列表, 每一行数据为array(数值下标 => data)的数组
        // $columns = array('name', 'xxxx', 'xxx');
        // $rows = array(array('xxxx', 'xxxx', 'xxxx'), ...);
        // 这里的示例是前端提交上来, 也可以在后台查询后直接生成
     //   $columns = explode(",", $_POST['headers']);
     //   $info = explode("|", $_POST['rows']);
     //   foreach ($info as $elem)
     //   {   
      //      $row = explode(",", $elem);
      //      $rows[] = $row;
     //   }   

    //    $excel->render($rows, $columns);
    //    $excel->download();
    }	
	/**
     * @desc 导入excel
     */
    public static function actionImport()
    {
    	ini_set('memory_limit', '256m');
        $total = 0; 
        if (isset($_FILES['userfile']))
        {    
            if ($_FILES['userfile']['type'] != 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet')
            {    
                header('Content-type: text/html; charset=utf-8');
                die('您上传的不是excel 2007 格式的文件。');
            }    
			
            $excel = ExcelImport::getInstance();
            // 每一列的列名
            $excel->init(array('columnNames' => array('Name', 'StudyNo', 'Subject')));
            $excel->load($_FILES['userfile']['tmp_name']);

			// 学校ID利用当前登录用户的SchoolID
            $schoolID = Yii::app()->session->get('SchoolID');
            
            // rows为导入的数据行, 每一行为key => value的数据
            $rows = $excel->getValues();
            $total = count($rows);
            $succCount = 0;
            
            foreach ($rows as $row)
            {
            	// 给学生添加对应用户, 密码默认为666666
            	$uid = AdminUtil::createUser($row['StudyNo'], '666666', 1);
            	if (0 == $uid)	// 创建用户失败
            	{
            		continue;
            	}
         	
            	$fields = array('UID' => $uid, 'Name' => $row['Name'], 'StudyNo' => $row['StudyNo'], 'GraSchool' => $row['GraSchool']);
            	$fields['Sex'] = ($row['Sex'] == '男')? 1 : 0;
            	$fields['Type'] = ($row['TypeName'] == '应届')? 0 : 1;
            	$fields['IsLocal'] = ($row['LocalName'] == '是')? 1 : 0;
            	$fields['EntryTime' ] = date('Y-m-d H:i:s', strtotime($row['EntryTime']));
            	
            	if (isset($classList[$row['ClassName']]))
            	{            		
            		$classInfo = $classList[$row['ClassName']];
            		$fields['ClassID'] = $classInfo['ClassID'];
            		$fields['SchoolID'] = $classInfo['SchoolID'];
            		$fields['GradeID'] = $classInfo['GradeID'];	
            	}
            	
            	$record = new InfoStudent();
            	$record->setAttributes($fields);
            	if ($record->save())
            	{
            		$succCount++;
            	}           		
            }
            
            $this->layout = false;
        	$result = array('success' => true, 'msg' => '文件导入成功', 'total' => $total, 'succ' => $succCount);
        	$this->renderText(json_encode(result));
        }
    }
}
