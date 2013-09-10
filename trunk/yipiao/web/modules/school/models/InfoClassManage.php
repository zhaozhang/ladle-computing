<?php

/**
 * This is the model class for table "info_class_manage".
 *
 * The followings are the available columns in table 'info_class_manage':
 * @property integer $UID
 * @property integer $ClassID
 * @property integer $SchoolID
 * @property integer $GradeID
 * @property integer $CreatorID
 * @property string $CreateTime
 * @property integer $State
 */
class InfoClassManage extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @return InfoClassManage the static model class
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
		return 'info_class_manage';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('SchoolID, GradeID, CreatorID, CreateTime', 'required'),
			array('SchoolID, GradeID, CreatorID, State', 'numerical', 'integerOnly'=>true),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('UID, ClassID, SchoolID, GradeID, CreatorID, CreateTime, State', 'safe', 'on'=>'search'),
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
			'ClassID' => 'Class',
			'SchoolID' => 'School',
			'GradeID' => 'Grade',
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

		$criteria->compare('ClassID',$this->ClassID);

		$criteria->compare('SchoolID',$this->SchoolID);

		$criteria->compare('GradeID',$this->GradeID);

		$criteria->compare('CreatorID',$this->CreatorID);

		$criteria->compare('CreateTime',$this->CreateTime,true);

		$criteria->compare('State',$this->State);

		return new CActiveDataProvider('InfoClassManage', array(
			'criteria'=>$criteria,
		));
	}
}