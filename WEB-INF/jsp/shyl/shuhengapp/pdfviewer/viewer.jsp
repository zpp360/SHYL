<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>

</head>

  <body tabindex="1" class="loadingInProgress">
  	<div><%=basePath%>${pafPath}</div>
    <iframe src="<c:url value="plugins/pdfjs/web/viewer.html" />?file=<%=basePath%>${pafPath}"
        width="100%" height="800"></iframe>

  </body>
</html>

