<?php

class SetProfileController extends CommonController
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
	 * 获取用户信息
	 */	
	public function actiongetUserinfo(){  
		$this->layout = false;
    	$result = array('success' => false, 'data' => array());
    	$uid = Yii::app()->user->getId();
    	if(!$uid){
    		$result['msg'] = '用户未登录';
    		$this->renderText(json_encode($result));
    		return;
    	}
    	
		$record = InfoUser::model()->findByPk($uid, "State = 1");
		if(empty($record))
		{
			$result['msg'] = '用户不存在';
		}else 
		{
			$result['data']['email'] = $record['Email'];
			$result['data']['emailver'] = substr ($record['Verify'],-2,1);
			$result['data']['phone'] = $record['Phone'];
			$result['data']['phonever'] = substr ($record['Verify'],-1,1);
			$result['success'] = true;
		}
		$this->renderText(json_encode($result));
		/*
		$s = '
			{
				"success":true,
				"msg":"",
				"data":{
					"email":"milan_yxh@qq.com",
					"phone": "18583940902"
				}
			}';
	
		echo $s;*/
	}
	/*
	 * 发送验证码
	 */	
	public function actionsendVerifycode(){  
		$this->layout = false;
    	$result = array('success' => false, 'data' => array());
    	$uid = Yii::app()->user->getId();
    	if(!$uid){
    		$result['msg'] = '用户未登录';
    		$this->renderText(json_encode($result));
    		return;
    	}  
    	$telephone = isset($_POST['telephone'])?$_POST['telephone']:''; 	

    	//判断今天是否还可以发送
		$sql= "select TIMESTAMPDIFF(SECOND,MAX(ValidityTime),NOW()) as a,COUNT(*) as b From info_verifycode Where UID = ".$uid." and type = 1 and DATE_FORMAT(ValidityTime,'%m-%d') = DATE_FORMAT(NOW(),'%m-%d')";
    	$connection=Yii::app()->db; 
    	$rows=$connection->createCommand ($sql)->query();
		foreach ($rows as $k => $v ){
			$dataInfo = array_change_key_case($v, CASE_LOWER);
			if($dataInfo["a"] < 180 && $dataInfo["b"] > 0)
			{
				$result['success'] = false;
				$result['msg'] = '请在3分钟后再操作';
		        $this->renderText(json_encode($result));
		        return;
			}elseif ($dataInfo["b"] > 4)
			{
				$result['success'] = false;
				$result['msg'] = '每天最多发送5次验证码，请明日再试';
		        $this->renderText(json_encode($result));
		        return;
			}
		}
    	
		//查询短信模板
		$msg_templet = '';
		$sql= "select ParamValue from sms_templet where ParamName = '验证码'";
    	$connection=Yii::app()->db; 
    	$rows=$connection->createCommand ($sql)->query();
		foreach ($rows as $k => $v ){
			$dataInfo = array_change_key_case($v, CASE_LOWER);
			$msg_templet  = $dataInfo["paramvalue"];
		}
		//产生验证码
		$VerifyCode= rand(0,9).rand(0,9).rand(0,9).rand(0,9).rand(0,9).rand(0,9);
		$msg_templet = str_replace("%s",$VerifyCode,$msg_templet);
		
		//写入验证码信息表
		$current_date = date('Y-m-d H:i:s',time());  
		$ValidityTime = date('Y-m-d H:i:s',strtotime("$current_date + 180 second"));  
		
		$sql= "insert into info_verifycode(UID,Phone,Type,VerifyCode,ValidityTime,State)
		values(".$uid.",'".$telephone."',1,'".$VerifyCode."','".$ValidityTime."',0)";
    	$connection=Yii::app()->db; 
    	$rows=$connection->createCommand ($sql)->query();
		
		//发送短信	
		$sql= "CALL sp_sms_sendmsginsert(".$uid.", '".$telephone."' ,'','".$msg_templet."','".$current_date."' ,2,0);";
    	$connection=Yii::app()->db; 
    	$rows=$connection->createCommand ($sql)->query();
    	
		$result['success'] = true;
		$result['msg'] = '';

        $this->renderText(json_encode($result));
	}	
	/*
	 * 提交手机号
	 */	
	public function actionsubmitPhone(){  
		$this->layout = false;
    	$result = array('success' => false, 'data' => array());
    	$uid = Yii::app()->user->getId();
    	if(!$uid){
    		$result['msg'] = '用户未登录';
    		$this->renderText(json_encode($result));
    		return;
    	}  
    	$verifycode = isset($_POST['verifycode'])?$_POST['verifycode']:''; 	
		$phone = "";
		$seqid = 0;
    	//查询号码，验证码是否正确
		$sql= "select SeqID,VerifyCode,Phone,State,TIMESTAMPDIFF(SECOND,ValidityTime,NOW()) as a from info_verifycode where uid = ".$uid." and type = 1 order by ValidityTime desc";
    	$connection=Yii::app()->db; 
    	$rows=$connection->createCommand ($sql)->query();
		foreach ($rows as $k => $v ){
			$dataInfo = array_change_key_case($v, CASE_LOWER);
			if($dataInfo["a"] < "180" && $dataInfo["state"] == "0" && $dataInfo["verifycode"] == $verifycode)
			{
				$phone = $dataInfo["phone"];
				$seqid = $dataInfo["seqid"];
			}else 
			{
				$result['success'] = false;
				$result['msg'] = '验证错误，号码修改失败';
				$this->renderText(json_encode($result));
				return;
			}
			break;
		}
		//更新手机号码
		$sql= "update info_user set Phone = '".$phone."',verify = concat(left(verify,length(verify)-1),'1') where uid = ".$uid;
    	$connection=Yii::app()->db; 
    	$rows=$connection->createCommand ($sql)->query();

    	//更新
		$sql= "update info_verifycode set state = 1 where SeqID = ".$seqid;
    	$connection=Yii::app()->db; 
    	$rows=$connection->createCommand ($sql)->query();
    	
    	$result['success'] = true;
		$result['msg'] = '手机号码修改成功';
        $this->renderText(json_encode($result));
	}	
	/*
	 * 发送验证邮件
	 */	
	public function actionsendVerifyemail(){  
	$this->layout = false;
    	$result = array('success' => false, 'data' => array());
    	$uid = Yii::app()->user->getId();
    	if(!$uid){
    		$result['msg'] = '用户未登录';
    		$this->renderText(json_encode($result));
    		return;
    	}  
    	$email = isset($_POST['email'])?$_POST['email']:''; 	
		
    	//发送验证邮件
    	
		$result['success'] = true;
		$result['msg'] = '';

        $this->renderText(json_encode($result));
	}
}
