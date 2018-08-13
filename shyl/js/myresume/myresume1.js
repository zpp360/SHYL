var locat;
$(function() {
	locat=document.getElementsByTagName('base')[0].href
	var lengthdd = $("#opendd").val()
	if (lengthdd == 3) {
		$("#newresume").attr("onclick", "tishi()");
	} else if (lengthdd == 1) {
		$("#defaultcv").attr("href", "javascript:;");
		$("#defaultcv").html("默认");
	}
	if ($("#a2").attr("class") == "hover") {
		$("#fenye").hide();
	}
});
function tishi() {
	$("#newresume").attr("data-target", "#makesure");
}
function setpub(CV_ID, index) {
	var yes = $("#yes" + index).attr("value");
	if (yes == '0') {
		$.ajax({
			type : "POST",
			url : locat+'myresume/setpub.act',
			data : {
				CV_ID : CV_ID,
				tm : new Date().getTime()
			},
			dataType : 'json',
			cache : false,
			success : function(data) {
				$("#yes" + index).attr("value", "1");
				window.location.reload();
			}
		});
	} else {
		$.ajax({
			type : "POST",
			url : locat+'myresume/setpubf.act',
			data : {
				CV_ID : CV_ID,
				tm : new Date().getTime()
			},
			dataType : 'json',
			cache : false,
			success : function(data) {
				$("#yes" + index).attr("value", "0");
				window.location.reload();
			}
		});
	}

}
function showDetails(CV_ID) {
	window.location.href = locat+'myresume/toEdit.act?CV_ID=' + CV_ID;
}
/* 创建新简历 */
function newresume() {
	$("#myresume1").hide();
	$.ajax({
		type : "POST",
		url : locat+'myresume/getmainflg.act',
		data : {
			tm : new Date().getTime()
		},
		dataType : 'json',
		cache : false,
		success : function(data) {
			var list = data.mainflg;
			var maintflg = list[0].MAINT_FLG;
			if (maintflg == 0) {
				$("#li1").html("暂无简历");
				alert("请先完善基本信息");
				window.location.href = locat+'myresume/basicinfo.act';
			} else {
				window.location.href = locat+'myresume/newresume.act';
			}
		}
	});
}
function tab1() {
	$("#jianli").hide();
	$("#seejianli").show();
	$("#sendjianli").hide();
	$("#a4").removeClass("hover");
	$("#a2").removeClass("hover");
	$("#a3").addClass("hover");
	$("#fenye").show();
}
function tab2() {
	window.location.href = locat+'myresume/list2.act';
}
function tab3(){
	window.location.href=locat+'myresume/myInvitationlist.act';
}
function tab0() {
	$("#jianli").hide();
	$("#seejianli").hide();
	$("#sendjianli").hide();
	$("#invitationlist").hide();
	$("#a3").removeClass("hover");
	$("#a4").removeClass("hover");
	$("#a5").removeClass("hover");
	$("#a2").addClass("hover");
	$("#fenye").hide();
	window.location.href = document.getElementsByTagName('base')[0].href+'myresume/list.act';
}
function deletecv(id, index) {
	$("#delectcvd" + index).attr("data-target", "#delresume");
	$("#d").attr("onclick", "deletecvs(" + id + ")")
}
function deletecvs(id) {
	window.location.href = locat+'myresume/deletecv.act?CV_ID=' + id;
}