<?php

/**
 * This is the model class for table "info_exam_score".
 *
 * The followings are the available columns in table 'info_exam_score':
 * @property integer $SeqID
 * @property integer $ExamID
 * @property integer $SubjectID
 * @property integer $UID
 * @property integer $GradeID
 * @property integer $ClassID
 * @property string $Score
 * @property integer $ClassRank
 * @property integer $GradeRank
 */
class InfoExamScore extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @return InfoExamScore the static model class
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
		return 'info_exam_score';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('ExamID, SubjectID, UID, GradeID, ClassID', 'required'),
			array('ExamID, SubjectID, UID, GradeID, ClassID, ClassRank, GradeRank', 'numerical', 'integerOnly'=>true),
			array('Score', 'length', 'max'=>8),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('SeqID, ExamID, SubjectID, UID, GradeID, ClassID, Score, ClassRank, GradeRank', 'safe', 'on'=>'search'),
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
			'SeqID' => 'Seq',
			'ExamID' => 'Exam',
			'SubjectID' => 'Subject',
			'UID' => 'Uid',
			'GradeID' => 'Grade',
			'ClassID' => 'Class',
			'Score' => 'Score',
			'ClassRank' => 'Class Rank',
			'GradeRank' => 'Grade Rank',
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

		$criteria->compare('SeqID',$this->SeqID);

		$criteria->compare('ExamID',$this->ExamID);

		$criteria->compare('SubjectID',$this->SubjectID);

		$criteria->compare('UID',$this->UID);

		$criteria->compare('GradeID',$this->GradeID);

		$criteria->compare('ClassID',$this->ClassID);

		$criteria->compare('Score',$this->Score,true);

		$criteria->compare('ClassRank',$this->ClassRank);

		$criteria->compare('GradeRank',$this->GradeRank);

		return new CActiveDataProvider('InfoExamScore', array(
			'criteria'=>$criteria,
		));
	}
}