<?php

Yii::import('application.modules.admin.models.*');
Yii::import('application.modules.school.models.*');

/**
 * @desc 用户角色接口封装
 * @author fox
 * @date 2013/08/10
 */

class AdminUtil
{
    /**
     * @desc 从session中读取用户角色等信息
     */
    public static function getUserSessionInfo($uid)
    {
        $sessionInfo = array();
        $keys = array('name','role_id', 'school_id', 'grade_id', 'class_id', 'subject_id', 't_grade_id');

        foreach ($keys as $key)
        {
            $sessionInfo[$key] = Yii::app()->session->get($key);
        }

        return $sessionInfo;
    } 
            
    /**
     * @desc 从数据库中加载用户角色等信息
     */
    public static function loadUserSessionInfo($uid)
    {
        $userInfo = array();

        $roleId = 0;
        $recordList = UserRole::model()->findAllByAttributes(array('UID' => $uid));
        foreach ($recordList as $record) // 只获取最后一个角色
        {
            $roleId = $record->RoleID;
            $userInfo['role_id'] = $roleId;
        }

        if (1 == $roleId) // 学生
        {
            $studentRecord = InfoStudent::model()->findByPk($uid, "State = 1");
            if ($studentRecord)
            {
            	$userInfo['name'] = $studentRecord->Name;
                $userInfo['school_id'] = $studentRecord->SchoolID;
                $userInfo['grade_id'] = $studentRecord->GradeID;
                $userInfo['class_id'] = $studentRecord->ClassID;
            }
        }
        else // 老师
        {
            $teacherRecord = InfoTeacher::model()->findByPk($uid, "State = 1");    
            if ($teacherRecord)
            {
            	$userInfo['name'] = $teacherRecord->Name;
                $userInfo['school_id'] = $teacherRecord->SchoolID;
                $userInfo['subject_id'] = $teacherRecord->SubjectID;
				//存储教学所在年级
                $teachRecord = InfoTeachrelation::model()->findByAttributes(array('UID' => $uid, 'State' => 1));
                if ($teachRecord)
                {	
                	$userInfo['t_grade_id'] = $teachRecord->GradeID;
                }
            	//存储年级管理信息
                $gradeRecord = InfoGradeManage::model()->findByAttributes(array('UID' => $uid, 'State' => 1));
                if ($gradeRecord)
                {
                //    $userInfo['school_id'] = $classRecord->SchoolID;
                    $userInfo['grade_id'] = $gradeRecord->GradeID;
                }
                //存储班级管理信息
                $classRecord = InfoClassManage::model()->findByAttributes(array('UID' => $uid, 'State' => 1));
                if ($classRecord)
                {
                    $userInfo['class_id'] = $classRecord->ClassID;
                }
            }
        }

        return $userInfo;
    }

    /*
     * @desc 获取角色菜单列表
     */
    public static function getRoleMenuList($roleId)
    {
        $menuList = array();
        $recordList = RoleMenu::model()->findAllByAttributes(array('RoleID' => $roleId));

        foreach ($recordList as $record)
        {
            $menuList[] = $record->MenuID;
        }

        // TODO: 需要把menuID转化为name/url, 目前仅考虑两层菜单
        //

        return $menuList;
    }

    /**
     * @desc 创建用户
     * @param userName 用户名
     * @param password 密码, 明文
     * @param roleId 用户角色
     * @param info 用户其它信息
     * @return UID int
     */
    public static function createUser($userName, $password, $roleId, $info = array())
    {
    	//查看用户名是否存在
    	
        $record = new InfoUser();

        $record->UserName = $userName;
        $record->Pwd = $password;
        $record->RegTime = date("Y-m-d H:i:s");
        $record->State = 1;
        foreach ($info as $key => $value)
        {
            $record->$key = $value;
        }

        // 创建失败则返回0
        if (!$record->save())
        {
            return 0;
        }
		$uid = $record->getPrimaryKey();
        $roleRecord = new UserRole();
        $roleRecord->UID = $uid;
        $roleRecord->RoleID = $roleId;
        
        return $roleRecord->save()? $uid : 0;
    }

    /**
     * @desc 获取角色列表
     * @return array(RoleID => array())
     */
    public static function getRoleList()
    {
        $roleList = array();

        $recordList = Role::model()->findAll();
        foreach ($recordList as $record)
        {
            $roleList[$record->RoleID] = $record->RoleName;
        }     

        return $roleList;
    }

    /**
     * @desc 获取学校的科目列表
     * @param SchoolID int
     * @return array(SubjectID => array())
     */
    public static function getSubjectList($schoolId)
    {
        $subjectList = array();
        $recordList = InfoSubject::model()->findAll("(SchoolID = 0 OR SchoolID = :SchoolID) and ReferSubjectID = '' and State = 1",array('SchoolID'=>$schoolId));
        foreach ($recordList as $record)
        {
            $subjectList[] = $record->getAttributes();
        }
        return $subjectList;
    }
}

?>
