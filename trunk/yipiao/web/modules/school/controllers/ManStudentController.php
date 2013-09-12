<?php

class ManStudentController extends CommonController
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
                $classInfo = array_change_key_case((array)$classRecord->getAttributes(), CASE_LOWER);
                $gradejson['children'][] = array(
                	'id' => $classInfo["classid"],
		            'gid' => $gradeInfo["gradeid"], 
		            'text'=> $classInfo["classname"], 
		            'selected'=>false,
		            'iconCls'=>""
                );
            }
            $result['data'][] = $gradejson;
        }
		$result['success'] = true;
        $this->renderText(json_encode($result));

    	//iconCls 根据文理科配置成不一样的
        /*
    	$s = '{
			  "success": true,
			  "msg": "",
			  "data": [
			    {
			      "id": "0",
			      "gid":"1",
			      "text": "高2014级",
			      "selected": false,
			      "iconCls": "",
			      "children": [
			        {
			          "id": "1",
			          "gid": "1",
			          "text": "高2014级1班",
			          "iconCls": "",
			          "selected": true
			        },
			        {
			          "id": "2",
			          "gid": "1",			          
			          "text": "高2014级2班",
			          "iconCls": "",
			          "selected": false
			        }
			      ]
			    },
			    {
			      "id": "0",
			      "gid": "2",
			      "text": "高2015级",
			      "selected": false,
			      "iconCls": "",
			      "children": [
			        {
			          "id": "3",
			          "gid": "2",			          
			          "text": "高2015级1班",
			          "iconCls": "",
			          "selected": false
			        },
			        {
			          "id": "4",
			          "gid": "2",			          
			          "text": "高2015级2班",
			          "iconCls": "",
			          "selected": false
			        }
			      ]
			    }
			  ]
			}';

        echo $s;
         */
	}       

	/*
	 * 查询学生
	 */ 
    public function actionGetstudent()
    {
    	$this->layout = false;
    	$result = array('success' => false, 'data' => array());
    	$uid = Yii::app()->user->getId();
    	if(!$uid){
    		$result['msg'] = '用户未登录';
    		$this->renderText(json_encode($result));
    		return;
    	};
    	
    	$ClassID	= isset($_POST['ClassID'])?$_POST['ClassID']:'';
    	$Name	= isset($_POST['Name'])?$_POST['Name']:'';
    	
        $this->layout = false;
        $result = array('success' => true, 'msg' => '');
		if('' == $Name)
        	$recordList = InfoStudent::model()->findAll("ClassID = :ClassID and State = 1",
        		array('ClassID'=>$ClassID));
        else 
         	$recordList = InfoStudent::model()->findAll("ClassID = :ClassID and Name like '%".$Name."%' and State = 1",
        		array('ClassID'=>$ClassID));       		
        foreach ($recordList as $record)
        {
            $studentInfo = $record->getAttributes();
            $result['data'][] = array_change_key_case($studentInfo, CASE_LOWER);
        }    

        $this->renderText(json_encode($result));
	}	

	/*
	 * 删除学生
	 */ 
    public function actionDeletestudent()
    {	
        $this->layout = false;
    	$result = array('success' => false, 'data' => array());
    	$uid = Yii::app()->user->getId();
    	if(!$uid){
    		$result['msg'] = '用户未登录';
    		$this->renderText(json_encode($result));
    		return;
    	};
    	
    	$uids = isset($_POST['UIDs'])? $_POST['UIDs'] : 0;//可以是多个，英文逗号隔开
        $uidList = explode(",", $uids);

        $result = array('msg' => '学生删除成功!', 'data' => array());
        $succCount = 0;
        foreach ($uidList as $uid)
        {
            $affectedRow = InfoStudent::model()->UpdateByPk($uid, array('State' => 0));
            if (1 == $affectedRow)
            {
                $succCount += 1;
            }
        }   

        $result['success'] = $succCount == count($uidList);
        $this->renderText(json_encode($result));
    }

    /*
     * 更新学生
     */
	public function actionUpdatestudent()
	{
        $this->layout = false;
    	$result = array('success' => false, 'data' => array());
    	$uidsession = Yii::app()->user->getId();
    	if(!$uidsession){
    		$result['msg'] = '用户未登录';
    		$this->renderText(json_encode($result));
    		return;
    	};
    	
        $fields = array();
		$uid = isset($_POST['UID'])? $_POST['UID'] : 0;

        unset($_POST['UID']);

        if (isset($_POST['Name']))
        {
            $fields['Name'] = $_POST['Name'];
        }
        if (isset($_POST['StudyNo']))
        {
            $fields['StudyNo'] = $_POST['StudyNo'];
        }
        if (isset($_POST['GraSchool']))
        {
            $fields['GraSchool'] = $_POST['GraSchool'];
        }
        if (isset($_POST['EntryTime']))
        {
            $fields['EntryTime'] = htmlentities($_POST['EntryTime'], ENT_QUOTES);
        }
        if (isset($_POST['Type']))
        {
            $fields['Type'] = intval($_POST['Type']);
        }
        if (isset($_POST['Sex']))
        {
            $fields['Sex'] = intval($_POST['Sex']);
        }
        if (isset($_POST['ClassID']))
        {
            $fields['ClassID'] = intval($_POST['ClassID']);
        }
	    if (isset($_POST['SchoolID']))
        {
            $fields['SchoolID'] = intval($_POST['SchoolID']);
        }
	    if (isset($_POST['GradeID']))
        {
            $fields['GradeID'] = intval($_POST['GradeID']);
        }
		if (isset($_POST['IsLocal']))
        {
            $fields['IsLocal'] = intval($_POST['IsLocal']);
        }
		$msg = '操作失败';
        $result = array('msg' => '操作失败', 'data' => array());
        $success = false;

		if (0 == $uid) //添加
        {
        	$trans = Yii::app()->db->beginTransaction();   
			try {   
				//需要先添加用户
	        	$record_user = new InfoUser();
	        	$record_user->UserName = $fields['StudyNo'];
	        	$record_user->Pwd = '666666';
	        	$record_user->RegTime = date("Y-m-d H:i:s");
	        	$record_user->State = 1;
	        	if ($record_user->save() && $record_user->validate())
	            {
	        		$record = new InfoStudent();
		            // TODO: 需要先根据角色为其生成1个uid
		            $record->UID = $record_user->getPrimaryKey();
		            $record->State = 1;
					$record->CreateTime=date("Y-m-d H:i:s");
					$record->CreatorID="1";
					
		            foreach ($fields as $key => $value)
		            {
		                $record->$key = $value;
		            }
		       //     var_dump($record);
		            if ($record->save() && $record->validate())
		            {
		                $success = true;
		                $msg = '学生添加成功';
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
            $record = InfoStudent::model()->findByPk($uid, "State = 1");
            if (empty($record))
            {
                $result['success'] = false;
                $this->renderText(json_encode($result));
                return; 
            }

            $affectedRow = $record->updateByPk($uid, $fields);
            if (1 == $affectedRow)
            {
                $msg = '学生修改成功!';
            }
            $success = true;
        }
        $result['success'] = $success;
        $result['msg'] = $msg;
        $this->renderText(json_encode($result));
	}     

    /**
     * @desc 导出excel
     * @param $_POST['ClassID'] 导出所在班级
     */
    public function actionExport()
    {
    	$classId = isset($_POST['ClassID'])? intval($_POST['ClassID']) : 0;
        $schoolId = Yii::app()->session->get('SchoolId');
    	
        $excel = ExcelExport::getInstance();
        $excel->setTemplate();
            
        $columns = array('姓名', '性别', '学号', '班级', '应届/往届', '是否本地高考', '毕业学校', '入学时间');
        $fields = array_keys($columns);
        
        $rows = array();
        $classList = SchoolUtil::getClassList($schoolId);
        
        if ($classId)
        {
        	$recordList = InfoStudent::model()->findAllByAttributes(array('ClassID' => $classId, 'State' => 1));
        }
        else
        {
        	$recordList = InfoStudent::model()->findAllByAttributes(array('SchoolID' => $schoolId, 'State' => 1));	
        }
        foreach ($recordList as $record)
        {
        	$row = $record->getAttributes($fields);
        	$row['Sex'] = (1 == $record->Sex)? '男' : '女';
        	$row['ClassName'] = $classList[$record->ClassID];
        	$row['Type'] = ($record->Type == 0)? '应届' : '往届';
        	$row['IsLocal'] = ($record->IsLocal == 1)? '是' : '否';
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
        ini_set('memory_limit', '256m');
        $total = 0; 

        if (isset($_FILES['userfile']))
        {    
            if ($_FILES['userfile']['type'] != 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
            && $_FILES['userfile']['type'] != 'application/vnd.ms-excel'
            && $_FILES['userfile']['type'] != 'application/kset')
            {    
                header('Content-type: text/html; charset=utf-8');
                die('您上传的不是excel格式的文件。');
            }    
			
            $excel = ExcelImport::getInstance();
            // 每一列的列名
            $excel->init(array('columnNames' => array('Name', 'Sex', 'StudyNo', 'ClassName', 'TypeName', 'LocalName', 'GraSchool', 'EntryTime')));
            $excel->load($_FILES['userfile']['tmp_name']);

			// 学校ID利用当前登录用户的SchoolID
            $schoolID = Yii::app()->session->get('SchoolID');
            
            // 获取学校的所有班级列表
            $classList = array(); 
            $schoolClassList = SchoolUtil::getClassList($schoolID);
            foreach ($schoolClassList as $classInfo)
            {
            	$classList[$classInfo['ClassName']] = $classInfo;	
            }
            
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
