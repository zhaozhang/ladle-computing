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
        $keys = array('role_id', 'school_id', 'grade_id', 'class_id', 'subject_id');

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
        }

        if (1 == $roleId) // 学生
        {
            $studentRecord = InfoStudent::model()->findByPk($uid, "State = 1");
            if ($studentRecord)
            {
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
                $userInfo['school_id'] = $teacherRecord->SchoolID;
                $userInfo['subject_id'] = $teacherRecord->SubjectID;

                $classRecord = InfoClassManage::model()->findByAttributes(array('UID' => $uid, 'State' => 1));
                if ($classRecord)
                {
                    $userInfo['school_id'] = $classRecord->SchoolID;
                    $userInfo['grade_id'] = $classRecord->GradeID;
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
        $record = new InfoUser();

        $record->UserName = $userName;
        $record->Pwd = md5sum($password);
        $record->RegTime = time();
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

        $recordList = InfoSubject::model()->findAllByAttributes(array('SchoolID' => $schoolId, 'State' => 1));
        foreach ($recordList as $record)
        {
            $subjectLIst[$record->SubjectID] = $record->getAttributes();
        }

        return $subjectList;
    }
}

?>
