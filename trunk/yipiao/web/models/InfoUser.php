<?php

/**
 * This is the model class for table "info_user".
 *
 * The followings are the available columns in table 'info_user':
 * @property integer $UID
 * @property string $UserName
 * @property string $Pwd
 * @property string $Email
 * @property string $Phone
 * @property string $RegTime
 * @property integer $State
 */
class InfoUser extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @return InfoUser the static model class
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
		return 'info_user';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('UserName, Pwd, RegTime', 'required'),
			array('State', 'numerical', 'integerOnly'=>true),
			array('UserName, Pwd, Email, Phone', 'length', 'max'=>32),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('UID, UserName, Pwd, Email, Phone, RegTime, State', 'safe', 'on'=>'search'),
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
			'UserName' => 'User Name',
			'Pwd' => 'Pwd',
			'Email' => 'Email',
			'Phone' => 'Phone',
			'RegTime' => 'Reg Time',
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

		$criteria->compare('UserName',$this->UserName,true);

		$criteria->compare('Pwd',$this->Pwd,true);

		$criteria->compare('Email',$this->Email,true);

		$criteria->compare('Phone',$this->Phone,true);

		$criteria->compare('RegTime',$this->RegTime,true);

		$criteria->compare('State',$this->State);

		return new CActiveDataProvider('InfoUser', array(
			'criteria'=>$criteria,
		));
	}
}