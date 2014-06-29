<script type="text/javascript">
$(function(){
	var $grid_pay = $('#pay_list_grid');
	
	$.ajax({            
		    type:"POST",   //post提交方式默认是get
		    url: '<?php echo $this->createUrl('getpayinfo'); ?>',
		    dataType:"json",  
		 	data:{
			    uid:ypuid
			},  
		    error:function(err) {      // 
				fun_showMsg('提示','获取信息失败('+JSON.stringify(err)+')');
		    },
		    success:function(resp) {
		    	if(resp.success)
		        {
					if(resp.data.package)
		    			$('#panelcharge').panel({ title: '您当前是高级用户，有效期至'+resp.data.package.validity.substring(0,10)+'，可以支付续费' });
					else
						$('#panelcharge').panel({ title: '您当前是基本用户，可以支付升级'});
	
					$('#pay_procombobox').combobox('loadData',resp.data.product);
	
					$grid_pay.datagrid({   
		    			border:true,
		    			striped:true,
		    			pagination:true,
		    			pageSize:20,
		    			singleSelect:true,
		    			idField:'seqid',
		    		    columns:[[
		    				{field: 'seqid', title: '流水号', width: 10,hidden:true},
		    				{field: 'uid', title: '用户ID', width: 10,hidden:true},
		    				{field: 'payseqid', title: '支付流水号', width: 120},
		    				{field: 'packageid', title: '产品', width: 120,
		    					formatter : function(text){  
	                               return '高级版';  
	                        	}
			    			},
		    				{field: 'monthnum', title: '期限(月)', width: 120},
		    				{field: 'amount', title: '金额(元)', width: 120},
		    				{field: 'feetype', title: '支付方式', width: 120,
		    					formatter : function(text){  
		                               return '网银在线';   
		                        }
			    			},
		    				{field: 'paytime', title: '支付时间', width: 150}
		    			]]
		    		});  
			  		$grid_pay.datagrid('loadData',resp.data.paylist);
		        }else
		        	fun_showMsg('提示','获取信息失败('+resp.msg+')');
		    }
	});
});

pay = function() {
	$.ajax({            
	    type:"POST",   //post提交方式默认是get
	    url: '<?php echo $this->createUrl('pay'); ?>',
	    dataType:"json",  
	 	data:{
		    uid:ypuid,
		    productid:$('#pay_procombobox').combobox('getValues').join(',')
		},  
	    error:function(err) {      // 
			fun_showMsg('提示','支付创建失败('+JSON.stringify(err)+')');
	    },
	    success:function(resp) {
	    	if(resp.success)
	        {
				//页面跳转
	    		window.open("about:blank");   
	        }else
	        	fun_showMsg('提示','支付创建失败('+resp.msg+')');
	    }
	});
	
};
</script>
<div style="height:auto;padding:5px;">
	<div class="easyui-panel" id="panelcharge" title="充值" collapsible="true" style="height:auto;padding:10px;">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;高级版本包含更丰富的成绩统计页面，自动短信成绩通知（需要在高级设置中添加接收手机号）以及短信/微信成绩查询
		<br/>
		<br/>
		期&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;限：
	    <input class="easyui-combobox"   
            id="pay_procombobox"  
            style="width:150px;height:26px;"
            data-options="  
                    valueField:'id',  
                    textField:'text',  
                    editable:false,
                    required : true,
                    multiple: false,
                    panelHeight:'auto',
                    onLoadSuccess : function(){
                    	var data = $('#pay_procombobox').combobox('getData');
                   		for(var i=0;i< data.length;i++)
                   		{
                   			if(data[i].selected)
                   			{
                    			$('#amount').html('金额：'+data[i].amount+'元');
                    			return;
                    		}
                    	}
                    },
                    onSelect : function(node)
                   {
                   		$('#amount').html('金额：'+node.amount+'元');
                   }
            ">  
        &nbsp;&nbsp;&nbsp;&nbsp;<span style="padding:0px 0;text-align: left;" id="amount"></span>      
		<br/>
		<br/>
		<a href="javascript:pay();" class="easyui-linkbutton" iconCls="icon-ok">支付</a>  
	</div>
	<br/>
	<div class="easyui-panel" title="充值记录" collapsible="true" style="height:auto;padding:10px;">
	<table id="pay_list_grid"></table>
	</div>
	<br/>
</div>
