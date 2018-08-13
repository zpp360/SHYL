<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>济南市服务外包企业申请汇总表</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">
@page{size:297mm 210mm;}
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
	table-layout: fixed;
	word-wrap: break-word;
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
<body id="top">

	<h2 style="text-align: center;">${year}年度济南市服务外包企业申请汇总表</h2>
	<table>
		<tr>
			<td><label>县(市)区：${apply_area!}</label></td>
			<td width="30%"></td>
			<td><label>${update_timestamp!}</label></td>
			<td width="30%"></td>
			<td><label>单位：万元</label></td>
		</tr>
	</table>

	<table id="appTable" border="1" bordercolor="black" cellspacing="1"
		class="table">
		<tr>
			<td rowspan="2">单位名称</td>
			<td rowspan="2">申报期内录用大学生人数</td>
			<td rowspan="2">${previous_Year!}离（在）岸外包执行额（万美元）</td>
			<td rowspan="2">${last_Year}离（在）岸外包执行额（万美元）</td>
			<td rowspan="2">根据“服务外包业务管理与统计系统”，执行额<br></br>及就业应享受的扶持比例（100%或50%）
			</td>
			<td colspan="${applyCapitalList?size}" rowspan="1">按应享受比例申请金额</td>
			<td>小计</td>
			<td>备注</td>
		</tr>
		<tr>
			<#list applyCapitalList as applyCapital>
			<td width="10%">${applyCapital.VALUE}</td> 
			</#list>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td>${company_name!}</td>
			<td>${college_student_num!}</td>
			<td>${previous_year_capital!}</td>
			<td>${last_year_capital!}</td>
			<td>${support_ratio!}</td>
			<#list applyCapitalList as applyCapital>
			<td><#list apply_capital as capitalVal> <#if
				applyCapital.DISTINGUISH_ID==capitalVal.id>${capitalVal.value}</#if>
				</#list></td>
			</#list>
			<td>${subtotal!}</td>
			<td>${remarks!}</td>
		</tr>
	</table>
	<label>注：
		申报所属日期：服务外包执行额扶持项目为2015年1月1日至2015年12月31日，其他项目为2015年7月1日至2016年6月30日。</label>
	<br />
	<table>
		<tr>
			<td>商务部门联系人：</td>
			<td width="12%"></td>
			<td>联系电话：</td>
			<td width="12%"></td>
			<td>财政部门联系人：</td>
			<td width="12%"></td>
			<td>联系电话：</td>
		</tr>
	</table>
</body>

</html>