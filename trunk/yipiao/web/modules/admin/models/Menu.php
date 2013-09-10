<?php

/**
 * This is the model class for table "p_menu".
 *
 * The followings are the available columns in table 'p_menu':
 * @property integer $MenuID
 * @property integer $PMenuID
 * @property string $Icon
 * @property integer $Isleaf
 * @property string $Name
 * @property string $Url
 * @property integer $OrderIndex
 */
class Menu extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @return Menu the static model class
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
		return 'p_menu';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('PMenuID, Isleaf, Name, Url, OrderIndex', 'required'),
			array('PMenuID, Isleaf, OrderIndex', 'numerical', 'integerOnly'=>true),
			array('Icon, Name, Url', 'length', 'max'=>64),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('MenuID, PMenuID, Icon, Isleaf, Name, Url, OrderIndex', 'safe', 'on'=>'search'),
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
			'MenuID' => 'Menu',
			'PMenuID' => 'Pmenu',
			'Icon' => 'Icon',
			'Isleaf' => 'Isleaf',
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

		$criteria->compare('MenuID',$this->MenuID);

		$criteria->compare('PMenuID',$this->PMenuID);

		$criteria->compare('Icon',$this->Icon,true);

		$criteria->compare('Isleaf',$this->Isleaf);

		$criteria->compare('Name',$this->Name,true);

		$criteria->compare('Url',$this->Url,true);

		$criteria->compare('OrderIndex',$this->OrderIndex);

		return new CActiveDataProvider('Menu', array(
			'criteria'=>$criteria,
		));
	}
}