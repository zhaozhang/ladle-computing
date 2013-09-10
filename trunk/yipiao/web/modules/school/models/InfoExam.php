<?php

/**
 * This is the model class for table "info_exam".
 *
 * The followings are the available columns in table 'info_exam':
 * @property integer $ExamID
 * @property string $ExamName
 * @property string $ExamTime
 * @property integer $SchoolID
 * @property integer $GradeID
 * @property integer $ClassID
 * @property integer $Type
 * @property integer $Scope
 * @property integer $Rank1
 * @property integer $Rank2
 * @property integer $Rank3
 * @property integer $CreatorID
 * @property string $CreateTime
 * @property integer $State
 */
class InfoExam extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @return InfoExam the static model class
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
		return 'info_exam';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('ExamName, ExamTime, SchoolID, GradeID, CreatorID, CreateTime', 'required'),
			array('SchoolID, GradeID, ClassID, Type, Scope, Rank1, Rank2, Rank3, CreatorID, State', 'numerical', 'integerOnly'=>true),
			array('ExamName', 'length', 'max'=>64),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('ExamID, ExamName, ExamTime, SchoolID, GradeID, ClassID, Type, Scope, Rank1, Rank2, Rank3, CreatorID, CreateTime, State', 'safe', 'on'=>'search'),
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
			'ExamID' => 'Exam',
			'ExamName' => 'Exam Name',
			'ExamTime' => 'Exam Time',
			'SchoolID' => 'School',
			'GradeID' => 'Grade',
			'ClassID' => 'Class',
			'Type' => 'Type',
			'Scope' => 'Scope',
			'Rank1' => 'Rank1',
			'Rank2' => 'Rank2',
			'Rank3' => 'Rank3',
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

		$criteria->compare('ExamID',$this->ExamID);

		$criteria->compare('ExamName',$this->ExamName,true);

		$criteria->compare('ExamTime',$this->ExamTime,true);

		$criteria->compare('SchoolID',$this->SchoolID);

		$criteria->compare('GradeID',$this->GradeID);

		$criteria->compare('ClassID',$this->ClassID);

		$criteria->compare('Type',$this->Type);

		$criteria->compare('Scope',$this->Scope);

		$criteria->compare('Rank1',$this->Rank1);

		$criteria->compare('Rank2',$this->Rank2);

		$criteria->compare('Rank3',$this->Rank3);

		$criteria->compare('CreatorID',$this->CreatorID);

		$criteria->compare('CreateTime',$this->CreateTime,true);

		$criteria->compare('State',$this->State);

		return new CActiveDataProvider('InfoExam', array(
			'criteria'=>$criteria,
		));
	}
}