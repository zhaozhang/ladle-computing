<?php
ini_set('max_execution_time', 600);

class ManTeacherController extends CommonController
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
		$selected = false;
    	if($roleid == 5)
        	// 获取所有年级
        	$gradeList = InfoGrade::model()->findAllByAttributes(array('SchoolID' => $schoolid, 'State' => 1));
        else
        {
        	$selected = true;
        	$gradeList = InfoGrade::model()->findAllByAttributes(array('GradeID' => $gradeid, 'State' => 1));	
        }
        foreach ($gradeList as $gradeRecord)
        {
            $gradeInfo = array_change_key_case((array)$gradeRecord->getAttributes(), CASE_LOWER);
            
            $gradejson = array(
            	'id' => 'g-'.$gradeInfo["gradeid"],
	            'gid' => $gradeInfo["gradeid"], 
	            'text'=> $gradeInfo["gradename"], 
	            'selected'=>$selected,
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
		            'gid' => $gradeInfo["gradeid"], 
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
			      "gid":"1",
			      "text": "高2014级",
			      "selected": false,
			      "iconCls": "",
			      "children": [
			        {
			          "id": "1",
			          "gid": "1",
			          "text": "高2014级1班",
			          "selected": true,
			          "iconCls": ""
			        },
			        {
			          "id": "2",
			          "gid": "1",			          
			          "text": "高2014级2班",
			          "selected": false,
			          "iconCls": ""
			        }
			      ]
			    },
			    {
			      "id": "g-2",
			      "gid": "2",
			      "text": "高2015级",
			      "selected": false,
			      "iconCls": "",
			      "children": [
			        {
			          "id": "3",
			          "gid": "2",			          
			          "text": "高2015级1班",
			          "selected": false,
			          "iconCls": "",
			          "checked": false
			        },
			        {
			          "id": "4",
			          "gid": "2",			          
			          "text": "高2015级2班",
			          "selected": false,
			          "iconCls": "",
			          "checked": false
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
         echo $s;
        /*
		//	"selected":false
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
			      "selected": true
			    }
			  ]
			}';
        echo $s;*/
	}
	/*
	 * 查询教师
	 */ 
    public function actionGetteacher()
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
    	  	
    	//有可能是年级id  g-1 的形式
    	$classid 		= isset($_POST['ClassID'])?$_POST['ClassID']:'';
    	$subjectids		= isset($_POST['SubjectIDs'])?$_POST['SubjectIDs']:'';
    	$name	= isset($_POST['Name'])?$_POST['Name']:'';
    	$this->layout = false;
        $result = array('success' => true, 'msg' => '');
        if('' == $subjectids)
        	$subjectquery = "1 = 1";
        else	
        	$subjectquery = "subjectid in (".$subjectids.")";
		if('' == $name)
		{
			if(substr($classid,0,1) == 'g')//年级
	       // 	$sql="select * from v_teacher where gradeid = ".substr($classid,2,strlen($classid)-2)." and subjectid in (".$subjectids.") and state = 1";
				$sql="select username,roleid,uid,schoolid,subjectid,name,sex,ifnull(gradeid,'') as gradeid,ifnull(group_concat(distinct classid),'') as classids,ifnull(group_concat(distinct classidm),'') as manclassids,ifnull(group_concat(distinct gradeidm),'') as mangradeids
					from v_teacher
					where schoolid = ".$schoolid." and (gradeid = ".substr($classid,2,strlen($classid)-2)." or gradeidm = ".substr($classid,2,strlen($classid)-2).") 
					and ".$subjectquery." and state = 1 
					group by uid,schoolid,subjectid,name,sex,position,entrytime,gradeid,roleid,username";
	        else if("" == $classid)
	        	$sql="select username,roleid,uid,schoolid,subjectid,name,sex,ifnull(gradeid,'') as gradeid,ifnull(group_concat(distinct classid),'') as classids,ifnull(group_concat(distinct classidm),'') as manclassids,ifnull(group_concat(distinct gradeidm),'') as mangradeids
					from v_teacher
					where schoolid = ".$schoolid." and ".$subjectquery." and state = 1 
					group by uid,schoolid,subjectid,name,sex,position,entrytime,gradeid,roleid,username";
	        else 
	        	$sql="select username,roleid,uid,schoolid,subjectid,name,sex,ifnull(gradeid,'') as gradeid,ifnull(group_concat(distinct classid),'') as classids,ifnull(group_concat(distinct classidm),'') as manclassids,ifnull(group_concat(distinct gradeidm),'') as mangradeids
					from v_teacher
					where schoolid = ".$schoolid." and uid in (select uid from v_teacher where classid = ".$classid." or classidm = ".$classid.") 
					and ".$subjectquery." and state = 1 
					group by uid,schoolid,subjectid,name,sex,position,entrytime,gradeid,roleid,username";
		}
        else 
        {
         	if(substr($classid,0,1) == 'g')//年级
         		$sql="select username,roleid,uid,schoolid,subjectid,name,sex,ifnull(gradeid,'') as gradeid,ifnull(group_concat(distinct classid),'') as classids,ifnull(group_concat(distinct classidm),'') as manclassids,ifnull(group_concat(distinct gradeidm),'') as mangradeids
					from v_teacher
					where schoolid = ".$schoolid." and (gradeid = ".substr($classid,2,strlen($classid)-2)." or gradeidm = ".substr($classid,2,strlen($classid)-2).") 
					and ".$subjectquery." and name like '%".$name."%' and state = 1
					group by uid,schoolid,subjectid,name,sex,position,entrytime,gradeid,roleid,username";
	        else if("" == $classid)
	        	$sql="select username,roleid,uid,schoolid,subjectid,name,sex,ifnull(gradeid,'') as gradeid,ifnull(group_concat(distinct classid),'') as classids,ifnull(group_concat(distinct classidm),'') as manclassids,ifnull(group_concat(distinct gradeidm),'') as mangradeids
					from v_teacher
					where schoolid = ".$schoolid." and ".$subjectquery." and name like '%".$name."%' and state = 1
					group by uid,schoolid,subjectid,name,sex,position,entrytime,gradeid,roleid,username";
         	else
	        	$sql="select username,roleid,uid,schoolid,subjectid,name,sex,ifnull(gradeid,'') as gradeid,ifnull(group_concat(distinct classid),'') as classids,ifnull(group_concat(distinct classidm),'') as manclassids,ifnull(group_concat(distinct gradeidm),'') as mangradeids
					from v_teacher
					where uid in (select uid from v_teacher where classid = ".$classid." or classidm = ".$classid.") 
					and schoolid = ".$schoolid." and ".$subjectquery." and name like '%".$name."%' and state = 1
					group by uid,schoolid,subjectid,name,sex,position,entrytime,gradeid,roleid,username";
        }	
        $connection=Yii::app()->db; 
    	$rows=$connection->createCommand ($sql)->query();
		foreach ($rows as $k => $v ){
			
			$result['data'][] = array_change_key_case($v, CASE_LOWER);
		}
        $this->renderText(json_encode($result));
       /*
    	$s = '{"success":true,"msg":"","data":[{"roleid":"5","uid":"1","schoolid":"1","subjectid":"1","name":"ceshi","sex":"1","position":"","entrytime":"2013-07-27 19:25:43","gradeid":"3","classids":"3,4","manclassids":"","mangradeids":""}]}';
		echo $s;
    	
    	$s = '{
			  "success": true,
			  "msg": "",
			  "data": [
			    {
			      "uid": 1,
			      "name": "教师1",
			      "sex": "1",
			      "subjectid": "1",
			      "classids": "1,2",
			      "roleid" : "3",
			      "manclassids" : "1",
			      "mangradeids" : "1"
			    },
			    {
			      "uid": 2,
			      "name": "教师2",
			      "sex": "0",
			      "subjectid": "2",
			      "classids": "3",
			      "roleid" : "4",
			      "manclassids" : "",
			      "mangradeids" : "2"
			    }
			  ]
			}';
        echo $s;*/
	}	
	/*
	 * 删除教师
	 */ 
    public function actionDeleteteacher()
    {	
    	$this->layout = false;
    	$result = array('success' => false, 'data' => array());
    	$uid = Yii::app()->user->getId();
    	if(!$uid){
    		$result['msg'] = '用户未登录';
    		$this->renderText(json_encode($result));
    		return;
    	}
    	
    	$uids = isset($_POST['UIDs'])? $_POST['UIDs'] : 0;//可以是多个，英文逗号隔开
        $uidList = explode(",", $uids);

        $result = array('msg' => '教师删除成功!', 'data' => array());
        $succCount = 0;
        foreach ($uidList as $uid)
        {
            $affectedRow = InfoTeacher::model()->UpdateByPk($uid, array('State' => 0));
            if (1 == $affectedRow)
            {
                $succCount += 1;
            }
        }   

        $result['success'] = $succCount == count($uidList);
        $this->renderText(json_encode($result));
        /*
    	$uids = isset($_POST['UIDs'])?$_POST['UIDs']:0;//可以是多个，英文逗号隔开
		$s = '
			{
				"success":true,
				"msg":"教师删除成功!"
			}';			
		echo $s;*/
    }
    /*
     * 更新教师
     */
	public function actionUpdateteacher()
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
		$uido = isset($_POST['UID'])? $_POST['UID'] : 0;

        unset($_POST['UID']);
		if (isset($_POST['Name']))
        {
            $fields['Name'] = $_POST['Name'];
        }
        if (isset($_POST['Sex']))
        {
            $fields['Sex'] = $_POST['Sex'];
        }
        if (isset($_POST['SubjectID']))
        {
            $fields['SubjectID'] = $_POST['SubjectID'];
        }
		if (isset($_POST['SchoolID']))
        {
            $fields['SchoolID'] = $_POST['SchoolID'];
        }
        $result['msg'] = '操作失败';
        if (0 == $uido) //添加
        {
        	$trans = Yii::app()->db->beginTransaction();   
			try {   
				//需要先添加用户
	        	$record_user = new InfoUser();
	        	$record_user->UserName = $_POST['UserName'];
	        	$record_user->Pwd = '666666';
	        	$record_user->RegTime = date("Y-m-d H:i:s");
	        	$record_user->State = 1;
	        	if ($record_user->save() && $record_user->validate())
	            {
	        		$record = new InfoTeacher();
		            // TODO: 需要先根据角色为其生成1个uid
		            $record->UID = $record_user->getPrimaryKey();
		            $record->State = 1;
					$record->CreateTime=date("Y-m-d H:i:s");
					$record->CreatorID=Yii::app()->user->getId();
					
		            foreach ($fields as $key => $value)
		            {
		                $record->$key = $value;
		            }
		       //     var_dump($record);
		            if ($record->save() && $record->validate())
		            {
		            	//更新角色
		            
		            	$affectedRow = InfoUserrole::model()->updateAll(array('RoleID'=>$_POST['RoleID']),'UID = '.$record_user->getPrimaryKey());
						if(!InfoUserrole::model()->exists('UID = '.$record_user->getPrimaryKey()))
		            //	if(0 == $affectedRow)
		            	{
		            		//添加
		            		$record_ur = new InfoUserrole();
		            		$record_ur->UID = $record_user->getPrimaryKey();
		            		$record_ur->RoleID = $_POST['RoleID'];
		            		if (!$record_ur->save() || !$record_ur->validate())
		            		{
		            			$trans->rollback();
		            			$this->renderText(json_encode($result));
			            		return;
		            		}
		            	}
		            	//更新授课班级
		            	$classidarr = explode(',',$_POST['ClassIDs']);
		            	foreach ($classidarr as $classid)
		            	{
		            		if(substr($classid,0,1) == 'g'  || $classid == '')
		            			continue;
		            		$affectedRow = InfoTeachrelation::model()->updateAll(
		            			array('State'=>1,'CreateTime'=>date("Y-m-d H:i:s"),'CreatorID'=>$uid),
		            			'UID = '.$record_user->getPrimaryKey().' and ClassID = '.$classid.' and SubjectID = '.$fields['SubjectID']);
			            	if(0 == $affectedRow)
			            	{
			            		//添加
			            		$record_tr = new InfoTeachrelation();
			            		$record_tr->UID = $record_user->getPrimaryKey();
			            		$record_tr->ClassID = $classid;
			            		$record_tr->SubjectID = $fields['SubjectID'];
			            		$record_tr->State = 1;
								$record_tr->CreateTime=date("Y-m-d H:i:s");
								$record_tr->CreatorID=$uid;
			            		
			            		$record_class = InfoClass::model()->findByPk($classid, "State = 1");
			            		$record_tr->GradeID = $record_class['GradeID'];
			            		
			            		if (!$record_tr->save() || !$record_tr->validate())
			            		{
			            			$trans->rollback();
			            			$this->renderText(json_encode($result));
			            			return;
			            		}
			            	}
		            	}
						if('3' == $_POST['RoleID']) //班级管理者才可更新
						{
			            	//更新管理班级
			            	$manclassidarr = explode(',',$_POST['ManClassIDs']);
			            	foreach ($manclassidarr as $classidm)
			            	{
			            		if(substr($classidm,0,1) == 'g' || $classidm == '')
			            			continue;
			            		$affectedRow = InfoClassManage::model()->updateAll(
			            			array('State'=>1,'CreateTime'=>date("Y-m-d H:i:s"),'CreatorID'=>$uid),
			            			'UID = '.$record_user->getPrimaryKey().' and ClassID = '.$classidm);
				            	if(0 == $affectedRow)
				            	{
				            		//添加
				            		$record_cm = new InfoClassManage();
				            		$record_cm->UID = $record_user->getPrimaryKey();
				            		$record_cm->ClassID = $classidm;
				            		$record_cm->SchoolID = $fields['SchoolID'];
				            		$record_cm->State = 1;
									$record_cm->CreateTime=date("Y-m-d H:i:s");
									$record_cm->CreatorID=$uid;
	
				            		$record_class = InfoClass::model()->findByPk($classidm, "State = 1");
				            		$record_cm->GradeID = $record_class['GradeID'];
				            		
				            		if (!$record_cm->save() || !$record_cm->validate())
				            		{
				            			$trans->rollback();
				            			$this->renderText(json_encode($result));
				            			return;
				            		}
				            	}
			            	}		      
						}
						
						if('4' == $_POST['RoleID']) //年级管理者才可更新
						{
			            	//更新管理年级
			            	$mangradeidarr = explode(',',$_POST['ManGradeIDs']);
			            	foreach ($mangradeidarr as $gradeid)
			            	{
			            		if($gradeid == '')
			            			continue;
			            		$affectedRow = InfoGradeManage::model()->updateAll(
			            			array('State'=>1,'CreateTime'=>date("Y-m-d H:i:s"),'CreatorID'=>$uid),
			            			'UID = '.$record_user->getPrimaryKey().' and GradeID = '.$gradeid);
				            	if(0 == $affectedRow)
				            	{
				            		//添加
				            		$record_gm = new InfoGradeManage();
				            		$record_gm->UID = $record_user->getPrimaryKey();
				            		$record_gm->GradeID = $gradeid;
				            		$record_gm->SchoolID = $fields['SchoolID'];
				            		$record_gm->State = 1;
									$record_gm->CreateTime=date("Y-m-d H:i:s");
									$record_gm->CreatorID=$uid;
	
				            		if (!$record_gm->save() || !$record_gm->validate())
				            		{
				            			$trans->rollback();
				            			$this->renderText(json_encode($result));
				            			return;
				            		}
				            	}
			            	}	
						}
		                $result['success'] = true;
		                $result['msg'] = '教师添加成功';
		                $result["data"]["id"] = $record_user->getPrimaryKey();
		                $trans->commit(); 
		            }else 
		            	$trans->rollback();
	            }else 
	            	$trans->rollback();    
			} catch (Exception $e) {   
			    $trans->rollback();     
			}   
        }
        else 
        {
        	$trans = Yii::app()->db->beginTransaction();   
			try {  
	        	$record = InfoTeacher::model()->findByPk($uido, "State = 1");
	            if (empty($record))
	            {
	                $result['success'] = false;
	                $this->renderText(json_encode($result));
	                return; 
	            }
	            $affectedRow = $record->updateByPk($uido, $fields);

            	//更新角色
				$record_ur_s = InfoUserrole::model()->findByPk($uido);
				if (empty($record_ur_s))
				{
					//添加
            		$record_ur = new InfoUserrole();
            		$record_ur->UID = $uido;
            		$record_ur->RoleID = $_POST['RoleID'];
            		if (!$record_ur->save() || !$record_ur->validate())
            		{
            			$trans->rollback();
            			$this->renderText(json_encode($result));
	            		return;
            		}
				}
	            else 
	            {
	            	$affectedRow = InfoUserrole::model()->updateAll(array('RoleID'=>$_POST['RoleID']),'UID = '.$uido);
	            }

            	//更新授课班级
            	$classidarr = explode(',',$_POST['ClassIDs']);
            	$affectedRow = InfoTeachrelation::model()->updateAll(
            			array('State'=>0),
            			'UID = '.$uido);
            	foreach ($classidarr as $classid)
            	{
            		if(substr($classid,0,1) == 'g'  || $classid == '')
            			continue;
            		$affectedRow = InfoTeachrelation::model()->updateAll(
            			array('State'=>1,'CreateTime'=>date("Y-m-d H:i:s"),'CreatorID'=>$uid),
            			'UID = '.$uido.' and ClassID = '.$classid.' and SubjectID = '.$fields['SubjectID']);
	            	if(0 == $affectedRow)
	            	{
	            		//添加
	            		$record_tr = new InfoTeachrelation();
	            		$record_tr->UID = $uido;
	            		$record_tr->ClassID = $classid;
	            		$record_tr->SubjectID = $fields['SubjectID'];
	            		$record_tr->State = 1;
						$record_tr->CreateTime=date("Y-m-d H:i:s");
						$record_tr->CreatorID=$uid;
	            		
	            		$record_class = InfoClass::model()->findByPk($classid, "State = 1");
	            		$record_tr->GradeID = $record_class['GradeID'];
	            		
	            		if (!$record_tr->save() || !$record_tr->validate())
	            		{
	            			$trans->rollback();
	            			$this->renderText(json_encode($result));
	            			return;
	            		}
	            	}
            	}
		       $affectedRow = InfoClassManage::model()->updateAll(
            	array('State'=>0),
            	'UID = '.$uido);
            	if('3' == $_POST['RoleID']) //班级管理者才可更新
				{
	            	//更新管理班级
	            	$manclassidarr = explode(',',$_POST['ManClassIDs']);

	            	foreach ($manclassidarr as $classidm)
	            	{
	            		if(substr($classidm,0,1) == 'g' || $classidm == '')
	            			continue;
	            		$affectedRow = InfoClassManage::model()->updateAll(
	            			array('State'=>1,'CreateTime'=>date("Y-m-d H:i:s"),'CreatorID'=>$uid),
	            			'UID = '.$uido.' and ClassID = '.$classidm);
	            			
		            	if(0 == $affectedRow)
		            	{
		            		//添加
		            		$record_cm = new InfoClassManage();
		            		$record_cm->UID = $uido;
		            		$record_cm->ClassID = $classidm;
		            		$record_cm->SchoolID = $fields['SchoolID'];
		            		$record_cm->State = 1;
							$record_cm->CreateTime=date("Y-m-d H:i:s");
							$record_cm->CreatorID=$uid;
	
		            		$record_class = InfoClass::model()->findByPk($classidm, "State = 1");
		            		$record_cm->GradeID = $record_class['GradeID'];
		            		if (!$record_cm->save() || !$record_cm->validate())
		            		{
		            			$trans->rollback();
		            			$this->renderText(json_encode($result));
		            			return;
		            		}
		            	}
	            	}		  
				}
				$affectedRow = InfoGradeManage::model()->updateAll(
            		array('State'=>0),
            		'UID = '.$uido);
				if('4' == $_POST['RoleID']) //班级管理者才可更新
				{
	            	//更新管理年级
	            	$mangradeidarr = explode(',',$_POST['ManGradeIDs']);

	            	foreach ($mangradeidarr as $gradeid)
	            	{
	            		if($gradeid == '')
	            			continue;
	            		$affectedRow = InfoGradeManage::model()->updateAll(
	            			array('State'=>1,'CreateTime'=>date("Y-m-d H:i:s"),'CreatorID'=>$uid),
	            			'UID = '.$uido.' and GradeID = '.$gradeid);
		            	if(0 == $affectedRow)
		            	{
		            		//添加
		            		$record_gm = new InfoGradeManage();
		            		$record_gm->UID = $uido;
		            		$record_gm->GradeID = $gradeid;
		            		$record_gm->SchoolID = $fields['SchoolID'];
		            		$record_gm->State = 1;
							$record_gm->CreateTime=date("Y-m-d H:i:s");
							$record_gm->CreatorID=$uid;
	
		            		if (!$record_gm->save() || !$record_gm->validate())
		            		{
		            			$trans->rollback();
		            			$this->renderText(json_encode($result));
		            			return;
		            		}
		            	}
	            	}	
				}
                $result['success'] = true;
                $result['msg'] = '教师修改成功!';
                $trans->commit(); 
	            
			} catch (Exception $e) {   
			    $trans->rollback();     
			} 
        }
        $this->renderText(json_encode($result));
        /*
		$manclassids= isset($_POST['ManClassIDs'])?$_POST['ManClassIDs']:'';
		$mangradeids= isset($_POST['ManGradeIDs'])?$_POST['ManGradeIDs']:'';

		if(0 == $uid) //添加
			$s = '
				{
					"success":true,
					"msg":"教师添加成功!",
					"data":{
						"id" : 3
					}
				}';
		else			//修改 
			$s = '
				{
					"success":true,
					"msg":"教师修改成功!"
				}';			
		echo $s;*/
	}     
/**
     * @desc 导出excel: 默认导出学校里所有老师列表
     */
    public function actionExport()
    {
        $schoolId = Yii::app()->session->get('SchoolId');
        if (is_null($schoolId))
        {
        	$schoolId = 0;	
       	}
    	
    	Yii::import('application.modules.admin.models.InfoUser');
        $excel = ExcelExport::getInstance();
        $excel->setTemplate();
        
        $columns = array('姓名', '性别', '科目', '角色名称');        
        $rows = array();
        
        // 获取所有学科名称
        $subjectList = AdminUtil::getSubjectList($schoolId);
       	
        // 获取所有角色列表
        $roleList = AdminUtil::getRoleList();
        
        $recordList = InfoStudent::model()->findAllByAttributes(array('SchoolID' => $schoolId, 'State' => 1));	      
        foreach ($recordList as $record)
        {
        	$row['Name'] = $record->Name;
        	$row['Sex'] = (1 == $record->Sex)? '男' : '女';
        	      	
        	$user = InfoUser::model()->findByPk($record->UID, "State = 1");
        	if (empty($user))
        	{
        		continue;
        	}
        	
        	$row['RoleName'] = $roleList[$user->RoleID];
        	$row['SubjectName'] = $subjectList[$record->SubjectID]['SubjectName'];
        	$rows[] = $row; 
        }		

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
    	
        ini_set('memory_limit', '128m');
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
            // 每一列的列名
            $excel->init(array('columnNames' => array('Name', 'UserName', 'Sex', 'SubjectName')));           
            $excel->load($_FILES['userfile']['tmp_name']);
            
            // 获取该学校的所有学科名称
            $subjectList = array();
            $schoolSubjectList = AdminUtil::getSubjectList($schoolid);
            foreach ($schoolSubjectList as $subjectInfo)
            {
            	$subjectList[$subjectInfo['SubjectName']] = $subjectInfo;
           	}
           	
            // 获取所有角色列表: RoleName -> RoleID
        //    $roleList = array_flip(AdminUtil::getRoleList());
            
            // rows为导入的数据行, 每一行为key => value的数据
            $rows = $excel->getValues(); 
            $total = count($rows);
            $succCount = 0;
            foreach ($rows as $row)
            {
            	// 给老师添加对应用户, 密码默认为666666
            	$uid = AdminUtil::createUser($row['UserName'], '666666', 2);
            	if (0 == $uid)	// 创建用户失败
            	{
            		continue;
            	}
         		
            	$fields = array('UID' => $uid, 
            		'Name' => $row['Name'],'State' =>1,'CreateTime' => date("Y-m-d H:i:s"),
            		'CreatorID'=>Yii::app()->user->getId(),
            		'SchoolID'=>$schoolid
            	);
            	$fields['Sex'] = ($row['Sex'] == '男')? 1 : 0;
					
            	if(isset($subjectList[$row['SubjectName']]))
            	{            		
            		$fields['SubjectID'] = $subjectList[$row['SubjectName']]['SubjectID'];
            	}
           /* 	if (isset($roleList[$row['RoleName']]))
            	{
            		$fields['RoleID'] = $roleList[$row['RoleName']];
            	}*/
	
            	$record = new InfoTeacher();
            	$record->setAttributes($fields);

            	if ($record->save())
            	{
            		$succCount++;
            	}
            }
            
            $result = array('success' => true, 'msg' => '文件导入成功,一共'.$succCount.'条记录', 'total' => $total, 'succ' => $succCount);
            echo json_encode($result);
        }
    }
}
