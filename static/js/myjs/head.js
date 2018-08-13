var locat = document.getElementsByTagName('base')[0].href

var dialogPath = locat.indexOf('https')>-1 ? '':locat;
var USER_ID;
// 用于即时通讯（ 当前登录用户）
var user = "FH"; 
var fmid = "fhindex";
var mid = "fhindex";

$(function() {

	// 换肤
	$("#skin-colorpicker").ace_colorpicker().on(
			"change",
		function() {
			var b = $(this).find("option:selected").data("class");
			hf(b);
			var url = locat + '/head/setSKIN.do?SKIN=' + b + '&tm='
					+ new Date().getTime();
			$.get(url, function(data) {});

	});
	
	$.ajax({
		type : "POST",
		url : locat + '/head/getUname.do?tm=' + new Date().getTime(),
		data : encodeURI(""),
		dataType : 'json',
		// beforeSend: validateData,
		cache : false,
		success : function(data) {
			// alert(data.list.length);
			$.each(data.list, function(i, list) {
				// 登陆者资料
				$("#user_info")
						.html('<small>Welcome</small> ' + list.USERNAME + '');
				user = list.USERNAME;
				USER_ID = list.USER_ID;// 用户ID
				hf(list.SKIN);// 皮肤
				if (list.USERNAME != 'admin') {
					$("#adminmenu").hide(); // 隐藏菜单设置
					$("#adminzidian").hide(); // 隐藏数据字典
					$("#systemset").hide(); // 隐藏系统设置
				}
				//online();// 连接在线管理
			});
		}
	});
	
});

// 菜单状态切换
function siMenu(id, fid, MENU_NAME, MENU_URL) {
	if (id != mid) {
		$("#" + mid).removeClass();
		mid = id;
	}
	if (fid != fmid) {
		$("#" + fmid).removeClass();
		fmid = fid;
	}
	$("#" + fid).attr("class", "active open");
	$("#" + id).attr("class", "active");
	top.mainFrame.tabAddHandler(id, MENU_NAME, MENU_URL);
	if (MENU_URL != "druid/index.html") {
		jzts();
	}
}



// 换肤
function hf(b) {

	var a = $(document.body);
	a.attr("class", a.hasClass("navbar-fixed") ? "navbar-fixed" : "");
	if (b != "default") {
		a.addClass(b);
	}
	if (b == "skin-1") {
		$(".ace-nav > li.grey").addClass("dark");
	} else {
		$(".ace-nav > li.grey").removeClass("dark");
	}
	if (b == "skin-2") {
		$(".ace-nav > li").addClass("no-border margin-1");
		$(".ace-nav > li:not(:last-child)").addClass("white-pink").find(
				'> a > [class*="icon-"]').addClass("pink").end().eq(0).find(
				".badge").addClass("badge-warning");
	} else {
		$(".ace-nav > li").removeClass("no-border").removeClass("margin-1");
		$(".ace-nav > li:not(:last-child)").removeClass("white-pink").find(
				'> a > [class*="icon-"]').removeClass("pink").end().eq(0).find(
				".badge").removeClass("badge-warning");
	}
	if (b == "skin-3") {
		$(".ace-nav > li.grey").addClass("red").find(".badge").addClass(
				"badge-yellow");
	} else {
		$(".ace-nav > li.grey").removeClass("red").find(".badge").removeClass(
				"badge-yellow");
	}
}

// 修改个人资料
function editUserH() {
	jzts();
	var urlPath = "/SHYL";
	var diag = new top.Dialog();
	diag.Drag = true;
	diag.Title = "修改系统用户资料";
	diag.URL = urlPath + '/user/goEditU.do?USER_ID=' + USER_ID + '&fx=head';
	diag.Width = 400;
	diag.Height = 350;
	diag.CancelEvent = function() { // 关闭事件
		diag.close();
	};
	diag.show();
}

// 系统设置
function editSys() {
	jzts();
	var diag = new top.Dialog();
	diag.Drag = true;
	diag.Title = "系统设置";
	diag.URL = dialogPath + '/head/goSystem.do';
	diag.Width = 600;
	diag.Height = 596;
	diag.CancelEvent = function() { // 关闭事件
		diag.close();
	};
	diag.show();
}
//清除加载进度
function hangge() {
	$("#jzts").hide();
}

//显示加载进度
function jzts() {
	$("#jzts").show();
}