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
<base href="<%=basePath%>">
<title>企业信息数据分析_济南市服务外包公共服务平台</title>
<!-- jsp文件头和头部 -->
<%@ include file="../../../system/admin/top.jsp"%>
<link rel="stylesheet" href="static/css/thing.css" />
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/mainjs/echarts.js"
	type="text/javascript"></script>
	<script src="<%=basePath%>shyl/js/mainjs/macarons.js"
	type="text/javascript"></script>
<style type="text/css">
.table-bordered {
	border: none;
}
.table-bordered td {
	border-left: none;
}
.table td {
    border-top: none;
}
</style>

</head>
<body>
	<div class="container-fluid" id="main-container">
		<div id="page-content" class="clearfix">
			<div class="row-fluid">
				<div class="row-fluid">
					<form action="" method="post" id="forms" class="form-horizontal">
						<table style="margin-bottom: 20px;">
							<tbody>
								<tr>
									<td class="form-inline">
									<label class="lbl" for="start_time">开始日期：</label> 
									<input
										class="span10 date-picker" name="start_timestamp"
										id="start_timestamp" value="${pd.start_timestamp}" type="text"
										data-date-format="yyyy-mm-dd" readonly="readonly"
										style="width: 206px;" placeholder="请选择开始日期" onblur="trim(this);" /></td>
									<td style="width: 20px"></td>
									<td class="form-inline">
									<label class="lbl" for="end_time">结束日期：</label>
									<input class="span10 date-picker" name="end_timestamp"
										id="end_timestamp" value="${pd.end_timestamp}" type="text"
										data-date-format="yyyy-mm-dd" readonly="readonly"
										style="width: 206px;" placeholder="请选择结束日期" onblur="trim(this);" /></td>
									<td style="width: 20px"></td>
									<td class="form-inline">
										<button type="button" onclick="searchs();" class="btn btn-small btn-success btn-lg" title="查询" >查询<i class="icon-search icon-on-right"></i></button>
									</td>
								</tr>
							</tbody>
						</table>
						<hr/>
						<table id="table_report"
							class="table table-striped table-bordered">
							<tbody>
								<tr>
									<td>
										<div id="single_Linediv" style="width: 900px;height:400px;"></div>
									</td>
									<td>
										<div id="single_column2div" style="width: 600px;height:400px;">FusionCharts</div>
									</td>
								</tr>
								<tr>
									<td>
										<div id=single_column3Ddiv style="width: 900px;height:400px;">FusionCharts</div>
									</td>
									<td>
										<div id="single_area2Ddiv" style="width: 620px;height:400px;">FusionCharts</div>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- 返回顶部  -->
	<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse"> <i
		class="icon-double-angle-up icon-only"></i>
	</a>

	<!-- 引入 -->
	<script type="text/javascript">
		window.jQuery
				|| document
						.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");
	</script>
	<script src="static/js/bootstrap.min.js"></script>
	<script src="static/js/ace-elements.min.js"></script>
	<script src="static/js/ace.min.js"></script>

	<script type="text/javascript"
		src="static/js/bootstrap-datepicker.min.js"></script>
	<!-- 日期框 -->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
</body>

