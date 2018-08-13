/**
 * add yanghaibo 2017-11-16
 */

/**
 * 增加放映时间
 */
function addOption() {
	var spanSize = $("#good span").size();
	
	var str = '<span>' +
	'<input type="hidden" id="filmDetailId" name="filmDetailId" value="'+0+'"/>' +
	'<input type="text" id="filmStartDate'+spanSize+'" name="filmStartDate" class="Wdate" value="" readonly="readonly" placeholder="请选择开始日期"' +
	'onclick="WdatePicker({maxDate:\'#F{$dp.$D(\\\'filmEndDate'+spanSize+'\\\',{d:-0});}\',dateFmt:\'yyyy-MM-dd HH:mm\',isShowClear:true});"/>' +
	' - <input type="text" id="filmEndDate'+spanSize+'" name="filmEndDate" class="Wdate" value="" readonly="readonly" placeholder="请选择结束日期"' +
	'onclick="WdatePicker({minDate:\'#F{$dp.$D(\\\'filmStartDate'+spanSize+'\\\',{d:0});}\',dateFmt:\'yyyy-MM-dd HH:mm\',isShowClear:true});"/>' +
	' <input type="text" id="person" name="person" placeholder="请输入观影人数"/>' + 
	'<i class="small-icon ques-remove-opt fa fa-minus-square" title="删除此选项" onclick="deleteOption(this)"></i>'+
	'</br>'+
	'</span>';

	$(str).appendTo($("#good"));
	
}

/**
*移除放映时间
*/
function deleteOption(obj){
	$(obj).parent().remove();
}

/**
 * 保存
 */
function save() {
	var flag = false;
	
	//校验
	if ($("#filmName").val() == "") {
		$("#filmName").tips({
			side : 3,
			msg : '请输入电影名称',
			bg : '#FF5080',
			time : 2
		});
		$("#filmName").focus();
		return false;
	}
	if ($("#director").val() == "") {
		$("#director").tips({
			side : 3,
			msg : '请输入导演名称',
			bg : '#FF5080',
			time : 2
		});
		$("#director").focus();
		return false;
	}
	if ($("#performer").val() == "") {
		$("#performer").tips({
			side : 3,
			msg : '请输入主演名称',
			bg : '#FF5080',
			time : 2
		});
		$("#performer").focus();
		return false;
	}
	if ($("#filmTime").val() == "") {
		$("#filmTime").tips({
			side : 3,
			msg : '请输入电影时长',
			bg : '#FF5080',
			time : 2
		});
		$("#filmTime").focus();
		return false;
	}else{
		var checkVal = /^\d+$/;//只能输入正整数
		if(!checkVal.test($("#filmTime").val())){ 
			$("#filmTime").tips({
				side : 3,
				msg : '请输入正确的电影时长格式',
				bg : '#FF5080',
				time : 2
			});
			$("#filmTime").focus();
		    return false;
		}
	}
	if ($("#filmLanguage").val() == "") {
		$("#filmLanguage").tips({
			side : 3,
			msg : '请输入电影语言',
			bg : '#FF5080',
			time : 2
		});
		$("#filmLanguage").focus();
		return false;
	}
	if ($("#filmLocal").val() == "") {
		$("#filmLocal").tips({
			side : 3,
			msg : '请输入上映地区',
			bg : '#FF5080',
			time : 2
		});
		$("#filmLocal").focus();
		return false;
	}
	if ($("#releaseTime").val() == "") {
		$("#releaseTime").tips({
			side : 3,
			msg : '请选择上映时间',
			bg : '#FF5080',
			time : 2
		});
		$("#releaseTime").focus();
		return false;
	}
	$('input[name=filmStartDate]').each(function(){
		
		if($(this).val() == ""){
			$(this).tips({
				side : 3,
				msg : '请选择开始时间',
				bg : '#FF5080',
				time : 2
			});
			flag = true;
			return false;
		}
	});
	$('input[name=filmEndDate]').each(function(){
		
		if($(this).val() == ""){
			$(this).tips({
				side : 3,
				msg : '请选择结束时间',
				bg : '#FF5080',
				time : 2
			});
			flag = true;
			return false;
		}
	});
	$('input[name=person]').each(function(){
		
		if($(this).val() == "" || $(this).val() == 0){
			$(this).tips({
				side : 3,
				msg : '观影人数至少为1人',
				bg : '#FF5080',
				time : 2
			});
			flag = true;
			return false;
		}
	});
	
	if(flag){
		return false;
	}
	
	if($("#placeId").val() == ""){
		$("#placeId").tips({
			side : 3,
			msg : '请选择放映场地',
			bg : '#FF5080',
			time : 2
		});
		$("#placeId").focus();
		return false;
	}
	if($("#filmType").val() == ""){
		$("#filmType").tips({
			side : 3,
			msg : '请选择电影类型',
			bg : '#FF5080',
			time : 2
		});
		$("#filmType").focus();
		return false;
	}
	
	
	//批量保存
	batchSave();
	
	$("#Form").submit();
	$("#zhongxin").hide();
	$("#zhongxin2").show();
}

