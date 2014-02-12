<?php
$this->breadcrumbs=array(
	'M',
);?>
<script type="text/javascript">
$(document).ready(function(){
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
	   	                //alert(item.id)
	   	                $("#man_sco_exacombobox").append("<option value='" +item.id + "'>" + item.text + "</option>" );  
	   	             	if(item.selected == true )
							$("#man_sco_exacombobox").attr("value", item.id);
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
	                //alert(item.id)
	                $("#man_sco_clacombotree").append("<option value='" +item.id + "'>" + item.text + "</option>" );  
					if(item.selected == true )
						$("#man_sco_clacombotree").attr("value", item.id);
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
	    	   	    		var a=eval(resp.data);
	    	   	            $.each(a, function(i,item){
	    	   	                //alert(item.id)
	    	   	                $("#man_sco_exacombobox").append("<option value='" +item.id + "'>" + item.text + "</option>" );  
	    	   	             	if(item.selected == true )
	    							$("#man_sco_exacombobox").attr("value", item.id);
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
		/*
		if(!$('#man_sco_clacombotree').combotree('isValid'))
		{
			fun_showMsg('提示','班级不能为空，请修改!');
			return;
		}
		if(!$('#man_sco_exacombobox').combobox('isValid'))
		{
			fun_showMsg('提示','考试不能为空，请修改!');
			return;
		}	*/		
		$("#score").empty();
		//查询数据
		$.ajax({            
			  type:"POST",   //post提交方式默认是get
			  url: '<?php echo $this->createUrl('getscore'); ?>',
			  dataType:"json",
			 // async:false,    
			  data:{				  examid: $("#man_sco_exacombobox").val()				  }, 
			  error:function(err) {      // 
					fun_showMsg('提示','成绩数据请求失败('+JSON.stringify(err)+')');
			  },
			  success:function(resp) {
				  if(resp.success)
			        {
				     //   alert(JSON.stringify(resp));
			    		var a=eval(resp.data);
			            $.each(a, function(i,item){
			                //alert(item.id)
			                $("#score").append(
					                "<div>科目</div><div>"+item.subjectname+"</div><div>成绩</div><div>"+item.score+"</div><div>班级排名</div><div>"+item.classrank+"</div><div>年级排名</div><div>"+item.graderank+"</div>"
					                );
			                //$("#man_sco_exacombobox").append("<option value='" +item.id + "'>" + item.text + "</option>" );  
			            });
			        }else
			        	fun_showMsg('提示','获取班级数据错误('+resp.msg+')');
			  }            
		});
	};
	
	
});
</script>
<div id="man_score_tb" style="padding:5px;height:auto">   
	<div style="margin-bottom:5px">    
		学年: 
		<select id="man_sco_clacombotree"  >
		</select>
		考试名称:
		<select id="man_sco_exacombobox"  >
		</select>
	    <a href="#" onclick="queryscore()">查询</a>
	    <label id="score"></label>
	</div>
</div>




