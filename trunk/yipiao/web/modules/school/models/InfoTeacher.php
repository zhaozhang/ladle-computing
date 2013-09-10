<?php

/**
 * This is the model class for table "info_teacher".
 *
 * The followings are the available columns in table 'info_teacher':
 * @property integer $UID
 * @property integer $SchoolID
 * @property integer $SubjectID
 * @property string $Name
 * @property integer $Sex
 * @property string $Position
 * @property string $EntryTime
 * @property integer $CreatorID
 * @property string $CreateTime
 * @property integer $State
 */
class InfoTeacher extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @return InfoTeacher the static model class
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
		return 'info_teacher';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('UID, SchoolID, Name, Sex, CreatorID, CreateTime', 'required'),
			array('UID, SchoolID, SubjectID, Sex, CreatorID, State', 'numerical', 'integerOnly'=>true),
			array('Name', 'length', 'max'=>32),
			array('Position', 'length', 'max'=>64),
			array('EntryTime', 'safe'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('UID, SchoolID, SubjectID, Name, Sex, Position, EntryTime, CreatorID, CreateTime, State', 'safe', 'on'=>'search'),
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
			'SubjectID' => 'Subject',
			'Name' => 'Name',
			'Sex' => 'Sex',
			'Position' => 'Position',
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

		$criteria->compare('SubjectID',$this->SubjectID);

		$criteria->compare('Name',$this->Name,true);

		$criteria->compare('Sex',$this->Sex);

		$criteria->compare('Position',$this->Position,true);

		$criteria->compare('EntryTime',$this->EntryTime,true);

		$criteria->compare('CreatorID',$this->CreatorID);

		$criteria->compare('CreateTime',$this->CreateTime,true);

		$criteria->compare('State',$this->State);

		return new CActiveDataProvider('InfoTeacher', array(
			'criteria'=>$criteria,
		));
	}
}