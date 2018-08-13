var locat = (window.location+'').split('/'); 
//$(function(){if('main'== locat[3]){locat =  locat[0]+'//'+locat[2];}else{locat =  locat[0]+'//'+locat[2]+'/'+locat[3];};});

function renyuanclick(){
	window.location.href='<%=basePath%>'+'/requirementdetail/personnelBidListInfo.act';
}
function xiugaiclick(project_id){
	window.location.href='<%=basePath%>'+'/bidCtrl/toEdit.act?project_id='+ project_id;
}
function xiangmuclick(){
	$("#xiangmu").show();
	$("#renyuanbtn").removeClass("hover");
	$("#xiangmubtn").addClass("hover");
	$("#xiugaibtn").addClass("hover");
	$("#fenye").hide();
}