<?php

/**
 * This is the model class for table "sms_templet".
 *
 * The followings are the available columns in table 'sms_templet':
 * @property string $ParamName
 * @property string $ParamValue
 */
class SmsTemplet extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @return SmsTemplet the static model class
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
		return 'sms_templet';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('ParamName, ParamValue', 'required'),
			array('ParamName', 'length', 'max'=>50),
			array('ParamValue', 'length', 'max'=>500),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('ParamName, ParamValue', 'safe', 'on'=>'search'),
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
			'ParamName' => 'Param Name',
			'ParamValue' => 'Param Value',
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

		$criteria->compare('ParamName',$this->ParamName,true);

		$criteria->compare('ParamValue',$this->ParamValue,true);

		return new CActiveDataProvider('SmsTemplet', array(
			'criteria'=>$criteria,
		));
	}
}