
<script type="text/javascript">
$(function(){
	$("#man_sco_clacombotree").change(function()
	{
	   $("#man_sco_exacombobox").empty();
	   $("#man_sco_exacombobox").attr("disabled",true); 
       $.ajax({            
	   	    type:"POST",   //post提交方式默认是get
	   	    url: '<?php echo $this->createUrl('getexam'); ?>',
	   	    dataType:"json",    
	   	    data:{Term: $(this).children('option:selected').val()},  
	   	    error:function(err) {      // 
	   	    	$("#man_sco_exacombobox").attr("disabled",false); 
	   	    	$("#man_sco_exacombobox").selectmenu("refresh");
	   			fun_showMsg('提示','班级考试请求失败('+JSON.stringify(err)+')');
	   			
	   	    },
	   	    success:function(resp) {
	   	    	$("#man_sco_exacombobox").attr("disabled",false); 
	   	    	if(resp.success)
	   	        {
	   	    		var a=eval(resp.data);
	   	            $.each(a, function(i,item){
	   	                $("#man_sco_exacombobox").append("<option value='" +item.id + "'>" + item.text + "</option>" );  
	   	             	if(item.selected == true )
	   	             	{
							$("#man_sco_exacombobox").attr("value", item.id);
	   	             	}
		   	        });
	   	        }else
	   	        	fun_showMsg('提示','获取考试数据错误('+resp.msg+')');
	   	    	$("#man_sco_exacombobox").selectmenu("refresh");
	   	    }            
	   	});
	});
	$("#man_sco_exacombobox").change(function()
	{
		queryscore();
	});
	//载入初始数据	
	$.ajax({            
	    type:'POST',   
	    url: '<?php echo $this->createUrl('getterm'); ?>',
	    cache : false, 
	    dataType:'json',    
	    data : {},
	    error:function(err) {      
			fun_showMsg('提示','年度数据请求失败('+JSON.stringify(err)+')');
	    },
	    success:function(resp) {
	    	if(resp.success)
	        {
	    		var a=eval(resp.data);
	            $.each(a, function(i,item){
	                $("#man_sco_clacombotree").append("<option value='" +item.id + "'>" + item.text + "</option>" );  
				
	            });
	            $("#man_sco_clacombotree").selectmenu("refresh");
	        	$("#man_sco_exacombobox").attr("disabled",true);
	            $.ajax({            
	    	   	    type:"POST",   //post提交方式默认是get
	    	   	    url: '<?php echo $this->createUrl('getexam'); ?>',
	    	   	    dataType:"json",    
	    	   	    data:{Term: $("#man_sco_clacombotree").children('option:selected').val()},  
	    	   	    error:function(err) {      // 
	    	   	    	$("#man_sco_exacombobox").attr("disabled",false); 
	    	   	    	$("#man_sco_exacombobox").selectmenu("refresh");
	    	   			fun_showMsg('提示','班级考试请求失败('+JSON.stringify(err)+')');
	    	   	    },
	    	   	    success:function(resp) {
	    	   	    	$("#man_sco_exacombobox").attr("disabled",false); 
	    	   	    	if(resp.success)
	    	   	        {
	    	   	    	 	$("#man_sco_exacombobox").empty();
	    	   	    		var a=eval(resp.data);
	    	   	            $.each(a, function(i,item){
	    	   	                //alert(item.id)
	    	   	                $("#man_sco_exacombobox").append("<option value='" +item.id + "'>" + item.text + "</option>" ); 
	    	   	             	$("#man_sco_exacombobox").attr("data-native-menu", false);
	    	   	             	if(item.selected == true )
	    							$("#man_sco_exacombobox").attr("value", item.id);
	    		   	        });
	    	   	        }else
	    	   	        	fun_showMsg('提示','获取考试数据错误('+resp.msg+')');
	    	   	    	$("#man_sco_exacombobox").selectmenu("refresh");
	    	   	    }            
	    	   	});
	        }else
	        {
	        	fun_showMsg('提示','获取年度数据错误('+resp.msg+')');
	        }
	    }            
	});	
	
	logout = function() {
		$.ajax({            
              type:"POST",   //post提交方式默认是get
              url: '<?php echo $this->createUrl('/site/logout'); ?>',
              dataType:"json",    
              error:function(err) {      // 
            	  window.location = "/"; 
              },
              success:function(resp) {
            	  window.location = "/"; 
              }        	    
          });
	}
	queryscore = function (){

		//判断是否选择		
		$("#score").empty();
		$("#queryscore").empty();
		//查询数据
		$.ajax({            
			  type:"POST",   //post提交方式默认是get
			  url: '<?php echo $this->createUrl('getscore'); ?>',
			  dataType:"json",
			 // async:false,    
			  data:{examid: $("#man_sco_exacombobox").val()				  }, 
			  error:function(err) {      // 
					fun_showMsg('提示','成绩数据请求失败('+JSON.stringify(err)+')');
			  },
			  success:function(resp) {
				  if(resp.success)
			        {
				     //   alert(JSON.stringify(resp));
				     	$("#queryscore").append(
				                "<div class='ui-block-a' style='width:30%'><div class='ui-bar ui-bar-a' >科目</div></div>"
				                +"<div class='ui-block-b' style='width:20%'><div class='ui-bar ui-bar-a' >成绩</div></div>"
				                +"<div class='ui-block-c' style='width:25%'><div class='ui-bar ui-bar-a' >班排名</div></div>"
				                +"<div class='ui-block-d' style='width:25%'><div class='ui-bar ui-bar-a' >年排名</div></div>"
				                );
			    		var a=eval(resp.data);
			            $.each(a, function(i,item){
			                //alert(item.id)
			                $("#queryscore").append(
					                "<div class='ui-block-a' style='width:30%'><div class='ui-bar ui-bar-a' >"+item.subjectname+"</div></div>"
					                +"<div class='ui-block-b' style='width:20%'><div class='ui-bar ui-bar-a' >"+item.score+"</div></div>"
					                +"<div class='ui-block-c' style='width:25%'><div class='ui-bar ui-bar-a' >"+item.classrank+"</div></div>"
					                +"<div class='ui-block-d' style='width:25%'><div class='ui-bar ui-bar-a' >"+item.graderank+"</div></div>"
					                );

			      //          +item.score+"</div><div>班级排名</div><div>"+item.classrank+"</div><div>年级排名</div><div>"+item.graderank+"</div>"
			                //$("#man_sco_exacombobox").append("<option value='" +item.id + "'>" + item.text + "</option>" );  
			            });
			        }else
			        	fun_showMsg('提示','获取班级数据错误('+resp.msg+')');
			  }            
		});
	};
});
</script>
<!--  <div data-role="page" id="pagemyscore">-->
<div data-role="header" data-position="fixed">
<a href="#" data-role="button" data-icon="user" data-iconpos="notext"></a>
<h1>我的成绩</h1>
<a href="javascript:logout();" data-role="button" data-icon="action" data-iconpos="notext"></a>
</div>
  	<div data-role="content" class="content"> 
		<div data-role="fieldcontain"> 
			学年:
			<select id="man_sco_clacombotree" data-native-menu="false" >
			</select>
			考试名称:
			<select id="man_sco_exacombobox" data-native-menu="false" >
			</select>
		    <a data-role="button" href="javascript:queryscore();" >查询</a>
		    <div class="ui-grid-c" id="queryscore" >
			    <div class="ui-block-a" style="width:30%"><div class="ui-bar ui-bar-a" >科目</div></div>
			    <div class="ui-block-b" style="width:20%"><div class="ui-bar ui-bar-a" >成绩</div></div>
			    <div class="ui-block-c" style="width:25%"><div class="ui-bar ui-bar-a" >班排名</div></div>
			    <div class="ui-block-d" style="width:25%"><div class="ui-bar ui-bar-a" >年排名</div></div>
			</div>
	  	</div>
	</div> 
 <div data-role="footer" data-position="fixed">
 <h1>欢迎您登录[<?php $sessionInfo = AdminUtil::getUserSessionInfo(Yii::app()->user->id); echo $sessionInfo['name'];?>]</h1>
 <!-- 	<div data-role="navbar">
      <ul>
        <li><a href="#" >我的成绩</a></li>
        <li><a href="#ceshi" >我的班级</a></li>
        <li><a href="#ceshi" >我的年级</a></li>
        <li><a href="#ceshi" >我的分析</a></li>
      </ul>
    </div> -->
 </div> 
<!-- </div>-->