<script type="text/javascript">
	$(top.hangge());
   
    $(document).ready(function() {
		//日期框
		$('.date-picker').datepicker();
		
	    natureCnt();
	    scaleCnt();
	    capitalCnt();
	    educationCnt();
	});
    <%-- 企业性质图 --%>
	function natureCnt() {
    	var START_TIME = $("#start_timestamp").val();
		var END_TIME = $("#end_timestamp").val();
		var myChart = echarts.init(document.getElementById('single_Linediv'),e_macarons);
		 var education = new Array();
	    	var valueDate = new Array();
	    	$.ajax({
	    		type:"POST",
	    		url:"<%=basePath%>statisticsCompany/single_line.do",
	    		async: false,
	    		data : {
	    			START_TIME : START_TIME,
	    			END_TIME : END_TIME
	    		},
	    		success : function(responseText) {
	    			$.each(responseText.list, function(name, item) {
	    				education.push(item.enterprise_nature);
	    				valueDate.push(item.numCount);
	    			});
	    		}
	    	});
			option = {
			    title : {
			    	x:'center',
			        text: '企业性质图',
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
			            magicType : {show: true, type: ['line', 'bar']},
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
			        	name:'企业类型',
			            type : 'category',
			            boundaryGap : false,
			            data :education,
			            axisLabel: {
			                interval: 0,
			                rotate: 335
			            }
			        }
			    ],
			    yAxis : [
			        {
			        	name:'数量',
			            type : 'value',
			            axisLabel : {
			                formatter: '{value}'
			            }
			        }
			    ],
			    series : [
			        {
			            name:'数量',
			            type:'line',
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
		 myChart.setOption(option);   
    }
	
	 <%-- 企业规模图 --%>
		function scaleCnt(){
	    	var START_TIME = $("#start_timestamp").val();
			var END_TIME = $("#end_timestamp").val();
			var myChart = echarts.init(document.getElementById('single_column3Ddiv'),e_macarons);
			 var education = new Array();
		    	var valueDate = new Array();
		    	$.ajax({
		    		type:"POST",
		    		url:"<%=basePath%>statisticsCompany/single_column3D.do",
		    		async: false,
		    		data : {
		    			START_TIME : START_TIME,
		    			END_TIME : END_TIME
		    		},
		    		success : function(responseText) {
		    				valueDate.push(responseText.oneCount.oneCount);
		    				valueDate.push(responseText.twoCount.twoCount);
		    				valueDate.push(responseText.threeCount.threeCount);
		    				valueDate.push(responseText.fourCount.fourCount);
		    				valueDate.push(responseText.fiveCount.fiveCount);
		    				valueDate.push(responseText.sixCount.sixCount);
		    		}
		    	});
				option = {
				    title : {
				    	x:'center',
				        text: '企业规模图',
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
				            magicType : {show: true, type: ['line', 'bar']},
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
				        	name:'企业规模',
				            type : 'category',
				            boundaryGap : false,
				            data :['1-50人之间','50-100人之间','100-200人之间','200-500人之间','500-1000人之间','1000人以上']
				        }
				    ],
				    yAxis : [
				        {
				        	name:'数量',
				            type : 'value',
				            axisLabel : {
				                formatter: '{value}'
				            }
				        }
				    ],
				    series : [
				        {
				            name:'数量',
				            type:'line',
				            data:valueDate,
				            itemStyle: {
				            	normal: {
				            		areaStyle: {
				            			type: 'default',color:'#FCCE10'
				            		},
				            		lineStyle:{  
		                                color:'#FE8463'  
		                            }
				        		}
				        	},
				        }
				    ]
				};
			 myChart.setOption(option);   
	    }
		
		<%-- 企业注册资金图 --%>
		function capitalCnt(){
	    	var START_TIME = $("#start_timestamp").val();
			var END_TIME = $("#end_timestamp").val();
			var myChart = echarts.init(document.getElementById('single_column2div'),e_macarons);
		    	var valueDate = new Array();
		    	$.ajax({
		    		type:"POST",
		    		url:"<%=basePath%>statisticsCompany/single_column2D.do",
		    		async: false,
		    		data : {
		    			START_TIME : START_TIME,
		    			END_TIME : END_TIME
		    		},
		    		success : function(responseText) {
		    				valueDate.push(responseText.capitalOneCount.capitalOneCount);
		    				valueDate.push(responseText.capitalTwoCount.capitalTwoCount);
		    		}
		    	});
				option = {
				    title : {
				    	x:'center',
				        text: '注册资金图',
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
				            magicType : {show: true, type: ['line', 'bar']},
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
				        	name:'注册资金',
				            type : 'category',
				            boundaryGap : true,
				            data :['注册资金在100万元以下','注册资金在100万元以上']
				        },
				    ],
				    yAxis : [
				        {
				        	name:'数量',
				            type : 'value',
				            axisLabel : {
				                formatter: '{value}'
				            }
				        }
				    ],
				    series : [
				        {
				            name:'数量',
				            type:'bar',
				            data:valueDate,
				            itemStyle: {
				            	normal: {
				            		areaStyle: {
				            			type: 'default',color:'#FCCE10'
				            		},
				            		lineStyle:{  
		                                color:'#FE8463'  
		                            }
				        		}
				        	},
				        }
				    ]
				};
			 myChart.setOption(option);   
	    }
    
		 <%-- 招聘学历图 --%>
			function educationCnt(){
		    	var START_TIME = $("#start_timestamp").val();
				var END_TIME = $("#end_timestamp").val();
				var myChart = echarts.init(document.getElementById('single_area2Ddiv'),e_macarons);
				 var education = new Array();
			    	var valueDate = new Array();
			    	$.ajax({
			    		type:"POST",
			    		url:"<%=basePath%>statisticsCompany/single_area2D.do",
			    		async: false,
			    		data : {
			    			START_TIME : START_TIME,
			    			END_TIME : END_TIME
			    		},
			    		success : function(responseText) {
			    			$.each(responseText.list, function(name, item) {
			    				education.push(item.education);
			    				valueDate.push(item.numCount);
			    			});
			    		}
			    	});
					option = {
					    title : {
					    	x: 'center',
					        text: '招聘学历图',
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
					            magicType : {show: true, type: ['line', 'bar']},
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
					        	name:'招聘学历',
					            type : 'category',
					            boundaryGap : true,
					            data :education
					        }
					    ],
					    yAxis : [
					        {
					        	name:'数量',
					            type : 'value',
					            axisLabel : {
					                formatter: '{value}'
					            }
					        }
					    ],
					    series : [
					        {
					            name:'数量',
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
				 myChart.setOption(option);   
		    }
    function searchs() {
    	var start_time=$("#start_timestamp").val();
    	var end_time=$("#end_timestamp").val();
    	if(start_time.length>0&&end_time.length>0){
    		if(start_time>end_time)
    		{
    		$("#start_timestamp").tips({
    			side : 3,
    			msg : '开始时间不能大于结束时间！',
    			bg : '#FF5080',
    			time : 2
    		});
    		$("#start_timestamp").focus();
    		return false;		
    		}
    	}
    	natureCnt();
	    scaleCnt();
	    capitalCnt();
	    educationCnt();
    }
</script>

</html>

