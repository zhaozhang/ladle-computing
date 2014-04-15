<?php

class ManSubjectController extends CommonController
{
    public function actionIndex()
    {
        $this->renderPartial('index');
    }
    /*
     * 获取基本科目列表，就是没有关联科目的科目
     */
    public function actionGetsubject()
    { 
        $this->layout = false;
    	$result = array('success' => true, 'data' => array());
    	$uid = Yii::app()->user->getId();
    	if(!$uid){
    		$result['success'] = false;
    		$result['msg'] = '用户未登录';
    		$this->renderText(json_encode($result));
    		return;
    	}
    	$sessionInfo = AdminUtil::getUserSessionInfo($uid);
    	$schoolid = $sessionInfo['school_id'];
    	$roleid = $sessionInfo['role_id'];
        if($roleid != 5 )
    	{
    		$result['success'] = false;
    		$result['msg'] = '用户无权限';
    		$this->renderText(json_encode($result));
    		return;
    	}
        	
        $s = '{"success": true, "msg": "", "data":[';
        // 获取所有年级
        //$subjectList = InfoSubject::model()->findAllByAttributes(array('SchoolID'=>$schoolid,'ReferSubjectID'=>'', 'State' => 1));
        $subjectList = InfoSubject::model()->findAll("(SchoolID = 0 OR SchoolID = :SchoolID) and ReferSubjectID = '' and State = 1",array('SchoolID'=>$schoolid));
        foreach ($subjectList as $subjectRecord)
        {
        	$subjectInfo = array_change_key_case((array)$subjectRecord->getAttributes(), CASE_LOWER);
        	$s=$s.'{"id":"'. $subjectInfo["subjectid"].'","text":"'. $subjectInfo["subjectname"].'"},';
        }
        if(count($subjectList)>0)
        {
        	$s=substr($s,0,-1);
        }
        $s=$s.']}';
        
        /*
        $s = 
        '{
		  "success": true,
		  "msg": "",
		  "data": [
		    {
		      "id": "1",
		      "text": "语文"
		    },
		    {
		      "id": "2",
		      "text": "数学"
		    },
		    {
		      "id": "3",
		      "text": "英语"
		    }
		  ]
		}';*/
        echo $s;
    }    
    /*
     * 获取科目列表
     */
    public function actionGetsubjectall()
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
    	 
