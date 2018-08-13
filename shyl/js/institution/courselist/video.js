var namedtype, namedTime, namedNum,listenTime,res,rootPath;
var obj = new Array();
var b = false;
var n = false;
	$(function(){
		rootPath=$("#rootPath").val()
		//退出
		$(".btn-logout").click(function(){
			$.post(rootPath+"/logout",function(){
				location.href=rootPath+"/";
			});
		});
		//返回
		$(".btn-return").click(function(){
			location.href = document.referrer;
		});
		
		for(var i=0;i< $(".zjlieb").length;i++){
			$(".zjlieb:eq("+i+")").data("sort",(i+1));
		}

		var toggle=function(){
		    if($(".aside").hasClass("close")){
		        //打开
		        $(".content").animate({"right": 399}, 200, function () {
		            $(".aside").removeClass("close").addClass("open");
		        });
		        $("object").attr("width",(parseInt($("object").attr("width")) + 399));
		    }else{
		        //关闭
		        $(".content").animate({"right": 0}, 200, function () {
		            $(".aside").removeClass("open").addClass("close");
		        });
	           $("object").attr("width",(parseInt($("object").attr("width")) + 399));
		    }
		};
	    $(".section").css("height",$(window).height()-60);
	    $(".video").css("height",$(window).height()-110);
	   
	    $(".rightFix li").each(function (index) {
	    	$(this).css("opacity", 1);
	        var $this=$(this);
	        $this.click(function () {
	            var $source=$(".rightFix").find(".active").length?$(".rightFix").find(".active"):$(".rightFix").find("li").eq(0);
	            var $target=$(this);
	            $(this).css("opacity", 1).css("background-color","#00baee")
	            	.siblings().css("opacity", 1)
	            	.css("background-color","#232323");
	            $(this).addClass("active");
	            toggle();
	        });
	    });
		$(".study").each(function(){
			if($(this).find(".zj_name").hasClass("zhangjie_active")){
				$(this).addClass("zjplaying");
			}
			$(this).click(function(){
				//获得之前的东西
				$(".study.zjplaying").find(".zj_name").removeClass("zhangjie_active");
				$(".study.zjplaying").removeClass("zjplaying");
				
				$(this).addClass("zjplaying");
				$(this).find(".zj_name").addClass("zhangjie_active");
				objectPlay($(this));
			});
		});
		objectPlay($(".zjplaying"));
		//章节
		$(".zjlieb").hover(function(){
				$(this).find(".zj_name").addClass("zhangjie_active");
		},function(){
			if(!$(this).hasClass("zjplaying")){
				$(this).find(".zj_name").removeClass("zhangjie_active");
			}
		});
	});
	//查询 是收费 还是免费 
	function objectPlay(obj){
		var uuid=obj.data("uuid");
		var vuid=obj.data("vuid");
		var cuid=obj.data("cuid");
		var utoken=obj.data("utoken");
		var videoid=obj.data("videoid");
		var chapterid=obj.data("chapterid");
		var classTypeId=$("#classTypeId").val();
		var freeflag=obj.data("freeflag");
		$("#shipin").html(obj.attr("title"));
		if(res != null){
			res.abort();
		}
		$("#video").html("");
		 $.ajax({
			url:rootPath+"courseapp/videoPermission.app",
			type:"post",
			dataType:"json",
			data:{"lectureId":videoid,
				"classTypeId":classTypeId,
				"moduleId":chapterid,
				"freeflag":freeflag
				},
			success:function(data){
				switch (data.falg) {
					case "notlogin"://未登录
						$.msg("登录后才能观看",1000);
						break;
					case "noPermissions"://没有权限
						if(freeflag==2){//试听状态可以播放
							b=true;
							listenTime = (obj.data("overflowtime") * 60);
							startPlayer(uuid,vuid);
						}else{//正常状态直接购买
							b=false;
							$("#video").html(addDiv());
						    $(".gobuy").show();
						}	
						break;
					case "isNotVideo"://该视频已删除
						$.msg("该视频已删除",1000);
						break;
					default:
						if(freeflag==2){//购买过的试听视频直接播放，禁止提示购买画面
							b=false;
						}
						startPlayer(uuid,vuid);//播放
				}
			},error:function(XMLHttpRequest, textStatus, errorThrown){
				$.msg("请求视频异常",1000);
			}
		});
		
		
		
	}
	function startPlayer(uuid,vuid){
		// 替换嵌入播放插件 --%>
		player = new CloudVodPlayer();
		player.init({definition:0,share:0,extend:0,uu:uuid,vu:vuid,callbackJs:"callbackJs",isShowRight:2,panoType:1,auto_play:1},"video");
		$("#video").css("overflow","hidden");
		window.callbackJs = function(type, data) {
			//console.log(type)
			switch (type) {
				case "videoStart":
					onPlayerStart();
					break;
				case "videoLiveStop":
					break;
				case "videoResume":
					onPlayerResume();
					break;
				case "adTailPlayComplete":
					onPlayerStop();
					//$("#marquee_contnet").hide();
					$("#marquee_contnet").stop();
					clearInterval(window.loopMarquee);
					break;
				case "videoPause":
					//$("#marquee_contnet").stop();
					//clearInterval(window.loopMarquee);
					break;
				case "videoReplay":
					$("#marquee_contnet").remove();
					marquee(data);
					break;
				case "playerInit":
					var time = player.sdk.getVideoSetting().duration;
					//计算需要
					if(namedtype != null && namedtype == 'LOOK_VIDEO_BY_TIME'){
						var num = parseInt(time / namedTime);
						for(var i = 0; i < num ; i ++){
							obj[i] = ((i + 1) * namedTime);
						}
					}else if(namedtype != null && namedtype == 'LOOK_VIDEO_BY_NUM'){
						var num = parseInt(time / namedNum);
						for(var i = 0; i < namedNum; i ++){
							obj[i] = ((i + 1) * num);
						}
					}
					$("#video").css("overflow","hidden");
					$.ajax({
						url : rootPath + "/classModule/marquee",
						type:"post",
						data:{"verificationcode":$("#cId").val()+"_"+($("#userId").val()==""?0:$("#userId").val())+"_f","vid":0},
						dataType:"json",
						success:function(data){
							data = (new Function("return " + data))();
							window.marquee_data = data;
							marquee();
						}
					});
					break;
				default:
					break;
			}

		}
		$("#video").append(addDiv());
	}
	//拖动回调
	function onPlayerSeek(from,to){
		tanc();
		nameds();
	}
	
	//开始播放回调
	function onPlayerStart(){
		if(startTime != ""){
			player.sdk.seekTo(startTime);
			startTime = ""; 
		}
		tanc();
		nameds();
	}
	//暂停后继续播放回调
	function onPlayerResume(){
		tanc();
		nameds();
	}
	
	function nameds(){
		if(n && obj != null && obj.length > 0){
			for(var i = 0; i <obj.length; i ++){
				var t = parseInt(player.sdk.getVideoTime());
				if(t == obj[i]){
					player.sdk.pauseVideo();
					player.sdk.seekTo(t);
					$(".pause").fadeIn(200);
					obj.splice(0,(i +1));
					break;
				}
			}
			setTimeout(function(){
				nameds();
			},250);
		}
			
	}
	
	function tanc(){
		console.log("b,"+b);
		if(b){
			if(parseInt(player.sdk.getVideoTime()) >= listenTime){
				player.sdk.seekTo(listenTime);
				player.sdk.pauseVideo();
				$(".gobuy").fadeIn(200);
			}else{
				setTimeout(function(){
					tanc();
				},250);
			}		
		}
	}
	
