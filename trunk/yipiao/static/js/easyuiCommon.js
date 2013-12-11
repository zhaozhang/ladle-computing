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
