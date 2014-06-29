<?php

class AnaClassController extends CommonController
{
    public function actionIndex()
    {
        $this->renderPartial('index');
    }	 
/*
	 * 获取用户可选择班级
	 */ 
    public function actionGetclass()
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
    	$schoolid = $sessionInfo['school_id'];
    	$roleid = $sessionInfo['role_id'];
    	$classid =  $sessionInfo['class_id'];
		$gradeid = 0;
        // 获取所有年级
        if($roleid == 1 || $roleid == 6)
        {
        	$gradeid = $sessionInfo['grade_id'];
        	$gradeList = InfoGrade::model()->findAllByAttributes(array('GradeID' => $gradeid, 'State' => 1));
        }else
        { 
        	$gradeid = $sessionInfo['t_grade_id'];
        	$gradeList = InfoGrade::model()->findAllByAttributes(array('SchoolID' => $schoolid, 'State' => 1));
        }
        foreach ($gradeList as $gradeRecord)
        {
            $gradeInfo = array_change_key_case((array)$gradeRecord->getAttributes(), CASE_LOWER);
            $gradejson = array(
            	'id' => 'g-'.$gradeInfo["gradeid"],
	            'text'=> $gradeInfo["gradename"], 
	            'selected'=>false,
	            'iconCls'=>"",
	            'children' => array());

            // 获取年级下的班级
            if($roleid == 1 || $roleid == 6)
            	$classList = InfoClass::model()->findAllByAttributes(array('ClassID' => $classid, 'State' => 1));
            else
            	$classList = InfoClass::model()->findAllByAttributes(array('GradeID' => $gradeRecord->GradeID, 'State' => 1));
            foreach ($classList as $classRecord)
            {
            	$selected = false;
                $iconCls = "";
                $classInfo = array_change_key_case((array)$classRecord->getAttributes(), CASE_LOWER);
                if( $classInfo["type"] == 1)
                	$iconCls = "icon-tip";
                else if($classInfo["type"] == 2)
                	$iconCls = "icon-sum";
                if($classid == $classInfo["classid"])
            		$selected = true;
                $gradejson['children'][] = array(
                	'id' => $classInfo["classid"],
		            'text'=> $classInfo["classname"], 
		            'selected'=>$selected,
		            'iconCls'=>$iconCls
                );
            }
            $result['data'][] = $gradejson;
        }
		$result['success'] = true;
        $this->renderText(json_encode($result));
        /*
    	//iconCls 根据文理科配置成不一样的
    	$s = '{
			  "success": true,
			  "msg": "",
			  "data": [
			    {
			      "id": "1",
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
			      "id": "2",
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

        echo $s;*/
	}   
