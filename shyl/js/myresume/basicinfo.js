var locat;
$(function() {
	locat=document.getElementsByTagName('base')[0].href;
				//单选框
				$(".chzn-select").chosen(); 
				$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
				
				//日期框
				$('.date-picker').datepicker();
				$('#Email').keyup(
						function() {
							var c = $(this);
							if (/[^a-zA-Z0-9! @ # $ % ?_]/.test(c.val())) {//替换其他字符
								var temp_amount = c.val().replace(
										/[^a-zA-Z0-9! @ # $ % . ?_]/g, '');
								$(this).val(temp_amount);
							}
						});
				//院校自动输入
			    $("#school").autocomplete({
			        source: function( request, response ) {
			            $.ajax({
			                url: locat+'/myresume/getschool.act', // 后台请求路径
			                dataType: "json",
			                data:{
			                    "inputStr": request.term    // 获取输入框内容
			                },
			                type:"POST",
			                contentType:"application/x-www-form-urlencoded; charset=utf-8",
			                success: function( data ) {
			                    response($.map(data, function(item) {
			                        return {
			                             // 设置item信息
			                             label: item.name, // 下拉项显示内容
			                             value: item.name,  // 下拉项对应数值
			                             schoolId: item.id
			                        }
			                    }));
			                }
			            });
			        },
			        minLength: 1,  // 输入框字符个等于2时开始查询
			        select: function( event, ui ) { // 选中某项时执行的操作
			        	// 存放选中选项的信息
			        	$("#school").val(ui.item.label);
			        	$("#school_id").val(ui.item.schoolId);
			          }
			    });
			});
			
			function saveinfo() {
					//姓名
					var Name=$.trim($("#Name").val());
					if ($.trim(Name) == "") {
						$("#Name").tips({
							side : 2,
							msg : '请输入姓名',
							bg : '#AE81FF',
							time : 3
						});
						$("#Name").focus();
						$("#Name").val("");
						return false;
					}
					
					//性别
					var Sex=$("input:radio[name='Sex']:checked").val();
					var sex=typeof($('input:radio[name="Sex"]:checked').val())
					if (sex == "undefined") {
						$("#sexli").tips({
							side : 2,
							msg : '请输入性别',
							bg : '#AE81FF',
							time :2,
							y:10,
						});
						$("#sexli").focus();
						return false;
					}
					//出生日期
					var BeginDate=$("#BeginDate").val();
					if (BeginDate == "") {
						$("#BeginDate").tips({
							side : 2,
							msg : '请输入出生日期',
							bg : '#AE81FF',
							time : 3
						});
						$("#BeginDate").focus();
						return false;
					}
					//参加工作日期
					var BeginjobDate = $("#BeginjobDate").val();
					if(BeginDate.length>0&&BeginjobDate.length>0){
			    		if(BeginDate>BeginjobDate)
			    		{
			    		$("#BeginjobDate").tips({
			    			side : 3,
			    			msg : '参加工作日期不能小于出生日期！',
			    			bg : '#AE81FF',
			    			time : 2
			    		});
			    		$("#BeginjobDate").focus();
			    		return false;		
			    		}
			    	}
					//毕业年度
					var graduation_date=$("#graduation_date").val();
					/*if (graduation_date == "") {
						$("#graduation_date").tips({
							side : 2,
							msg : '请输入毕业时间',
							bg : '#AE81FF',
							time : 3
						});
						$("#graduation_date").focus();
						return false;
					}*/
					//婚姻状态
					var Marriage = $("#Marriage").val();
					if(Marriage==""){
						$("#Marriage").tips({
							side:2,
							msg:'请输入婚姻状况',
							bg:'#AE81FF',
							time:3
						});
						$("#Marriage").focus();
						return false;
					}
					//国家地区
					var Country = $("#Country").val();
					if(Country==""){
						$("#Country").tips({
							side:2,
							msg:'请输入国家和地区',
							bg:'#AE81FF',
							time:3
						});
						$("#Country").focus();
						return false;
					}
					//证件类型
					var IdCodeType = $("#IdCodeType").val();
					if(IdCodeType==""){
						$("#IdCodeType").tips({
							side:2,
							msg:'请输入证件类型',
							bg:'#AE81FF',
							time:3
						});
						$("#IdCodeType").focus();
						return false;
					}
					if(IdCodeType=="2"){
						var IdCode = $("#IdCode").val();
						var codeid=IdCode.replace(/(^\s*)|(\s*$)/g, "");
						var reg=/南字第(\d{8})号|北字第(\d{8})号|沈字第(\d{8})号|兰字第(\d{8})号|成字第(\d{8})号|济字第(\d{8})号|广字第(\d{8})号|海字第(\d{8})号|空字第(\d{8})号|参字第(\d{8})号|政字第(\d{8})号|后字第(\d{8})号|装字第(\d{8})号/;
						if (codeid == "") {
							$("#IdCode").tips({
								side : 2,
								msg : '请输入军官证',
								bg : '#AE81FF',
								time : 3
							});
							$("#IdCode").focus();
							return false;
						} else if (!(reg.test(codeid))) {
							$("#IdCode").tips({
								side : 2,
								msg : '请输入正确的军官证格式',
								bg : '#AE81FF',
								time : 3
							});
							$("#IdCode").focus();
							return false;
						} 
					}else if(IdCodeType=="1"){
						 var IdCode = $("#IdCode").val();
							if (IdCode == "") {
								$("#IdCode").tips({
									side : 2,
									msg : '请输入身份证',
									bg : '#AE81FF',
									time : 3
								});
								$("#IdCode").focus();
								return false;
								}
								else if (!isIdCardNo(IdCode)) {
								$("#IdCode").tips({
									side : 2,
									msg : "请输入合法的身份证号",
									bg : '#AE81FF',
									time : 2
								});
								$("#IdCode").focus();
								return false;
							}
					}else{
						var IdCode = $("#IdCode").val();
						var reg=/^1[45][0-9]{7}|([P|p|S|s]\d{7})|([S|s|G|g]\d{8})|([Gg|Tt|Ss|Ll|Qq|Dd|Aa|Ff]\d{8})|([H|h|M|m]\d{8，10})$/;
						if (IdCode == "") {
							$("#IdCode").tips({
								side : 2,
								msg : '请输入护照',
								bg : '#AE81FF',
								time : 3
							});
							$("#IdCode").focus();
							return false;
						} else if (!(reg.test(IdCode))) {
							$("#IdCode").tips({
								side : 2,
								msg : '请输入正确的护照格式',
								bg : '#AE81FF',
								time : 3
							});
							$("#IdCode").focus();
							return false;
						} 
					}
					
					//海外工作经历
					var HasOverseas=$("input:radio[name='HasOverseas11']:checked").val();
					//政治面貌
					var Political = $("#Political").val();
					//学历
					var EduBackground = $("#EduBackground").val();
					if (EduBackground == "") {
						$("#EduBackground").tips({
							side : 2,
							msg : '请输入学历',
							bg : '#AE81FF',
							time : 3
						});
						$("#EduBackground").focus();
						return false;
					}
					//毕业院校
					var GRADUATE_SCHOOL=$("#school").val();
//					if (GRADUATE_SCHOOL == "") {
//						$("#school").tips({
//							side : 2,
//							msg : '请输入毕业院校',
//							bg : '#AE81FF',
//							time : 3
//						});
//						$("#school").focus();
//						return false;
//					}
					//后口所在地
					var AccountAddress = $("#AccountAddress").val();
					//居住地
					var LivingAddress = $("#LivingAddress").val();
					//联系方式
					var Telephone=$("#Telephone").val();
					var Filter =/(^(0[0-9]{2,3}\-)?([2-9][0-9]{6,7})+(\-[0-9]{1,4})?$)|(^((\(\d{3}\))|(\d{3}\-))?(1[358]\d{9})$)/;
					if (Telephone == "") {
						$("#Telephone").tips({
							side : 2,
							msg : '请输入电话',
							bg : '#AE81FF',
							time : 3
						});
						$("#Telephone").focus();
						return false;
					} else if (!(Filter.test(Telephone))) {
						$("#Telephone").tips({
							side : 2,
							msg : '请输入正确的联系电话格式',
							bg : '#AE81FF',
							time : 3
						});
						$("#Telephone").focus();
						return false;
					}
					//邮箱
					var Email = $("#Email").val();
					var EmailFilter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
					if (Email == "") {
						$("#Email").tips({
							side : 2,
							msg : '请输入邮箱',
							bg : '#AE81FF',
							time : 3
						});
						$("#Email").focus();
						return false;
					} else if (!(EmailFilter.test(Email))) {
						$("#Email").tips({
							side : 2,
							msg : '请输入正确的邮箱格式'+locat+'/myresume/savebasicinfo.act',
							bg : '#AE81FF',
							time : 3
						});
						$("#Email").focus();
						return false;
					}
					$.ajax({
						type : "POST",
						url :  locat+'/myresume/savebasicinfo.act',
						data : {
							Name : Name,
							Sex : Sex,
							BeginDate :BeginDate ,
							BeginjobDate : BeginjobDate,
							Marriage : Marriage,
							Country : Country,
							IdCodeType : IdCodeType,
							IdCode : IdCode,
							HasOverseas : HasOverseas,
							Political : Political,
							EduBackground : EduBackground,
							AccountAddress : AccountAddress,
							LivingAddress:LivingAddress,
							Telephone:Telephone,
							Email:Email,
							GRADUATE_SCHOOL:GRADUATE_SCHOOL,
							graduation_date:graduation_date,
							tm : new Date().getTime()
						},
						dataType : 'json',
						cache : false,
						success : function(data) {
							//$("input[name='HasOverseas11']").removeAttr('checked');
							if ("success" == data.result) {
								$('#success').show ()
								setTimeout("openmy()",1000);
							}else if("telErr" == data.result){
								$("#Telephone").tips({
									side : 2,
									msg : '该联系方式已经存在',
									bg : '#AE81FF',
									time : 3
								});
								$("#Telephone").focus();
								return false;
							}else if("emailErr" == data.result){
								$("#Email").tips({
									side : 2,
									msg : '该邮箱已经存在',
									bg : '#AE81FF',
									time : 3
								});
								$("#Email").focus();
								return false;
							}else{
								$('#srror').show ()
								setTimeout("errorshow()",1000);
							}
						}
					});
					}
			function openmy(){
				$('#success').hide();
				window.location.href=locat+'/myresume/basicinfo.act';

			}
			function errorshow(){
				$('#error').hide();
				$('#savepro').modal('hide');
			}
			function checkDate(date) 
			{ 
				var idvalue = date;
			    var tmpStr = "";  
			    var strReturn = "";  
				
			    if (idvalue.length == 8) {  
			    	        tmpStr = idvalue.substring(0, 8);  
			    	        tmpStr = tmpStr.substring(0, 4) + "-" + tmpStr.substring(4, 6) + "-" + tmpStr.substring(6, 8)  
			    }
			    
			    var v = tmpStr.match(/((^((1[8-9]\d{2})|([2-9]\d{3}))(-)(10|12|0?[13578])(-)(3[01]|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))(-)(11|0?[469])(-)(30|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))(-)(0?2)(-)(2[0-8]|1[0-9]|0?[1-9])$)|(^([2468][048]00)(-)(0?2)(-)(29)$)|(^([3579][26]00)(-)(0?2)(-)(29)$)|(^([1][89][0][48])(-)(0?2)(-)(29)$)|(^([2-9][0-9][0][48])(-)(0?2)(-)(29)$)|(^([1][89][2468][048])(-)(0?2)(-)(29)$)|(^([2-9][0-9][2468][048])(-)(0?2)(-)(29)$)|(^([1][89][13579][26])(-)(0?2)(-)(29)$)|(^([2-9][0-9][13579][26])(-)(0?2)(-)(29)$))/);
			    
			    if(v == null){
			    	return false;
			    }else{
			    	return true;
			    }
			} 
			function isIdCardNo(num) {
				var factorArr = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4,
						2, 1);
				var error;
				var varArray = new Array();
				var intValue;
				var lngProduct = 0;
				var intCheckDigit;
				var intStrLen = num.length;
				var idNumber = num;
				// initialize
				if ((intStrLen != 15) && (intStrLen != 18)) {
					// error = "输入身份证号码长度不对！";
					// alert(error);
					// frmAddUser.txtIDCard.focus();
					return false;
				}
				// check and set value
				for (i = 0; i < intStrLen; i++) {
					varArray[i] = idNumber.charAt(i);
					if ((varArray[i] < '0' || varArray[i] > '9') && (i != 17)) {
						// error = "错误的身份证号码！.";
						// alert(error);
						// frmAddUser.txtIDCard.focus();
						return false;
					} else if (i < 17) {
						varArray[i] = varArray[i] * factorArr[i];
					}
				}
				if (intStrLen == 18) {
					// check date
					var date8 = idNumber.substring(6, 14);
					if (checkDate(date8) == false) {
						// error = "身份证中日期信息不正确！.";
						// alert(error);
						return false;
					}
					// calculate the sum of the products
					for (i = 0; i < 17; i++) {
						lngProduct = lngProduct + varArray[i];
					}
					// calculate the check digit
					intCheckDigit = 12 - lngProduct % 11;
					switch (intCheckDigit) {
					case 10:
						intCheckDigit = 'X';
						break;
					case 11:
						intCheckDigit = 0;
						break;
					case 12:
						intCheckDigit = 1;
						break;
					}
					// check last digit
					if (varArray[17].toUpperCase() != intCheckDigit) {
						// error = "身份证效验位错误!...正确为： " + intCheckDigit + ".";
						// alert(error);
						return false;
					}
				} else { // length is 15
					var date6 = idNumber.substring(6, 12);
					if (checkDate(date6) == false) {
						// alert("身份证日期信息有误！.");
						return false;
					}
				}
				return true;
			} 
			