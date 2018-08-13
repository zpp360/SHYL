<%@page import="com.shyl.framework.util.StringUtil"%>
<%@page import="java.util.*"%>
<%@page import="com.shyl.framework.entity.system.User"%>
<%@page import="com.shyl.framework.util.PageData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	PageData pdPicture= (PageData)request.getSession().getAttribute("pdPicture");
	PageData Sex= (PageData)request.getSession().getAttribute("Sex");
	List<PageData> commonLeftList= (List<PageData>)request.getSession().getAttribute("commonLeftList");
	String menuType = request.getParameter("menuType");
	User platUser = (User)request.getSession().getAttribute("platUser");
	String utype = platUser.getUSER_TYPE();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="<%=basePath%>shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<base href="<%=basePath%>">
<script>
$(document).ready(function(){
	if('<%=utype%>'!="5"){
		if ('<%=menuType%>' == "12") {
			$("#"+<%=menuType%>).attr('class',"hover");
			$("#"+<%=menuType%>).attr('herf',"<%=basePath%>institutionCtrl/toUpdateInstitution.act?institutions_id=${platUser.USER_ID}");
		} else if ('<%=menuType%>' == "13") {
			$("#"+<%=menuType%>).attr('class',"hover");
			$("#"+<%=menuType%>).attr('herf',"<%=basePath%>institutionCtrl/toAboutTeachers.act?institutions_id=${pd.institutions_id}");
		} else if ('<%=menuType%>' == "14") {
			$("#"+<%=menuType%>).attr('class',"hover");
			$("#"+<%=menuType%>).attr('herf',"<%=basePath%>institutionCtrl/toAboutCourses.act?institutions_id=${pd.institutions_id}");
		} else {
			$("#"+<%=menuType%>).attr('class',"hover");
			$("#"+<%=menuType%>).attr('style',"text-decoration:none");
		}
	}
	if('<%=utype%>'=="3"){
		if ('<%=menuType%>' == "2") {
			$("#37").attr('class',"hover");
			$("#37").attr('style',"text-decoration:none");
		}else if ('<%=menuType%>' == "4") {
			$("#41").attr('class',"hover");
			$("#41").attr('style',"text-decoration:none");
		}
	}
	if('<%=utype%>'=="5"){
		if ('<%=menuType%>' == "1") {
			$("#22").attr('class',"hover");
			$("#22").attr('style',"text-decoration:none");
		}else if ('<%=menuType%>' == "2") {
			$("#23").attr('class',"hover");
			$("#23").attr('style',"text-decoration:none");
		}else if ('<%=menuType%>' == "3") {
			$("#24").attr('class',"hover");
			$("#24").attr('style',"text-decoration:none");
		}else if ('<%=menuType%>' == "4") {
			$("#25").attr('class',"hover");
			$("#25").attr('style',"text-decoration:none");
		}else if ('<%=menuType%>' == "5") {
			$("#26").attr('class',"hover");
			$("#26").attr('style',"text-decoration:none");
		}else if ('<%=menuType%>' == "6") {
			$("#27").attr('class',"hover");
			$("#27").attr('style',"text-decoration:none");
		}else if ('<%=menuType%>' == "7") {
			$("#28").attr('class',"hover");
			$("#28").attr('style',"text-decoration:none");
		}else if ('<%=menuType%>' == "19") {
			$("#29").attr('class',"hover");
			$("#29").attr('style',"text-decoration:none");
		}else if ('<%=menuType%>' == "20") {
			$("#30").attr('class',"hover");
			$("#30").attr('style',"text-decoration:none");
		}
	}
});
</script>
</head>
<body>
<input type="hidden" value="<%=pdPicture%>" id="dd">
<input type="hidden" value="<%=Sex%>" id="dd">
	<div class="mypage_left">
	    <div class="mypage_image" style="line-height:1px;box-shadow:0 0 0px #eef1fb" id="mypage_image">
	    	<%if(null!=pdPicture){%>
	    	<%if(StringUtil.isEmpty(pdPicture.getString("user_picture"))){%>
	    		<% if(utype.equals("1")){%>
	          <%if(null!=Sex){%>
	    	  <%if(Sex.getString("sex").equals("1")){%>
	    			<img src="<%=basePath%>shyl/images/f-w.png" alt="LOGO" style="max-width: 100%; max-height: 100%;" >
	    		<%}else{%>
	    			<img src="<%=basePath%>shyl/images/f-m.png" alt="LOGO" style="max-width: 100%; max-height: 100%;" >
	    		<%}
	         }else{ %>
	    	   <img src="<%=basePath%>shyl/images/logo_temp.jpg" alt="LOGO" style="max-width: 100%; max-height: 100%;" >
	    	<%} 
	    	}else{%>
	    		<img src="<%=basePath%>shyl/images/logo_temp.jpg" alt="LOGO" style="max-width: 100%; max-height: 100%;" >	
	    	<%}
	    	}else{%>
	    		<img id="LOGO" onerror="showImgDelay(this,'<%=basePath%>shyl/images/logo_temp.jpg');" src="<%=basePath%>images/<%=pdPicture.getString("user_picture")%>" alt="LOGO" style="max-width: 100%; max-height: 100%;" >
	    	<%}%>
	    	<%}else{%>	
	    	   <% if(utype.equals("1")){%>
	          <%if(null!=Sex){%>
	    	  <%if(Sex.getString("sex").equals("1")){%>
	    			<img src="<%=basePath%>shyl/images/f-w.png" alt="LOGO" style="max-width: 100%; max-height: 100%;" >
	    		<%}else{%>
	    			<img src="<%=basePath%>shyl/images/f-m.png" alt="LOGO" style="max-width: 100%; max-height: 100%;" >
	    		<%}
	         }else{ %>
	    	   <img src="<%=basePath%>shyl/images/logo_temp.jpg" alt="LOGO" style="max-width: 100%; max-height: 100%;" >
	    	<%} 
	    	}else{%>
	    		<img src="<%=basePath%>shyl/images/logo_temp.jpg" alt="LOGO" style="max-width: 100%; max-height: 100%;" >	
	    	<%}
	    	} %>
		</div>
		<% 
		if(commonLeftList.size()>0){
			for(PageData pds:commonLeftList){
				%>
					<a href="<%=basePath%><%=pds.getString("menu_url")%>" class="" id="<%=pds.getString("id")%>"><%=pds.getString("menu_name")%></a>	
		<% 	}	
		}
		%>
	</div>
</body>
</html>