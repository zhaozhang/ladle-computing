<?php

class WxController extends Controller
{
	public $layout = "//layouts/m";
	public function actionIndex()
	{
		//发送请求
		/*
		$string = '<xml>
 <ToUserName><![CDATA[toUser]]></ToUserName>
 <FromUserName><![CDATA[fromUser]]></FromUserName> 
 <CreateTime>1348831860</CreateTime>
 <MsgType><![CDATA[text]]></MsgType>
 <Content><![CDATA[this is a test]]></Content>
 <MsgId>1234567890123456</MsgId>
 </xml>';
 */

		/*
		//关注消息
		<xml>
		<ToUserName><![CDATA[toUser]]></ToUserName>
		<FromUserName><![CDATA[FromUser]]></FromUserName>
		<CreateTime>123456789</CreateTime>
		<MsgType><![CDATA[event]]></MsgType>
		<Event><![CDATA[subscribe]]></Event>
		</xml>
		
		//扫描且未关注
		<xml><ToUserName><![CDATA[toUser]]></ToUserName>
		<FromUserName><![CDATA[FromUser]]></FromUserName>
		<CreateTime>123456789</CreateTime>
		<MsgType><![CDATA[event]]></MsgType>
		<Event><![CDATA[subscribe]]></Event>
		<EventKey><![CDATA[qrscene_123123]]></EventKey>
		<Ticket><![CDATA[TICKET]]></Ticket>
		</xml>
		//扫描且已经关注
		<xml>
		<ToUserName><![CDATA[toUser]]></ToUserName>
		<FromUserName><![CDATA[FromUser]]></FromUserName>
		<CreateTime>123456789</CreateTime>
		<MsgType><![CDATA[event]]></MsgType>
		<Event><![CDATA[SCAN]]></Event>
		<EventKey><![CDATA[SCENE_VALUE]]></EventKey>
		<Ticket><![CDATA[TICKET]]></Ticket>
		</xml>
		*/

		
		$responseformat = '<xml>
		<ToUserName><![CDATA[一瓢计算]]></ToUserName>
		<FromUserName><![CDATA[%1$s]]></FromUserName>
		<CreateTime>%2$d</CreateTime>
		<MsgType><![CDATA[text]]></MsgType>
		<Content><![CDATA[3%$s]]></Content>
		</xml>';
		
		$xml = simplexml_load_string($string);
		//print_r($xml);
		$ToUserName = (string) $xml->ToUserName;
		$FromUserName = (string) $xml->FromUserName;
		$CreateTime = (int) $xml->CreateTime;
		$MsgType = (string) $xml->MsgType;
		
		print_r(time());
		
		//如果不是发送给yipiao的直接返回
		if ($ToUserName!='') {
			return '';
		}
		//如果createtime，超过现在一定时间，则直接放弃
		
		//如果msgid已经重复，则放弃处理
		//如果发送消息不是文本，则告诉用户应该以什么格式进行发送
		if($MsgType=='text')
		{
			$Event = 'text';
			$Content = (string) $xml->Content;
			$MsgId = (string) $xml->MsgId;
		}
		if($MsgType=='event')
		{
			$Event = (string) $xml->Event;
		}
		//处理消息，查询成绩
		if ($Event=='subscribe') {
			//欢迎信息，帮助提示
			return sprintf($responseformat, $FromUserName, time(),'欢迎信息，帮助提示');
		}
		if ($Event=='SCAN') {
			//帮助提示
			return sprintf($responseformat, $FromUserName, time(),'帮助提示');
		}
		if ($Event=='text') {
			
			if($Content=='成绩')
			{
				//查相关id，查成绩
				return sprintf($responseformat, $FromUserName, time(),'成绩');
			}
			return sprintf($responseformat, $FromUserName, time(),'帮助提示');
		}
		
		
		
		
		
		
		
		
		//回复消息
		/*
		'<xml>
		<ToUserName><![CDATA[toUser]]></ToUserName>
		<FromUserName><![CDATA[fromUser]]></FromUserName>
		<CreateTime>12345678</CreateTime>
		<MsgType><![CDATA[text]]></MsgType>
		<Content><![CDATA[你好]]></Content>
		</xml>'
		*/
		
		
		/* 成为开发者
		$echoStr = $_GET["echostr"];
	
		//valid signature , option
		if($this->checkSignature()){
			echo $echoStr;
			
		}
		else 
		{
			echo '微信开发者验证失败';
		}
		*/
	}
	
	private function checkSignature()
	{
		$signature = $_GET["signature"];
		$timestamp = $_GET["timestamp"];
		$nonce = $_GET["nonce"];
	
		$token = '841024';
		$tmpArr = array($token, $timestamp, $nonce);
		sort($tmpArr, SORT_STRING);
		$tmpStr = implode( $tmpArr );
		$tmpStr = sha1( $tmpStr );
	
		if( $tmpStr == $signature ){
			return true;
		}else{
			return false;
		}
	}

	// -----------------------------------------------------------
	// Uncomment the following methods and override them if needed
	/*
	public function filters()
	{
		// return the filter configuration for this controller, e.g.:
		return array(
			'inlineFilterName',
			array(
				'class'=>'path.to.FilterClass',
				'propertyName'=>'propertyValue',
			),
		);
	}

	public function actions()
	{
		// return external action classes, e.g.:
		return array(
			'action1'=>'path.to.ActionClass',
			'action2'=>array(
				'class'=>'path.to.AnotherActionClass',
				'propertyName'=>'propertyValue',
			),
		);
	}
	*/
	
}

?>