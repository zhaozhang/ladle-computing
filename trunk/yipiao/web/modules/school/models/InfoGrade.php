<?php

/**
 * This is the model class for table "info_grade".
 *
 * The followings are the available columns in table 'info_grade':
 * @property integer $GradeID
 * @property integer $SchoolID
 * @property string $GradeName
 * @property integer $StudentCount
 * @property integer $UID
 * @property integer $AUID
 * @property integer $State
 */
class InfoGrade extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @return InfoGrade the static model class
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
		return 'info_grade';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('SchoolID', 'required'),
			array('SchoolID, CreatorID, State', 'numerical', 'integerOnly'=>true),
			array('GradeName', 'length', 'max'=>32),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('GradeID, SchoolID, GradeName, CreatorID, CreateTime, State', 'safe', 'on'=>'search'),
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
			'GradeID' => 'Grade',
			'SchoolID' => 'School',
			'GradeName' => 'Grade Name',
			'CreatorID' => 'CreatorID',
			'CreateTime' => 'CreateTime',
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

		$criteria->compare('GradeID',$this->GradeID);

		$criteria->compare('SchoolID',$this->SchoolID);

		$criteria->compare('GradeName',$this->GradeName,true);

		$criteria->compare('CreatorID',$this->CreatorID);

		$criteria->compare('CreateTime',$this->CreateTime);

		$criteria->compare('State',$this->State);

		return new CActiveDataProvider('InfoGrade', array(
			'criteria'=>$criteria,
		));
	}
}