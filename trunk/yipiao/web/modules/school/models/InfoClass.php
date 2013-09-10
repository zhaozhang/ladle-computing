<?php

/**
 * This is the model class for table "info_class".
 *
 * The followings are the available columns in table 'info_class':
 * @property integer $ClassID
 * @property integer $SchoolID
 * @property integer $GradeID
 * @property string $ClassName
 * @property integer $Type
 * @property integer $State
 */
class InfoClass extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @return InfoClass the static model class
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
		return 'info_class';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('SchoolID, GradeID', 'required'),
			array('SchoolID, GradeID, Type, State', 'numerical', 'integerOnly'=>true),
			array('ClassName', 'length', 'max'=>32),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('ClassID, SchoolID, GradeID, ClassName, Type, State', 'safe', 'on'=>'search'),
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

	public function primaryKey()
	{
		return 'ClassID';
	}
	
	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'ClassID' => '班级ID',
			'SchoolID' => '学校',
			'GradeID' => '年级',
			'ClassName' => '名称',
			'Type' => '班级类型',
			'State' => '有效状态',
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

		$criteria->compare('ClassID',$this->ClassID);

		$criteria->compare('SchoolID',$this->SchoolID);

		$criteria->compare('GradeID',$this->GradeID);

		$criteria->compare('ClassName',$this->ClassName,true);

		$criteria->compare('Type',$this->Type);

		$criteria->compare('State',$this->State);

		return new CActiveDataProvider('InfoClass', array(
			'criteria'=>$criteria,
		));
	}
}
