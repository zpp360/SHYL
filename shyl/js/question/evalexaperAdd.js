var locat;
$(function(){
	//题型
	locat=document.getElementsByTagName('base')[0].href
	$(".add-ques-amount").change(function() {
		calculateTotalPoints();
	});
	//题型分数
	$(".add-ques-score").change(function() {
		calculateTotalPoints();
	});
	
	//知识点
	var selection = $("#aq-course1").find("select");
	var point_list = $("#aq-course2").find("select");
	selection.change(function(){
		$.post(locat+'/papermain/get-knowledge-point.act', {
			fieldId : selection.val()
		}, function(data) {
			point_list.empty();
			$.each(data.knowledgepoint, function(i, list) {
				point_list.append("<option value=\"" + list.pointId + "\">" + list.pointName + "</option>");
			});
		});
	});
	//点击选择知识点按钮
	$("#add-point-btn").click(function() {
		var field = $("#field-select > option:selected");
		var point = $("#point-from-select > option:selected");
		if (field.length == 0 || point.length == 0) {
			$("#aq-course2").tips({
				side : 2,
				msg : '请选择需要添加的知识点',
				bg : '#AE81FF',
				time : 2
			});
			return false;
		}
		var html = "<option 	st=\""+field.attr("value")+"\" value=\"" + point.attr("value") + "\">" + field.text() + " > " + point.text() + "</option>";
		var p = point.attr("value");
		if (!checkPointDuplicate(p)) {
			$("#point-to-select").tips({
				side : 2,
				msg : '不能重复添加',
				bg : '#AE81FF',
				time : 2
			});
			return false;
		}
		$.ajax({
		type : "POST",
		url :  locat+'/papermain/selectTestTypeNums.act',
		data : {
			fieldNo:field.val(),
			pointNo:point.val()
		},
		cache : false,
		async : false,
		success : function(data) {
			if(data!=null && data!=""){
				$("#Num1").text("本知识点的单选题共"+data.Num1+"道题");
				$("#Num2").text("本知识点的多选题共"+data.Num2+"道题");
				$("#Num3").text("本知识点的判选题共"+data.Num3+"道题");
			}else{
				$("#Num1").text("本知识点的单选题共0道题");
				$("#Num2").text("本知识点的多选题共0道题");
				$("#Num3").text("本知识点的判选题共0道题");
			}
			
		}
	});
		$("#point-to-select").empty();
		$("#point-to-select").append(html);
		return false;
	});
	//点击删除知识点按钮
	$("#del-point-btn").click(function() {
		var st = $("#point-to-select > option:selected");
		if(st.val() != null && st.val() != ""){
		$("#Num1").text('');
		$("#Num2").text('');
		$("#Num3").text('');}
		$("#point-to-select > option:selected").remove();
		return false;
	});
	//点击请出列表按钮
	$("#remove-all-point-btn").click(function() {
		$("#Num1").text('');
		$("#Num2").text('');
		$("#Num3").text('');
		$("#point-to-select").empty();
		return false;
	});
});

// 题型/题型分数计算
function calculateTotalPoints() {
	var qt = $(".add-ques-type");
	var amount = 0;
	for(var i = 0 ; i< qt.length;i++){
		var itemamount = parseInt($(qt[i]).find(".add-ques-amount").val());
		var itemscore = parseFloat($(qt[i]).find(".add-ques-score").val());
		if(isNaN(itemamount)||isNaN(itemscore)){
			continue;
		}else{
			amount = amount +  itemamount * itemscore * 10;
		}
	}
	$("#tatolPoint").val(amount / 10);
}

function checkPointDuplicate(p) {
	var points = $("#point-to-select option");
	for (var i = 0; i < points.length; i++) {
		var point = $(points[i]).attr("value");
		if (point == p) return false;
	}
	return true;
}

//组卷方式切换
function changeCreatType() {
	var creatType = $("#creatType").val();
	if (creatType == 1) {
		$("#ques-type-div").hide();
		$("#tatol-point-div").hide();
	} else if (creatType == 2) {
		$("#ques-type-div").show();
		$("#tatol-point-div").show();
		$("#field-select-div").show();
	}
}

