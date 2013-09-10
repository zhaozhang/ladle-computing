<?php

Yii::import('application.modules.school.models.*');

class SchoolUtil
{
    /**
     * @desc 获取班级列表
     * @param schoolId int 学校Id
     * @param gradeId int 年级Id
     * @return array(classId => array())
     */
    public static function getClassList($schoolId, $gradeId = 0)
    {
        $classList = array();

        $attrs = array('SchoolID' => $schoolId, 'State' => 1);
        if ($gradeId > 0)
        {
            $attrs['GradeID'] = $gradeId;
        }

        $recordList = InfoClass::model()->findAllByAttributes($attrs);
        foreach ($recordList as $record)
        {
            $classList[$record->ClassID] = $record->getAttributes();
        }

        return $classList;
    }

}

?>
