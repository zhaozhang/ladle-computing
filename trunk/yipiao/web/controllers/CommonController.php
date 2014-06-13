<?php

class CommonController extends CController
{
    public $layout = "//layouts/main";

    public function filters()
    {
        return array(
            'accessControl', // perform access control for CRUD operations
        );
    }

    public function accessRules()
    {
        return array(
            array('allow', // allow authenticated user to perform 'create' and 'update' actions
                'actions'=>array('index',), 
                'users'=>array('@'),
            ),
        );
    }

	public function actionIndex(){  
        $this->render('index');
	}	
	/*
	 * 切换版本
	 */	
	public function actionchangeVersion(){  
		$this->layout = false;
    	$result = array('success' => false, 'data' => array());
    	$uid = Yii::app()->user->getId();
    	if(!$uid){
    		$result['msg'] = '用户未登录';
    		$this->renderText(json_encode($result));
    		return;
    	}
    	
		$type = isset($_POST['type'])?$_POST['type']:'';

		$sql= "update p_user_role set RoleID = ".$type." where uid =".$uid;
	    $connection=Yii::app()->db; 
	   	$rows=$connection->createCommand ($sql)->query();
	  
	   	if($type == '6') 
	   	{
	  	 	$sql= "insert into info_user_package values(".$uid.",1,'2017-1-1',1,Now())";
	   	}
	  	elseif($type == '1') 
	  		$sql= "delete from info_user_package where uid = ".$uid;
	    $connection=Yii::app()->db; 
	   	$rows=$connection->createCommand ($sql)->query();
	   	
		$result['success'] = true;
		$result['msg'] = '';
	
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
	 * 重置密码
	 */	
	public function actionresetUserpwd(){  
		$this->layout = false;
    	$result = array('success' => false, 'data' => array());
    	
		$type = isset($_POST['type'])?$_POST['type']:'';
		$username = isset($_POST['username'])?$_POST['username']:'';
		$param = isset($_POST['param'])?$_POST['param']:'';
		
		//判断用户名和参数是否匹配
		$record = InfoUser::model()->find('UserName='.$username.' and State = 1');
		if(empty($record))
		{
			$result['success'] = false;
			$result['msg'] = '用户不存在，重置密码失败';
			$this->renderText(json_encode($result));
			return;
		}
		if($type == 'email')
		{
			if($record['Email'] == '' || substr ($record['Verify'],-2,1) =='0' )
			{
				$result['success'] = false;
				$result['msg'] = '邮箱没有验证，重置密码失败';
				$this->renderText(json_encode($result));
				return;
			}
			else if($record['Email'] != $param)
			{
				$result['success'] = false;
				$result['msg'] = '用户名和邮箱不匹配，重置密码失败';
				$this->renderText(json_encode($result));
				return;
			}
			//重置密码
			$pwd= rand(0,9).rand(0,9).rand(0,9).rand(0,9).rand(0,9).rand(0,9);
			$record->Pwd=$pwd;
			$record->save(); 

			//向用户发送邮件
			
			
		}else if($type == 'mobile')
		{
			if($record['Phone'] == '' || substr ($record['Verify'],-1,1) =='0' )
			{
				$result['success'] = false;
				$result['msg'] = '手机号没有验证，重置密码失败';
				$this->renderText(json_encode($result));
				return;
			}
			else if($record['Phone'] != $param)
			{
				$result['success'] = false;
				$result['msg'] = '用户名和手机号不匹配，重置密码失败';
				$this->renderText(json_encode($result));
				return;
			}
			//重置密码
			$pwd= rand(0,9).rand(0,9).rand(0,9).rand(0,9).rand(0,9).rand(0,9);
			$record->Pwd=$pwd;
			$record->save(); 
			
			//向用户发送短信
			//查询短信模板
			$msg_templet = '';
			$sql= "select ParamValue from sms_templet where ParamName = '密码重置'";
	    	$connection=Yii::app()->db; 
	    	$rows=$connection->createCommand ($sql)->query();
			foreach ($rows as $k => $v ){
				$dataInfo = array_change_key_case($v, CASE_LOWER);
				$msg_templet  = $dataInfo["paramvalue"];
			}
			$msg_templet = str_replace("%s",$pwd,$msg_templet);
		
			$current_date = date('Y-m-d H:i:s',time());  
			$sql= "CALL sp_sms_sendmsginsert(".$record['UID'].", '".$param."' ,'','".$msg_templet."','".$current_date."' ,2,0);";
	    	$connection=Yii::app()->db; 
	    	$rows=$connection->createCommand ($sql)->query();
		}
		$result['success'] = true;
		$result['msg'] = '重置密码成功，请查收';
		$this->renderText(json_encode($result));
	}			
	/*
	 * 获取用户菜单
	 */
	public function actionLayoutgetmenu(){  
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
       /* 
		$uid = '1';
        $roleid = '1';
        $s = '';   
		if($roleid == '1')
			$s = '{
				  "success": true,
				  "msg": "",
				  "data": [
				    {
				      "id": "1",
				      "text": "欢迎",
				      "iconCls": "plugin",
				      "attributes": {
				        "isleaf": "1",
				        "href": "school/welcome/index"
				      }
				    },
				    {
				      "id": "2",
				      "text": "系统管理",
				      "iconCls": "tux",
				      "attributes": {
				        "isleaf": "0",
				        "href": ""
				      },
				      "children": [
				        {
				          "id": "3",
				          "text": "班级管理",
				          "iconCls": "",
				          "attributes": {
				            "isleaf": "1",
				            "href": "school/manClass/index"
				          }
				        },
				        {
				          "id": "4",
				          "text": "教师管理",
				          "iconCls": "",
				          "attributes": {
				            "isleaf": "1",
				            "href": "school/manTeacher/index"
				          }
				        },
				        {
				          "id": "5",
				          "text": "科目管理",
				          "iconCls": "",
				          "attributes": {
				            "isleaf": "1",
				            "href": "school/manSubject/index"
				          }
				        },
				        {
				          "id": "6",
				          "text": "学生管理",
				          "iconCls": "",
				          "attributes": {
				            "isleaf": "1",
				            "href": "school/manStudent/index"
				          }
				        },
				        {
				          "id": "7",
				          "text": "考试管理",
				          "iconCls": "",
				          "attributes": {
				            "isleaf": "1",
				            "href": "school/manExam/index"
				          }
				        },
				        {
				          "id": "8",
				          "text": "成绩管理",
				          "iconCls": "",
				          "attributes": {
				            "isleaf": "1",
				            "href": "school/manScore/index"
				          }
				        }
				      ]
				    },
				    {
				      "id": "9",
				      "text": "成绩统计",
				      "iconCls": "tux",
				      "attributes": {
				        "isleaf": "0",
				        "href": ""
				      },
				      "children": [
				        {
				          "id": "10",
				          "text": "学生成绩",
				          "iconCls": "",
				          "attributes": {
				            "isleaf": "1",
				            "href": "school/statStudent/index"
				          }
				        },
				        {
				          "id": "11",
				          "text": "学生排名",
				          "iconCls": "",
				          "attributes": {
				            "isleaf": "1",
				            "href": "school/statSturank/index"
				          }
				        },
				        {
				          "id": "12",
				          "text": "班级成绩",
				          "iconCls": "",
				          "attributes": {
				            "isleaf": "1",
				            "href": "school/statClass/index"
				          }
				        }
				      ]
				    },
				    {
				      "id": "13",
				      "text": "成绩分析",
				      "iconCls": "tux",
				      "attributes": {
				        "isleaf": "0",
				        "href": ""
				      },
				      "children": [
				        {
				          "id": "14",
				          "text": "学生分析",
				          "iconCls": "",
				          "attributes": {
				            "isleaf": "1",
				            "href": "school/anaStudent/index"
				          }
				        },
				        {
				          "id": "16",
				          "text": "班级分析",
				          "iconCls": "",
				          "attributes": {
				            "isleaf": "1",
				            "href": "school/anaClass/index"
				          }
				        },
				        {
				          "id": "17",
				          "text": "教师分析",
				          "iconCls": "",
				          "attributes": {
				            "isleaf": "1",
				            "href": "common/index"
				          }
				        }
				      ]
				    }
				  ]
				}';
		echo $s;*/
    } 
}
?>
