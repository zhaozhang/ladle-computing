<?php

/**
 * This is the model class for table "info_student".
 *
 * The followings are the available columns in table 'info_student':
 * @property integer $UID
 * @property integer $SchoolID
 * @property integer $GradeID
 * @property integer $ClassID
 * @property string $Name
 * @property integer $Sex
 * @property string $StudyNo
 * @property integer $Type
 * @property integer $IsLocal
 * @property string $GraSchool
 * @property string $EntryTime
 * @property integer $CreatorID
 * @property string $CreateTime
 * @property integer $State
 */
class InfoStudent extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @return InfoStudent the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'info_student';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('UID, SchoolID, GradeID, ClassID, Name, Sex, CreatorID, CreateTime', 'required'),
			array('UID, SchoolID, GradeID, ClassID, Sex, Type, IsLocal, CreatorID, State', 'numerical', 'integerOnly'=>true),
			array('Name, StudyNo, GraSchool', 'length', 'max'=>32),
			array('EntryTime', 'safe'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('UID, SchoolID, GradeID, ClassID, Name, Sex, StudyNo, Type, IsLocal, GraSchool, EntryTime, CreatorID, CreateTime, State', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'UID' => 'Uid',
			'SchoolID' => 'School',
			'GradeID' => 'Grade',
			'ClassID' => 'Class',
			'Name' => 'Name',
			'Sex' => 'Sex',
			'StudyNo' => 'Study No',
			'Type' => 'Type',
			'IsLocal' => 'Is Local',
			'GraSchool' => 'Gra School',
			'EntryTime' => 'Entry Time',
			'CreatorID' => 'Creator',
			'CreateTime' => 'Create Time',
			'State' => 'State',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
	 */
	public function search()
	{
		// Warning: Please modify the following code to remove attributes that
		// should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('UID',$this->UID);

		$criteria->compare('SchoolID',$this->SchoolID);

		$criteria->compare('GradeID',$this->GradeID);

		$criteria->compare('ClassID',$this->ClassID);

		$criteria->compare('Name',$this->Name,true);

		$criteria->compare('Sex',$this->Sex);

		$criteria->compare('StudyNo',$this->StudyNo,true);

		$criteria->compare('Type',$this->Type);

		$criteria->compare('IsLocal',$this->IsLocal);

		$criteria->compare('GraSchool',$this->GraSchool,true);

		$criteria->compare('EntryTime',$this->EntryTime,true);

		$criteria->compare('CreatorID',$this->CreatorID);

		$criteria->compare('CreateTime',$this->CreateTime,true);

		$criteria->compare('State',$this->State);

		return new CActiveDataProvider('InfoStudent', array(
			'criteria'=>$criteria,
		));
	}
}