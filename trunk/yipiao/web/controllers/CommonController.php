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
		$oldpwd 	= isset($_POST['oldpwd'])?$_POST['oldpwd']:'';
		$newpwd 	= isset($_POST['newpwd'])?$_POST['newpwd']:'';
		$s = '
			{
				"success":true,
				"msg":"密码修改成功"
			}';
	
		echo $s;
	}	
	/*
	 * 获取用户信息
	 */	
	public function actiongetUserinfo(){  
		$s = '
			{
				"success":true,
				"msg":"",
				"data":{
					"email":"milan_yxh@qq.com",
					"phone": "18583940902"
				}
			}';
	
		echo $s;
	}	
	/*
	 * 修改信息
	 */	
	public function actioneditUserinfo(){  
		$email 	= isset($_POST['email'])?$_POST['email']:'';
		$phone 	= isset($_POST['phone'])?$_POST['phone']:'';
		$s = '
			{
				"success":true,
				"msg":"信息修改成功"
			}';
	
		echo $s;
	}			
	/*
	 * 获取用户菜单
	 */
	public function actionLayoutgetmenu(){  
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
		echo $s;
    } 
}
?>
