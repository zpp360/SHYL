<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>企业技术出口贴息申请表_济南市服务外包人才公共服务平台</title>
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
<#if contract_index==0 && contract_index%10 ==0 >
<h2 style="text-align: center;">${currentYear}年企业技术出口贴息申请表</h2>
<table>
	<tr>
		<td><label>申请企业：${py.company_name}</label></td>
		<td width="80%"></td>
		<td><label>金额单位：万美元</label></td>
	</tr>
</table>
<table bordercolor="black" cellspacing="1" class="table">
    <tr>
        <td style="width: 7%; text-align: center;">序号</td>
        <td style="width: 15%; text-align: center;">合同登记证书号</td>
        <td style="width: 15%; text-align: center;">合同号</td>
        <td style="width: 17%; text-align: center;">合同名称</td>
        <td style="width: 10%; text-align: center;">合同金额</td>
        <td style="width: 15%; text-align: center;">${lastyear}年实际出口额</td>
        <td style="width: 10%; text-align: center;">备注</td>
    </tr>
</#if>
<#if contract_index!=0 && contract_index%10 ==0>
   <div style="page-break-before:always;"></div>
     <tr style="height:50px">
    </tr>
    <tr>
        <td style="width: 7%; text-align: center;">序号</td>
        <td style="width: 15%; text-align: center;">合同登记证书号</td>
        <td style="width: 15%; text-align: center;">合同号</td>
        <td style="width: 17%; text-align: center;">合同名称</td>
        <td style="width: 10%; text-align: center;">合同金额</td>
        <td style="width: 15%; text-align: center;">${lastyear}年实际出口额</td>
        <td style="width: 10%; text-align: center;">备注</td>
    </tr>
</#if>
        <tr>
            <td>${contract_index+1}</td>
			<td>${contract.contract_regist_no}</td>
			<td>${contract.contract_no}</td>
			<td>${contract.contract_name}</td>
			<td>${contract.contract_money}</td>
			<td>${contract.export_money}</td>
			<td>${(contract.remarks)!''}
			</td>
        </tr>
    </#list>
     <#if (contractlist?size%10) == 0>  
         <div style="page-break-before:always;"></div>
              <tr style="height:50px">
    </tr>
        <tr>
        <td style="width: 7%; text-align: center;">序号</td>
        <td style="width: 15%; text-align: center;">合同登记证书号</td>
        <td style="width: 15%; text-align: center;">合同号</td>
        <td style="width: 17%; text-align: center;">合同名称</td>
        <td style="width: 10%; text-align: center;">合同金额</td>
        <td style="width: 15%; text-align: center;">${lastyear}年实际出口额</td>
        <td style="width: 10%; text-align: center;">备注</td>
    </tr>
          <tr>
            <td>合计</td>
			<td></td>
			<td></td>
			<td></td>
			<td>${totalContractMoney.totalContractMoney}</td>
			<td>${totalExportMoney.totalExportMoney}</td>
			<td></td>
         </tr>
     </#if> 
     <#if (contractlist?size%10) lt 6 &&  (contractlist?size%10)!=0>
            <tr>
            <td>合计</td>
			<td></td>
			<td></td>
			<td></td>
			<td>${totalContractMoney.totalContractMoney}</td>
			<td>${totalExportMoney.totalExportMoney}</td>
			<td></td>
        </tr>   
</#if>
<#if (contractlist?size%10) gte 6>
          <tr>
            <td>合计</td>
			<td></td>
			<td></td>
			<td></td>
			<td>${totalContractMoney.totalContractMoney}</td>
			<td>${totalExportMoney.totalExportMoney}</td>
			<td></td>
         </tr>
         <div style="page-break-before:always;"></div>
</#if>
         <tr>
			<td colspan="4">
				<table  border="0" cellspacing="0" cellpadding="0" style="border-collapse: collapse;border-width: 0px;border-style: hidden;width: 100%;" class="table">
					<tr>
						<td style="text-align: left; padding-left: 20px; padding-top: 20px; border: 0px solid #fff;">
							<p>市商务部门意见：</p>
						</td>
					</tr>
					<tr>
						<td style="text-align: right; padding-right: 120px; border: 0px solid #fff;"></td>
					</tr>
					<tr>
						<td style="text-align: right; padding-right: 80px; border: 0px solid #fff;">（盖章）：</td>
					</tr>
					<tr>
						<td style="text-align: right; padding-right: 60px; border: 0px solid #fff;">年&nbsp;&nbsp;&nbsp;&nbsp; 月&nbsp; &nbsp;&nbsp;&nbsp; 日</td>
					</tr>
					<tr>
						<td style="text-align: right; padding-right: 120px; border: 0px solid #fff;"></td>
					</tr>
				</table>
			</td>
			<td colspan="3">
				<table  border="0" cellspacing="0" cellpadding="0" style="border-collapse: collapse;border-width: 0px;border-style: hidden;width: 100%;" class="table">
					<tr>
						<td style="text-align: left; padding-left: 20px; padding-top: 20px; border: 0px solid #fff;">
							<p>市财政部门意见：</p>
						</td>
					</tr>
					<tr>
						<td style="text-align: right; padding-right: 120px; border: 0px solid #fff;"></td>
					</tr>
					<tr>
						<td style="text-align: right; padding-right: 40px; border: 0px solid #fff;">（盖章）：</td>
					</tr>
					<tr>
						<td style="text-align: right; padding-right: 20px; border: 0px solid #fff;">年&nbsp;&nbsp;&nbsp;&nbsp; 月&nbsp; &nbsp;&nbsp;&nbsp; 日</td>
					</tr>
					<tr>
						<td style="text-align: right; padding-right: 120px; border: 0px solid #fff;"></td>
					</tr>
				</table>
			</td>
		</tr>
</table>  
<label>注：业务金额精确到个位数。例：28万美元</label>
</body>
</html>