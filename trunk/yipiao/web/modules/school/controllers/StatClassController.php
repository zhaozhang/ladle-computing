<?php

class StatClassController extends CommonController
{
    public function actionIndex()
    {
        $this->renderPartial('index');
    }	 
	/*
	 * 获取用户可选择班级
	 */ 
    public function actionGetgrade()
    {
    	//iconCls 根据文理科配置成不一样的
    	$s = '{
			  "success": true,
			  "msg": "",
			  "data": [
			    {
			      "id": "1",
			      "text": "高2014级",
			      "selected": false
			    },
			    {
			      "id": "2",
			      "text": "高2015级",
			      "selected": true
			    }
			  ]
			}';

        echo $s;
	}   
	/*
	 * 获取用户可选择考试，按时间倒序
	 */ 
    public function actionGetexam()
    {
    	$gradeid 	= isset($_POST['GradeID'])?$_POST['GradeID']:'';
    	$s = '{
			  "success": true,
			  "msg": "",
			  "data": [
			    {
			      "id": "1",
			      "text": "考试1",
			      "selected": true,
			      "subject": [
			        {
			          "id": "1",
			          "text": "语文",
			          "selected": true
			        },
			        {
			          "id": "2",		          
			          "text": "数学",
			          "selected": true
			        }
			      ]
			    },
			    {
			      "id": "2",
			      "text": "考试2",
			      "selected": false,
			      "subject": [
			         {
			          "id": "1",
			          "text": "语文",
			          "selected": true
			        },
			        {
			          "id": "3",		          
			          "text": "英语",
			          "selected": true
			        }
			      ]
			    }
			  ]
			}';

        echo $s;
	}       
	/*
	 * 查询成绩
	 */ 
    public function actionGetscore()
    {
    	$classid 	= isset($_POST['ClassID'])?$_POST['ClassID']:'';
     	$examid 	= isset($_POST['ExamID'])?$_POST['ExamID']:'';   	
    	$subjectid	= isset($_POST['SubjectID'])?$_POST['SubjectID']:'';
    	$s = '{
			  "success": true,
			  "msg": "",
			  "data": [
			    {
			      "sname": "语文",
			      "cname": "高2016级1班",
			      "clevel" : "1",
			      "tname": "教师1",
			      "avg": "97.76",
			      "avg-r": "1",
			      "avg-r1": "1",
			      "max" : "127",
			      "max-r": "1",
			      "max-r1": "1",
				  "min" : "67",
			      "min-r":"1",
			      "min-r1":	"1",		      
				  "passrate" : "63.67%",
			      "passrate-r":"1",
			      "passrate-r1": "1",
			      "150-141": "7",
			      "140-131": "4",
			      "130-121": "9"
			    },
			    {
			      "sname": "语文",
			      "cname": "高2016级2班",
			      "clevel" : "2",
			      "tname": "教师2",
			      "avg": "86.56",
			      "avg-r": "2",
			      "avg-r1": "2",
			      "max" : "122",
			      "max-r": "2",
			      "max-r1": "2",
				  "min" : "56",
			      "min-r":"2",
			      "min-r1":	"2",		      
				  "passrate" : "54.78%",
			      "passrate-r":"2",
			      "passrate-r1": "2",
			      "150-141": "3",
			      "140-131": "1",
			      "130-121": "6"
			    },
			    {
			      "sname": "语文",
			      "cname": "高2016级",
			      "clevel" : "-1",
			      "tname": "",
			      "avg": "96.43",
			      "avg-r": "",
			      "avg-r1": "",
			      "max" : "122",
			      "max-r": "",
			      "max-r1": "",
				  "min" : "56",
			      "min-r":"",
			      "min-r1":	"",		      
				  "passrate" : "62.49%",
			      "passrate-r":"",
			      "passrate-r1": "",
			      "150-141": "10",
			      "140-131": "5",
			      "130-121": "15"
			    }
			  ],
			  "scorerange": "150-141,140-131,130-121"
			}';
        echo $s;
	}	
}
