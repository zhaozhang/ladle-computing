<?php

/**
 * This is the model class for table "info_school".
 *
 * The followings are the available columns in table 'info_school':
 * @property integer $SchoolID
 * @property string $Province
 * @property string $SchoolName
 * @property string $City
 * @property string $Phone
 * @property string $Address
 * @property string $PostCode
 * @property string $Home
 * @property string $Email
 * @property string $CreateTime
 */
class InfoSchool extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @return InfoSchool the static model class
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
		return 'info_school';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('Province, City, PostCode', 'length', 'max'=>16),
			array('SchoolName, Address', 'length', 'max'=>128),
			array('Phone', 'length', 'max'=>32),
			array('Home, Email', 'length', 'max'=>64),
			array('CreateTime', 'safe'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('SchoolID, Province, SchoolName, City, Phone, Address, PostCode, Home, Email, CreateTime', 'safe', 'on'=>'search'),
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
			'SchoolID' => '学校ID',
			'Province' => '省份',
			'SchoolName' => '学校名称',
			'City' => '城市',
			'Phone' => '联系电话',
			'Address' => '学校地址',
			'PostCode' => '邮政编码',
			'Home' => '学校主页',
			'Email' => '联系邮箱',
			'CreateTime' => '创建时间',
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

		$criteria->compare('SchoolID',$this->SchoolID);

		$criteria->compare('Province',$this->Province,true);

		$criteria->compare('SchoolName',$this->SchoolName,true);

		$criteria->compare('City',$this->City,true);

		$criteria->compare('Phone',$this->Phone,true);

		$criteria->compare('Address',$this->Address,true);

		$criteria->compare('PostCode',$this->PostCode,true);

		$criteria->compare('Home',$this->Home,true);

		$criteria->compare('Email',$this->Email,true);

		$criteria->compare('CreateTime',$this->CreateTime,true);

		return new CActiveDataProvider('InfoSchool', array(
			'criteria'=>$criteria,
		));
	}
}
