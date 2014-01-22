<script type="text/javascript">
$.ajax({            
    type:"POST",   //post提交方式默认是get
    url: '<?php echo $this->createUrl('getpage'); ?>',
    dataType:"json",    
    data:{},  
    error:function(err) {      // 
		fun_showMsg('提示','页面数据请求失败('+JSON.stringify(err)+')');
    },
    success:function(resp) {
    	if(resp.success)
        {
    		$('#suggest_errcombotree').combotree('loadData',resp.data);
        }else
        	fun_showMsg('提示','获取页面数据错误('+resp.msg+')');
    }            
});

$('#suggest_form').form({
    url:'<?php echo $this->createUrl('savesuggest'); ?>',
    onSubmit:function(){
        return $(this).form('validate');
    },
    success:function(resp){
    	fun_showMsg('提示','数据提交成功');
    }
});
</script>
<div class="easyui-layout"  fit="true" style="width:400px;">  
	<div data-options="region:'north',split:true" style="height:50px;padding:9px 5px;">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;您可以通过这个页面上报系统使用中遇到的问题，
	也可以提出自己对系统的修改建议，我们将第一时间处理系统使用中的问题，并根据您的建议对系统作出合理的改进：）
	</div>
	<div region="center" style="padding:2px 15px;">
	<form id="suggest_form" method="post" >  
		<div>  
			<label style="font-size:12px; for="type">类型:</label>  
			<input class="easyui-combobox"   
				name="type"
	            id="suggest_typecombobox"  
	            style="width:60px;font-size:12px;"
	            data-options="  
            		valueField:'id',
                    textField:'text', 
                    required : true,
                    panelHeight:'auto',
                    data:[  
	                    {id:'0',text:'问题',selected:false},  
	                    {id:'1',text:'建议',selected:true}
	                ],
	            ">  
		</div>    
 		<div>  
			<label style="font-size:12px; for="page">出错页面:</label>  
			<input name="page"
				class="easyui-combotree"   
	            id="suggest_errcombotree"  
	            style="width:200px;font-size:12px;"
	            data-options="  
            		valueField:'id',
                    textField:'text', 
                    multiple: false, 
                    panelHeight:'auto',
                    onLoadSuccess : function(node, data){
                    	for(var i=0;i < data.length;i++)
                    	{
                    		for(var j=0;j < data[i].children.length;j++ )
                    		{
                    			if(data[i].children[j].selected)
                    			{
                    				$('#suggest_errcombotree').combotree('setValue', data[i].children[j].id);
                    				return;
                    			}
                    		}
                    	}
                    },
                    onBeforeSelect: function(node) 
	                {            
                    	if (!$(this).tree('isLeaf', node.target)) 
                    	{                
                        	return false;            
                        }              		
                   }
	            ">  
		</div>    
		<div>  
			<label  style="font-size:12px; for="message">问题/建议描述:</label>  
			<textarea name="message" style="width:500px;height:120px;font-size:12px;"></textarea>  
		</div>  
		<div>  
			<input type="submit" value="提交">  
		</div>
	</form>  
    </div> 
</div> 

