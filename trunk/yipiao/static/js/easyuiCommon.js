jQuery.extend(jQuery.fn.datagrid.defaults.editors, {   
    combotree: {   
        init: function(container, options){   
            var editor = jQuery('<input type="text">').appendTo(container);   
            editor.combotree(options);   
            return editor;   
        },   
        destroy: function(target){   
            jQuery(target).combotree('destroy');   
        },   
        getValue: function(target){   
            var temp = jQuery(target).combotree('getValues');   
            //alert(temp);   
            return temp.join(',');
        },   
        setValue: function(target, value){   
            var temp = value.split(',');
         //   alert(temp);   
            jQuery(target).combotree('setValues', temp);
        },   
        resize: function(target, width){   
            jQuery(target).combotree('resize', width);
        }   
	}   
}); 
$.extend($.fn.datagrid.defaults.editors, {   
    numberspinner: {   
        init: function(container, options){   
            var input = $('<input type="text">').appendTo(container);   
            return input.numberspinner(options);   
        },   
        destroy: function(target){   
            $(target).numberspinner('destroy');   
        },   
        getValue: function(target){   
            return $(target).numberspinner('getValue');   
        },   
        setValue: function(target, value){   
            $(target).numberspinner('setValue',value);   
        },   
        resize: function(target, width){   
            $(target).numberspinner('resize',width);   
        }   
    }   
});

/**
 * 合并连续相同项
 * 
 **/
$.extend($.fn.datagrid.methods, {
	autoMergeCells : function (jq, fields) {
		return jq.each(function () {
			var target = $(this);
			if (!fields) {
				fields = target.datagrid("getColumnFields");
			}
			var rows = target.datagrid("getRows");
			var i = 0,
			j = 0,
			temp = {};
			for (i; i < rows.length; i++) {
				var row = rows[i];
				j = 0;
				for (j; j < fields.length; j++) {
					var field = fields[j];
					var tf = temp[field];
					if (!tf) {
						tf = temp[field] = {};
						tf[row[field]] = [i];
					} else {
						var tfv = tf[row[field]];
						if (tfv) {
							tfv.push(i);
						} else {
							tfv = tf[row[field]] = [i];
						}
					}
				}
			}
			$.each(temp, function (field, colunm) {
				$.each(colunm, function () {
					var group = this;
					
					if (group.length > 1) {
						var before,
						after,
						megerIndex = group[0];
						for (var i = 0; i < group.length; i++) {
							before = group[i];
							after = group[i + 1];
							if (after && (after - before) == 1) {
								continue;
							}
							var rowspan = before - megerIndex + 1;
							if (rowspan > 1) {
								target.datagrid('mergeCells', {
									index : megerIndex,
									field : field,
									rowspan : rowspan
								});
							}
							if (after && (after - before) != 1) {
								megerIndex = after;
							}
						}
					}
				});
			});
		});
	}
});
/*
 * 公用数据
 */
var data_classtype = [  
                      {id:'0',text:'不区分'},  
                      {id:'1',text:'文科'},  
                      {id:'2',text:'理科'}
                  ]; 

var data_sex = [  
                      {id:'0',text:'女'},  
                      {id:'1',text:'男'}
                  ]; 

var data_stutype = [  
                {id:'0',text:'应届 '},  
                {id:'1',text:'往届'}
            ]; 
var data_teacherrole = [  
                {id:'2',text:'任课教师'},  
                {id:'3',text:'班级管理人'},
                {id:'4',text:'年级管理人'},
                {id:'5',text:'教务管理人'}
            ]; 

var data_is = [  
                    {id:'0',text:'否 '},  
                    {id:'1',text:'是'}
                ];
/*
 * 公用函数
 */
var fun_showMsg = function (title, msg,timeout) {
	timeout=timeout||3000;  
	if(msg == '')
		return;
	$.messager.show({  
        title:title,  
        msg:msg,  
        timeout:timeout,  
        showType:'slide',
        height : 'auto',
        style:{
			right:'',
			top:document.body.scrollTop+document.documentElement.scrollTop,
			bottom:''
		}
    });
};

//扩展easyui表单的验证
$.extend($.fn.validatebox.defaults.rules, {
    //验证汉子
    CHS: {
        validator: function (value) {
            return /^[\u0391-\uFFE5]+$/.test(value);
        },
        message: '只能输入汉字'
    },
    //移动手机号码验证
    mobile: {//value值为文本框中的值
        validator: function (value) {
            var reg = /^0?(13[0-9]|15[012356789]|18[0-9]|14[57])[0-9]{8}$/;
            return reg.test(value);
        },
        message: '手机号格式不准确.'
    },
    //国内邮编验证
    zipcode: {
        validator: function (value) {
            var reg = /^[1-9]\d{5}$/;
            return reg.test(value);
        },
        message: '邮编必须是非0开始的6位数字.'
    },
    //用户账号验证(只能包括 _ 数字 字母) 
    account: {//param的值为[]中值
        validator: function (value, param) {
            if (value.length < param[0] || value.length > param[1]) {
                $.fn.validatebox.defaults.rules.account.message = '用户名长度必须在' + param[0] + '至' + param[1] + '范围';
                return false;
            } else {
                if (!/^[\w]+$/.test(value)) {
                    $.fn.validatebox.defaults.rules.account.message = '用户名只能数字、字母、下划线组成.';
                    return false;
                } else {
                    return true;
                }
            }
        }, message: ''
    }
})