// check测评
function checkCP(){
	// 获取所有table 的tr
	var tr = $("#fm2_table_body").find("tr");
	var twoLength = tr.length;
	var twoArray = new Array(twoLength);
	for(var i = 0; i<twoLength; i++){
		// 每个tr钟td的开始
		var startInput = parseInt($($($("#fm2_table_body").find("tr")[i]).find("td")[0]).find("input").val());
		// 每个tr钟td的结束
		var endInput = parseInt($($($("#fm2_table_body").find("tr")[i]).find("td")[1]).find("input").val());
		// 记录区间值，封装成数组
		if(startInput>=0||endInput>=1){
			twoArray[i] = new Array(startInput,endInput);
		}else{
			return 0;
		}
	}
	// 区间循环比较
	for(var i=0;i<twoArray.length;i++){
		var a1 = twoArray[i][0];
		var a2 = twoArray[i][1];
		// 区间循环原有的比较
		for(var j=0;j<twoArray.length;j++){
			var b1 = twoArray[j][0];
			var b2 = twoArray[j][1];
			/* 
			 * 判断几种 ：
			 * 	开始区间大于比较开始区间 ，开始区间小于结束区间，开始时间小于结束时间，大于开始时间。
			 *  结束时间大于开始时间，结束时间大于结束时间，结束时间小于结束时间，大于开始时间。
			 *  之后拿开始时间和结束时间比较，
			 *  如果小于结束区间，则区间重复（自己跟自己比较，自己绝对是重复的），
			 *  所以要排除这个自己跟自己比较的范围就从当前比较下一个来做排除，
			 *  排除第一个比较，后面的比较，如果都不满足条件，则输入合法。
			 *  之后依次判断下面的录入数据。
			 * */
			if(a1>b1&&a1>b2){
				if(a2>b1&&a2>b2){
					continue;
				}else{
					return "#start_number"+j;
				}
			}else if(a1<b1&&a1<b2){
				if(a2<b1&&a2<b2){
					continue;
				}else{
					return "#start_number"+j;
				}
			}else if(b1>b2){
				return "#end_number"+j;
			}else{
				console.log("自己跟自己比较："+a1+":"+a2+":"+b1+":"+b2);
			}
		}
	}
}

