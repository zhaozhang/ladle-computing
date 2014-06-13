<?php

/**
 * This is the model class for table "info_product".
 *
 * The followings are the available columns in table 'info_product':
 * @property integer $ProductID
 * @property integer $PackageID
 * @property string $ProductName
 * @property integer $MonthNum
 * @property string $Amount
 * @property string $CreateTime
 * @property integer $State
 */
class InfoProduct extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @return InfoProduct the static model class
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
		return 'info_product';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('ProductID, PackageID, ProductName, Amount, CreateTime', 'required'),
			array('ProductID, PackageID, MonthNum, State', 'numerical', 'integerOnly'=>true),
			array('ProductName', 'length', 'max'=>200),
			array('Amount', 'length', 'max'=>8),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('ProductID, PackageID, ProductName, MonthNum, Amount, CreateTime, State', 'safe', 'on'=>'search'),
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
			'ProductID' => 'Product',
			'PackageID' => 'Package',
			'ProductName' => 'Product Name',
			'MonthNum' => 'Month Num',
			'Amount' => 'Amount',
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

		$criteria->compare('ProductID',$this->ProductID);

		$criteria->compare('PackageID',$this->PackageID);

		$criteria->compare('ProductName',$this->ProductName,true);

		$criteria->compare('MonthNum',$this->MonthNum);

		$criteria->compare('Amount',$this->Amount,true);

		$criteria->compare('CreateTime',$this->CreateTime,true);

		$criteria->compare('State',$this->State);

		return new CActiveDataProvider('InfoProduct', array(
			'criteria'=>$criteria,
		));
	}
}