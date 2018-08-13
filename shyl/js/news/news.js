/**
 *  add yanghaibo 2017-11-28
 */


/**
*保存
*/
function save(){
	
	//校验
	if ($("#newsTitle").val() == "") {
		$("#newsTitle").tips({
			side : 3,
			msg : '请输入新闻标题',
			bg : '#FF5080',
			time : 2
		});
		$("#newsTitle").focus();
		return false;
	}
	if ($("#newsSource").val() == "") {
		$("#newsSource").tips({
			side : 3,
			msg : '请输入新闻标题',
			bg : '#FF5080',
			time : 2
		});
		$("#newsSource").focus();
		return false;
	}
	
	$("#Form").submit();
	$("#zhongxin").hide();
	$("#zhongxin2").show();
	
}