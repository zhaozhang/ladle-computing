<?php

class SuggestController extends CommonController
{
    public function actionIndex()
    {
        $this->renderPartial('index');
    }	 

    public function actionGetpage()
    {
 		$this->layout = false;
    	$result = array('success' => false, 'data' => array());
    	$uid = Yii::app()->user->getId();
    	if(!$uid){
    		$result['msg'] = '用户未登录';
    		$this->renderText(json_encode($result));
    		return;
    	}
		$sessionInfo = AdminUtil::getUserSessionInfo($uid);
    	$roleid = $sessionInfo['role_id'];
		$result['success'] = true;
        // 获取目录
        $connection=Yii::app()->db; 
    	$sql="select m.* from p_role_menu rm,p_menu m where rm.menuid = m.menuid
    										and m.pmenuid = 0  
    										and rm.roleid = ".$roleid."   
											order by m.orderindex";
		$rows=$connection->createCommand ($sql)->query();
		foreach ($rows as $k => $v ){
			$menuInfo = array_change_key_case($v, CASE_LOWER);
			$menujson = array(
				'id' => $menuInfo["menuid"],
	            'text'=> $menuInfo["name"],
				'iconCls'=> $menuInfo["icon"],
				'attributes'=>array(
					'isleaf'=>$menuInfo['isleaf'],
				    'href'=>$menuInfo['url']
				),
				'children'=>array()
			);
			$sql="select m.* from p_role_menu rm,p_menu m where rm.menuid = m.menuid
    										and m.pmenuid = ".$menuInfo["menuid"]."   
    										and rm.roleid = ".$roleid."   
											order by m.orderindex";
			$rowstemp=$connection->createCommand ($sql)->query();
			foreach ($rowstemp as $k1 => $v1 ){
				$menuInfo1 = array_change_key_case($v1, CASE_LOWER);
				$menujson['children'][] = array(
                	'id' => $menuInfo1["menuid"],
		            'text'=> $menuInfo1["name"],
					'iconCls'=> $menuInfo1["icon"],
					'attributes'=>array(
						'isleaf'=>$menuInfo1['isleaf'],
					    'href'=>$this->createUrl($menuInfo1['url'])
					)
                );
			}
			$result['data'][] = $menujson;
		}
        $this->renderText(json_encode($result));
   	}
    public function actionSavesuggest()
    {
    	$this->layout = false;
    	$result = array('success' => false, 'data' => array());
    	$uid = Yii::app()->user->getId();
    	if(!$uid){
    		$result['success'] = false;
    		$result['msg'] = '用户未登录';
    		$this->renderText(json_encode($result));
    		return;
    	}
    	$sessionInfo = AdminUtil::getUserSessionInfo($uid);
    	$schoolid = $sessionInfo['school_id'];
    	
		$result['msg'] = '数据提交失败';
		$connection=Yii::app()->db; 
		$sql="insert into info_suggest(UID,Type,Page,Description,CreateTime)
				values(".$uid.",".$_POST['type'].",'".$_POST['page']."','".$_POST['message']."',now())";
		$rows=$connection->createCommand ($sql)->query();
		
		$result['success'] = true;
		$result['msg'] = '数据提交成功';
		$this->renderText(json_encode($result));
    }
}
