<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>毕业生一览表</title>
<style type="text/css">
			body {
			margin-left: 45px;
			margin-right: 45px;
			font-family: SimSun;
			font-size: 16px;
			}
			.table {
				border: 0px solid;
				border-color: #ddd;
				margin-bottom: 0px !important;
				width: 100%;
    			max-width: 100%;
	    		border-collapse: collapse;
	    		table-layout:fixed; 
	    		word-wrap:break-word;
			}
			
			.table td {
				border: 1px solid;
				border-color: #ddd;
				border-collapse: collapse;
				text-align: center;
				vertical-align: middle !important;
				height: 40px;
			}
			.table td label {
				font-size: 0.85em;
			}
			.vertical {
				width: 20px;
				font-size: 12px;
				word-wrap: break-word;
				letter-spacing: 20px;
			}
			
			.width70 {
				width: 70% !important;
			}
			
			.font-size85 {
				color: #b6b6b6;
				font-size: 0.85em;
			}
			
			* {
				box-sizing: content-box;
			}
		</style>
</head>
<body>
    <h2 style="text-align: center;">${year}毕业生一览表</h2>
	<table id="table" border="1" bordercolor="black" cellspacing="1" class="table">
					<tr>
						<th style="width:5%;text-align: left;">序号</th>
						<th style="width:10%;text-align: left;">姓名</th>
						<th style="width:22%;text-align: left;">身份证号码</th>
						<th style="width:9%;text-align: left;">学历</th>
						<th style="width:23%;text-align: left;">毕业学校</th>
						<th style="width:5%;text-align: left;">专业</th>
					</tr>
				   <#list graduateList as var>
						<tr>
						    <td style="width:5%;text-align:left;">${var_index+1}</td>
							<td style="width:10%;text-align: left;">
							${var.name!''}
							</td>
							<td style="width:22%;text-align: left;">
								${var.id_number!''}
							</td>
							<td style="width:9%;text-align: left;">
							${var.education!''}
							</td>
							<td style="width:23%;text-align: left;">
							${var.school!''}
							</td>
							<td style="width:5%;text-align: left;">
							${var.major!''}
							</td>
						</tr>
                </#list>
			</table>
			<h2>申请应届大学生培训扶持资金${reward}万元</h2>
	</body>
</html>