    	$s = '{"success": true, "msg": "", "data":[';
    	// 获取所有年级
    	$subjectList = InfoSubject::model()->findAllByAttributes(array('SchoolID'=>$schoolid, 'State' => 1));
    	foreach ($subjectList as $subjectRecord)
    	{
    		$subjectInfo = array_change_key_case((array)$subjectRecord->getAttributes(), CASE_LOWER);
    		$s=$s.'{"subjectid":"'. $subjectInfo["subjectid"] 
    				.'","schoolid":"'.$subjectInfo["schoolid"]
    				.'","refersubjectid":"'.$subjectInfo["refersubjectid"]
    				.'","subjectname":"'.$subjectInfo["subjectname"]
    				.'","type":"'."0"
    				.'","fullscore":"'.$subjectInfo["fullscore"]
    				.'","passscore":"'.$subjectInfo["passscore"].'"},';
    	}
    	if(count($subjectList)>0)
    	{
    		$s=substr($s,0,-1);
    	}
    	$s=$s.']}';
    	/*
	   	$s = '';
        $s = 
        '{
		  "success": true,
		  "msg": "",
		  "data": [
		    {
		      "subjectid": "1",
		      "schoolid": "0",
		      "refersubjectid": "",
		      "subjectname": "语文",
		      "type": "0",
		      "fullscore": "150",
		      "passscore" : "90"
		    },
		    {
		      "subjectid": "2",
		      "schoolid": "0",
		      "refersubjectid": "",
		      "subjectname": "数学",
		      "type": "0",
		      "fullscore": "150",
		      "passscore" : "90"
		    },
		    {
		      "subjectid": "4",
		      "schoolid": "1",
		      "refersubjectid": "",
		      "subjectname": "物理",
		      "type": "2",
		      "fullscore": "100",
		      "passscore" : "60"
		    },
		    {
		      "subjectid": "7",
		      "schoolid": "1",
		      "refersubjectid": "1,2",
		      "subjectname": "综合",
		      "type": "1",
		      "fullscore": "300",
		      "passscore" : "120"
		    }
		  ]
		}';
		*/
        echo $s;
    }    
    /*
     * 更新科目
     */
	public function actionUpdatesubject()
	{
    	/*$schoolid	= isset($_POST['SchoolID'])?$_POST['SchoolID']:0;
		$subjectid	= isset($_POST['SubjectID'])?$_POST['SubjectID']:0;
		$subjectname	= isset($_POST['SubjectName'])?$_POST['SubjectName']:0;
		$refersubjectid	= isset($_POST['ReferSubjectID'])?$_POST['ReferSubjectID']:0;
		$fullscore	= isset($_POST['FullScore'])?$_POST['FullScore']:0;
		$passscore	= isset($_POST['PassScore'])?$_POST['PassScore']:0;
		*/
	    $this->layout = false;
    	$result = array('success' => true, 'data' => array());
    	$uid = Yii::app()->user->getId();
    	if(!$uid){
    		$result['success'] = false;
    		$result['msg'] = '用户未登录';
    		$this->renderText(json_encode($result));
    		return;
    	}
    	$sessionInfo = AdminUtil::getUserSessionInfo($uid);
    	$schoolid = $sessionInfo['school_id'];
    	$roleid = $sessionInfo['role_id'];
        if($roleid != 5 )
    	{
    		$result['success'] = false;
    		$result['msg'] = '用户无权限';
    		$this->renderText(json_encode($result));
    		return;
    	}
    	
		$fields = array();
			
		if (isset($_POST['SchoolID']))
		{
			$fields['SchoolID'] = $schoolid;
		}
		if (isset($_POST['SubjectID']))
		{
			$fields['SubjectID'] = intval($_POST['SubjectID']);
		}
		if (isset($_POST['SubjectName']))
		{
			$fields['SubjectName'] = $_POST['SubjectName'];
		}
		if (isset($_POST['ReferSubjectID']))
		{
			$fields['ReferSubjectID'] = $_POST['ReferSubjectID'];
		}
		if (isset($_POST['FullScore']))
		{
			$fields['FullScore'] = $_POST['FullScore'];
		}
		if (isset($_POST['PassScore']))
		{
			$fields['PassScore'] = $_POST['PassScore'];
		}
		$result['msg'] = '科目添加失败';
		
		if (0 == $fields['SubjectID']) //添加
		{
			$record = new InfoSubject();

			$record->State = 1;
			$record->CreateTime=date("Y-m-d H:i:s");
			$record->CreatorID=$uid;
			unset($fields['SubjectID']);
			
			foreach ($fields as $key => $value)
			{
				$record->$key = $value;
			}
		
			if ($record->save() && $record->validate())
			{
			//	var_dump($record);
				$result['success'] = true;
				$result['msg'] = '科目添加成功';
				$result["data"]["id"]=$record->getPrimaryKey();
			}
		}
		else
		{
			$record = InfoSubject::model()->findByPk($fields['SubjectID'], "State = 1");
			if (empty($record))
			{
				$result['success'] = false;
				$this->renderText(json_encode($result));
				return;
			}
		
			$affectedRow = $record->updateByPk($fields['SubjectID'], $fields);
		//	if (1 == $affectedRow)
			{
				$result['success'] = true;
				$result['msg'] = '科目修改成功!';
			}
		}
		$this->renderText(json_encode($result));
		
		/*
		if(0 == $subjectid) //添加
			$s = '
				{
					"success":true,
					"msg":"科目添加成功!"
				}';
		else			//修改 
			$s = '
				{
					"success":true,
					"msg":"科目修改成功!"
				}';	
			
		echo $s;*/	
	}   
	 /*
     * 删除科目
     */
	public  function actionDeletesubject()
	{
	    $this->layout = false;
    	$result = array('success' => true, 'data' => array());
    	$uid = Yii::app()->user->getId();
    	if(!$uid){
    		$result['success'] = false;
    		$result['msg'] = '用户未登录';
    		$this->renderText(json_encode($result));
    		return;
    	}
    	$sessionInfo = AdminUtil::getUserSessionInfo($uid);
    	$schoolid = $sessionInfo['school_id'];
    	$roleid = $sessionInfo['role_id'];
        if($roleid != 5 )
    	{
    		$result['success'] = false;
    		$result['msg'] = '用户无权限';
    		$this->renderText(json_encode($result));
    		return;
    	}
    	
		$subjectid	= isset($_POST['SubjectID'])?$_POST['SubjectID']:0;
		
		$this->layout = false;
		
		$result = array('msg' => '科目删除成功!', 'data' => array());

		$affectedRow = InfoSubject::model()->UpdateByPk($subjectid, array('State' => 0));
		
		$result['success'] = 1 == count($affectedRow);
		$this->renderText(json_encode($result));
		
		/*$s = '
			{
				"success":true,
				"msg":"科目删除成功!"
			}';			
		echo $s;
		*/
	}
}
