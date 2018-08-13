<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.fixed-bottom {width: 100% !important;position: fixed !important;top:inherit !important;bottom: 0px !important;}
</style>
<footer class="newfooter">
	<div class="wanew">
		<p>
			版权所有：济南市服务外包协会<span>技术支持：富士软件科技（山东）有限公司</span><br>
			地址：山东省济南市高新区新泺大街1768号齐鲁软件大厦423室<span>邮编：250100</span><span>电话：0531-66602739 66602729</span><span>传真：0531-66602739</span><span>Email:service@jinansourcing.com</span>
		</p>
	</div>
</footer>
<script>
$(document).ready(function(){
	var evt = "onorientationchange" in window ? "orientationchange" : "resize";
	var browser={  
		    versions:function(){   
		           var u = navigator.userAgent, app = navigator.appVersion;   
		           return {//移动终端浏览器版本信息   
		                trident: u.indexOf('Trident') > -1, //IE内核  
		                presto: u.indexOf('Presto') > -1, //opera内核  
		                webKit: u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核  
		                gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1, //火狐内核  
		                mobile: !!u.match(/AppleWebKit.*Mobile.*/), //是否为移动终端  
		                ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端  
		                android: u.indexOf('Android') > -1 || u.indexOf('Linux') > -1, //android终端或者uc浏览器  
		                iPhone: u.indexOf('iPhone') > -1 , //是否为iPhone或者QQHD浏览器  
		                iPad: u.indexOf('iPad') > -1, //是否iPad    
		                webApp: u.indexOf('Safari') == -1, //是否web应该程序，没有头部与底部  
		                weixin: u.indexOf('MicroMessenger') > -1, //是否微信   
		                qq: u.match(/\sQQ/i) == " qq" //是否QQ  
		            };  
		         }(),  
		         language:(navigator.browserLanguage || navigator.language).toLowerCase()  
		}   
		  
	if(browser.versions.mobile || browser.versions.ios || browser.versions.android ||   
		    browser.versions.iPhone || browser.versions.iPad){        
		//固定footer在底部
		fixedBottom();
		//移动设备旋转时处理footer
		window.addEventListener(evt, function() {
			setTimeout(fixedBottom(),5000);
		}, false);
	}	    

});
function fixedBottom(){
	 if(!(document.body.scrollHeight>window.innerHeight)){
		 $("html,body").css("height",window.innerHeight);
		$(".newfooter").addClass("fixed-bottom");
    }else{
   	 $("body").css("height","100%");
		$(".newfooter").removeClass("fixed-bottom");
	} 
}
</script>