/*
	 * 获取用户可选择学年
	 */ 
    public function actionGetterm()
    {
    	$this->layout = false;
    	$result = array('success' => false, 'data' => array());
    	$uid = Yii::app()->user->getId();
    	if(!$uid){
    		$result['msg'] = '用户未登录';
    		$this->renderText(json_encode($result));
    		return;
    	}
    	
    	$classlid	= isset($_POST['ClassID'])?$_POST['ClassID']:0;

        if (!isset($_POST['ClassID']))
        {
            $result['msg'] = '参数错误';
            $this->renderText(json_encode($result));
            return;
        }
    	//查询用户入学时间       
    	$connection=Yii::app()->db;
		$sql="select min(examtime) as mintime,max(examtime) as maxtime from v_class_exam where ClassIDq = ".$classlid." and State = 1";
		$rows=$connection->createCommand ($sql)->query();
		$isfirst = true;
		foreach ($rows as $k => $v ){
			$examInfo = array_change_key_case($v, CASE_LOWER);
			$mintime=strtotime($examInfo["mintime"]);
			$month=date("m",$mintime);
			$year=date("Y",$mintime);
			$maxtime=strtotime($examInfo["maxtime"]);
			$month_now=date("m",$maxtime);
			$year_now=date("Y",$maxtime);
			if($month_now > 8)
				$year_now = $year_now + 1;
			if($month < 9)
				$year = $year - 1;
			while($year < $year_now)
			{			
				$examjson = array(
	            	'id' => ($year_now-1)."-".$year_now,
		            'text'=> ($year_now-1)."-".$year_now, 
		            'selected'=>$isfirst
				);
				$isfirst = false;
				$year_now = $year_now - 1;
				
				$result['data'][] = $examjson;
			}
		/*	
			// 获取考试下的科目
			$connection=Yii::app()->db; 
			$sql="select * from v_exam_subject where ExamID = ".$examInfo["examid"]." and State = 1 order by subjectID";
			$rows=$connection->createCommand ($sql)->query();
			foreach ($rows as $k => $v ){
				$subjectInfo = array_change_key_case($v, CASE_LOWER);
				$examjson['subject'][] = array(
                	'id' => $subjectInfo["subjectid"],
		            'text'=> $subjectInfo["subjectname"], 
		            'selected'=>false,
                );
			}
						
			*/
		}
		$result['success'] = true;
        $this->renderText(json_encode($result));
	}   	
	/*
	 * 获取用户可选择科目
	 */ 
    public function actionGetsubject()
    {
    	$this->layout = false;
    	$result = array('success' => false, 'data' => array());
    	$u_id = Yii::app()->user->getId();
    	if(!$u_id){
    		$result['msg'] = '用户未登录';
    		$this->renderText(json_encode($result));
    		return;
    	}
    	$sessionInfo = AdminUtil::getUserSessionInfo($u_id);
    	$school_id =  $sessionInfo['school_id'];
    	$subject_id = $sessionInfo['subject_id'];
    	$role_id = $sessionInfo['role_id'];
    	
    	$classid 	= isset($_POST['ClassID'])?$_POST['ClassID']:'0';
    	
    	$record = InfoClass::model()->findByPk($classid, "State = 1");
		if (empty($record))
		{
			$result['success'] = false;
			$result['msg'] = '班级错误';
			$this->renderText(json_encode($result));
			return;
		}
    	$classtype 	= $record['Type'];
        
    	//查询科目
    	if(0 == $classtype)
    		$subjectList = InfoSubject::model()->findAll("(SchoolID = 0 OR SchoolID = :SchoolID) and State = 1",array('SchoolID'=>$school_id));
        else 
    		$subjectList = InfoSubject::model()->findAll("(SchoolID = 0 OR SchoolID = :SchoolID) and (Type = ".$classtype." OR Type = 0) and SubjectID <> 14 AND State = 1",array('SchoolID'=>$school_id));
        foreach ($subjectList as $subjectRecord)
    	{
    		$subjectInfo = array_change_key_case((array)$subjectRecord->getAttributes(), CASE_LOWER);
    		$selected = true;
    		$subjectjson = array(
            	'id' => $subjectInfo["subjectid"],
	            'text'=> $subjectInfo["subjectname"], 
	            'selected'=>$selected
    		);
    		$result['data'][] = $subjectjson;
    	}
    	$result['success'] = true;
    	$this->renderText(json_encode($result));
    	/*
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

        echo $s;*/
	}   
	    
	/*
	 * 查询能力值
	 */ 
    public function actionGetyscore()
    {
    	$this->layout = false;
    	$result = array('success' => false, 'data' => array());
    	$u_id = Yii::app()->user->getId();
    	if(!$u_id){
    		$result['msg'] = '用户未登录';
    		$this->renderText(json_encode($result));
    		return;
    	}
    	$sessionInfo = AdminUtil::getUserSessionInfo($u_id);
    	$school_id = $sessionInfo['school_id'];
    	$role_id = $sessionInfo['role_id'];
    	$grade_id = $sessionInfo['grade_id'];
    	$class_id = $sessionInfo['class_id'];
    	
    	$classids 	= isset($_POST['ClassIDs'])?$_POST['ClassIDs']:'';	
    	$SubjectID 	= isset($_POST['SubjectID'])?$_POST['SubjectID']:'';
    	$term 	= isset($_POST['Term'])?$_POST['Term']:'0';   	
    	
    	//先查询总共的考试
        //查询考试
    	$termarr = explode('-', $term);
    	$connection=Yii::app()->db; 
		$sql="select distinct examid,examname,examtime from v_class_exam where ClassIDq = ".$class_id." and examtime >= '".$termarr[0]."-8-1"."' and examtime < '".$termarr[1]."-8-1"."' and State = 1 order by ExamTime desc";
		$rowsexam=$connection->createCommand ($sql)->query();
		$isfirst = true;
		$examdates	= array();
		foreach ($rowsexam as $k => $v ){
			$examInfo = array_change_key_case($v, CASE_LOWER);
			$examid = $examInfo['examid'];
			//先查询考试总共的科目
			if($isfirst)
			{
		        $subjectids	= array();
		    	$connection=Yii::app()->db; 
				$sql="select * from v_exam_subject where ExamID = ".$examid."  and state = 1";
				$rows=$connection->createCommand ($sql)->query();
				foreach ($rows as $k => $v ){
					$subjectInfo = array_change_key_case($v, CASE_LOWER);
					$subjectids[] = $subjectInfo['subjectid'].'-'.$subjectInfo['subjectname'];
				}
		        $result['subjectids'] = implode(",", $subjectids);
		        $isfirst = false;
			}
			
			//查询能力值
	    	$sql="select es.*,e.examname,e.examtime,s.classname from info_exam_class_yscore es,info_exam e,info_class s where es.examid = e.examid and s.classid = es.classid and e.state = 1 
					and es.classid = ".$class_id." 
					and es.examid = ".$examid;
	    	$rows=$connection->createCommand ($sql)->query();
	    	$isfirst1 = 1;
			foreach ($rows as $k => $v ){
				$examInfo = array_change_key_case($v, CASE_LOWER);
				if($isfirst1 == 1)
				{
					$scorejson = array(
		            	'id' => $examInfo["classid"].'-'.$examInfo["examid"],
			            'name' => $examInfo["classname"],
						'examname' => $examInfo["examname"],
						'examtime' => substr($examInfo["examtime"],0,10)
			        );
					//能力值初始化
		            foreach ($subjectids as $subjectid)
		            {
		            	$subjectarr = explode("-",$subjectid);  
		            	$scorejson["s".$subjectarr[0]] = "";
		            	$scorejson["s".$subjectarr[0]."-cr"] = "";
		            	$scorejson["s".$subjectarr[0]."-maxcy"] = "";
		            	$scorejson["s".$subjectarr[0]."-mincy"] = "";
		            	$scorejson["s".$subjectarr[0]."-s"] = "";
		            	$scorejson["s".$subjectarr[0]."-maxs"] = "";
		            	$scorejson["s".$subjectarr[0]."-mins"] = "";
		            	$scorejson["s".$subjectarr[0]."-i"] = "";
		            	$scorejson["s".$subjectarr[0]."-maxi"] = "";
		            	$scorejson["s".$subjectarr[0]."-mini"] = "";
		            	$scorejson["s".$subjectarr[0]."-sc"] = "";
		            }
				}
			    $isfirst1 = 0;
		        $scorejson['s'.$examInfo["subjectid"]] = $examInfo["avgcyscore"].'-s'.$examInfo["subjectid"];
		        $scorejson['s'.$examInfo["subjectid"].'-cr'] = intval($examInfo["avgcyscorerank"]);
    			$scorejson['s'.$examInfo["subjectid"].'-maxcy'] = intval($examInfo["maxcysocre"]);
    			$scorejson['s'.$examInfo["subjectid"].'-mincy'] = intval($examInfo["mincysocre"]);
		        $scorejson['s'.$examInfo["subjectid"].'-s'] = floatval($examInfo["avgsta"]);
		        $scorejson['s'.$examInfo["subjectid"].'-maxs'] = floatval($examInfo["maxsta"]);
		        $scorejson['s'.$examInfo["subjectid"].'-mins'] = floatval($examInfo["minsta"]);
		        $scorejson['s'.$examInfo["subjectid"].'-i'] = floatval($examInfo["avgimp"]);
		        $scorejson['s'.$examInfo["subjectid"].'-maxi'] = floatval($examInfo["maximp"]);
		        $scorejson['s'.$examInfo["subjectid"].'-mini'] = floatval($examInfo["minimp"]);		        
		        $scorejson['s'.$examInfo["subjectid"].'-sc'] = floatval($examInfo["scatteryscore"]);
			}   
			if($scorejson)
				$result['data'][] = array_change_key_case($scorejson, CASE_LOWER);	
		}
    	
        $result['success'] = true;
        $this->renderText(json_encode($result));
    	/*
    	 * examid|examname|能力值|排名|稳定性|进步值
    	 */
    /*	
        $s = '{
			  "success": true,
			  "msg": "",
			  "data": [
			    {
			      "id": "1",
			      "name": "1班",
			      "2013-09-01": "1|中考|84|7|0|0",
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
        echo $s;*/
	}	
		/*
	 * 查询考试学生能力值明细
	 */ 
    public function actionGetscalist()
    {
    	$this->layout = false;
    	$result = array('success' => false, 'data' => array('other'=>array() ,'me'=>array(),'ms'=>0));
    	$u_id = Yii::app()->user->getId();
    	if(!$u_id){
    		$result['msg'] = '用户未登录';
    		$this->renderText(json_encode($result));
    		return;
    	}
    	$sessionInfo = AdminUtil::getUserSessionInfo($u_id);
    	$school_id = $sessionInfo['school_id'];
    	$role_id = $sessionInfo['role_id'];
    	$class_id = $sessionInfo['class_id'];
    	
    //	if($role_id == 1)
    //		$classid = $class_id;
    //	else
    	$classid = isset($_POST['ClassID'])?$_POST['ClassID']:'';	
    	$subjectid = isset($_POST['SubjectID'])?$_POST['SubjectID']:'';		
    	$examid = isset($_POST['ExamID'])?$_POST['ExamID']:'';
    	
    	$this->layout = false;
        $result = array('success' => true, 'msg' => '');
        
    	$connection=Yii::app()->db; 
		$sql="select *  from info_exam_yscore where ExamID = ".$examid." and SubjectID = ".$subjectid." and ClassID = ".$classid." and YScore IS NOT NULL";
		$rows=$connection->createCommand ($sql)->query();

		foreach ($rows as $k => $v ){
			$subjectInfo = array_change_key_case($v, CASE_LOWER);
			$result['data']['ms'] = floatval($subjectInfo["stability"])>$result['data']['ms']?floatval($subjectInfo["stability"]):$result['data']['ms'];
			if($u_id == $subjectInfo["uid"])
			{
				$result['data']['me'][] = array(floatval($subjectInfo["cyscore"]),floatval($subjectInfo["improve"]),floatval($subjectInfo["stability"]));	
			}else
			{
				$result['data']['class'][] = array(floatval($subjectInfo["cyscore"]),floatval($subjectInfo["improve"]),floatval($subjectInfo["stability"]));	
			}
		}
		$result['success'] = true;
        $this->renderText(json_encode($result));
    }
}
