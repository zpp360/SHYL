<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="img_host" value="${applicationScope.get('img_host')}"></c:set>
<meta charset="utf-8" />
<title>${pd.SYSNAME}</title>
<meta name="description" content="overview & stats" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- basic styles -->
<link href="static/css/bootstrap.min.css" rel="stylesheet" />
<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
<link rel="stylesheet" href="static/css/font-awesome.min.css" />
<!-- page specific plugin styles -->
<!-- 下拉框-->
<link rel="stylesheet" href="static/css/chosen.css" />
<!-- ace styles -->
<link rel="stylesheet" href="static/css/ace.min.css" />
<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
<link rel="stylesheet" href="static/css/ace-skins.min.css" />
<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
<link rel="stylesheet" href="static/css/datepicker.css" />
<!-- 日期框 -->
<!--引入弹窗组件start-->
<script type="text/javascript" src="plugins/attention/zDialog/zDrag.js"></script>
<script type="text/javascript"
	src="plugins/attention/zDialog/zDialog.js"></script>
<!--引入弹窗组件end-->
<script type="text/javascript" src="static/js/jquery.tips.js"></script>

<!-- My97WdatePicker日期控件 --> 
<script type="text/javascript" src="shyl/js/datepicker/WdatePicker.js"></script>
<link rel="stylesheet" href="shyl/js/datepicker/skin/WdatePicker.css"/>


<!-- 富文本编辑器start -->
<!-- 配置文件 -->
<script type="text/javascript" src="plugins/ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="plugins/ueditor/ueditor.all.js"></script>
<!-- 富文本编辑器end -->

<!-- 下拉框 start-->
<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script>
<script type="text/javascript" src="shyl/js/mainjs/errImage.js"></script>
<!-- 下拉框 end-->

<!-- oss web直传 -->
<script type="text/javascript" src="plugins/oss/lib/crypto1/crypto/crypto.js"></script>
<script type="text/javascript" src="plugins/oss/lib/crypto1/hmac/hmac.js"></script>
<script type="text/javascript" src="plugins/oss/lib/crypto1/sha1/sha1.js"></script>
<script type="text/javascript" src="plugins/oss/lib/base64.js"></script>
<script type="text/javascript" src="plugins/oss/lib/plupload-2.1.2/js/plupload.full.min.js"></script>
<script type="text/javascript" src="plugins/oss/upload.js"></script>
<!-- oss web直传  end -->
<!-- 自定义验证 -->
<script src="shyl/js/mainjs/validata.js" type="text/javascript"></script>
<script type="text/javascript">
	var locat = document.getElementsByTagName('base')[0].href
	var dialogPath = locat.indexOf('https')>-1 ? '':locat;
	
	function isSpecialChar(str){
		var regEn = /[`~!@#$%^&*()_+<>?:"{},.\/;'[\]]/im,
	    regCn = /[·！#￥（——）：；“”‘、，|《。》？、【】[\]]/im;

		if(regEn.test(str) || regCn.test(str)) {
		    return true;
		}
	}
	
	function isSpeChar(str){
		var regEn = /["]/im;

		if(regEn.test(str)) {
		    return true;
		}
	}
	
</script>
