<?php

class ManClassController extends CommonController
{
    public function actionIndex()
    {
        $this->renderPartial('index');
    }
    /*
     * 获取年级列表
     * 根据用户角色，获取他可以编辑的年级列表
     * 教导管理人，返回所有年级；年级主任，返回所管理的年级
     */
    public function actionGetgrade()
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
    	$gradeList = InfoGrade::model()->findAllByAttributes(array('SchoolID' => $schoolid, 'State' => 1));
    	foreach ($gradeList as $gradeRecord)
    	{
    		$gradeInfo = array_change_key_case((array)$gradeRecord->getAttributes(), CASE_LOWER);
    		$s=$s.'{"gradeid": "'. $gradeInfo["gradeid"] .'", "gradename":"'.$gradeInfo["gradename"].'"},';   		
    	}
    	if(count($gradeList)>0)
    	{
    		$s=substr($s,0,-1);
    	}
       	$s=$s.']}';
    	//$this->renderText(json_encode($result));
    	
        /*
        $s = 
        '{
		  "success": true,
		  "msg": "",
		  "data": [
		    {
		      "gradeid": "1",
		      "gradename": "高2014级"
		    },
		    {
		      "gradeid": "2",
		      "gradename": "高2015级"
		    },
		    {
		      "gradeid": "3",
		      "gradename": "高2016级"
		    }
		  ]
		}';
		*/
        echo $s;
    }    
    /*
     * 获取班级列表
     * 根据年级id获取班级列表
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
        if($roleid != 5 )
    	{
    		$result['msg'] = '用户无权限';
    		$this->renderText(json_encode($result));
    		return;
    	}
    	
		$gradeid	= isset($_POST['GradeID'])?$_POST['GradeID']:0;
		 
		if (!isset($_POST['GradeID']))
		{
			$result['msg'] = '参数错误';
			$this->renderText(json_encode($result));
			return;
		}
		$gradeid= (int)($_POST['GradeID']);
		 
		$s = '{"success": true, "msg": "", "data":[';
		// 获取所有年级
		$classList = InfoClass::model()->findAllByAttributes(array('GradeID'=>$gradeid, 'State' => 1));
		foreach ($classList as $classRecord)
		{
			$classInfo = array_change_key_case((array)$classRecord->getAttributes(), CASE_LOWER);
			$s=$s.'{"classid": "'. $classInfo["classid"] .'", "classname":"'.$classInfo["classname"].'", "classlevel":"'.$classInfo["classlevel"].'","type": "'. $classInfo["type"].'" },';
		}
		if(count($classList)>0)
		{
    		$s=substr($s,0,-1);
		}
       	$s=$s.']}';
		
        /*
        if($gradeid == '1')
	        $s = 
	        '{
			  "success": true,
			  "msg": "",
			  "data": [
			    {
			      "classid": "1",
			      "classname": "1班",
			      "type": "0",
			      "classlevel":"1"
			    },
			    {
			      "classid": "2",
			      "classname": "2班",
			      "type": "1",
			      "classlevel":"1"
			    },
			    {
			      "classid": "3",
			      "classname": "3班",
			      "type": "2",
			      "classlevel":"2"
		   }
			  ]
			}';
	    else if($gradeid == '2')
	        $s = 
	        '{
			  "success": true,
			  "msg": "",
			  "data": [
			    {
			      "classid": "1",
			      "classname": "4班",
			      "type": "0",
			      "classlevel":"1"
			    },
			    {
			      "classid": "2",
			      "classname": "5班",
			      "type": "1",
			      "classlevel":"1"
			    },
			    {
			      "classid": "3",
			      "classname": "6班",
			      "type": "2",
			      "classlevel":"1"
			    }
			  ]
			}'; 
	    else if($gradeid == '3')
	        $s = 
	        '{
			  "success": true,
			  "msg": "",
			  "data": [
			    {
			      "classid": "1",
			      "classname": "7班",
			      "type": "0",
			      "classlevel":"1"
			    },
			    {
			      "classid": "2",
			      "classname": "8班",
			      "type": "1",
			      "classlevel":"1"
			    },
			    {
			      "classid": "3",
			      "classname": "9班",
			      "type": "2",
			      "classlevel":"1"
			    }
			  ]
			}'; 	*/          
        echo $s;
    }  
    /*
     * 更新年级
     */
	public function actionUpdategrade()
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
        if($roleid != 5 )
    	{
    		$result['msg'] = '用户无权限';
    		$this->renderText(json_encode($result));
    		return;
    	}
		$fields = array();
			
		if (isset($_POST['SchoolID']))
		{
			$fields['SchoolID'] = intval($_POST['SchoolID']);
		}
		if (isset($_POST['GradeID']))
		{
			$fields['GradeID'] = intval($_POST['GradeID']);
		}
		if (isset($_POST['GradeName']))
		{
			$fields['GradeName'] = $_POST['GradeName'];
			//$fields['GradeName'] = htmlentities($_POST['GradeName'], ENT_QUOTE);
		}
		
		if (0 == $fields['GradeID']) //添加
		{
			$record = new InfoGrade();
			
			$record->State = 1;
			$record->CreateTime=date("Y-m-d H:i:s");
			$record->CreatorID="1";
		
            unset($fields['GradeID']);
			foreach ($fields as $key => $value)
			{
				$record->$key = $value;
			}
		
			if ($record->save() && $record->validate())
			{
				//var_dump($record);
				$result['success'] = true;
				$result['msg']  = '年级添加成功';
				$result["data"]["id"]=$record->getPrimaryKey();
			}
		}
		else
		{
			$record = InfoGrade::model()->findByPk($fields['GradeID'], "State = 1");
			if (empty($record))
			{
				$result['msg']  = '年级错误';
				$this->renderText(json_encode($result));
				return;
			}
		
			$affectedRow = $record->updateByPk($fields['GradeID'], $fields);
		//	if (1 == $affectedRow)
			{
				$result['success'] = true;
				$result['msg'] = '年级修改成功!';
				$newid=$fields['GradeID'];
			}
		}

		$this->renderText(json_encode($result));

		
		/*if(0 == $gradeid) //添加
			$s = '
				{
					"success":true,
					"msg":"年级添加成功!"
				}';
		else			//修改 
			$s = '
				{
					"success":true,
					"msg":"年级修改成功!"
				}';		
		echo $s;*/
	}   
    /*
     * 更新班级
     */
	public function actionUpdateclass()
	{
    	/*
    	$schoolid	= isset($_POST['SchoolID'])?$_POST['SchoolID']:0;
		$gradeid	= isset($_POST['GradeID'])?$_POST['GradeID']:0;
		$classid	= isset($_POST['ClassID'])?$_POST['ClassID']:0;
		$classname	= isset($_POST['ClassName'])?$_POST['ClassName']:0;
		$type		= isset($_POST['Type'])?$_POST['Type']:0;
		$classlevel	= isset($_POST['ClassLevel'])?$_POST['ClassLevel']:0;
*/
		
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
        if($roleid != 5 )
    	{
    		$result['msg'] = '用户无权限';
    		$this->renderText(json_encode($result));
    		return;
    	}
    	
		$fields = array();
			
		if (isset($_POST['SchoolID']))
		{
			$fields['SchoolID'] = intval($_POST['SchoolID']);
		}
		if (isset($_POST['GradeID']))
		{
			$fields['GradeID'] = intval($_POST['GradeID']);
		}
		if (isset($_POST['ClassID']))
		{
			$fields['ClassID'] = $_POST['ClassID'];
		}
		if (isset($_POST['ClassName']))
		{
			$fields['ClassName'] = $_POST['ClassName'];
		}
		if (isset($_POST['ClassLevel']))
		{
			$fields['ClassLevel'] = $_POST['ClassLevel'];
		}
		if (isset($_POST['Type']))
		{
			$fields['Type'] = $_POST['Type'];
		}

		$result['msg'] = '班级操作失败';
		if (0 == $fields['ClassID']) //添加
		{
			$record = new InfoClass();
			
			$record->State = 1;
			$record->CreateTime=date("Y-m-d H:i:s");
			$record->CreatorID=1;
			$record->ClassLevel=1;
            unset($fields['ClassID']);

			foreach ($fields as $key => $value)
			{
				$record->$key = $value;
			}

			if ($record->save() && $record->validate())
			{
				$result['success'] = true;
				$result['msg'] = '班级添加成功';
				$result["data"]["id"]=$record->getPrimaryKey();
			}
		}
		else
		{
			$record = InfoClass::model()->findByPk($fields['ClassID'], "State = 1");
			if (empty($record))
			{
				$result['success'] = false;
				$result['msg'] = '班级修改失败';
				$this->renderText(json_encode($result));
				return;
			}
		
			$affectedRow = $record->updateByPk($fields['ClassID'], $fields);
		//	if (1 == $affectedRow)
			{
				$result['success'] = true;
				$result['msg'] = '班级修改成功!';
			}
		}
		
		$this->renderText(json_encode($result));		/*
		if(0 == $classid) //添加
			$s = '
				{
					"success":true,
					"msg":"班级添加成功!"
				}';
		else			//修改 
			$s = '
				{
					"success":true,
					"msg":"班级修改成功!"
				}';			
		echo $s;*/
	}   
	 /*
     * 删除年级
     */
	public function actionDeletegrade()
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
    	
		$gradeid = isset($_POST['GradeID'])?$_POST['GradeID']:0;

		$result = array('success' => true, 'msg' => '年级删除成功!', 'data' => array());
		
		if (!isset($gradeid))
		{
			$result['success'] = false;
			$result['msg'] = '参数错误';
			$this->renderText(json_encode($result));
			return;
		}
		
		$succCount = 0;
		
		// 获取所有年级
		$gradeList = InfoGrade::model()->findAllByAttributes(array('GradeID' => $gradeid, 'State' => 1));
		foreach ($gradeList as $gradeRecord)
		{
			// 获取年级下的班级
			$classList = InfoClass::model()->findAllByAttributes(array('GradeID' => $gradeRecord->GradeID, 'State' => 1));
			foreach ($classList as $classRecord)
			{
				$classInfo = array_change_key_case((array)$classRecord->getAttributes(), CASE_LOWER);
				$affectedRow = InfoClass::model()->UpdateByPk($classInfo["classid"], array('State' => 0));
				if (1 == $affectedRow)
				{
					$succCount += 1;
				}
			}
			$affectedRow = InfoGrade::model()->UpdateByPk($gradeid, array('State' => 0));
		
			//$result['success'] = $succCount == count($affectedRow);
		}
		
		$this->renderText(json_encode($result));
		
		/*
		$gradeid = isset($_POST['GradeID'])?$_POST['GradeID']:0;
		$s = '
			{
				"success":true,
				"msg":"年级删除成功!"
			}';			
		echo $s;
		*/
	}
	 /*
     * 删除班级
     */
	public  function actionDeleteclass()
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
    	
		$classids = isset($_POST['ClassIDs'])? $_POST['ClassIDs'] : 0;//可以是多个，英文逗号隔开
		$classidList = explode(",", $classids);

		$result = array('msg' => '班级删除成功!', 'data' => array());
		$succCount = 0;
		foreach ($classidList as $classid)
		{
			$affectedRow = InfoClass::model()->UpdateByPk($classid, array('State' => 0));
			if (1 == $affectedRow)
			{
				$succCount += 1;
			}
		}
		
		$result['success'] = $succCount == count($classidList);
		$this->renderText(json_encode($result));
		
		/*
		$classids = isset($_POST['ClassIDs'])?$_POST['ClassIDs']:0;//可以是多个班级id，英文逗号隔开
		$s = '
			{
				"success":true,
				"msg":"班级删除成功!"
			}';			
		echo $s;
		*/
	}	
}
