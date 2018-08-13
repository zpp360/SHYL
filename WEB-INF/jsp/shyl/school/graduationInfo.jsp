<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<title>专业类别_济南市服务外包公共服务平台</title>
<meta charset="UTF-8" />
<base href="<%=basePath%>">
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css" />
<link href="<%=basePath%>shyl/css/maincss/school.css" rel="stylesheet" type="text/css">
<script src="shyl/js/mainjs/jquery-v1.10.2.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/jquery.min.js"></script>
<script src="<%=basePath%>shyl/js/bootstrap.js"></script>
<script src="shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/datepicker/WdatePicker.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/mainjs/echarts.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/mainjs/macarons.js" type="text/javascript"></script>
</head>
<body style="background-color: #f7f7f7;">
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="clear"></div>
	<div class="register-box p0">
		<div class="rticon"></div>
		<jsp:include page="../common/left.jsp"><jsp:param value="16" name="menuType"/></jsp:include>
		<div class="mypage_right">
			<input type="hidden" id="level" value="${pd.level}"/>
			<h2>毕业状况统计</h2>
			<div class="tab" style="margin-bottom:0;">
				<span><small style="color: red;">*</small>毕业时间：</span> 
				<input class="inputtxt2 date_control"type="text" value="" name="year" id="year" 
							onFocus="WdatePicker({dateFmt:'yyyy',isShowWeek:true});" placeholder="毕业时间"
							title="毕业时间">
				<button type="button" onclick="searchs();" class="btn btn-small btn-success btn-lg" title="查询" >查询<i class="icon-search icon-on-right"></i></button>
			</div>
			<div class="jianli" style="margin:30px 0px 0px -5px;">
					<div id="single_Linediv" style="width: 800px;height:600px;"></div>
			</div>
		
		</div>
	</div>
	<div class="clear"></div>
	<%@ include file="../common/footer.jsp"%>
</body>
<script type="text/javascript" src="shyl/js/jquery.tips.js"></script>
<script type="text/javascript">
function searchs() {
	if ($("#year").val() == "") {
		$("#year").tips({
			side : 3,
			msg : '请输入毕业年度',
			bg : '#AE81FF',
			time : 3
		});
		$("#year").focus();
		return false;
	}
	natureCnt();  
}
$(document).ready(function() {
	// 获取当前年
	var date = new Date();
    var year = date.getFullYear();
	$("#year").val(year);
	natureCnt();
});
<%-- 专业～人数图 --%>
function natureCnt() {
	var START_TIME = $("#year").val();
	var level = $("#level").val();
	var myChart = echarts.init(document.getElementById('single_Linediv'),e_macarons);
	var education = new Array();
   	var valueDate = new Array();
   	$.ajax({
    		type:"POST",
    		url:"<%=basePath%>school/professional_line.act",
    		async: false,
    		data : {
    			START_TIME : START_TIME,
    			level : level
    		},
    		success : function(responseText) {
    			$.each(responseText.list, function(name, item) {
    				education.push(item.profession);
    				valueDate.push(item.numcount);
    			});
    		}
    	});
	
   	if(level=="0"){
   		option = {
   				title : {
			    	x:'center',
			        text: '毕业状况图',
			        textStyle: {  
		                fontWeight: 'normal',              //标题颜色  
		                color: '#FE8463'  
		            }
			    },
			    color:[
			           "#30e0e0"
			       ],
			    tooltip : {
			        trigger: 'axis'
			    },
			    toolbox: {
			        show : true,
			        feature : {
			            mark : {show: false},
			            magicType : {show: true, type: ['bar', 'line']},
			            restore : {show: true},
			            saveAsImage : {show: false}
			        }
			    },
			    itemStyle: {
	                normal: {
	                    color: function(params) {
	                        // build a color map as your need.
	                        var colorList = [
							"#C6E579","#B5C334","#FCCE10","#E87C25","#27727B",
							"#FE8463","#9BCA63","#FAD860","#F3A43B","#60C0DD",
							"#D7504B","#F4E001","#26C0C0","#F0805A","#C1232B"
	                        ];
	                        return colorList[params.dataIndex]
	                    }
	                }
	            },
			    calculable : true,
			    xAxis : [
			        {
			        	name:'院系',
			            type : 'category',
			            boundaryGap : true,
			            data :education,
			            axisLabel: {
			                interval: 0,
			                rotate: 300
			            }
			        }
			    ],
			    grid : { // 控制图的大小，调整下面这些值就可以，
		             x: 80,
		             x2: 100,
		             y2: 190,// y2可以控制 X轴跟Zoom控件之间的间隔，避免以为倾斜后造成 label重叠到zoom上
		        },
			    yAxis : [
			        {
			        	name:'人数',
			            type : 'value',
			            axisLabel : {
			                formatter: '{value}'
			            }
			        }
			    ],
			    series : [
			        {
			            name:'人数',
			            type:'bar',
			            data:valueDate,
			            itemStyle: {
			            	normal: {
			            		areaStyle: {
			            			type: 'default',color:'#C6E579'
			            		},
			            		lineStyle:{  
	                                color:'#FE8463'  
	                            }
			        		}
			        	},
			        }
			        
			    ]
			};
   	}else if(level=="1"){
   		option = {
   				title : {
			    	x:'center',
			        text: '毕业状况图',
			        textStyle: {  
		                fontWeight: 'normal',              //标题颜色  
		                color: '#FE8463'  
		            }
			    },
			    color:[
			           "#30e0e0"
			       ],
			    tooltip : {
			        trigger: 'axis'
			    },
			    toolbox: {
			        show : true,
			        feature : {
			            mark : {show: false},
			            magicType : {show: true, type: ['bar', 'line']},
			            restore : {show: true},
			            saveAsImage : {show: false}
			        }
			    },
			    itemStyle: {
	                normal: {
	                    color: function(params) {
	                        // build a color map as your need.
	                        var colorList = [
							"#C6E579","#B5C334","#FCCE10","#E87C25","#27727B",
							"#FE8463","#9BCA63","#FAD860","#F3A43B","#60C0DD",
							"#D7504B","#F4E001","#26C0C0","#F0805A","#C1232B"
	                        ];
	                        return colorList[params.dataIndex]
	                    }
	                }
	            },
			    calculable : true,
			    xAxis : [
			        {
			        	name:'专业',
			            type : 'category',
			            boundaryGap : true,
			            data :education,
			            axisLabel: {
			                interval: 0,
			                rotate: 300
			            }
			        }
			    ],
			    grid : { // 控制图的大小，调整下面这些值就可以，
		             x: 80,
		             x2: 100,
		             y2: 190,// y2可以控制 X轴跟Zoom控件之间的间隔，避免以为倾斜后造成 label重叠到zoom上
		        },
			    yAxis : [
			        {
			        	name:'人数',
			            type : 'value',
			            axisLabel : {
			                formatter: '{value}'
			            }
			        }
			    ],
			    series : [
			        {
			            name:'人数',
			            type:'bar',
			            data:valueDate,
			            itemStyle: {
			            	normal: {
			            		areaStyle: {
			            			type: 'default',color:'#C6E579'
			            		},
			            		lineStyle:{  
	                                color:'#FE8463'  
	                            }
			        		}
			        	},
			        }
			        
			    ]
			};
   	}
	myChart.setOption(option);
} 

</script>
</html>