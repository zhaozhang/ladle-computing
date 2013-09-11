<?php

class CommonController extends CController
{
	public function actionIndex(){  
		echo '建设中...';
	}	
	/*
	 * 修改密码
	 */	
	public function actioneditUserpwd(){  
		$uid 	= isset($_POST['uid'])?$_POST['uid']:'';
		$oldpwd = isset($_POST['oldpwd'])?$_POST['oldpwd']:'';
		$newpwd = isset($_POST['newpwd'])?$_POST['newpwd']:'';
		
		$this->layout = false;
		$result = array('msg' => '', 'data' => array());
		$success = false;
		$msg = '';
		$record = InfoUser::model()->findByPk($uid, "State = 1");
		if(empty($record))
		{
			$msg = '用户不存在';
		}
		else if($record['Pwd'] != $oldpwd)
		{
			$msg = '原密码错误';
		}else
		{
			$fields = array();
			$fields['Pwd'] = $newpwd;
			$affectedRow = $record->updateByPk($uid, $fields);
			if (1 == $affectedRow)
			{
				$success = true;
				$msg = '密码修改成功!';
			}
		}
		
		$result['success'] = $success;
        $result['msg'] = $msg;
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
		$uid 	= isset($_POST['uid'])?$_POST['uid']:'';
		
		$this->layout = false;
		$result = array('msg' => '', 'data' => array());
		$success = false;
		$msg = '';
		$record = InfoUser::model()->findByPk($uid, "State = 1");
		if(empty($record))
		{
			$msg = '用户不存在';
		}else 
		{
			$result['data']['email'] = $record['Email'];
			$result['data']['phone'] = $record['Phone'];
			$result['success'] = true;
		}
		$result['msg'] = $msg;
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
	 * 修改信息
	 */	
	public function actioneditUserinfo(){  
		$uid 	= isset($_POST['uid'])?$_POST['uid']:'';
		$email 	= isset($_POST['email'])?$_POST['email']:'';
		$phone 	= isset($_POST['phone'])?$_POST['phone']:'';
		$this->layout = false;
		$result = array('msg' => '', 'data' => array());
		$success = false;
		$msg = '';
		$record = InfoUser::model()->findByPk($uid, "State = 1");
		if(empty($record))
		{
			$msg = '用户不存在';
		}
		else
		{
			$fields = array();
			$fields['Email'] = $email;
			$fields['Phone'] = $phone;
			$affectedRow = $record->updateByPk($uid, $fields);
			if (1 == $affectedRow)
			{
				$success = true;
				$msg = '信息修改成功!';
			}
		}
		
		$result['success'] = $success;
        $result['msg'] = $msg;
        $this->renderText(json_encode($result));
		/*
		$s = '
			{
				"success":true,
				"msg":"信息修改成功"
			}';
	
		echo $s;*/
	}			
	/*
	 * 获取用户菜单
	 */
	public function actionLayoutgetmenu(){  
		$uid 	= isset($_POST['uid'])?$_POST['uid']:'';
		$roleid 	= isset($_POST['roleid'])?$_POST['roleid']:'';
		
		$this->layout = false;
        $result = array('success' => true, 'msg'=>'', 'data' => array());

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
					    'href'=>$menuInfo1['url']
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
