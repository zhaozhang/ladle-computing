<?php

/**
 * This is the model class for table "info_user_fee".
 *
 * The followings are the available columns in table 'info_user_fee':
 * @property integer $SeqID
 * @property integer $UID
 * @property integer $ProductID
 * @property integer $PackageID
 * @property integer $MonthNum
 * @property string $Amount
 * @property integer $FeeType
 * @property integer $PaySeqID
 * @property string $CreateTime
 * @property integer $State
 * @property string $PayTime
 */
class InfoUserFee extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @return InfoUserFee the static model class
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
		return 'info_user_fee';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('UID, ProductID, PackageID, Amount, FeeType, CreateTime', 'required'),
			array('UID, ProductID, PackageID, MonthNum, FeeType, PaySeqID, State', 'numerical', 'integerOnly'=>true),
			array('Amount', 'length', 'max'=>8),
			array('PayTime', 'safe'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('SeqID, UID, ProductID, PackageID, MonthNum, Amount, FeeType, PaySeqID, CreateTime, State, PayTime', 'safe', 'on'=>'search'),
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
			'UID' => 'Uid',
			'ProductID' => 'Product',
			'PackageID' => 'Package',
			'MonthNum' => 'Month Num',
			'Amount' => 'Amount',
			'FeeType' => 'Fee Type',
			'PaySeqID' => 'Pay Seq',
			'CreateTime' => 'Create Time',
			'State' => 'State',
			'PayTime' => 'Pay Time',
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

		$criteria->compare('UID',$this->UID);

		$criteria->compare('ProductID',$this->ProductID);

		$criteria->compare('PackageID',$this->PackageID);

		$criteria->compare('MonthNum',$this->MonthNum);

		$criteria->compare('Amount',$this->Amount,true);

		$criteria->compare('FeeType',$this->FeeType);

		$criteria->compare('PaySeqID',$this->PaySeqID);

		$criteria->compare('CreateTime',$this->CreateTime,true);

		$criteria->compare('State',$this->State);

		$criteria->compare('PayTime',$this->PayTime,true);

		return new CActiveDataProvider('InfoUserFee', array(
			'criteria'=>$criteria,
		));
	}
}