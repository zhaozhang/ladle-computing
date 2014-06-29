<?php
ini_set('max_execution_time', 600);

class ManTeachRelationController extends CommonController
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
    	$result = array('success' => false, 'data' => array(),'data2' => array());
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
    	$subjectid		= isset($_POST['SubjectID'])?$_POST['SubjectID']:'';
    	if('' == $subjectid)
        	$subjectquery = "1 = 1";
        else	
        	$subjectquery = "tr.subjectid in (".$subjectid.")";

    	$this->layout = false;
        $result = array('success' => true, 'msg' => '');
		if(substr($classid,0,1) == 'g')//年级
       // 	$sql="select * from v_teacher where gradeid = ".substr($classid,2,strlen($classid)-2)." and subjectid in (".$subjectids.") and state = 1";
			$sql="SELECT c.ClassID,c.ClassName,S.TeachID,S.UID, S.SubjectID AS SubjectID,S.`Name` from 
				info_class c LEFT OUTER JOIN
				(select `tr`.`TeachID` AS `TeachID`,`tr`.`UID` AS `UID`,`tr`.`GradeID` AS `GradeID`,`tr`.`ClassID` AS `ClassID`,`tr`.`SubjectID` AS `SubjectID`,`tr`.`CreatorID` AS `CreatorID`,`tr`.`CreateTime` AS `CreateTime`,`tr`.`State` AS `State`,`t`.`Name` AS `Name` 
				from (`info_teachrelation` `tr` join `info_teacher` `t`) 
				where ((`tr`.`UID` = `t`.`UID`) and (`t`.`State` = 1) and (`tr`.`State` = 1) 
				and ".$subjectquery." )) AS S ON c.ClassID = S.ClassID
				where c.gradeid = ".substr($classid,2,strlen($classid)-2);			
	
        else 
        	$sql="SELECT c.ClassID,c.ClassName,S.TeachID,S.UID, S.SubjectID AS SubjectID,S.`Name` from 
				info_class c LEFT OUTER JOIN
				(select `tr`.`TeachID` AS `TeachID`,`tr`.`UID` AS `UID`,`tr`.`GradeID` AS `GradeID`,`tr`.`ClassID` AS `ClassID`,`tr`.`SubjectID` AS `SubjectID`,`tr`.`CreatorID` AS `CreatorID`,`tr`.`CreateTime` AS `CreateTime`,`tr`.`State` AS `State`,`t`.`Name` AS `Name` 
				from (`info_teachrelation` `tr` join `info_teacher` `t`) 
				where ((`tr`.`UID` = `t`.`UID`) and (`t`.`State` = 1) and (`tr`.`State` = 1) 
				and ".$subjectquery." )) AS S ON c.ClassID = S.ClassID
				where c.classid = ".$classid;

        $connection=Yii::app()->db; 
    	$rows=$connection->createCommand ($sql)->query();
		foreach ($rows as $k => $v ){
			
			$result['data'][] = array_change_key_case($v, CASE_LOWER);
		}
		
		$sql= "SELECT tr.* FROM info_teacher tr where tr.schoolid =".$schoolid." and ".$subjectquery." and tr.state = 1";
    	$connection=Yii::app()->db; 
    	$rows=$connection->createCommand ($sql)->query();
		foreach ($rows as $k => $v ){
			$teacherInfo = array_change_key_case($v, CASE_LOWER);
            
            $teacherjson = array(
            	'id' => $teacherInfo["uid"],
	            'text'=> $teacherInfo["name"]);
            
			 $result['data2'][] = $teacherjson;
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
     * 更新
     */
	public function actionUpdaterelation()
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

        $classid 	= isset($_POST['classid'])?$_POST['classid']:'';
    	$subjectid	= isset($_POST['subjectid'])?$_POST['subjectid']:'';
    	$uido 		= isset($_POST['uid'])?$_POST['uid']:'';

        $result['msg'] = '操作失败';
        //查询老师授课科目
		$user = InfoTeacher::model()->findByPk($uido, "State = 1");
        if (empty($user))
        {
        	$this->renderText(json_encode($result));
        	return;
        }else if($user['SchoolID'] != $schoolid)
        {
        	$this->renderText(json_encode($result));
        	return;
        }
        $subjectid = $user['SubjectID'];
        
        if($subjectid == '')
		{
        	$this->renderText(json_encode($result));
        	return;
        }	
        if ('' == $uido) //删除
        {
        	$sql= "update info_teachrelation set state = 0 where classid =".$classid." and subjectid =".$subjectid." and state = 1";
	    	$connection=Yii::app()->db; 
	    	$rows=$connection->createCommand ($sql)->query();
        }
        else 
        {
        	$affectedRow = InfoTeachrelation::model()->updateAll(
            	array('State'=>1 ,'UID'=>$uido,'CreateTime'=>date("Y-m-d H:i:s"),'CreatorID'=>$uid),
            	'ClassID = '.$classid.' and SubjectID = '.$subjectid);
            if(0 == $affectedRow)
            {
            	//添加
            	$record_tr = new InfoTeachrelation();
            	$record_tr->UID = $uido;
            	$record_tr->ClassID = $classid;
            	$record_tr->SubjectID = $subjectid;
            	$record_tr->State = 1;
				$record_tr->CreateTime=date("Y-m-d H:i:s");
				$record_tr->CreatorID= $uid;
            	
            	$record_class = InfoClass::model()->findByPk($classid, "State = 1");
            	$record_tr->GradeID = $record_class['GradeID'];
            	
            	if (!$record_tr->save() || !$record_tr->validate())
            	{
            		$this->renderText(json_encode($result));
            		return;
            	}
            }  	
        }
        $result['success'] = true;
        $result['msg'] = '修改成功';
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
    	$sessionInfo = AdminUtil::getUserSessionInfo($uid);
    	$schoolid = $sessionInfo['school_id'];
    	$roleid = $sessionInfo['role_id'];
    	$gradeid = $sessionInfo['grade_id'];
    	
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
            $excel->init(array('columnNames' => array('ClassName', 'SubjectName', 'Name')));           
            $excel->load($_FILES['userfile']['tmp_name']);
            
            // 获取该学校的所有学科名称
            $subjectList = array();
            $schoolSubjectList = AdminUtil::getSubjectList($schoolid);
            foreach ($schoolSubjectList as $subjectInfo)
            {
            	$subjectList[$subjectInfo['SubjectName']] = $subjectInfo;
           	}
           	
         	$classList = array(); 
            if($roleid == 5)
            	$schoolClassList = SchoolUtil::getClassList($schoolid);
            else if($roleid == 4)
           		$schoolClassList = SchoolUtil::getClassList($schoolid,$gradeid);
            foreach ($schoolClassList as $classInfo)
            {
            	$classList[$classInfo['ClassName']] = $classInfo;	
            }
            
       		$teacherList = array(); 

           	$schoolTeacherList = SchoolUtil::getTeacherList($schoolid);
            foreach ($schoolTeacherList as $teacherInfo)
            {
            	$teacherList[$teacherInfo['Name']] = $teacherInfo;	
            }
            // 获取所有角色列表: RoleName -> RoleID
        //    $roleList = array_flip(AdminUtil::getRoleList());
            
            // rows为导入的数据行, 每一行为key => value的数据
            $rows = $excel->getValues(); 
            $total = count($rows);
            $succCount = 0;
            foreach ($rows as $row)
            {
            	if(isset($teacherList[$row['Name']]['UID']) && isset($classList[$row['ClassName']]['ClassID'])
            	&& isset($subjectList[$row['SubjectName']]['SubjectID']))
            	{
	            	$affectedRow = InfoTeachrelation::model()->updateAll(
	            	array('State'=>1 ,'UID'=>$teacherList[$row['Name']]['UID'],'CreateTime'=>date("Y-m-d H:i:s"),'CreatorID'=>$u_id),
	            	'ClassID = '.$classList[$row['ClassName']]['ClassID'].' and SubjectID = '.$subjectList[$row['SubjectName']]['SubjectID']);
	            	if(0 == $affectedRow)
		            {
		            	//添加
		            	$record_tr = new InfoTeachrelation();
		            	$record_tr->UID = $teacherList[$row['Name']]['UID'];
		            	$record_tr->ClassID = $classList[$row['ClassName']]['ClassID'];
		            	$record_tr->SubjectID = $subjectList[$row['SubjectName']]['SubjectID'];
		            	$record_tr->State = 1;
						$record_tr->CreateTime=date("Y-m-d H:i:s");
						$record_tr->CreatorID= $u_id;
		            	
		            	$record_class = InfoClass::model()->findByPk($classList[$row['ClassName']]['ClassID'], "State = 1");
		            	$record_tr->GradeID = $record_class['GradeID'];
		            	
		            	$record_tr->save();
		            } 
	            	$succCount++;
            	}
            }
            
            $result = array('success' => true, 'msg' => '文件导入成功,一共'.$succCount.'条记录', 'total' => $total, 'succ' => $succCount);
            echo json_encode($result);
        }
    }
}
