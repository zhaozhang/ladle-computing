<?php

/**
 * This is the model class for table "info_subject".
 *
 * The followings are the available columns in table 'info_subject':
 * @property integer $SubjectID
 * @property string $SubjectName
 * @property integer $Type
 * @property string $ReferSubjectID
 * @property integer $SchoolID
 * @property string $FullScore
 * @property string $PassScore
 * @property string $CreateTime
 * @property integer $CreatorID
 * @property integer $State
 */

class InfoSubject extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @return InfoSubject the static model class
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
		return 'info_subject';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('SubjectName, SchoolID, CreateTime, CreatorID', 'required'),
			array('Type, SchoolID, CreatorID, State', 'numerical', 'integerOnly'=>true),
			array('SubjectName', 'length', 'max'=>32),
			array('ReferSubjectID', 'length', 'max'=>64),
			array('FullScore, PassScore', 'length', 'max'=>8),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('SubjectID, SubjectName, Type, ReferSubjectID, SchoolID, FullScore, PassScore, CreateTime, CreatorID, State', 'safe', 'on'=>'search'),
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
			'SubjectID' => 'Subject',
			'SubjectName' => 'Subject Name',
			'Type' => 'Type',
			'ReferSubjectID' => 'Refer Subject',
			'SchoolID' => 'School',
			'FullScore' => 'Full Score',
			'PassScore' => 'Pass Score',
			'CreateTime' => 'Create Time',
			'CreatorID' => 'Creator',
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

		$criteria->compare('SubjectID',$this->SubjectID);

		$criteria->compare('SubjectName',$this->SubjectName,true);

		$criteria->compare('Type',$this->Type);

		$criteria->compare('ReferSubjectID',$this->ReferSubjectID,true);

		$criteria->compare('SchoolID',$this->SchoolID);

		$criteria->compare('FullScore',$this->FullScore,true);

		$criteria->compare('PassScore',$this->PassScore,true);

		$criteria->compare('CreateTime',$this->CreateTime,true);

		$criteria->compare('CreatorID',$this->CreatorID);

		$criteria->compare('State',$this->State);

		return new CActiveDataProvider('InfoSubject', array(
			'criteria'=>$criteria,
		));
	}
}