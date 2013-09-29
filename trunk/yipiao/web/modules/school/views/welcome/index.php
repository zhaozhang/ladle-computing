<script type="text/javascript">
$(function(){
	$('#wel_portal').portal({
		border:false,
		fit:true
	});
	//临时设置
	//yproleid = 1;
	add();
});
function add(){
	var p_n = $('<div/>').appendTo('body');
	p_n.panel({
		title:'系统公告',
	//	content:'<div style="padding:5px;">建设中...</div>',
		height:230,
		collapsible:true,
		href: '<?php echo $this->createUrl('getnotice'); ?>',
		tools: [{   
		    iconCls:'icon-redo',   
		    handler:function(){
				window.open ('');
			}   
		  },{   
		    iconCls:'icon-reload',   
		    handler:function(){
			  p_n.panel('refresh','<?php echo $this->createUrl('getnotice'); ?>');  
			}   
		  }]  
	});
	$('#wel_portal').portal('add', {
		panel:p_n,
		columnIndex:0
	});
	
	var p_intro = $('<div/>').appendTo('body');
	p_intro.panel({
		title:'系统简介',
	//	content:'<div style="padding:5px;">建设中...</div>',
		height:230,
		collapsible:true,
		href: '<?php echo $this->createUrl('getintro'); ?>'
	});
	$('#wel_portal').portal('add', {
		panel:p_intro,
		columnIndex:1
	});		
	/*
	if(yproleid == 1 )
	{
		var p1 = $('<div/>').appendTo('body');
		p1.panel({
			title:'我的评价',
			content:'<div style="padding:5px;">建设中...</div>',
			height:200,
			collapsible:true
		});
		$('#wel_portal').portal('add', {
			panel:p1,
			columnIndex:0
		});
		var p2 = $('<div/>').appendTo('body');
		p2.panel({
			title:'我的徽章',
			content:'<div style="padding:5px;">建设中...</div>',
			height:200,
			collapsible:true
		});
		$('#wel_portal').portal('add', {
			panel:p2,
			columnIndex:1
		});
	}*/
	$('#wel_portal').portal('resize');
}
function remove(){
	$('#wel_portal').portal('remove',$('#pgrid'));
	$('#wel_portal').portal('resize');
}
function shownotice(){
	
}
</script>
<div id="wel_portal" style="position:relative">
	<div style="width:50%;padding:5px;">
	</div>
	<div style="width:50%;padding:5px;">
	</div>
</div>
