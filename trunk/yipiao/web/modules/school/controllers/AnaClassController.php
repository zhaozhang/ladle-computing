<?php

class AnaClassController extends CommonController
{
    public function actionIndex()
    {
        $this->renderPartial('index');
    }	 
	/*
	 * 获取年级
	 */ 
    public function actionGetclass()
    {
    	$classtype 	= isset($_POST['ClassType'])?$_POST['ClassType']:'';
    	//iconCls 根据文理科配置成不一样的
    	$s = '{
			  "success": true,
			  "msg": "",
			  "data": [
			    {
			      "id": "g-1",
			      "text": "高2014级",
			      "iconCls": "",
			      "children": [
			        {
			          "id": "1",
			          "text": "高2014级1班",
			          "selected": false,
			          "iconCls": ""
			        },
			        {
			          "id": "2",		          
			          "text": "高2014级2班",
			          "selected": false,
			          "iconCls": ""
			        }
			      ]
			    },
			    {
			      "id": "g-2",
			      "text": "高2015级",
			      "iconCls": "",
			      "children": [
			        {
			          "id": "3",		          
			          "text": "高2015级1班",
			          "selected": true,
			          "iconCls": ""
			        },
			        {
			          "id": "4",		          
			          "text": "高2015级2班",
			          "selected": false,
			          "iconCls": ""
			        }
			      ]
			    }
			  ]
			}';

        echo $s;
	}   
	/*
	 * 获取用户可选择科目
	 */ 
    public function actionGetsubject()
    {
    	$classtype 	= isset($_POST['ClassType'])?$_POST['ClassType']:'';
    	$s = '{
		  "success": true,
		  "msg": "",
		  "data": [
		    {
		      "id": "1",
		      "text": "语文",
		      "selected": true
		    },
		    {
		      "id": "2",
		      "text": "数学",
		      "selected": false
		    },
		    {
		      "id": "3",
		      "text": "英语",
		      "selected": false
		    }
		  ]
		}';

        echo $s;
	}   
	    
	/*
	 * 查询能力值
	 */ 
    public function actionGetyscore()
    {
    	$classid 	= isset($_POST['ClassID'])?$_POST['ClassID']:'';	
    	$SubjectID 	= isset($_POST['SubjectID'])?$_POST['SubjectID']:'';
    	/*
    	 * 能力值|班级排名|年级排名|稳定性|进步值
    	 */
    	$s = '{
			  "success": true,
			  "msg": "",
			  "data": [
			    {
			      "id": "1",
			      "name": "1班",
			      "2013-09-01": "1|中考|84|7|16|0|0",
			      "2013-10-01": "2|第一次月考|89|9|16|4|7",
			      "2013-11-01": "3|半期考试|97|4|12|5|9",
			      "2013-12-01": "4|第三次月考|85|4|12|6|2"
			    },
			    {
			      "id": "2",
			      "name": "2班",
			      "2013-09-01": "1|中考|63|13|24|0|0",
			      "2013-10-01": "2|第一次月考|56|15|27|4|7",
			      "2013-11-01": "3|半期考试|82|24|43|5|9",
			      "2013-12-01": "4|第三次月考|71|34|52|6|2"
			    }
			  ],
			  "examdates": "2013-09-01,2013-10-01,2013-11-01,2013-12-01"
			}';
        echo $s;
	}	
		/*
	 * 查询考试详细能力值
	 */ 
    public function actionGetyscorebyexam()
    {
    	$uid 	= isset($_POST['UID'])?$_POST['UID']:'';	
    	$ExamID 	= isset($_POST['ExamID'])?$_POST['ExamID']:'';
    	$s = '';
    	if('1' == $uid)
	    	$s = '{
				  "success": true,
				  "msg": "",
				  "data": [
				    {
				      "id":"1-4",
				      "name": "1班",
				      "examname": "考试1",
				      "examtime": "2013-5-1",
				      "s1": "117-s1",
				      "s1-cr": 18,
				      "s1-gr": 27,
				      "s1-max": "117",
				      "s1-min": "117",
				      "s1-s": "3",
				      "s1-s-max": "3",
				      "s1-s-min": "3",
				      "s1-i": "3",
				      "s1-i-max": "3",
				      "s1-i-min": "3",
				      "s2": "127-s2",
				      "s2-cr": 17,
				      "s2-gr": 21,
				      "s2-max": "117",
				      "s2-min": "117",
				      "s2-s": "3",
				      "s2-s-max": "3",
				      "s2-s-min": "3",
				      "s2-i": "3",
				      "s2-i-max": "3",
				      "s2-i-min": "3",
				      "s3": "135-s3",
				      "s3-cr": 17,
				      "s3-gr": 21,
				      "s3-max": "117",
				      "s3-min": "117",
				      "s3-s": "3",
				      "s3-s-max": "3",
				      "s3-s-min": "3",
				      "s3-i": "3",
				      "s3-i-max": "3",
				      "s3-i-min": "3"
				    }
				  ],
				  "subjectids": "1-语文,2-数学,3-英语"
				}';
	    if('2' == $uid)
	    	$s = '{
				  "success": true,
				  "msg": "",
				  "data": [
				    {
				      "id":"2-4",
				      "name": "2班",
				      "examname": "考试1",
				      "examtime": "2013-5-1",
				      "s1": "117-s1",
				      "s1-cr": 18,
				      "s1-gr": 27,
				      "s1-max": "117",
				      "s1-min": "117",
				      "s1-s": "3",
				      "s1-s-max": "3",
				      "s1-s-min": "3",
				      "s1-i": "3",
				      "s1-i-max": "3",
				      "s1-i-min": "3",
				      "s2": "127-s2",
				      "s2-cr": 17,
				      "s2-gr": 21,
				      "s2-max": "117",
				      "s2-min": "117",
				      "s2-s": "3",
				      "s2-s-max": "3",
				      "s2-s-min": "3",
				      "s2-i": "3",
				      "s2-i-max": "3",
				      "s2-i-min": "3",
				      "s3": "135-s3",
				      "s3-cr": 17,
				      "s3-gr": 21,
				      "s3-max": "117",
				      "s3-min": "117",
				      "s3-s": "3",
				      "s3-s-max": "3",
				      "s3-s-min": "3",
				      "s3-i": "3",
				      "s3-i-max": "3",
				      "s3-i-min": "3"
				    }
				  ],
				  "subjectids": "1-语文,2-数学,3-英语"
				}';	
        echo $s;
    }
}
