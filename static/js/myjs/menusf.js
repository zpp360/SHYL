$(function() {
	if(typeof($.cookie('menusf')) == "undefined"){
		$("#sidebar").attr("class","menu-min");
	}else{
		$("#sidebar").attr("class","");
	}
});

//保存缩放菜单状态
function menusf(){
	if(document.getElementsByName('menusf')[0].checked){
		$.cookie('menusf', 'ok');
		$("#sidebar").attr("class","");
	}else{
		$.cookie('menusf', 'ok');
		$("#sidebar").attr("class","");
	}
}
//保持菜单展开
function menusfA(){
		$.cookie('menusf', 'ok');
		$("#sidebar").attr("class","");	
}
