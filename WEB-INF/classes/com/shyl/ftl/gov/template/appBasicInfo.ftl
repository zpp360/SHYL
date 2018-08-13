<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<title>申请单位基本情况表</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<style type="text/css">
			body {
			margin-left: 45px;
			margin-right: 45px;
			font-family: SimSun;
			font-size: 0.85em;;
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
			.inputtxt2 {
				width: 80% !important;
			}
			.cheackboxError {
				outline: 1px solid red;
			}
			.inputError {
				border: 1px solid #f00 !important;
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

		<h2 style="text-align: center;">申请单位基本情况表 </h2>
		<table id="appTable" class="table">
			<tr>
				<td>单位名称</td>
				<td colspan="5">${company_name}</td>
			</tr>
			<tr>
				<td>单位地址</td>
				<td colspan="3">${company_address}</td>
				<td>邮&nbsp;&nbsp;&nbsp;&nbsp;编</td>
				<td>${zip_code}</td>
			</tr>
			<tr>
				<td>单位代码</td>
				<td colspan="3">${company_code}</td>
				<td>单位性质</td>
				<td>${company_nature}</td>
			</tr>
			<tr>
				<td width="18%">法人代表</td>
				<td width="15%">${company_representative}</td>
				<td width="15%">注册地</td>
				<td width="15%">
				${address_province}
				${address_city} </td>
				<td width="18%">联&nbsp;系&nbsp;人</td>
				<td width="18%">${contact}</td>
			</tr>
			<tr>
				<td>电&nbsp;&nbsp;&nbsp;&nbsp;话</td>
				<td>${contact_tel}</td>
				<td>传&nbsp;&nbsp;真</td>
				<td>${fax}</td>
				<td>E-mail</td>
				<td>${E_mail}</td>
			</tr>
			<tr>
				<td colspan="2">银行账户名称</td>
				<td colspan="2">${bank_name}</td>
				<td >开户银行</td>
				<td >${bank}</td>
			</tr>
			<tr>
				<td colspan="2">开户银行帐号</td>
				<td colspan="2">${bank_account}</td>
				<td >开户行地址</td>
				<td >${bank_address}</td>
			</tr>
			<tr>
				<td colspan="2">大额支付系统行号</td>
				<td colspan="4">${large_number}</td>
			</tr>
			<tr>
				<td colspan="2">申请资金类型</td>
				<td colspan="4">
					<table border="1" cellspacing="0" cellpadding="0" style="border-collapse: collapse; border-width: 0px; border-style: hidden;"  class="table">
						<tbody>
							<#list Moneytypelist as moneyType> 
								<tr>
							        <td style="text-align: left;width:80%;">${moneyType.value}</td>
									<td><#if apply_money_type?index_of(moneyType.distinguish_id)!=-1>√</#if></td> 
							 	</tr>
							 	
					        </#list>
					        
						</tbody>
					</table>
				</td>
				
			</tr>
			<tr>
				<td style="height:30px;" colspan="6">申&nbsp;&nbsp;请&nbsp;&nbsp;报&nbsp;&nbsp;告</td>
			</tr>
			<tr style="height: 80px;">
				<td colspan="6" style="text-align:left;padding-left:10px;font-size: 0.85em;">详见《${fileName}》</td>
			</tr>
			<tr>
				<td colspan="6" >
				<label style="float:left;font-size: 0.85em;">企业（单位）声明：</label>
				<p style="text-align: left;font-size: 0.85em;">&nbsp;&nbsp;&nbsp;&nbsp;本人谨代表申请单位作出声明，完全明白国家促进服务贸易创新发展扶持资金有关规定及本申请书表格内的所有内容。本人确认：本单位所填报的各项申请材料，均真实、有效。
						本人也知道如误报或瞒报材料，以欺诈手段取得专项资金，均属违规行为，将承担相应责任。</p>
				<p align="right" style="margin-top: 30px;font-size: 0.85em;">法定代表人（单位负责人）签字及申请企业（单位）印章</p>
				</td>
			</tr>
		</table>
		<label style="font-size: 0.85em;word-wrap:break-word;">备注：1、银行账户信息必须为公司账户，用于拨付资金，务必正确填写。2、申请报告请按照申报材料相关要求说明申请事项等，可另加附页。</label>
	</body>
</html>