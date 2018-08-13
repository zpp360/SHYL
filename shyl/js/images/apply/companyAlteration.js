var fileindex = 0;
var pathArray=new Array();
var person=new Object();
$(function() {
	
	var methodUrl = $("#methodUrl").val();
	    	 //上传文件
	 $("#file_upload").fileupload({
		 dataType :'json',
		 autoUpload: true,
		 maxNumberOfFiles :1,
         url: methodUrl+'platform/uploadContractFiles.act',
         sequentialUploads: true
	 }).bind('fileuploadchange', function (e, data) {
		 if(data.files.length > 1){
			 $("#file_upload").tips({
				 side : 2,
				 msg : "一次最多上传一个pdf文件",
				 bg : '#AE81FF',
				 time : 2
			 });
			 progressError('progress');
    		 return false;
		 }
     }).bind('fileuploadprogress', function (e, data) {
			progress('progress',data);
	}).bind('fileuploaddone', function (e, data) {
    	 if("no"==data.result.fileExtError){
    		 $("#file_upload").tips({
				 side : 2,
				 msg : "请上传格式为.pdf格式的文档文件。",
				 bg : '#AE81FF',
				 time : 2
			 });
    		 progressError('progress');
    		 return false;
    		
    	 } else {
    		 if(data.result.filePath!=undefined && data.result.filePath!=""){
	    		//通过Ajax向后台传值
	    		 $.ajax({
	    		 	type : "POST",
	    		 	url : methodUrl+'platform/uploadAppComAlteration.act',
	    		 	data : {
	    		 		info_id : $("#info_id").val(),
	    		 		file_path:data.result.filePath,
	    		 		file_name:data.result.OriginalFileName
	    		 	},
	    		 	dataType : 'json',
	    		 	cache : false,
	    		 	success : function(data) {
	    	    		 reloadAjaxData(data.filelist,"fileID");
	    	    		 $('#progress .bar').text('完成').parent().fadeOut(3000);
	    		 	},error:function(){
	    		 		progressError('progress');
	    		 	}
	    		 });
    		 	
    		 }else{
    			 progressError('progress');
    		 }
    	 }
     });
});	
function progressError(obj){
	$('#'+obj+' .bar').addClass("bar-error").text('上传失败').parent().fadeOut(3000);
}
function progress(obj,data){
	var progress = parseInt(data.loaded / data.total * 100, 10);
	 $("#"+obj).show();
	 $('#'+obj+' .bar').removeClass("bar-error").css('width', progress + '%').text(progress==100 ?'文件保存中，请稍等...':progress+'%');
}
function showButton(){
	 $(".pull-right").css("display","block");
}
function hideButton(){
	 $(".pull-right").css("display","none");
}
function reloadAjaxData(List,id){
	$("#"+id).empty();
	if(List ==null || List.length==0){
		$("#"+id).append("<tr><td colspan='2' style='text-align: center;'><span style='color: #ff6a00'>没有相关记录</span></td></tr>");
	}else{
    	for (var i = 0; i < List.length; i++) {
    		var file_name ;
    		if (List[i].file_info_name.length > 30) {
    			file_name = List[i].file_info_name.substring(0,
    					30)
    					+ "...";
    		} else {
    			file_name = List[i].file_info_name;
    		}
    		$("#"+id).append(htmlAppend(file_name,List[i].id,List[i].file_info_path));
    	}
	}
}
function htmlAppend(file_name,id,file_path){
	var html=
		"<tr>"
		+ "<td style='width: 140px; text-align: center' title='"
		+ file_name
		+ "'>"
		+ file_name
		+ "</td>"
		+ "<td style='text-align: center;'><a  id='view"
		+ id
		+ "' href='javascript:void(0);' target='_blank' class='zview' onclick='return view(view"
		+id
		+ ","+id+")'>预览</a><a data-toggle='modal' data-target='#delComAlterFile' onclick='delComAlterFile("
		+id
		+ ")' class='delete' style='cursor:pointer'>删除</a><input id='pdfPath"
		+ id
		+ "' name='pdfPath"
		+id
		+"' type='hidden' value='"
		+file_path
		+"'/></td>"
		+ "</tr>";
	return html;
}
//模态框初始加载合同
function delComAlterFile(id) {
	$("#delectAltid").val(id);
	}
function deleteUploadComAlterFile(){
	var methodUrl = $("#methodUrl").val();
	 var id = $("#delectAltid").val();
	//通过Ajax向后台传值
	$.ajax({
		type : "POST",
		url : methodUrl+'platform/deleteUploadComAlterFile.act',
		data : {
			info_id : $("#info_id").val(),
			id : id
		},
		dataType : 'json',
		cache : false,
		success : function(data) {
			$('#delComAlterFile').modal('hide');
			reloadAjaxData(data.filelist,"fileID");
		}
	});
}
// 预览企业变更情况PDF
function view(pdf_id,id) {
	var methodUrl = $("#methodUrl").val();
	var ret=false;
	$.ajax({
		type : "POST",
		url : methodUrl+'platform/viewAppComAlteration.act',
		dataType : 'json',
		data : {
			id : id,
		},
		cache : false,
		async: false,
		success : function(data) {
			if(data.responseStr=="OK"){
				var path=data.responsePath;
				$("#view"+id).attr('href',methodUrl+'register/showPdf.act?pdfFile='+path);
				ret=true;
			} else {
				$('#my-modal-success-alert').show ().delay (1000).fadeOut ();
				ret=false;
			}
		}
	});
	return ret; 
}