var basePath;
function Clear() {
		$("#declaration_level option:first").prop("selected", 'selected');
		var obj = document.getElementById('declaration_year')
		$('#listForm').find('input[type=checkbox]').bind(
				'click',
				function() {
					$('#listForm').find('input[type=checkbox]').not(this).attr(
							"checked", false);
				});
		document.getElementById("declaration_name").value = "";
	}
	function ClearV() {
		window.location.reload();
	}

	function Delete() {
		location.href = basePath+"gov/logicalDel.act?info_id="
				+ $("#info_id").val();
	}

	function del(id, divid) {
		$("#" + divid).attr("data-target", "#deldec");
		$("#deldec").attr("data-target", "");
		$("#info_id").val(id);
	}

	function downloadFile(info_id) {
		var info_id = encodeURI(encodeURI(info_id));
		$.ajax({
			type : "POST",
			url :  basePath+'gov/downfile.act?info_id=' + info_id,
			dataType : 'json',
			cache : false,
			success : function(data) {
				if (data.responseStr == "OK") {
					$("#listForm").attr(
							"action",
							basePath+"gov/download.act?fileName="
									+ data.responseName + "&filePath="
									+ data.responsePath);
					$("#listForm").submit();
				} else {
					$('#my-modal-down-alert').show().delay(1000).fadeOut();
				}
			}
		});
	}
	// 下载操作指南
	function downloadNotice() {
		fileName="govNotice.pdf";
		filePath="templateFiles/govNotice.pdf";
	    $("#listForm").attr("action",basePath+"gov/downloadTemp.act?fileName="+encodeURI(fileName)+"&filePath="+filePath);
	    $("#listForm").submit();          
	}
	function view(id, info_id) {
		var ret = false;
		$.ajax({
			type : "POST",
			url : basePath+'gov/view.act?info_id=' + info_id,
			dataType : 'json',
			cache : false,
			async : false,
			success : function(data) {
				if (data.responseStr == "OK") {
					var path = data.responsePath;
					$("#" + id).attr('href',basePath+'register/showPdf.act?pdfFile='+path);
					ret = true;
				} else {
					$('#my-modal-view-alert').show().delay(1000).fadeOut();
				}
			}
		});
		return ret;
	}
	function Applycheck() {
		location.href =basePath+"apply/list.act";
	}

	function creatPDF() {
		var license = $("#business_license").val();
		var appro = $("#para").val();
		var str = '';
		for (var i = 0; i < document.getElementsByName('ids').length; i++) {
			if (document.getElementsByName('ids')[i].checked) {
				if (str == '')
					str += document.getElementsByName('ids')[i].value;
				else
					str += ',' + document.getElementsByName('ids')[i].value;
			}
		}
		//企业营业执照check
		if (license == "") {
			$('#my-modal-license-alert').show().delay(
					2000).fadeOut();
			return false;
		}
		if (str == "") {
			$("#ids").tips({
				side : 2,
				msg : "请选择内容",
				bg : '#AE81FF',
				time : 3
			});
			$("#ids").focus();
			return false;
		}
		$.ajax({
			type : "POST",
			url : basePath+'gov/findStatus.act?info_id='+ str+'&appro='+appro,
			dataType : 'json',
			cache : false,
			success : function(data) {
				if (data.responseStr == "5") {
					// 状态为已上报且审批结果为复审通过
					$('#my-modal-createPdf-alert').show().delay(
							1000).fadeOut();
				} else{
					// 通过Ajax向后台传值
					$.ajax({
						type : "POST",
						url : basePath+'govMakePdf/creatpdf.act?info_id=' + str,
						data : {},
						dataType : 'json',
						cache : false,
						beforeSend : function() {
							$('#top').showLoading();
						},
						complete : function() {
							$('#top').hideLoading();
						},
						success : function(data) {
							if (data.response == "success") {
								$('#my-modal-success-alert').show().delay(1000).fadeOut();
							}else if (data.response == "imperfect") {
								$('#my-modal-imperfect-alert').show().delay(1000).fadeOut();
							}else {
								$('#my-modal-failure-alert').show().delay(1000).fadeOut();
							}
						}
					});
				}
			}
		});
		
	}

	function reportStatus() {
		var appro = $("#para").val();
		var str = '';
		var type='';
		$("input[name='ids']:checked").each(function(){
				if (str == '')
					str += $(this).val();
				else
					str += ',' + $(this).val();
				type=$(this).next().val();
		  });
		if(type=='服务外包业务'){
			type='技术出口贴息';
		}else{
			type='服务外包业务';
		}

		if (str == "") {
			$("#ids").tips({
				side : 2,
				msg : "请选择内容",
				bg : '#AE81FF',
				time : 3
			});
			$("#ids").focus();
			return false;
		}
		// 验证
		$.ajax({
			type : "POST",
			url : basePath+'gov/view.act?info_id=' + str,
			dataType : 'json',
			cache : false,
			async : false,
			success : function(data) {
				if (data.responseStr == "OK") {
					// 通过Ajax向后台传值 修改状态
					$
							.ajax({
								type : "POST",
								url : basePath+'gov/findStatus.act?info_id='+ str+'&appro='+appro,
								dataType : 'json',
								cache : false,
								async : false,
								success : function(data) {
									if (data.responseStr == "0") {
										// 未上报
										$("#reportStatus").attr("data-target",
												"#upreport");
									} else if (data.responseStr == "3") {
										// 状态为已上报且审批结果为待初审
										$('#my-modal-report-not-approved-alert').show().delay(
												1000).fadeOut();
									} else if (data.responseStr == "4") {
										// 状态为已上报且审批结果为初审通过
										$('#my-modal-report-final-not-approved-alert').show().delay(
												1000).fadeOut();
									} else if (data.responseStr == "5") {
										// 状态为已上报且审批结果为复审通过
										$('#my-modal-report-alert').show().delay(
												1000).fadeOut();
									} else if (data.responseStr == "6") {
										// 数据不一致提示
										$('#resetInfo').show();
										$("#resetType").text(type);
										$('#reset_info_id').val(str);
									} else{
										// 其他状态
										$("#reportStatus").attr("data-target","#upreport");
									}
								}
							});
				} else {
					$('#my-modal-view-alerts').show().delay(1000).fadeOut();
				}
			}
		});

	}
	function resetInfo(){
		var appro = $("#para").val();
		var str='';
		$("input[name='ids']:checked").each(function(){
			if (str == '')
				str += $(this).val();
			else
				str += ',' + $(this).val();
			type=$(this).next().val();
		});
		$.ajax({
			type : "POST",
			url : basePath+'gov/resetInfo.act',
			data:{info_id:str},
			dataType : 'json',
			cache : false,
			async : false,
			success : function(data) {
				if (data.responseStr == "1") {
					// 成功
					$('#my-modal-reset-success-alert').show().delay(
							1000).fadeOut(function(){window.location.reload();});
				} else {
					// 失败
					$('#my-modal-reset-final-alert').show().delay(
							3000).fadeOut(function(){window.location.reload();});
				}
				
			},error:function(data){
				// 失败
				$('#my-modal-reset-final-alert').show().delay(
						3000).fadeOut(function(){window.location.reload();});
			}
		});
		
	}
	
	function reSta() {
		var appro = $("#para").val();
		var str = '';
		for (var i = 0; i < document.getElementsByName('ids').length; i++) {
			if (document.getElementsByName('ids')[i].checked) {
				if (str == '')
					str += document.getElementsByName('ids')[i].value;
				else
					str += ',' + document.getElementsByName('ids')[i].value;
			}
		}
		
		$.ajax({
			type : "POST",
			url : basePath+'gov/toReport.act?info_id=' + str+'&appro='+appro,
			dataType : 'json',
			cache : false,
			async : false,
			success : function(data) {
				if (data.responseStr == "1") {
					window.location.href=basePath+"gov/list.act";
				} else{
					window.location.href=basePath+"gov/list.act";
				}
			}
		});
	}

	$(document).ready(
			function() {
				// 设置年份的选择
				var myDate = new Date();
				var endYear = myDate.getFullYear() + 5;// 结束年份 */
				//var obj = document.getElementById('declaration_year')
				//obj.options.add(new Option(myDate.getFullYear()));
				$("#declaration_year").append("<option values='"+myDate.getFullYear()+"' selected='true' >"+myDate.getFullYear()+"</option>");
				$('#listForm').find('input[type=checkbox]').bind(
						'click',
						function() {
							$('#listForm').find('input[type=checkbox]').not(this)
									.attr("checked", false);
						});
				basePath=document.getElementsByTagName('base')[0].href;
				changeLevel($("#declaration_level"));
			});
			
	// 确认
	function confirm() {
		if (localcheck()) {
			var level = $("#declaration_level").val();
			var year = $("#declaration_year").val();
			var type = $("#declaration_type").val();
			// 通过Ajax向后台传值
			$.ajax({
				type : "POST",
				url : basePath+'gov/yearCheck.act?level='+level+'&year='+year+'&declaration_type='+type,
				dataType : 'json',
				cache : false,
				success : function(data) {
					if ("success" == data.result) {
						if ($("#declaration_level").val() == "1") {
							$("#docForm")
									.attr('action', basePath+'gov/confirm.act?level=1');
						} else if ($("#declaration_level").val() == "2") {
							$("#docForm")
									.attr('action', basePath+'gov/confirm.act?level=2');
						}

						$("#docForm").submit();
					} else {
						$("input[name='clearData']").trigger("click");
						$('#myApply').modal('hide');
			    		$('#my-modal-report-exist-alert').show().delay(4000).fadeOut();
			    		return;
					}
				}
			});
		}
	}
	function localcheck() {
		if ($("#declaration_level").val() == "") {
			$("#declaration_level").tips({
				side : 2,
				msg : "请输入申报级别",
				bg : '#AE81FF',
				time : 3
			});
			$("#declaration_level").focus();
			return false;
		}
		if ($("#declaration_year").val() == "") {
			$("#declaration_year").tips({
				side : 2,
				msg : "请选择申请年度",
				bg : '#AE81FF',
				time : 3
			});
			$("#declaration_year").focus();
			return false;
		}
		if ($("#declaration_name").val() == "") {
			$("#declaration_name").tips({
				side : 2,
				msg : "请输入申报名称",
				bg : '#AE81FF',
				time : 3
			});
			$("#declaration_name").focus();

			return false;
		}
		return true;
	}
	
	// 点击文本选中本条checkbox --sunlk
	function selectCheckbox(thiss,parmes){
		$("#para").val(parmes);
		if($(thiss).find(".checkbox").find("input").is(":checked")){
			return;
		}else{
			$("input[name=ids]").prop('checked',false);
			$(thiss).find(".checkbox").find("input").prop('checked',true);
		}
	}
	function changeLevel(obj){
		var level=$(obj).children('option:selected').val();
		if(level=='2'){
			$("#declaration_type").parents(".form-group").hide();
		}else{
			$("#declaration_type").parents(".form-group").show();
		}
		
	}
	
	
	
	