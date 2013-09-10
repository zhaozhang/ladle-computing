<?php

class ManExamController extends CommonController
{
    public function actionIndex()
    {
        $this->renderPartial('index');
    }
    /*
     * 获取年级列表
     */
    public function actionGetgrade()
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
            	'id' => $gradeInfo["gradeid"],
	            'text'=> $gradeInfo["gradename"], 
	            'selected'=>false);

            $result['data'][] = $gradejson;
        }

        $this->renderText(json_encode($result));
    	/*
        $s = '';
        $s = 
        '{
		  "success": true,
		  "msg": "",
		  "data": [
		    {
		      "id": "1",
		      "text": "高2014级",
		      "selected":true
		    },
		    {
		      "id": "2",
		      "text": "高2015级",
		      "selected":false
		    },
		    {
		      "id": "3",
		      "text": "高2016级",
		      "selected":false
		    }
		  ]
		}';
        echo $s;*/
    }    
    /*
     * 获取考试列表
     */    
    public function actionGetexam()
    {
		$schoolid	= isset($_POST['SchoolID'])?$_POST['SchoolID']:0;
		$gradeid	= isset($_POST['GradeID'])?$_POST['GradeID']:0;
		$type	= 	isset($_POST['Type'])?$_POST['Type']:'';
		
		$this->layout = false;
        $result = array('success' => true, 'msg' => '');
        if('' == $type)
        	$recordList = InfoExam::model()->findAll("GradeID = ".$gradeid." and State = 1",
        		array());   
        else
        	$recordList = InfoExam::model()->findAll("GradeID = ".$gradeid." and Type = ".$type." and State = 1",
        		array());       		
        foreach ($recordList as $record)
        {
            $examInfo = $record->getAttributes();
            $examInfo["fromexamid"] = "0";
            $result['data'][] = array_change_key_case($examInfo, CASE_LOWER);
        }    

        $this->renderText(json_encode($result));
        /*
        $s = '';

        $s = 
        '{
		  "success": true,
		  "msg": "",
		  "data": [
		    {
		      "examid": "1",
		      "fromexamid" : "0",
		      "schoolid": "1",
		      "examname": "考试1",
		      "examtime": "2013-5-8",
		      "gradeid": "1",
		      "type": "1",
		      "Rank1": "310",
		      "Rank2": "900",
		      "Rank3": ""
		    },
		    {
		      "examid": "2",
		      "fromexamid" : "0",
		      "schoolid": "1",
		      "examname": "考试2",
		      "examtime": "2013-5-8",
		      "gradeid": "1",
		      "type": "2",
		      "Rank1": "310",
		      "Rank2": "900",
		      "Rank3": ""
		    },
		    {
		      "examid": "3",
		      "fromexamid" : "0",
		      "schoolid": "1",
		      "examname": "考试3",
		      "examtime": "2013-6-8",
		      "gradeid": "1",
		      "type": "0",
		      "Rank1": "310",
		      "Rank2": "900",
		      "Rank3": ""
		    }
		  ]
		}';
        echo $s;*/
    }  
	/*
	 * 获取考试相关科目列表
	 */ 
    public function actionGetsubject()
    {
    	$examid	= isset($_POST['ExamID'])?$_POST['ExamID']:0;
    	
    	$this->layout = false;
        $result = array('success' => true, 'msg' => '');
		$connection=Yii::app()->db; 
		$sql="select * from v_exam_subject where ExamID = ".$examid." order by ExamID";
		$rows=$connection->createCommand ($sql)->query();
		foreach ($rows as $k => $v ){
			$result['data'][] = array_change_key_case($v, CASE_LOWER);
		}
/*       
        $recordList = InfoExamSubject::model()->findAll("ExamID = ".$examid."",
        	array());    		
        foreach ($recordList as $record)
        {
            $examsubjectInfo = $record->getAttributes();
            $result['data'][] = array_change_key_case($examsubjectInfo, CASE_LOWER);
        }    
*/
        $this->renderText(json_encode($result));
        /*
		//	"selected":false
    	$s = '{
			  "success": true,
			  "msg": "",
			  "data": [
			    {
			      "subjectid": "1",
			      "subjectname": "语文",
			      "isuse": "1",
			      "fullscore": "150",
			      "passscore": "90",
			      "scorerange": "0-60,61-90,91-120,121-150"
			    },
			    {
			      "subjectid": "1",
			      "subjectname": "数学",
			      "isuse": "0",
			      "fullscore": "150",
			      "passscore": "90",
			      "scorerange": "0-60,61-90,91-120,121-150"
			    }
			  ]
			}';
        echo $s;*/
	}    
    /*
     * 更新考试
     */
	public function actionUpdateexam()
	{
		$this->layout = false;
		$fields = array();
		if (isset($_POST['SchoolID']))
		{
			$fields['SchoolID'] = intval($_POST['SchoolID']);
		}
		if (isset($_POST['ExamID']))
		{
			$fields['ExamID'] = intval($_POST['ExamID']);
		}
		if (isset($_POST['ExamName']))
		{
			$fields['ExamName'] = $_POST['ExamName'];
		}
		if (isset($_POST['ExamTime']))
		{
			$fields['ExamTime'] = $_POST['ExamTime'];
		}		
		if (isset($_POST['GradeID']))
		{
			$fields['GradeID'] = intval($_POST['GradeID']);
		}
		if (isset($_POST['Type']))
		{
			$fields['Type'] = intval($_POST['Type']);
		}
		if (isset($_POST['Rank1']))
		{
			$fields['Rank1'] = intval($_POST['Rank1']);
		}
		if (isset($_POST['Rank2']))
		{
			$fields['Rank2'] = intval($_POST['Rank2']);
		}
		if (isset($_POST['Rank3']))
		{
			$fields['Rank3'] = intval($_POST['Rank3']);
		}
		$result = array('msg' => '', 'data' => array());
		$success = false;
		if(0 == $fields['ExamID']) //添加
		{
			$trans = Yii::app()->db->beginTransaction();   
			try { 
				$record = new InfoExam();
				
				$record->State = 1;
				$record->CreateTime=date("Y-m-d H:i:s");
				$record->CreatorID="1";
			
	            unset($fields['ExamID']);
				foreach ($fields as $key => $value)
				{
					$record->$key = $value;
				}
				if ($record->save() && $record->validate())
				{
					//var_dump($record);
        			$recordList = InfoSubject::model()->findAll("(SchoolID = ".$fields['SchoolID']." or SchoolID = 0) and State = 1",
        				array());		
					foreach ($recordList as $record_s)
			        {	            	
			            $subjectinfo = array_change_key_case((array)$record_s->getAttributes(), CASE_LOWER);		
						$record_subject = new InfoExamSubject();
						$record_subject->ExamID = $record->getPrimaryKey();
						$record_subject->SubjectID = $subjectinfo["subjectid"];
						$record_subject->FullScore = $subjectinfo["fullscore"];
						$record_subject->PassScore = $subjectinfo["passscore"];
						$record_subject->ScoreRange = "";
						$record_subject->State = 0;
						
						if (!$record_subject->save() || !$record_subject->validate())
						{
							$trans->rollback();
						}
			        }  
					$success = true;
					$msg = '考试添加成功';
					$result["data"]["id"]=$record->getPrimaryKey();
					$trans->commit(); 
				}
				else
				{
					$trans->rollback();
				}
			} catch (Exception $e) {   
		    	$trans->rollback();     
			}  
		}
		else			//修改
		{ 
			$record = InfoExam::model()->findByPk($fields['ExamID'], "State = 1");
			if (empty($record))
			{
				$result['success'] = false;
				$this->renderText(json_encode($result));
				return;
			}
		
			$affectedRow = $record->updateByPk($fields['ExamID'], $fields);
			if (1 == $affectedRow)
			{
				$success = true;
				$msg = '考试修改成功!';
			}		
		}
		$result['success'] = $success;
		$result['msg'] = $msg;
		$this->renderText(json_encode($result));
	}   
    /*
     * 更新科目
     */
	public function actionUpdatesubject()
	{	
		$this->layout = false;
		$fields = array();
		if (isset($_POST['ExamID']))
		{
			$fields['ExamID'] = intval($_POST['ExamID']);
		}
		if (isset($_POST['SubjectID']))
		{
			$fields['SubjectID'] = intval($_POST['SubjectID']);
		}
		if (isset($_POST['State']))
		{
			$fields['State'] = intval($_POST['State']);
		}
		if (isset($_POST['FullScore']))
		{
			$fields['FullScore'] = $_POST['FullScore'];
		}		
		if (isset($_POST['PassScore']))
		{
			$fields['PassScore'] = intval($_POST['PassScore']);
		}
		if (isset($_POST['ScoreRange']))
		{
			$fields['ScoreRange'] = intval($_POST['ScoreRange']);
		}
		
		$result = array('msg' => '', 'data' => array());
		$success = false;
		$record = InfoExamSubject::model()->findAllByPk(array (
                                'ExamID'=>$fields['ExamID'], 
                                'SubjectID'=>$fields['SubjectID']
                        ));
		if (empty($record))
		{
			$result['success'] = false;
			$this->renderText(json_encode($result));
			return;
		}
		$affectedRow = InfoExamSubject::model()->updateByPk(array (
                                'ExamID'=>$fields['ExamID'], 
                                'SubjectID'=>$fields['SubjectID']
                        ), $fields);

       	if (1 == $affectedRow)
		{
			$success = true;
			$msg = '科目修改成功!';
		}		
		$result['success'] = $success;
		$result['msg'] = $msg;
		$this->renderText(json_encode($result));
		/*
		$s = '
			{
				"success":true,
				"msg":"科目更新成功!"
			}';
	
		echo $s;*/
	}   
	 /*
     * 删除考试
     */
	public  function actionDeleteexam()
	{
		$examid	= isset($_POST['ExamID'])?$_POST['ExamID']:0;
		
		$this->layout = false;
		
		$result = array('msg' => '考试删除成功!', 'data' => array());

		$affectedRow = InfoExam::model()->UpdateByPk($examid, array('State' => 0));
		
		$result['success'] = 1 == count($affectedRow);
		$this->renderText(json_encode($result));
		/*
		$examid	= isset($_POST['ExamID'])?$_POST['ExamID']:0;
		$s = '
			{
				"success":true,
				"msg":"考试删除成功!"
			}';			
		echo $s;*/
	}
}
