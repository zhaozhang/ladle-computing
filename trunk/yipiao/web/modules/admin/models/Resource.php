<?php

/**
 * This is the model class for table "p_resource".
 *
 * The followings are the available columns in table 'p_resource':
 * @property integer $ResourceID
 * @property integer $PResourceID
 * @property string $Name
 * @property string $Url
 * @property integer $OrderIndex
 */
class Resource extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @return Resource the static model class
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
		return 'p_resource';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('PResourceID, Name, Url, OrderIndex', 'required'),
			array('PResourceID, OrderIndex', 'numerical', 'integerOnly'=>true),
			array('Name, Url', 'length', 'max'=>64),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('ResourceID, PResourceID, Name, Url, OrderIndex', 'safe', 'on'=>'search'),
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
			'ResourceID' => 'Resource',
			'PResourceID' => 'Presource',
			'Name' => 'Name',
			'Url' => 'Url',
			'OrderIndex' => 'Order Index',
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

		$criteria->compare('ResourceID',$this->ResourceID);

		$criteria->compare('PResourceID',$this->PResourceID);

		$criteria->compare('Name',$this->Name,true);

		$criteria->compare('Url',$this->Url,true);

		$criteria->compare('OrderIndex',$this->OrderIndex);

		return new CActiveDataProvider('Resource', array(
			'criteria'=>$criteria,
		));
	}
}