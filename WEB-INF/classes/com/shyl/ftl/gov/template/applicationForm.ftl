<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<title>申请承诺书</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<style type="text/css">
			body {
			margin-left: 15px;
			margin-right: 15px;
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

		<h2 style="text-align: center;">济南市开放型经济发展资金项目申请表（服务外包） </h2>
		<label>填表日期：${update_timestamp!}</label>
		<table id="appTable" border="1" bordercolor="black" cellspacing="1" class="table">

			<tr>
				<td width="20%">申请单位名称</td>
				<td width="30%">${company_name!}</td>
				<td width="20%">注册辖区</td>
				<td width="30%">${registered_area!}</td>
			</tr>
			<tr>
				<td width="20%">单位地址</td>
				<td>${company_address!}</td>
				<td>纳税辖区</td>
				<td>${tax_area!}</td>
			</tr>
			<tr>
				<td colspan="4" align="center" style="padding: 0px;">
					<table border="1" cellspacing="0" cellpadding="0" style="border-collapse: collapse; border-width: 0px; border-style: hidden;" class="table">
						<tr>
							<td rowspan="3" width="15%">申请单位类别<br></br>(请勾选√)</td>
							<td width="18%" id="apply_company_type"><span style="font-size: 0.85em;">园区、基地&#12288;<#if apply_company_type?string =="2" >√</#if></span></td>

								<td rowspan="3" width="15%"><label class="control-label"> 申请单位主要<br></br>股东及投资比例</label></td>
								<td width="40%"  style="text-align: left;"><span >1.${shareholders1!}
													</span></td>
								<td><span><#if  shareholders1_scale??>${shareholders1_scale}%</#if></span></td>
						
						</tr>
						<tr>
							<td><span style="font-size: 0.85em;">企业&#12288;<#if apply_company_type?string =="1">√</#if>
													</span></td>
							<td  style="text-align: left;"><span>2.${shareholders2!}</span></td>
							<td><span><#if shareholders2_scale??>${shareholders2_scale}%</#if></span></td>
						</tr>
						<tr>
							<td><span style="font-size: 0.85em;">其他&#12288;<#if apply_company_type?string =="3">√</#if>
													</span></td>
							<td style="text-align: left;"><span >3.${shareholders3!}</span></td>
							<td><span><#if  shareholders3_scale??>${shareholders3_scale}%</#if></span></td>
						</tr>
					</table>
					</td>
			</tr>
			<tr>
				<td colspan="4" align="center" style="padding: 0px;">
					<table border="1" cellspacing="0" cellpadding="0" style="border-collapse: collapse; border-width: 0px; border-height: 0px; border-style: hidden;" class="table">
						<tr>
							<td rowspan="2" width="20%"><label class="control-label">项目负责人</label></td>
							<td rowspan="2" width="15%">${project_leader!}</td>
							<td><label class="control-label">单位电话</label></td>
							<td>${pleader_work_tel!}</td>
						</tr>
						<tr>
							<td><label class="control-label">个人手机</label></td>
							<td>${pleader_per_phone!}</td>
						</tr>
						<tr>
							<td rowspan="2"><label class="control-label">财务负责人</label></td>
							<td rowspan="2">${finance_leader!}</td>
							<td><label class="control-label">单位电话</label></td>
							<td>${fleader_work_tel!}</td>
						</tr>
						<tr>
							<td><label class="control-label">个人手机</label></td>

							<td>${fleader_per_phone!}</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="4" align="center" style="padding: 0px;">
					<table border="1" cellspacing="0" cellpadding="0" style="border-collapse: collapse; border-width: 0px; border-style: hidden;" class="table">
						<tr>
							<td colspan="3" style="text-align: left;"><label class="control-label">根据“服务外包业务管理与统计系统”服务外包执行额和就业应享受的扶持比例（勾选√）</label></td>
							<td><span style="font-size: 0.85em;">100%<#if support_ratio?string=="100">√</#if>
													</span></td>
							<td id="support_ratio"><span style="font-size: 0.85em;">50%<#if support_ratio?string=="50">√</#if>
													</span></td>
						</tr>
						<tr>
							<td width="20%"><label class="control-label">上年度获得市级财政<br></br>服务外包资金总额<br></br>（万元）</label></td>
							<td width="15%">${last_year_capital!}</td>
							<td width="20%"><label class="control-label">本次申请资金总额<br></br>(万元)</label></td>
							<td colspan="2">${this_apply_capital!}</td>
						</tr>
						<tr>
							<td><label class="control-label">申请报告</label></td>
							<td colspan="4" style="text-align: left;">
								详见《申请报告》
							</td>

						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="4" align="center" style="padding: 0px;">
					<table  border="0" cellspacing="0" cellpadding="0" style="border-collapse: collapse;border-width: 0px;border-style: hidden;width: 100%;" class="table">
						<tr>
							<td style="text-align: left; padding-left: 20px; padding-top: 20px; border: 0px solid #fff;">
								<p>本人郑重声明：</p>
								<p>1.提供的申请项目属实</p>
								<p>2.提供的所有复印件已与材料原件核对，均完全一致</p>
								<p>3.如有虚假，人本承担相应法律责任</p>
							</td>
						</tr>
						<tr>
							<td style="text-align: right; padding-right: 250px; border: 0px solid #fff;">法人签字：</td>
						</tr>
						<tr>
							<td style="text-align: right; padding-right: 120px; border: 0px solid #fff;">申请单位（盖章）：</td>
						</tr>
						<tr>
							<td style="text-align: right; padding-right: 100px; border: 0px solid #fff;">年&nbsp;&nbsp;&nbsp;&nbsp; 月&nbsp; &nbsp;&nbsp;&nbsp; 日</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<table>
		<tr>
			<td>申报联系人:</td>
			<td>${contact_person}</td>
			<td>办公电话:</td>
			<td>${contact_office_tel}</td>
		</tr>
		<tr>
			<td>手机:</td>
			<td>${contact_phone}</td>
			<td>邮箱:</td>
			<td>${contact_mail}</td>
		</tr>
		</table>
	
	</body>
</html>