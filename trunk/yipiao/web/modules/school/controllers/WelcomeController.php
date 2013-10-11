<?php

class WelcomeController extends CommonController
{
    public function actionIndex()
    {
        $this->renderPartial('index');
    }	 

    public function actionGetnotice()
    {
   //     echo "<div style='padding:5px;'>建设中...</div>";
   		echo "<div style='padding:5px;'>[2013-9-23] 系统测试版本beta1.0发布 (推荐使用chrome浏览器 <a href='http://softdownload.hao123.com/hao123-soft-online-bcs/soft/C/2013-09-25_ChromeStandaloneSetup.exe'>点击下载</a>)</div>";
	}   
    public function actionGetintro()
    {
        echo "<div style='padding:5px;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;毅瓢计算中学成绩分析系统主要用于学生对考试成绩的查询和学习成绩的分析，希望通过信息化的技术帮助老师提高教学质量，同时帮助学生及家长了解学生的学习状况。目前包含了系统管理、成绩统计和成绩分析三大模块。
        <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;除了基本的成绩查询统计功能外，系统加入了成绩分析功能，主要通过能力值、稳定指数和进步指数来提现学生当前的学习情况。其中能力值表示该学生目前在这个年级的一个位置；稳定指数表示该学生考试成绩的稳定性（越低表示越稳定）；进步指数表示该学生最近学习的起伏状况（正数为进步，负数为退步）。
        <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;系统今后会不断更新，加入更多功能， 希望能得到教师、学生和家长的使用反馈，我们将不断改进，以便于更好的为用户提供有用的功能。</div>";
	}
}
