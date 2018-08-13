<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>中高端境外人才实训_济南市服务外包人才公共服务平台</title>
<style>
body {
			margin-left: 45px;
			margin-right: 45px;
			font-family: SimSun;
			font-size: 16px;
			}
			.table {
				border: 0px solid;
				border-color: #ddd;
				margin-bottom: 20px !important;
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
				height: 41px;
			}
			</style>
</head>
<body >
	<#list trainingList as var>
	<#if var_index%23==0 && var_index !=0 && var_has_next>
			</tbody>
  		</table>
	</#if>
	<#if var_index%23 ==0 >
	<h2 style="text-align: center;">中高端境外人才实训</h2>
	<table class="table">
		<tr>
			<td style="padding-left: 30px; text-align: center;">实训区间</td>
			<td style="text-align: center;">实训人员</td>
			<td style="text-align: center;">凭证号</td>
			<td style="text-align: center;">人民币(元)</td>
		</tr>
	  </#if>
		<tr>
				<#if (var_index ==0) || ((var_index !=0) && (trainingList[var_index-1].train_id != var.train_id)) >
					<td style="width: 250px; text-align: center;"
						rowspan="${var.counts1}">${var.strart_time}至
												${var.end_time}</td>
						<td style="width: 100px; text-align: center;"
						rowspan="${var.counts1}">${var.evection_people}</td>
				</#if>
				
				
				
				<td style="width: 110px; text-align: center;">
					${var.certificate_number}</td>
				<td style="width: 110px; text-align: center;">${var.money}</td>
			</tr>
			<#if !var_has_next>
				<tr style="padding-left: 50px;">
					<td style="text-align: center;">合计：</td>
					<td></td>
					<td></td>
					<td style="text-align: center;">${var.training_money}元</td>
				</tr>
  		</table>
  		<#--<h2>申请境外实训扶持资金${reward}万元</h2>-->
			</#if>
			</#list>
</body>
</html>
