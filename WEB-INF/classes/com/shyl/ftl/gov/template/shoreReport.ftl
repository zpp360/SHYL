<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>在岸外包收入汇总表</title>
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
				margin-bottom: 5px !important;
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
		</style>

	</head>

	<body id="top">
		<#list contractlist as contract>
		<#if contract_index%14==0 && contract_index !=0 && contract_has_next>
			    </table>
				<span>企业联系人：${py.contact}</span><span style="margin-left:10%">联系电话：${py.contact_tel}</span>
		</#if>
		<#if contract_index%14 ==0 >
		<h2 style="text-align: center;">${lastyear}年度在岸外包收入汇总表</h2>
		<span>申请企业：${py.company_name}</span>
		<table id="appTable" bordercolor="black" cellspacing="1" class="table">
			<tr>
				<td style="width: 7%; text-align: center;">ID</td>
				<td style="width: 15%; text-align: left;">合同登记证书号</td>
				<td style="width: 15%; text-align: left;">合同号</td>
				<td style="width: 17%; text-align: left;">合同名</td>
				<td style="width: 13%; text-align: left;">合同金额（万美元）</td>
				<td style="width: 13%; text-align: left;">实际出口额（万美元）</td>
				<td style="width: 10%; text-align: left;">备注</td>
			</tr>
		</#if>
			<tr>
				<td>${contract_index+1}</td>
				<td>${contract.contract_regist_no}</td>
				<td>${contract.contract_no}</td>
				<td>${contract.contract_name}</td>
				<td>${contract.contract_money}</td>
				<td>${contract.export_money}</td>
				<td><#if contract.remarks??> <#if   contract.remarks?length lt 6>
						${contract.remarks}
					<#else>
						${contract.remarks?substring(0,6)}
					</#if></#if>
				</td>
			</tr>
		<#if !contract_has_next>			
			</table>
			<span>企业联系人：${py.contact}</span><span style="margin-left:10%">联系电话：${py.contact_tel}</span>
		</#if>
		</#list>
	</body>

</html>