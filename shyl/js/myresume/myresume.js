var baseurl;
$(function() {
	baseurl=document.getElementsByTagName('base')[0].href;
	var lengthdd = $("#opendd").val();
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



function tab1() {
	window.location.href = baseurl+'myresume/list1.act';
}
function tab2() {
	window.location.href = baseurl+'myresume/list2.act';
}
function tab3(){
	window.location.href=baseurl+'myresume/myInvitationlist.act';
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
	window.location.href = baseurl+'myresume/list.act';
}
