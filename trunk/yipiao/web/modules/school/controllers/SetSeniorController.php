<?php

class SetSeniorController extends CommonController
{
    public function actionIndex()
    {
        $this->renderPartial('index');
    }	 

	/*
	 * 查询号码
	 */ 
    public function actionGetphone()
    {
    	$this->layout = false;
    	$result = array('success' => false, 'data' => array());
    	$uid = Yii::app()->user->getId();
    	if(!$uid){
    		$result['msg'] = '用户未登录';
    		$this->renderText(json_encode($result));
    		return;
    	};
    	   	
        $this->layout = false;
        $result = array('success' => true, 'msg' => '');
        $sql= "select seqid,phone,remark from info_user_phone where uid = ".$uid." and state = 1";
    	$connection=Yii::app()->db; 
    	$rows=$connection->createCommand ($sql)->query();    		
        foreach ($rows as $k => $v )
        {
            $result['data'][] = array_change_key_case($v, CASE_LOWER);
        }    
        $this->renderText(json_encode($result));
	}	

	/*
	 * 删除号码
	 */ 
    public function actionDeletephone()
    {	
        $this->layout = false;
    	$result = array('success' => false, 'data' => array());
    	$uid = Yii::app()->user->getId();
    	if(!$uid){
    		$result['msg'] = '用户未登录';
    		$this->renderText(json_encode($result));
    		return;
    	};
    	
    	$seqids = isset($_POST['UIDs'])? $_POST['UIDs'] : 0;//可以是多个，英文逗号隔开
        $seqidList = explode(",", $seqids);

        $result = array('msg' => '号码删除成功!', 'data' => array());
        $succCount = 0;
        foreach ($seqidList as $seqid)
        {
        	$sql= "update info_user_phone set state = 0 where seqid = ".$seqid;
	    	$connection=Yii::app()->db; 
	    	$rows=$connection->createCommand ($sql)->query();
            $succCount += 1;
        }   

        $result['success'] = $succCount == count($seqidList);
        $this->renderText(json_encode($result));
    }

    /*
     * 更新号码
     */
	public function actionUpdatephone()
	{
        $this->layout = false;
    	$result = array('success' => false, 'data' => array());
    	$uidsession = Yii::app()->user->getId();
    	if(!$uidsession){
    		$result['msg'] = '用户未登录';
    		$this->renderText(json_encode($result));
    		return;
    	};
    	
		$seqid = isset($_POST['SeqID'])? $_POST['SeqID'] : 0;
		$phone = isset($_POST['Phone'])? $_POST['Phone'] : '';
		$remark = isset($_POST['Remark'])? $_POST['Remark'] : '';

		$msg = '操作失败';
        $result = array('msg' => '操作失败', 'data' => array());
        $success = false;

		if (0 == $seqid) //添加
        {
        	$sql= "select * from info_user_phone where uid = ".$uidsession." and state = 1";
	    	$connection=Yii::app()->db; 
	    	$rows=$connection->createCommand ($sql)->query();
        	if(count($rows) >  2 )
        	{
        		$success = false;
	        	$msg = '号码不能超过3个';
        	}
	        else {
		        //查询号码是否存在
	        	$sql= "select seqid,state from info_user_phone where uid = ".$uidsession." and phone = '".$phone."'";
		    	$connection=Yii::app()->db; 
		    	$rows=$connection->createCommand ($sql)->query();
	        	if(count($rows) >  0 )
	        	{	
	        		$statetemp = '';
	        		$seqidtemp = '';
		        	foreach ($rows as $k => $v ){
						$dataInfo = array_change_key_case($v, CASE_LOWER);
						$statetemp = $dataInfo["state"];
						$seqidtemp = $dataInfo["seqid"];
						break;
					}
					if($statetemp == '1')
					{
						$success = false;
			        	$msg = '号码已存在';
					}
					else {
						$sql= "update info_user_phone set state = 1
		        		where seqid = ".$seqidtemp;
		        		$connection=Yii::app()->db; 
				    	$rows=$connection->createCommand ($sql)->query();
				    	$success = true;
			        	$msg = '号码添加成功!';
			        	$result["data"]["id"] = $seqidtemp;
					}
	        	}     
	        	else
	        	{
	        		$record = new InfoUserPhone();
		            // TODO: 需要先根据角色为其生成1个uid
		            $record->UID = $uidsession;
		            $record->Phone = $phone;
		            $record->Remark = $remark;
		            $record->State = 1;
					$record->CreateTime=date("Y-m-d H:i:s");
		        	if ($record->save() && $record->validate())
					{
						$success = true;
			        	$msg = '号码添加成功!';
						$result["data"]["id"]=$record->getPrimaryKey();
					}
	        	}
	        }	
        }
        else 
        {
        	//查询新号码是否存在
        	$sql= "select seqid,state from info_user_phone where uid = ".$uidsession." and phone = '".$phone."'";
	    	$connection=Yii::app()->db; 
	    	$rows=$connection->createCommand ($sql)->query();
        	if(count($rows) >  0 )
        	{	
        		$statetemp = '';
        		$seqidtemp = '';
	        	foreach ($rows as $k => $v ){
					$dataInfo = array_change_key_case($v, CASE_LOWER);
					$statetemp = $dataInfo["state"];
					$seqidtemp = $dataInfo["seqid"];
					break;
				}
				if($statetemp == '1')
				{
					$success = false;
		        	$msg = '号码已存在';
				}
				else {
					$sql= "update info_user_phone set state = 0 
	        		where seqid = ".$seqid;
	        		$connection=Yii::app()->db; 
			    	$rows=$connection->createCommand ($sql)->query();
		    	
					$sql= "update info_user_phone set state = 1
	        		where seqid = ".$seqidtemp;
	        		$connection=Yii::app()->db; 
			    	$rows=$connection->createCommand ($sql)->query();
			    	$success = true;
		        	$msg = '号码修改成功!';
		        	$result["data"]["id"] = $seqidtemp;
				}
        	}   
        	else
        	{
        		$sql= "update info_user_phone set phone = '".$phone."',remark = '".$remark."' 
        		where seqid = ".$seqid;
        		$connection=Yii::app()->db; 
		    	$rows=$connection->createCommand ($sql)->query();
 				$msg = '号码修改成功!';
            	$success = true;
        	}
        }
        $result['success'] = $success;
        $result['msg'] = $msg;
        $this->renderText(json_encode($result));
	}     
}