//保存
var trainArray = new Array();
function save() {
	var tr = $("table tbody tr").length;
	var trCount = tr;
	if(trCount==1){
		var dataAll=new Object();
		dataAll.start_number=$("#start_number0").val();
		dataAll.end_number=$("#end_number0").val();
		dataAll.stage=$("#stage0").val();
		dataAll.describe=$("#description").val();
		trainArray.push(dataAll);
	} else {
		for(i=0;i<trCount;i++){
		var dataAll=new Object();
		dataAll.start_number=$("#start_number"+i).val();
		dataAll.end_number=$("#end_number"+i).val();
		dataAll.stage=$("#stage"+i).val();
		dataAll.description=$("#description"+i).val();
		    trainArray.push(dataAll);
		}
	}
	//判断测评结果分段是否符合标准
	var i =checkCP();
	if(typeof(i)!="undefined"&&i!=0){
		$(i).tips({
			side : 2,
			msg : '区间不正确，请核对后在提交',
			bg : '#AE81FF',
			time : 2
		});
		$(i).focus();
		return false;
	}
	if ($("#paperName").val() == "") {
		$("#paperName").tips({
			side : 2,
			msg : '请输入试卷名称',
			bg : '#AE81FF',
			time : 2
		});
		$("#paperName").focus();
		return false;
	}
	
	var duration = $("#duration").val();
	if (duration == "") {
		$("#duration").tips({
			side : 2,
			msg : '请输入考试时长（如：120）',
			bg : '#AE81FF',
			time : 2
		});
		$("#duration").focus();
		return false;
	} else if (!(duration > 30 && duration < 241)) {
		$("#duration").tips({
			side : 2,
			msg : '数字范围无效，考试的时长必须设置在30到240的范围内',
			bg : '#AE81FF',
			time : 2
		});
		$("#duration").focus();
		return false;
	}
	if ($("#field-select > option:selected").length == 0 ||  $("#point-from-select > option:selected").length == 0) {
		$("#aq-course2").tips({
			side : 2,
			msg : '请选择需要添加的知识点',
			bg : '#AE81FF',
			time : 2
		});
		return false;
	}
	if($("#point-to-select option").attr("value")==null){
		$("#point-to-select").tips({
			side : 2,
			msg : '必须选择知识点',
			bg : '#AE81FF',
			time : 2
		});
		$("#point-to-select").focus();
		return false;
	}
	if ($("#creatType").val()==2) {
		if ($("#tatolPoint").val() == ""||$("#tatolPoint").val() == 0) {
			$("#tatolPoint").tips({
				side : 2,
				msg : '无效的分数',
				bg : '#AE81FF',
				time : 2
			});
			$("#tatolPoint").focus();
			return false;
		}
	}
	if ($("#passPoint").val() == "") {
		$("#passPoint").tips({
			side : 3,
			msg : '请输入及格分数',
			bg : '#AE81FF',
			time : 2
		});
		$("#passPoint").focus();
		return false;
	}else if($("#passPoint").val() == 0){
		$("#passPoint").tips({
			side : 3,
			msg : '请输入大于0的有效及格分数',
			bg : '#AE81FF',
			time : 2
		});
		$("#passPoint").focus();
		return false;
	}
	if($("#creatType").val()==2){
		var A=parseInt($("#passPoint").val());
		var B=parseInt($("#tatolPoint").val());
		if (A>B) {
	    	$("#passPoint").tips({
				side : 2,
				msg : '及格分数必须小于或等于总分数',
				bg : '#AE81FF',
				time : 2
			});
			$("#passPoint").focus();
			return false;
	    }
	}
	
	for(var i=0;i<trCount;i++){
		var start_number=$("#start_number"+i).val();
		var end_number=$("#end_number"+i).val();
		if(parseInt(start_number)>parseInt(end_number)){
			$("#start_number"+i).tips({
				side : 3,
				msg : '开始分数不能大于结束分数',
				bg : '#AE81FF',
				time : 2
			});
			
			return false;
		}
	}
	if(i==0){
		$("#start_number0").tips({
			side : 2,
			msg : '区间未填写',
			bg : '#AE81FF',
			time : 2
		});
		$("#start_number0").focus();
		return false;
	}
	// 页面各个控件的值
    var question_entity = composeEntity();
    var start_number=$("#start_number").val();
	var end_number=$("#end_number").val();
	var stage=$("#stage").val();
	var describe=$("#describe").val();
    $.ajax({
	    type : "POST",
	    url :  locat+'/papermain/save.act',
		data : {question_entity : JSON.stringify(question_entity),
			start_number:start_number,
			end_number:end_number,
			stage:stage,
			describe:describe,
			trainArray:JSON.stringify(trainArray)
		},
		dataType : 'json',
		cache : false,
		success : function(message, tst, jqXHR) {
			if (message.result == "success") {
				// 跳转到修改试卷页面
				var fieldid=$("#point-to-select option").attr("st");
				var pointid=$("#point-to-select option").attr("value");
				window.location.href = locat+"/papermain/to_Edit.act?generatedId=" + message.generatedId+"&pointid="+pointid+"&fieldid="+fieldid;
			} else {
				$("#warntext").html(message.result);
				$("#messageresult").modal('show');
			}
		},
		error : function(jqXHR, textStatus) {
			bootbox.alert("操作失败请稍后尝试");
		}
	});
	$("#zhongxin").hide();
	$("#zhongxin2").show();
}


