<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>专线明细表</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
			
			.table th {
				border: 1px solid;
				border-color: #ddd;
				border-collapse: collapse;
				text-align: center;
				vertical-align: middle !important;
				height: 40px;
			}
			
		</style>

	</head>

	<body id="top">

		<h2 style="text-align: center;">${date}专线明细表</h2>
		<table id="appTable" bordercolor="black" cellspacing="1" class="table">
			<tr>
				<th style="width:5%;text-align: center;">序号</th>
				<th style="width:10%;text-align: center;">年</th>
				<th style="width:10%;text-align: center;">月</th>
				<th style="width:10%;text-align: center;">日</th>
				<th style="width:20%;text-align: center;">凭证号</th>
				<th style="width:25%;text-align: center;">摘要</th>
				<th style="width:20%;text-align: center;">金额</th>
			</tr>
			<#list varList as var>
			<tr>
				<td style="text-align: center;">${var_index + 1}</td>
				<td style="text-align: center;">${var.apply_year}</td>
				<td style="text-align: center;">${var.apply_mon}</td>
				<td style="text-align: center;">${var.apply_date}</td>
				<td style="text-align: center;">${var.voucher_num}</td>
				<td style="text-align: center;">${var.apply_abstract}</td>
				<td style="text-align: center;">${var.apply_amount}</td>
			</tr>
			</#list>
			<tr>
				<td style="text-align: center;"></td>
				<td style="text-align: center;"></td>
				<td style="text-align: center;"></td>
				<td style="text-align: center;"></td>
				<td style="text-align: center;"></td>
				<td style="text-align: center;">本年累计</td>
				<td style="text-align: center;">${total.total}</td>
			</tr>
		</table>
		<#--<h2>申请专线补助:${capital.dedicated_subsidy_capital}万元</h2>-->
	</body>

</html>