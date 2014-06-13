<?php

/**
 * This is the model class for table "info_user_phone".
 *
 * The followings are the available columns in table 'info_user_phone':
 * @property integer $SeqID
 * @property integer $UID
 * @property string $Phone
 * @property string $Remark
 * @property integer $State
 * @property string $CreateTime
 */
class InfoUserPhone extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @return InfoUserPhone the static model class
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
		return 'info_user_phone';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('CreateTime', 'required'),
			array('UID, State', 'numerical', 'integerOnly'=>true),
			array('Phone', 'length', 'max'=>20),
			array('Remark', 'length', 'max'=>64),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('SeqID, UID, Phone, Remark, State, CreateTime', 'safe', 'on'=>'search'),
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
			'Phone' => 'Phone',
			'Remark' => 'Remark',
			'State' => 'State',
			'CreateTime' => 'Create Time',
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

		$criteria->compare('Phone',$this->Phone,true);

		$criteria->compare('Remark',$this->Remark,true);

		$criteria->compare('State',$this->State);

		$criteria->compare('CreateTime',$this->CreateTime,true);

		return new CActiveDataProvider('InfoUserPhone', array(
			'criteria'=>$criteria,
		));
	}
}