// 页面各个控件的值
function composeEntity(){
	var paperParam = new Object();
	paperParam.paperName = $("#paperName").val();
	paperParam.passPoint = parseInt($("#passPoint").val());
	paperParam.time = $("#duration").val();
	paperParam.paperPoint = $("#tatolPoint").val();
	paperParam.paperType = $("#creatType").val();
	paperParam.fieldid=$("#point-to-select option").attr("st");
	paperParam.pointfield=$("#point-to-select option").attr("value");
	var qt = $(".add-ques-type");
	var amountMap = new Object();
	var pointMap = new Object();
	for(var i = 0 ; i< qt.length;i++){
		var itemamount = parseInt($(qt[i]).find(".add-ques-amount").val());
		var itemscore = parseFloat($(qt[i]).find(".add-ques-score").val());
		var itemsid = $(qt[i]).find(".ques-id").val();
		if(isNaN(itemamount)||isNaN(itemscore)){
			continue;
		}else{
			amountMap[itemsid] = itemamount;
			pointMap[itemsid] = itemscore;
		}
	}
	if($("#creatType").val() == 2){
		paperParam.questionTypeNum = amountMap;
		paperParam.questionTypePoint = pointMap;
		paperParam.paperPoint = $("#tatolPoint").val();
	}else{
		paperParam.paperPoint = "100";
	}
	
	var knowledges = $("#point-to-select option");
	var rateMap = new Object();
	knowledges.each(function(){
		rateMap[$(this).val()] = 0;
	});
	
	paperParam.questionKnowledgePointRate = rateMap;
	
	return paperParam;
}
function loadeval(){
	window.location.href=locat+"/papermain/insertPaper.act";
}
function yzs(id,text){
	if(new RegExp(/[^\-?\d.]/g).test(text)){
		$("#"+id).val("");
	}
}
    function Delete() {
    	location.href = locat+"/companyNews/delNews.act?company_id="+ $("#company_id").val() + "&id="+ $("#id").val();
	}
    function del(id, divid) {
		$("#" + divid).attr("data-target", "#delnews");
		$("#delnews").attr("data-target", "");
		$("#id").val(id);
	}
// 上线提示
    function Supload() {
    	var id=$("#suploadId").val();
    	location.href = locat+"papermain/supload.act?id="+id;
	}
    function setSupload(id) {
    	$("#suploadId").val(id);
	}
