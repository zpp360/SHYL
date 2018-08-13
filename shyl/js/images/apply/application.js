$(function(){
		$('input, textarea').placeholder({customClass:'my-placeholder'});
	});
	//金额
	$.validator.addMethod(
		    "amtCheck",
		    function(value, element){
		    	if(value !=''){
		    		return value && /^(?!0+(?:\.0+)?$)(?:[1-9]\d*|0)(?:\.\d{1,4})?$/.test(value);
		    	}else{
		    		return true;
		    	}
		    },
		    "金额必须大于0且小数位数不超过4位"
		);
	// 手机号码验证
	$.validator.addMethod("isMobile", function(value, element) {
	    var length = value.length;
	    var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;
	    return this.optional(element) || (length == 11 && mobile.test(value));
	}, "请正确填写您的手机号码");
	//百分数验证
	jQuery.validator.addMethod("maxNumber", function(value, element){
		var number = /^(([1-9]\d{0,2})|(0))(\.\d{1,2})?$/;
    	if(value !=''){
    		return value && number.test(value);
    	}else{
    		return true;
    	}
    },
    "请正确填写比例"
    );
	//金额大于0验证
	jQuery.validator.addMethod("checkBalance", function(value,element) {
        var  balance=0;
      return this.optional(element) || value>balance;   
    }, $.validator.format("金额必须大于0"));
	// 电话验证
	$.validator.addMethod("isTel", function(value, element) {
	    var length = value.length;
	    var tel = /^(?:(?:0\d{2,3})-)?(?:\d{7,8})(-(?:\d{3,}))?$/;
	    return  tel.test(value);
	}, "请正确填写电话号码");
	
	var tips=function(id,msg){
		$("#"+id).tips({
			side : 2,
			msg : msg,
			bg : '#AE81FF',
			time : 5
		}).focus();

	}
	var isOneSubmit=true;
	var single=true;
	$('#form1').validate({
        showErrors:function(errorMap,errorList) {
        	$.each(errorList,function (index,dom){
        		var element=dom.element;
        		if(index==0){
					$(".jq_tips_box").hide();
	        			if (element.type=='radio' || element.type=='checkbox') { //如果是radio或checkbox 
	        				var eid =element.name;
	        	           	tips(eid,dom.message);
	                	}else{
	                		var eid =element.id;
	        	           	tips(eid,dom.message);
	                	}
	        			isOneSubmit=true;
	        	}
        	});
        },
        onkeyup:false,
        success: function (label) {
            label.addClass('valid');
        },
        rules: {
        	apply_report_path:{
        		required: true,
           } ,
        	company_name: {
        		required: true
            },
            registered_area:{
            	required: true
            },
            company_address:{
            	required: true
            },
            tax_area: {
            	required: true
            },
            apply_company_type:{
            	required: true
            },
            shareholders1:{
            	required: true
            },
            shareholders1_scale:{
            	required: true,
            	maxNumber:true,
                max:100
            },
            shareholders2_scale:{
            	maxNumber:true,
                max:100
            },
            shareholders3_scale:{
            	maxNumber:true,
                max:100
            },
            project_leader:{
            	required: true
            },
            pleader_work_tel:{
            	required: true,
            	isTel:true
            },
            pleader_per_phone:{
            	required: true,
            	isMobile:true
            },
            finance_leader:{
            	required: true
            },
            fleader_work_tel:{
            	required: true,
            	isTel:true
            },
            fleader_per_phone:{
            	required: true,
            	isMobile:true
            },
            support_ratio:{
            	required: true
            },
            last_year_capital:{
            	required: true,
            	amtCheck:true,
            	maxlength:11,
            	checkBalance:true,
            	max:999999.9999
            },
            this_apply_capital:{
            	required: true,
            	amtCheck:true,
            	maxlength:11,
            	checkBalance:true,
            	max:999999.9999
            },
            contact_person:{
            	required: true,
            },
            contact_office_tel:{
            	required: true,
            	isTel:true
            },
            contact_phone:{
            	required: true,
            	isMobile:true
            },
            contact_mail:{
            	required: true,
            	email:true
            } 
        },
        messages: {
        	company_name: {
        		required: "请输入申请单位名称"
            },
            registered_area:{
            	required: "请输入注册辖区"
            },
            company_address:{
            	required: "请输入单位地址"
            },
            tax_area: {
            	required: "请输入纳税辖区"
            },
            apply_company_type:{
            	required: "申请单位类别选其一"
            },
            shareholders1:{
            	required: "请输入申请单位主要股东及投资比例"
            },
            shareholders1_scale:{
            	required: "请输入申请单位主要股东及投资比例",
            	digits:"必须是整数",
                max:"最大不能超过100"
            },
            shareholders2_scale:{
            	digits:"必须是整数",
                max:"最大不能超过100"
            },
            shareholders3_scale:{
            	digits:"必须是整数",
                max:"最大不能超过100"
            },
            project_leader:{
            	required: "请输入项目负责人"
            },
            pleader_work_tel:{
            	required: "请输入电话",
            	isTel:"请输入正确的电话格式"
            },
            pleader_per_phone:{
            	required: "请输入手机号",
            	isMobile:"请输入正确的手机号格式"
            },
            finance_leader:{
            	required: "请输入财务负责人"
            },
            fleader_work_tel:{
            	required: "请输入电话",
            	isTel:"请输入正确的电话格式"
            },
            fleader_per_phone:{
            	required: "请输入手机号",
            	isMobile:"请输入正确的手机号格式"
            },
            support_ratio:{
            	required: "扶持比例二选其一"
            },
            last_year_capital:{
            	required: "请输入上年度获得市级财政服务外包资金总额（万元）",
            	maxlength:"最大值不能超过999999.9999",
            	max:'最大值不能超过999999.9999'
            },
            this_apply_capital:{
            	required: "请输入本次申请资金总额",
            	maxlength:"最大值不能超过999999.9999",
            	max:'最大值不能超过999999.9999'
            },
            apply_report_path:{
            	required:'请选择文件！'
           }
            ,
            contact_person:{
            	required: "请输入申报联系人"
            },
            contact_office_tel:{
            	required: "请输入办公电话",
            	isTel:"请输入正确的电话格式"
            },
            contact_phone:{
            	required: "请输入手机号",
            	isMobile:"请输入正确的手机号格式"
            },
            contact_mail:{
            	required: "请输入邮箱",
            	email:"请输入正确的邮箱格式"
            }
        }
    });
	
	$( document ).ready(function() {
		cheackradio('support_ratio');
	     $("input[name='support_ratio'").on("change",function(){
	    	cheackradio('support_ratio');
	    
	    })
	});
	
	function cheackradio(objId) {
		if ($("input[name='"+objId+"']:checked").length >= 1) {
			$("[name='"+objId+"']").each(function() {
				if (!$(this).is(":checked")) {
					$(this).attr("disabled", true);
				}
			});
		} else {
			$("input[name='"+objId+"']").each(function() {
				$(this).attr("disabled", false);
			});
		}
	}
	 // 返回
    function GO(url) {
        location.href = '<%=basePath%>'+url+'?&info_id='+$("#info_id").val();
    }
	 
	function OK() {
		if(isOneSubmit){
			isOneSubmit=false;
            single=true;
			$("#form1").submit();
			
		}
	}