<?php

class PayController extends CommonController
{
    public function actionIndex()
    {
        $this->renderPartial('index');
    }	 

	public function actioneditUserpwd(){  
		$this->layout = false;
    	$result = array('success' => false, 'data' => array());
    	$uid = Yii::app()->user->getId();
    	if(!$uid){
    		$result['msg'] = '用户未登录';
    		$this->renderText(json_encode($result));
    		return;
    	}
    	
		$oldpwd = isset($_POST['oldpwd'])?$_POST['oldpwd']:'';
		$newpwd = isset($_POST['newpwd'])?$_POST['newpwd']:'';

		$record = InfoUser::model()->findByPk($uid, "State = 1");
		if(empty($record))
		{
			$result['msg'] = '用户不存在';
		}
		else if($record['Pwd'] != $oldpwd)
		{
			$result['msg'] = '原密码错误';
		}else
		{
			$fields = array();
			$fields['Pwd'] = $newpwd;
			$affectedRow = $record->updateByPk($uid, $fields);
			if (1 == $affectedRow)
			{
				$result['success'] = true;
				$result['msg'] = '密码修改成功!';
			}
		}
		
        $this->renderText(json_encode($result));
    /*    
		$s = '
			{
				"success":true,
				"msg":"密码修改成功"
			}';
	
		echo $s;*/
	}
	/*
	 * 
	 */	
	public function actiongetPayinfo(){  
		$this->layout = false;
    	$result = array('success' => false, 'data' => array());
    	$uid = Yii::app()->user->getId();
    	if(!$uid){
    		$result['msg'] = '用户未登录';
    		$this->renderText(json_encode($result));
    		return;
    	}
    	//查询产品信息
    	$productList = InfoProduct::model()->findAllByAttributes(array('State' => 1));
    	            $isfirst = true;
		foreach ($productList as $productRecord)
    	{
    		$productInfo = array_change_key_case((array)$productRecord->getAttributes(), CASE_LOWER);

            $productjson = array(
            	'id' => $productInfo["productid"],
	            'text'=>$productInfo["productname"],
            	'selected'=>$isfirst,
            	'amount'=>$productInfo["amount"]);
			$isfirst = false;
            $result['data']['product'][] = $productjson; 		
    	}

		//查询用户套餐信息
		$packageList = InfoUserPackage::model()->findAll("UID = :UID AND PackageID = 1 AND Validity > now() and State = 1",
			array('UID'=>$uid));
		foreach ($packageList as $packagerecord)
        {
        	$result['data']['package'] = array();
			$result['data']['package']['packageid'] = $packagerecord['PackageID'];
			$result['data']['package']['validity'] = $packagerecord['Validity'];
		}
		
    	//查询用户付费记录
		$payList = InfoUserFee::model()->findAll("UID = :UID AND State = 1 ORDER BY PayTime DESC",
        		array('UID'=>$uid));       		
        foreach ($payList as $payrecord)
        {
            $payInfo = $payrecord->getAttributes();
            $result['data']['paylist'][] = array_change_key_case($payInfo, CASE_LOWER);
        }       	
    	
    	$result['success'] = true;
    	
		$this->renderText(json_encode($result));
	}
	
	/*
	 * 
	 */	
	public function actionPay(){  
		$this->layout = false;
    	$result = array('success' => false, 'data' => array());
    	$uid = Yii::app()->user->getId();
    	if(!$uid){
    		$result['msg'] = '用户未登录';
    		$this->renderText(json_encode($result));
    		return;
    	}
    	$productid	= isset($_POST['productid'])?$_POST['productid']:0;
    	//查询产品信息
    	$record = InfoProduct::model()->findByPk($productid, "State = 1");
		if(empty($record))
		{
			$result['success'] = false;
			$result['msg'] = '产品信息错误';
			$this->renderText(json_encode($result));
			return;
		}
		//创建支付记录
		$payinfo = new InfoUserFee();
		$payinfo->UID = $uid;
		$payinfo->ProductID = $productid;
		$payinfo->PackageID = $record['PackageID'];
		$payinfo->MonthNum = $record['MonthNum'];
		$payinfo->Amount = $record['Amount'];
    	$payinfo->FeeType = 1;
    	$payinfo->CreateTime = date("Y-m-d H:i:s");

		if ($payinfo->save() && $payinfo->validate())
		{
			$result['success'] = true;
			$result["data"]["id"] = $payinfo->getPrimaryKey();
			$result["data"]["amount"] = $record['Amount'];
		}
		$this->renderText(json_encode($result));
	}
}
