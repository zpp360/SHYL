function showImgDelay(imgObj, imgsrc){
	imgObj.onerror=null;
	imgObj.src=imgsrc;  
}

function showOriginalPhoto(bathPath, path) {
	// 如果路径不存在
	if (path == null || path=="" || path == undefined) {
		return;
	}
	var src = bathPath + path;
	var ImgObj=new Image();
    ImgObj.src= src;
     if(ImgObj.fileSize > 0 || (ImgObj.width > 0 && ImgObj.height > 0)) {
    	 var newwin = window.open();
    	 newwin.document.write("<div align='center'><img src='"+src+"'/></div>");
    }

}