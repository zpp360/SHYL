<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>企业交流费用汇总表_济南市服务外包人才公共服务平台</title>
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
    </style>

</head>

<body id="top">

<#list listDetaiLists as detaillistPd>
<h2 style="text-align: center;">${detaillistPd.meeting_name}费用汇总表</h2>
<table bordercolor="black" cellspacing="1" class="table">
    <tr>
        <td style="width: 7%; text-align: center;">ID</td>
        <td style="width: 15%; text-align: center;">日期</td>
        <td style="width: 15%; text-align: center;">凭证号</td>
        <td style="width: 17%; text-align: center;">出差人员</td>
        <td style="width: 10%; text-align: center;">金额</td>
        <td style="width: 10%; text-align: center;">备注</td>
    </tr>
    <#list detaillistPd.detailList as detail>
        <tr>
            <td>${detail_index+1}</td>
                <td>${detail.doc_date!""}</td>
                <td>${detail.doc_num!""}</td>
                <td>${detail.business_traveler!""}</td>
                <td>${detail.money!""}</td>
                <td>${detail.remark!""}</td>
        </tr>
        </#list>
        <tr>
            <td>合计</td>
                <td></td>
                <td></td>
                <td></td>
                <td>${detaillistPd.totalMoney!}</td>
                <td></td>
        </tr>
</table>
<#-- <h4 style="font-size: 20px; margin-top: 20px; margin-left: 12px">
<h5 style="margin-top: 20px; margin-left: 12px">
    申请扶持资金：${detaillistPd.total_money!}万元
</h5>-->
</#list>
<#-- <h4 style="font-size: 20px; margin-top: 20px; margin-left: 12px">
    申请扶持资金合计：${fcTotalMoney!}万元
</h4>-->
</body>
</html>