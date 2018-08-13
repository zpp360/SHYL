/**
 * 用于二重提交验证，防止重复提交 在每个请求之前被发送和$.ajax()处理它们前处理 yc 2017/1/3
 */
$(document).ready(function() {
	//ajax提交
	var pendingRequests = {};
	jQuery.ajaxPrefilter(function(options, originalOptions, jqXHR) {
		var key = options.url;
		if (!pendingRequests[key]) {
			pendingRequests[key] = jqXHR;
		} else {
			jqXHR.abort(); // 放弃后触发的提交
			// pendingRequests[key].abort(); // 放弃先触发的提交
		}
		var complete = options.complete;
		options.complete = function(jqXHR, textStatus) {
			pendingRequests[key] = null;
			if (jQuery.isFunction(complete)) {
				complete.apply(this, arguments);
			}
		};
	});
	//form 表单提交
	$('form').submit(function() {
		//提交过不可再次提交
		if (typeof jQuery.data(this, "disabledOnSubmit") == 'undefined') {
			jQuery.data(this, "disabledOnSubmit", {
				submited : true
			});
			$('input[type=submit], input[type=button]', this).each(function() {
				$(this).attr("disabled", "disabled");
			});
			return true;
		} else {
			return false;
		}
	});
});