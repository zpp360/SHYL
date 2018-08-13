<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>技术引进、研发创新技术奖项、境外专利</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <style type="text/css">
   		@page{size: 210mm 290mm;}
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
            height: 41px;
        }
    </style>

</head>

<body id="top">

		<h2 style="text-align: center;">技术引进、研发创新技术奖项、境外专利</h2>
		<table bordercolor="black" cellspacing="1" class="table">
   			 <tr>
							<td style="width: 8%; text-align: center;">年</td>
							<td style="width: 8%; text-align: left;">月</td>
							<td style="width: 8%; text-align: left;">日</td>
							<td style="width: 12%; text-align:left;">类型</td>
							<td style="width: 10%; text-align:left;">凭证号数</td>
							<td style="width: 10%; text-align: left;">摘要</td>
							<td style="width: 10%; text-align: left;">人民币</td>
							<td style="width: 10%; text-align: left;">备注</td>
						</tr>
     				<#list softList as detail>
						<tr>
							<td>
							${detail.apply_date?substring(0,4)}
							</td>
							<td>
							${detail.apply_date?substring(5,7)}
							</td>
							<td>
							${detail.apply_date?substring(8,10)}
							</td>
							<td>
							${detail.soft_type1}
							</td>
							<td>
							${detail.voucher}
							</td>
							<td class="T-tit">
							<#if detail.abstract_info?length lt 7>
								${detail.abstract_info}
							<#else>
								${detail.abstract_info?substring(0,7)}
							</#if>
							</td>
							<td>
							${detail.rmb}
							</td>
							<td>
							<#if detail.remarks?length lt 7>
								${detail.remarks}
							<#else>
								${detail.remarks?substring(0,7)}
							</#if>
							</td>
						</tr>
						 </#list>
						<#if mo??><tr><td colspan="6" style="text-align:center;">软件小计：</td>
							<td>${mo.softrmb!''}元</td><td></td></tr></#if>
						  <#list HardwareList as detail>
						<tr>
							<td>
							${detail.apply_date?substring(0,4)}
							</td>
							<td>
							${detail.apply_date?substring(5,7)}
							</td>
							<td>
							${detail.apply_date?substring(8,10)}
							</td>
							<td>
							${detail.soft_type1}
							</td>
							<td>
							${detail.voucher}
							</td>
							<td class="T-tit">
							<#if detail.abstract_info?length lt 7>
								${detail.abstract_info}
							<#else>
								${detail.abstract_info?substring(0,7)}
							</#if>
							</td>
							<td>
							${detail.rmb}
							</td>
							<td>
							<#if detail.remarks?length lt 7>
								${detail.remarks}
							<#else>
								${detail.remarks?substring(0,7)}
							</#if>
							</td>
						</tr>
						 </#list>
						 <#if hard??><tr><td colspan="6" style="text-align:center;">设备小计：</td>
							<td>${hard.hardrmb!''}元</td><td></td></tr></#if>
					    <tr><td colspan="6" style="text-align:center;">合计：</td>
						<td><#if hard?? && mo??>${hard.hardrmb+mo.softrmb}<#elseif hard??>${hard.hardrmb}<#elseif mo??>${mo.softrmb}<#else></#if>元</td><td></td></tr>
</table>
</body>
</html>