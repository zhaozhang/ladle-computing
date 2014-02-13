
<script type="text/javascript">
$(function(){
	$("#man_sco_clacombotree").change(function()
	{
	   $("#man_sco_exacombobox").empty();
       $.ajax({            
	   	    type:"POST",   //post提交方式默认是get
	   	    url: '<?php echo $this->createUrl('getexam'); ?>',
	   	    dataType:"json",    
	   	    data:{Term: $(this).children('option:selected').val()},  
	   	    error:function(err) {      // 
	   			fun_showMsg('提示','班级考试请求失败('+JSON.stringify(err)+')');
	   	    },
	   	    success:function(resp) {
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
	   	    }            
	   	});
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
	            $.ajax({            
	    	   	    type:"POST",   //post提交方式默认是get
	    	   	    url: '<?php echo $this->createUrl('getexam'); ?>',
	    	   	    dataType:"json",    
	    	   	    data:{Term: $("#man_sco_clacombotree").children('option:selected').val()},  
	    	   	    error:function(err) {      // 
	    	   			fun_showMsg('提示','班级考试请求失败('+JSON.stringify(err)+')');
	    	   	    },
	    	   	    success:function(resp) {
	    	   	    	if(resp.success)
	    	   	        {
	    	   	    	 	$("#man_sco_exacombobox").empty();
	    	   	    		var a=eval(resp.data);
	    	   	            $.each(a, function(i,item){
	    	   	                //alert(item.id)
	    	   	                $("#man_sco_exacombobox").append("<option value='" +item.id + "'>" + item.text + "</option>" );  
	    	   	             //	if(item.selected == true )
	    					//		$("#man_sco_exacombobox").attr("value", item.id);
	    		   	        });
	    	   	        }else
	    	   	        	fun_showMsg('提示','获取考试数据错误('+resp.msg+')');
	    	   	    }            
	    	   	});
	        }else
	        	fun_showMsg('提示','获取年度数据错误('+resp.msg+')');
	    }            
	});	

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
				                "<div class='ui-block-a'><div class='ui-bar ui-bar-a' >科目</div></div>"
				                +"<div class='ui-block-b'><div class='ui-bar ui-bar-a' >成绩</div></div>"
				                +"<div class='ui-block-c'><div class='ui-bar ui-bar-a' >班级排名</div></div>"
				                +"<div class='ui-block-c'><div class='ui-bar ui-bar-a' >年级排名</div></div>"
				                );
			    		var a=eval(resp.data);
			            $.each(a, function(i,item){
			                //alert(item.id)
			                $("#queryscore").append(
					                "<div class='ui-block-a'><div class='ui-bar ui-bar-a' >"+item.subjectname+"</div></div>"
					                +"<div class='ui-block-b'><div class='ui-bar ui-bar-a' >"+item.score+"</div></div>"
					                +"<div class='ui-block-c'><div class='ui-bar ui-bar-a' >"+item.classrank+"</div></div>"
					                +"<div class='ui-block-c'><div class='ui-bar ui-bar-a' >"+item.graderank+"</div></div>"
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
<div data-role="header" data-theme="b"><h1>成绩查询分析系统</h1></div>
  	<div data-role="content" class="content"> 
		<div data-role="fieldcontain"> 
			学年:
			<select id="man_sco_clacombotree" >
			</select>
			考试名称:
			<select id="man_sco_exacombobox"  >
			</select>
		    <a data-role="button" href="javascript:queryscore();" data-theme="a">查询</a>
		    <div class="ui-grid-c" id="queryscore">
			    <div class="ui-block-a"><div class="ui-bar ui-bar-a" >科目</div></div>
			    <div class="ui-block-b"><div class="ui-bar ui-bar-a" >成绩</div></div>
			    <div class="ui-block-c"><div class="ui-bar ui-bar-a" >班级排名</div></div>
			    <div class="ui-block-d"><div class="ui-bar ui-bar-a" >年级排名</div></div>
			</div>
		    <label id="score"></label>
	  	</div>
	</div> 
<div data-role="footer" data-theme="b"><h1>版权所有 毅瓢计算</h1></div> 

	