function addDiv(){
		listenHint = "尊敬的用户，该视频属于收费视频，如想继续收看请您购买课程";
	var html = "<div class='mask gobuy'><div class='word'>"
			+ "<p>" + listenHint + "</p>"
			+ "<button onclick='javascript:buyclass();'>立即购买</button>"
			+ "</div></div>"
			+ "<div class='mask pause'><div class='word'>"
			+ "<p>点击确定继续观看</p>"
			+ "<button onclick='javascript:cuntinue();'>确定</button>"
			+ "</div></div>";
	return html;
}
function named(cv){
	if(cv.setPointName == "LOOK_VIDEO_BY_TIME"){
		n = true;
		namedtype = cv.setPointName;
		namedTime = (cv.namedTime * 60);
		
	}else if(cv.setPointName == "LOOK_VIDEO_BY_NUM" ){
		n = true;
		namedtype = cv.setPointName;
		namedNum = cv.namedNum;
	}
}

function cuntinue(){
	$(".pause").fadeOut(200,function(){
		player.sdk.resumeVideo();		
	});
}

function buyclass(){
	window.location.href = rootPath + "institution/notFreeCourse.act?classTypeId=" + $("#classTypeId").val();
}


function playVideoJsAudio(myPlayer){
	var loadsum = myPlayer.bufferedPercent();
	if(loadsum == 100){
		myPlayer.play();
	}else{
		setTimeout(playVideoJsAudio(myPlayer),1000);
	}	
}