//下线提示
    function Xdown(){
    	var id = $("#xdownId").val();
    	location.href=locat+"papermain/xdown.act?id="+id;
    }
    function setXdown(id){
    	$("#xdownId").val(id);
    }
	var html='';
	html+='<ul>'+'<li style="float: left;">'+'<input type="text" value="ss" style="width: 77px;" id="start_number" name="start_number">'+'</li>'+'<li style="float:left;width: 12px;margin-left: 7px;">'+'-'+'<li>'+'<li style="float: left;">'+'<input type="text" value="sss" style="width: 77px;" id="end_number" name="end_number">'+'</li>'+'<li style="float:left;margin-left: 10px;">'+'评分阶段:'+'</li>'+'<li style="float:left;">'+'<input type="text" value="" style="width: 100px;" name="stage" id="stage">'+'</li>'+'<li style="float:left;margin-left: 10px;">'+'描述:'+'</li>'+'<input type="text" value="" style="width: 250px;" id="describe" name="describe">'+'<button type="button" style="background-color: #3C67CE;width: 40px;height: 34px;border: 1px solid transparent;border-radius: 4px;margin-left: 5px;"  onclick="test()">'+'+'+'</button>'+'</li>'+'</ul>'
	function addNewPersonRow(){
		 var bodyObj=document.getElementById("fm2_table_body");
		 var yz="value=value.replace(/[^\-?\d.]/g,'')";
		 bodyObj.style.display = '';
		    if(bodyObj==null)   
		    {  
		        alert("Body of Table not Exist!");  
		        return;  
		    }  
		    var rowCount = bodyObj.rows.length;
		    var count = rowCount;
		    var newRow = bodyObj.insertRow(rowCount++);
		    var firstCell = newRow.insertCell(0);
		    var secondCell = newRow.insertCell(1);
		    var threeCell = newRow.insertCell(2);
		    var fourCell=newRow.insertCell(3);
		    var fiveCell=newRow.insertCell(4);
		    var sixCell=newRow.insertCell(5);
		    var sevenCell=newRow.insertCell(6);
		    firstCell.className = "bgc_tt short";  //this is a css
		    secondCell.className = "bgc_tt short";
		    threeCell.className = "bgc_tt short";
		    fourCell.className="bgc_tt short";
		    fiveCell.className="bgc_tt short";
		    sixCell.className="bgc_tt short";
		    sevenCell.className="bgc_tt_short"
		    firstCell.colSpan = "1";
		    secondCell.colSpan = "1";
		    threeCell.colSpan = "1";
		    fourCell.colSpan="1";
		    fiveCell.colSpan="1";
		    sixCell.colSpan="1";
		    sevenCell.colSpan="1";
		    firstCell.innerHTML = "<input type='text' class='inputtxt2' placeholder='请输入开始分数' style='width: 93%;font-size: 1.2em;' maxlength='5' id='start_number"+count+"' maxlength=50 name='start_number"+count+"' onkeyup='yzs(this.id,this.value);'/>";
		    secondCell.innerHTML="<input type='text' class='inputtxt2' placeholder='请输入结束分数' style='width: 93%;font-size: 1.2em;' maxlength='5' id='end_number"+count+"' maxlength=10 name='end_number"+count+"' onkeyup='yzs(this.id,this.value);'  />";
		    threeCell.innerHTML="评分阶段:";
		    fourCell.innerHTML="<input type='text' class='inputtxt2' style='width: 93%;font-size: 1.2em;'id='stage"+count+"' maxlength='10' name='stage"+count+"'   onblur='trim(this);'/>";
		    fiveCell.innerHTML="描述:"
		    sixCell.innerHTML="<input type='text' class='inputtxt2' style='width: 93%;font-size: 1.2em;'id='description"+count+"' maxlength='1000' name='description"+count+"' />";
		    sevenCell.innerHTML="<input type='button' class='btn btn-success btn-block' value='删除' style='width: 63px;height:37px;margin-left:10%' onclick='removeNewPersonRow(this)'/>";
		 }	
    //检索
	function search(){
		top.jzts();
		$("#newsform").submit();
	}
	function removeNewPersonRow(inputobj){  
	    if(inputobj==null) return;  
	    var parentTD = inputobj.parentNode;  //parentNode是父标签的意思，如果你的TD里用了很多div控制格式，要多调用几次parentNode
	    var parentTR = parentTD.parentNode;  
	    var parentTBODY = parentTR.parentNode;  
	    parentTBODY.removeChild(parentTR);  
	}
	var selection = $("#dd").find("select");
	var point_list = $("#ss").find("select");
	selection.change(function(){
		$.post(locat+'/papermain/get-knowledge-point.act', {
			fieldId : selection.val()
		}, function(data) {
			point_list.empty();
			$.each(data.knowledgepoint, function(i, list) {
				point_list.append("<option value=\"" + list.pointId + "\">" + list.pointName + "</option>");
			});
		});
	});
	    function delevaluation() {
	    	var id=$("#id").val();
	    	location.href=locat+"papermain/delevaluation.act?id="+id;
		}

	    function del(id){
	    	$("#id").val(id);
	    }
	    function details(id){
	    	window.location=locat+"papermain/details.act?generatedId="+id;
	    }
	    //检索
		function search(){
			top.jzts();
			$("#newsform").submit();
		}
	    function updatePaper(id){
	    	$.ajax({
				type : "POST",
				url :  locat+'papermain/findpaperbyid.act',
				data : {
					id:id
				},
				dataType : 'json',
				cache : false,
				success : function(data) {
					$("#TechName").val(data.name);
					$("#Duration").val(data.duration);
					$("#types").val(data.field_id);
					$("#paperid").val(id);
					$("#knowleage").val(data.point_id);
				}
			});
	    }