/**
 * 批量保存
 */
function batchSave(){
	
	//开始时间
	var startTime = "";
	$('input[name=filmStartDate]').each(function(){
		if(startTime==""){
			startTime = this.value;
		}else{
			startTime = startTime + "," + this.value;
		}
	});
	$("#startTime").val(startTime);
	
	//结束时间
	var endTime = "";
	$("input[name='filmEndDate']").each(function(){
		if(endTime==""){
			endTime = this.value;
		}else{
			endTime = endTime + "," + this.value;
		}
	});
	$("#endTime").val(endTime);
	
	//观影人数
	var persunSum = "";
	$("input[name='person']").each(function(){
		if(persunSum==""){
			persunSum = this.value;
		}else{
			persunSum = persunSum + "," + this.value;
		}
	});
	$("#persunSum").val(persunSum);
	
}

/**
 * 修改
 */
function update() {
	
	var flag = false;
	
	//校验
	if ($("#filmName").val() == "") {
		$("#filmName").tips({
			side : 3,
			msg : '请输入电影名称',
			bg : '#FF5080',
			time : 2
		});
		$("#filmName").focus();
		return false;
	}
	if ($("#director").val() == "") {
		$("#director").tips({
			side : 3,
			msg : '请输入导演名称',
			bg : '#FF5080',
			time : 2
		});
		$("#director").focus();
		return false;
	}
	if ($("#performer").val() == "") {
		$("#performer").tips({
			side : 3,
			msg : '请输入主演名称',
			bg : '#FF5080',
			time : 2
		});
		$("#performer").focus();
		return false;
	}
	if ($("#filmTime").val() == "") {
		$("#filmTime").tips({
			side : 3,
			msg : '请输入电影时长',
			bg : '#FF5080',
			time : 2
		});
		$("#filmTime").focus();
		return false;
	}else{
		var checkVal = /^\d+$/;
		if(!checkVal.test($("#filmTime").val())){  //一旦录入除正整数外的，则清空输入值 
			$("#filmTime").tips({
				side : 3,
				msg : '请输入正确的电影时长格式',
				bg : '#FF5080',
				time : 2
			});
			$("#filmTime").focus();
		    return false;
		}
	}
	if ($("#releaseTime").val() == "") {
		$("#releaseTime").tips({
			side : 3,
			msg : '请选择上映时间',
			bg : '#FF5080',
			time : 2
		});
		$("#releaseTime").focus();
		return false;
	}
	$('input[name=filmStartDate]').each(function(){
		
		if($(this).val() == ""){
			$(this).tips({
				side : 3,
				msg : '请选择开始时间',
				bg : '#FF5080',
				time : 2
			});
			flag = true;
			return false;
		}
	});
	$('input[name=filmEndDate]').each(function(){
		
		if($(this).val() == ""){
			$(this).tips({
				side : 3,
				msg : '请选择结束时间',
				bg : '#FF5080',
				time : 2
			});
			flag = true;
			return false;
		}
	});
	$('input[name=person]').each(function(){
		
		if($(this).val() == "" || $(this).val() == 0){
			$(this).tips({
				side : 3,
				msg : '观影人数至少为1人',
				bg : '#FF5080',
				time : 2
			});
			flag = true;
			return false;
		}
	});
	
	if(flag){
		return false;
	}
	
	if($("#placeId").val() == ""){
		$("#placeId").tips({
			side : 3,
			msg : '请选择放映场地',
			bg : '#FF5080',
			time : 2
		});
		$("#placeId").focus();
		return false;
	}
	if($("#filmType").val() == ""){
		$("#filmType").tips({
			side : 3,
			msg : '请选择电影类型',
			bg : '#FF5080',
			time : 2
		});
		$("#filmType").focus();
		return false;
	}
	
	//批量修改
	batchUpdate();
	
	$("#Form").submit();
	$("#zhongxin").hide();
	$("#zhongxin2").show();
}

/**
 * 批量修改
 */
function batchUpdate(){
	
	//开始时间
	var startTime = "";
	$('input[name=filmStartDate]').each(function(){
		if(startTime==""){
			startTime = this.value;
		}else{
			startTime = startTime + "," + this.value;
		}
	});
	$("#startTime").val(startTime);
	
	//结束时间
	var endTime = "";
	$("input[name='filmEndDate']").each(function(){
		if(endTime==""){
			endTime = this.value;
		}else{
			endTime = endTime + "," + this.value;
		}
	});
	$("#endTime").val(endTime);
	
	//观影人数
	var persunSum = "";
	$("input[name='person']").each(function(){
		if(persunSum==""){
			persunSum = this.value;
		}else{
			persunSum = persunSum + "," + this.value;
		}
	});
	$("#persunSum").val(persunSum);
	
	var filmDetailIdSum = "";
	$("input[name='filmDetailId']").each(function(){
		if(filmDetailIdSum==""){
			filmDetailIdSum = this.value;
		}else{
			filmDetailIdSum = filmDetailIdSum + "," + this.value;
		}
	});
	$("#filmDetailIdSum").val(filmDetailIdSum);
}
