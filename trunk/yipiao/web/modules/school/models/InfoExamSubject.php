<?php

/**
 * This is the model class for table "info_exam_subject".
 *
 * The followings are the available columns in table 'info_exam_subject':
 * @property integer $ExamID
 * @property integer $SubjectID
 * @property string $FullScore
 * @property string $PassScore
 * @property string $YRefer
 * @property string $ScoreRange
 * @property integer $State
 */
class InfoExamSubject extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @return InfoExamSubject the static model class
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
		return 'info_exam_subject';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('ExamID, SubjectID', 'required'),
			array('ExamID, SubjectID, State', 'numerical', 'integerOnly'=>true),
			array('FullScore, PassScore, YRefer', 'length', 'max'=>8),
			array('ScoreRange', 'length', 'max'=>128),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('ExamID, SubjectID, FullScore, PassScore, YRefer, ScoreRange, State', 'safe', 'on'=>'search'),
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
			'SubjectID' => 'Subject',
			'FullScore' => 'Full Score',
			'PassScore' => 'Pass Score',
			'YRefer' => 'Yrefer',
			'ScoreRange' => 'Score Range',
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

		$criteria->compare('SubjectID',$this->SubjectID);

		$criteria->compare('FullScore',$this->FullScore,true);

		$criteria->compare('PassScore',$this->PassScore,true);

		$criteria->compare('YRefer',$this->YRefer,true);

		$criteria->compare('ScoreRange',$this->ScoreRange,true);

		$criteria->compare('State',$this->State);

		return new CActiveDataProvider('InfoExamSubject', array(
			'criteria'=>$criteria,
		));
	}
}