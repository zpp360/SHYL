var locat;
$("#School").autocomplete({
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
					        	$("#School").val(ui.item.label);
					        	$("#school_id").val(ui.item.schoolId);
					          }
					    });
				function show(){
					var CV_ID=$("#CVID").val();
					window.location.href=locat+'/myresume/show.act?CV_ID='+CV_ID;
				}
				$("#EduButtonedu").click(function(){
					var CV_ID=$("#CVID").val();
					var school=$("#School").val();
					var start=$("#START_TIME_EDU").val();
					var end=$("#END_TIME_EDU").val();
					var end1=end.substring(0,7);
					var Major=$("#Major").val();
					var EduBackground=$("#EduBackground").val();
					var HasOverseas=$("input:radio[name='HasOverseas11']:checked").val();
					if(educheck()){
					$.ajax({
						type : "POST",
						url :  locat+'/edu/edusave.act?time='+new Date().getTime(),
						data : {
							CV_ID:CV_ID,
							school_name: school,
							start_time:start,
							end_time:end,
							specialty:Major,
							education:EduBackground,
							overseas_study:HasOverseas,
							tm : new Date().getTime()
						},
						dataType : 'json',
						cache : false,
						success : function(data) {
							showinfo();
							$('#sEdu').modal('hide');
							$("input[name='editedu']").trigger("click");
							//location.reload();
						}
					});
					}
				function educheck(){
					var school=$("#School").val();
					if (school == "") {
						$("#School").tips({
							side : 2,
							msg : '请输入学校名称',
							bg : '#AE81FF',
							time : 3
						});
						$("#School").focus();
						return false;
					}
					var start=$("#START_TIME_EDU").val();
					if (start == "") {
						$("#START_TIME_EDU").tips({
							side : 2,
							msg : '请输入开始时间',
							bg : '#AE81FF',
							time : 3
						});
						$("#START_TIME_EDU").focus();
						return false;
					}
					var end=$("#END_TIME_EDU").val();
					if (end == "") {
						$("#END_TIME_EDU").tips({
							side : 2,
							msg : '请输入结束时间',
							bg : '#AE81FF',
							time : 3
						});
						$("#END_TIME_EDU").focus();
						return false;
					}
					//开始时间和结束时间比较
			    	if(start.length>0&&end.length>0){
			    		if(start>end)
			    		{
			    		$("#END_TIME_EDU").tips({
			    			side : 3,
			    			msg : '结束时间不能小于开始时间！',
			    			bg : '#AE81FF',
			    			time : 2
			    		});
			    		$("#END_TIME_EDU").focus();
			    		return false;	
			    		}
			    	}
					var Major=$("#Major").val();
					if (Major == "") {
						$("#Major").tips({
							side : 2,
							msg : '请输入专业',
							bg : '#AE81FF',
							time : 3
						});
						$("#Major").focus();
						return false;
					}
					var EduBackground=$("#EduBackground").val();
					if (EduBackground== "") {
						$("#EduBackground").tips({
							side : 2,
							msg : '请选择学历',
							bg : '#AE81FF',
							time : 3
						});
						$("#EduBackground").focus();
						return false;
					}
					return true;
				}
				})
					
					function showinfo(){
					var CV_ID=$("#CVID").val();
					$.ajax({
						type : "POST",
						url :  locat+'/edu/showinfo.act',
						data : {
							CV_ID:CV_ID,
							tm : new Date().getTime()
						},
						dataType : 'json',
						cache : false,
						success : function(data) {
							console.log(data);
						var html='';
						var List=data.eduList;
						for(var i=0;i<List.length;i++){
							var start1=List[i].start_time.substring(0,7);
							var end1=List[i].end_time.substring(0,7);
							html+='<div style=" padding-bottom: 3ex;">',
							html+='<li style="width:850px;margin-left:8px;margin-bottom:-30px">'+start1+'～'+end1+':'+'学校:'+List[i].school_name+'/'+'专业:'+List[i].specialty+'/'+'学历:'+List[i].education+'/'+'海外学习经历:'+List[i].overseas_study1+'</div>',
							html+='<span style="float:right;margin-top：30px;">',
							html+='<a href="#" class="modify" data-toggle="modal" data-target="#eEdu" onclick="eduUpdate('+List[i].info_id+')">'+'修改'+'</a>',
							html+='<a href="#" class="delete" data-toggle="modal" data-target="#deledu" onclick="eduDelete('+List[i].info_id+')">'+'删除'+'</a>',
							html+='</span>',
							html+='</li>',
							html+='</div>',
							html+='<hr style="border-style: dashed;">'
							
						}
						var lanlist=data.lanlist;
						console.log(lanlist);
						var lanhtml='';
						for(var i=0;i<lanlist.length;i++){
							lanhtml+='<li style="line-height:56px;padding-left:15px">',
							lanhtml+='<span>'+'语言:'+lanlist[i].languages+'/'+'听力能力:'+lanlist[i].listen_say_skill+'/'+'读写能力:'+lanlist[i].read_write_skill+'</span>',
							lanhtml+='<span style="float:right;position:absolute;right:18px">',
							lanhtml+='<a href="#" class="modify" data-toggle="modal" data-target="#LansEdit" onclick="lanUpdate('+lanlist[i].info_id+')">'+'修改'+'</a>',
							lanhtml+='<a href="#" class="delete" data-toggle="modal" data-target="#dellan" onclick="lanDelete('+lanlist[i].info_id+')">'+'删除'+'</a>',
							lanhtml+='</span>',
							lanhtml+='</li>',
							lanhtml+='<hr style="border-style: dashed;">'
						}
						var worklist=data.worklist;
						var workhtml='';
						for(var i=0;i<worklist.length;i++){
							var end1 = '至今';
							if(worklist[i].end_time!=null){
								end1 = worklist[i].end_time.substring(0,7);
							}
							workhtml+='<li style="line-height:30px;float;right;padding-left:15px">',
							workhtml+='<span>'+'企业名称:'+'</span>'+'<div style="width:700px;margin-left:90px;margin-top:-30px;margin-bottom:-30px">'+worklist[i].enterprise_name+'</div>',
							workhtml+='<span style="float:right;position:relative;margin-top:27px">',
							workhtml+='<a href="#" class="modify" data-toggle="modal" data-target="#WorkEdit" onclick="workrefresh('+worklist[i].info_id+')">'+'修改'+'</a>',
							workhtml+='<a href="#" class="delete" data-toggle="modal" data-target="#delwork" onclick="workDelete('+worklist[i].info_id+')">'+'删除'+'</a>',
							workhtml+='</span>',
							workhtml+='<br>'
							workhtml+='<span>'+'<span style="text-align:right;display:block;width:8%;float:left;">'+'企业性质:'+'</span>'+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+worklist[i].enterprise_nature+'</span>',
							workhtml+='<br>'
							workhtml+='<span>'+'<span style="text-align:right;display:block;width:8%;float:left;">'+'行业类别:'+'</span>'+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+worklist[i].industry_type+'</span>',
							workhtml+='<br>'
							workhtml+='<span>'+'<span style="text-align:right;display:block;width:8%;float:left;">'+'部门:'+'</span>'+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+worklist[i].department+'</span>',
							workhtml+='<br>'
							workhtml+='<span>'+'<span style="text-align:right;display:block;width:8%;float:left;">'+'时间:'+'</span>'+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+worklist[i].start_time.substring(0,7)+'～'+end1+'</span>',
							workhtml+='<br>'
							workhtml+='<span>'+'<span style="text-align:right;display:block;width:8%;float:left;">'+'职位:'+'</span>'+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+worklist[i].positions+'</span>',
							workhtml+='<br>'
							workhtml+='<span>'+'<span style="text-align:right;display:block;width:8%;float:left;">'+'下属人数:'+'</span>'+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+worklist[i].subordinates+'</span>',
							workhtml+='<br>'
							workhtml+='<span style="text-align:right;display:block;width:8%;float:left;">'+'工作描述:'+'</span>'+'<div style="width:700px;margin-left:90px;">'+worklist[i].job_description+'</div>',
							workhtml+='</li>',
							workhtml+='<hr style="border-style: dashed;">'
						}
						var prolist=data.prolist;
						var prohtml='';
						for(var i=0;i<prolist.length;i++){
							prohtml+='<li style="line-height:30px;float;right;padding-left:15px">',
							prohtml+='<span>'+'项目名称:'+'</span>'+'<div style="width:700px;margin-left:90px;margin-top:-30px;margin-bottom:-30px">'+prolist[i].project_name+'</div>',
							prohtml+='<span style="float:right;position:relative;margin-top:27px">',
							prohtml+='<a href="#" class="modify" data-toggle="modal" data-target="#Programedit" onclick="prorefresh('+prolist[i].info_id+')">'+'修改'+'</a>',
							prohtml+='<a href="#" class="delete" data-toggle="modal" data-target="#delpro" onclick="deletepro('+prolist[i].info_id+')">'+'删除'+'</a>',
							prohtml+='</span>',
							prohtml+='<br>'
							prohtml+='<span>'+'<span style="padding-left:33px">'+'时间:'+'</span>'+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+prolist[i].start_time.substring(0,7)+'～'+prolist[i].end_time.substring(0,7)+'</span>',
							prohtml+='<br>'
							prohtml+='<span>'+'开发工具:'+'</span>'+'<div style="width:700px;margin-left:90px;margin-top:-30px;margin-bottom:-30px">'+prolist[i].development_tool+'</div>',
							prohtml+='<br>'
							prohtml+='<span>'+'涉及技术:'+'</span>'+'<div style="width:700px;margin-left:90px;margin-top:-30px;margin-bottom:-30px">'+prolist[i].technology+'</div>',
							prohtml+='<br>'
							prohtml+='<span>'+'项目描述:'+'</span>'+'<div style="width:700px;margin-left:90px;margin-top:-30px;margin-bottom:-30px">'+prolist[i].project_description+'</div>',
							prohtml+='<br>'
							prohtml+='<div>'+'职位描述:'+'</div>'+'<div style="width:700px;margin-left:90px;margin-top:-30px;">'+prolist[i].job_description+'</div>',
							prohtml+='</li>',
							prohtml+='<hr style="border-style: dashed;">'
						}
						var tralist=data.tralist;
						var trahtml='';
						for(var i=0;i<tralist.length;i++){
							trahtml+='<li style="line-height:30px;float;right">',
							trahtml+='<span style="padding-left:15px">'+'培训机构:'+'</span>'+'<div style="width:700px;margin-left:107px;margin-top:-30px;margin-bottom:-30px">'+tralist[i].training_institutions+'</div>',
							trahtml+='<span style="float:right;position:relative;margin-top:25px">',
							trahtml+='<a href="#" class="modify" data-toggle="modal" data-target="#traedit" onclick="trarefresh('+tralist[i].info_id+')">'+'修改'+'</a>',
							trahtml+='<a href="#" class="delete" data-toggle="modal" data-target="#deltra" onclick="deletetra('+tralist[i].info_id+')">'+'删除'+'</a>',
							trahtml+='</span>',
							trahtml+='<br>'
							trahtml+='<span>'+'<span style="padding-left:45px">'+'时间:'+'</span>'+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+tralist[i].start_time.substring(0,7)+'～'+tralist[i].end_time.substring(0,7)+'</span>',
							trahtml+='<br>'
							trahtml+='<span style="padding-left:45px">'+'证书:'+'</span>'+'<div style="width:700px;margin-left:107px;margin-top:-30px;margin-bottom:-30px">'+tralist[i].certificate+'</div>',
							trahtml+='<br>'
							trahtml+='<div style="padding-left:15px">'+'培训课程:'+'</div>'+'<div style="width:700px;margin-left:107px;margin-top:-30px;">'+tralist[i].course+'</div>',
							trahtml+='</li>',
							trahtml+='<hr style="border-style: dashed;">'
						}
						var itList=data.itlist;
						var ithtml='';
						for(var i=0;i<itList.length;i++){
							ithtml+='<div style=" padding-bottom: 3ex;">',
							ithtml+='<li style="line-height:30px;">',
							ithtml+='<div style="width:850px;margin-left:15px;margin-bottom:-30px">'+'名称:'+itList[i].skill_name+'/'+'使用时间:'+itList[i].use_month+'/'+'掌握程度:'+itList[i].skill_level+'</div>',
							ithtml+='<span style="float:right;position:absolute;right:18px">',
							ithtml+='<a href="#" class="modify" data-toggle="modal" data-target="#Itedit" onclick="itrefresh('+itList[i].info_id+')">'+'修改'+'</a>',
							ithtml+='<a href="#" class="delete" data-toggle="modal" data-target="#delit" onclick="itDelete('+itList[i].info_id+')">'+'删除'+'</a>',
							ithtml+='</span>',
							ithtml+='</li>',
							ithtml+='</div>',
							ithtml+='<hr style="border-style: dashed;">'
							
						}
						var honList=data.honlist;
						var honhtml='';
						for(var i=0;i<honList.length;i++){
							honhtml+='<li style="line-height:30px;">',
							honhtml+='<div style="width:850px;margin-left:15px;margin-bottom:-30px">'+'证书名称:'+honList[i].certificate_name+'/'+'证书获得时间:'+honList[i].get_time.substring(0,7)+'</div>',
							honhtml+='<span style="float:right;position:absolute;right:18px;">',
							honhtml+='<a href="#" class="modify" data-toggle="modal" data-target="#honedit" onclick="honrefresh('+honList[i].info_id+')">'+'修改'+'</a>',
							honhtml+='<a href="#" class="delete" data-toggle="modal" data-target="#delhon" onclick="honDelete('+honList[i].info_id+')">'+'删除'+'</a>',
							honhtml+='</span>',
							honhtml+='</li>',
							honhtml+='<hr style="border-style: dashed;">'
						}
						$("#edulist ul").html(html);
						$("#Lan1 ul").html(lanhtml);
						$("#worklist ul").html(workhtml);
						$("#prolist ul").html(prohtml);
						$("#tralist ul").html(trahtml);
						$("#itlist ul").html(ithtml);
						$("#honlist ul").html(honhtml);
						}
					});
				}
				$("#WorkButton").click(function(){
					//企业名称
					var CompanyName=$("#CompanyName").val();
					//企业性质
					var CompanyNatureID=$("#CompanyNatureID").val();
					var CompanyIndustryID=$("#CompanyIndustryID").val();
					//部门
					var Department=$("#Department").val();
					//职位
					var Job=$("#Job").val();
					//开始时间
					var WorkBeginDate=$("#BeginDate").val();
					//结束时间
					var WorkEndDate=$("#EndDate").val();
					//下属人数
					var Underling=$("#Underling").val();
					if(Underling==''){
						var Underling=0;
					}
					//职责描述
					var Description=$("#Description").val();
					var CV_ID=$("#CVID").val();
					if(valitework()){
					$.ajax({
						type : "POST",
						url :  locat+'/edu/worksave.act',
						data : {
							CV_ID:CV_ID,
							CompanyName:CompanyName,
							CompanyNatureID:CompanyNatureID,
							CompanyIndustryID:CompanyIndustryID,
							Department:Department,
							Job:Job,
							WorkBeginDate:WorkBeginDate,
							WorkEndDate:WorkEndDate,
							Underling:Underling,
							Description:Description,
							tm : new Date().getTime()
						},
						dataType : 'json',
						cache : false,
						success : function(data) {
							$('#Work').modal('hide');
							showinfo();
							$("input[name='editwork']").trigger("click");
							//location.reload();
							return false;
						}
					});
					}
			function valitework(){
				var CompanyName=$("#CompanyName").val();
				if (CompanyName == "") {
					$("#CompanyName").tips({
						side : 2,
						msg : '请输入企业名称',
						bg : '#AE81FF',
						time : 3
					});
					$("#CompanyName").focus();
					return false;
				}
				//企业性质
				var CompanyNatureID=$("#CompanyNatureID").val();
				if (CompanyNatureID == "") {
					$("#CompanyNatureID").tips({
						side : 2,
						msg : '请选择企业性质',
						bg : '#AE81FF',
						time : 3
					});
					$("#CompanyNatureID").focus();
					return false;
				}
				//行业类别
				var CompanyIndustryID=$("#CompanyIndustryID").val();
				if (CompanyIndustryID == "") {
					$("#CompanyIndustryID").tips({
						side : 2,
						msg : '请选择行业类别',
						bg : '#AE81FF',
						time : 3
					});
					$("#CompanyIndustryID").focus();
					return false;
				}
				//部门
				var Department=$("#Department").val();
				if (Department == "") {
					$("#Department").tips({
						side : 2,
						msg : '请输入部门',
						bg : '#AE81FF',
						time : 3
					});
					$("#Department").focus();
					return false;
				}
				//职位
				var Job=$("#Job").val();
				if (Job == "") {
					$("#Job").tips({
						side : 2,
						msg : '请输入职位',
						bg : '#AE81FF',
						time : 3
					});
					$("#Job").focus();
					return false;
				}
				//开始时间
				var WorkBeginDate=$("#BeginDate").val();
				if (WorkBeginDate == "") {
					$("#BeginDate").tips({
						side : 2,
						msg : '请输入开始时间',
						bg : '#AE81FF',
						time : 3
					});
					$("#BeginDate").focus();
					return false;
				}
				//结束时间
				var WorkEndDate=$("#EndDate").val();
//				if (WorkEndDate == "") {
//					$("#EndDate").tips({
//						side : 2,
//						msg : '请输入结束时间',
//						bg : '#AE81FF',
//						time : 3
//					});
//					$("#EndDate").focus();
//					return false;
//				}
				//开始日期和结束日期比较
		    	if(WorkBeginDate.length>0&&WorkEndDate.length>0){
		    		if(WorkBeginDate>WorkEndDate)
		    		{
		    		$("#EndDate").tips({
		    			side : 3,
		    			msg : '结束日期不能小于开始日期！',
		    			bg : '#AE81FF',
		    			time : 2
		    		});
		    		$("#EndDate").focus();
		    		return false;		
		    		}
		    	}
				//下属人数
				var Underling=$("#Underling").val();
				if(Underling==''){
					var Underling=0;
				}
				return true;
			}
				})
				$("#ProgramButton").click(function(){
						var CV_ID=$("#CVID").val();
						var ProgramName = $("#ProgramName").val();
						var BeginDate = $("#BeginDatepro").val();
						var EndDate = $("#EndDatepro").val();
						var Tools = $("#Tools").val();
						var ITTechID = $("#ITTechID").val();
						//项目描述
						var ProDescription = $("#ProDescription").val();
						var Responsibility = $("#Responsibility").val();
						if(vilatepro()){
 						$.ajax({
							type : "POST",
							url :  locat+'/edu/prosave.act',
									data : {
										CV_ID : CV_ID,
										ProgramName : ProgramName,
										BeginDate : BeginDate,
										EndDate : EndDate,
										Tools : Tools,
										ITTechId : ITTechID,
										ProDescription : ProDescription,
										Responsibility : Responsibility,
										tm : new Date().getTime()
									},
									dataType : 'json',
									cache : false,
									success : function(data) {
										showinfo();
										$('#Program').modal('hide');
										$("input[name='editpro']").trigger("click");
										return false;
									}
								});
							}
						function vilatepro() {
							//项目名称
							var ProgramName = $("#ProgramName").val();
							if (ProgramName == "") {
								$("#ProgramName").tips({
									side : 2,
									msg : '请输入项目名称',
									bg : '#AE81FF',
									time : 3
								});
								$("#ProgramName").focus();
								return false;
							}
							//开始时间
							var BeginDate = $("#BeginDatepro").val();
							if (BeginDate == "") {
								$("#BeginDatepro").tips({
									side : 2,
									msg : '请输入开始时间',
									bg : '#AE81FF',
									time : 3
								});
								$("#BeginDatepro").focus();
								return false;
							}
							//结束时间
							var EndDate = $("#EndDatepro").val();
							if (EndDate == "") {
								$("#EndDatepro").tips({
									side : 2,
									msg : '请输入结束时间',
									bg : '#AE81FF',
									time : 3
								});
								$("#EndDatepro").focus();
								return false;
							}
							//结束时间和开始时间比较
					    	if(BeginDate.length>0&&EndDate.length>0){
					    		if(BeginDate>EndDate)
					    		{
					    		$("#EndDatepro").tips({
					    			side : 3,
					    			msg : '结束时间不能小于开始时间！',
					    			bg : '#AE81FF',
					    			time : 2
					    		});
					    		$("#EndDatepro").focus();
					    		return false;		
					    		}
					    	}
							var Tools = $("#Tools").val();
							var ITTechID = $("#ITTechID").val();
							//项目描述
							var ProDescription = $("#ProDescription").val();
							if (ProDescription == "") {
								$("#ProDescription").tips({
									side : 2,
									msg : '请输入项目描述',
									bg : '#AE81FF',
									time : 3
								});
								$("#ProDescription").focus();
								return false;
							}
							//职责描述
							var Responsibility = $("#Responsibility").val();
							if (Responsibility == "") {
								$("#Responsibility").tips({
									side : 2,
									msg : '请输入职责',
									bg : '#AE81FF',
									time : 3
								});
								$("#Responsibility").focus();
								return false;
							}
							return true;
						}
					})
					$("#TraButton").click(function(){
							var TrainCompany=$("#TrainCompany").val();
							//开始时间
							var BeginDate=$("#BeginDatetra").val();
							//结束时间
							var EndDate=$("#EndDatetra").val();
							var Certificate=$("#Certificate").val();
							var CV_ID=$("#CVID").val();
							var Course=$("#Course").val();
							if(valatetra()){
							$.ajax({
								type : "POST",
								url :  locat+'/edu/trasave.act',
								data : {
									CV_ID:CV_ID,
									TrainCompany:TrainCompany,
									BeginDate:BeginDate,
									EndDate:EndDate,
									Certificate:Certificate,
									Course:Course,
									tm : new Date().getTime()
								},
								dataType : 'json',
								cache : false,
								success : function(data) {
									showinfo();
									$("input[name='edittra']").trigger("click");
									$('#Tra').modal('hide');
								}
							});
							}
						function valatetra(){
							var TrainCompany=$("#TrainCompany").val();
							if (TrainCompany == "") {
								$("#TrainCompany").tips({
									side : 2,
									msg : '请输入培训机构名称',
									bg : '#AE81FF',
									time : 3
								});
								$("#TrainCompany").focus();
								return false;
							}	
							//开始时间
							var BeginDatetra=$("#BeginDatetra").val();
							if (BeginDatetra== "") {
								$("#BeginDatetra").tips({
									side : 2,
									msg : '请输入开始时间',
									bg : '#AE81FF',
									time : 3
								});
								$("#BeginDatetra").focus();
								return false;
							}	
							//结束时间
							var EndDatetra=$("#EndDatetra").val();
							if (EndDatetra== "") {
								$("#EndDatetra").tips({
									side : 2,
									msg : '请输入结束时间',
									bg : '#AE81FF',
									time : 3
								});
								$("#EndDatetra").focus();
								return false;
							}
							//结束时间和开始时间比较
					    	if(BeginDatetra.length>0&&EndDatetra.length>0){
					    		if(BeginDatetra>EndDatetra)
					    		{
					    		$("#EndDatetra").tips({
					    			side : 3,
					    			msg : '结束时间不能小于开始时间！',
					    			bg : '#AE81FF',
					    			time : 2
					    		});
					    		$("#EndDatetra").focus();
					    		return false;		
					    		}
					    	}
							var Certificate=$("#Certificate").val();
							if (Certificate== "") {
								$("#Certificate").tips({
									side : 2,
									msg : '请输入证书',
									bg : '#AE81FF',
									time : 3
								});
								$("#Certificate").focus();
								return false;
							}	
							var Course=$("#Course").val();
							if (Course== "") {
								$("#Course").tips({
									side : 2,
									msg : '请输入课程',
									bg : '#AE81FF',
									time : 3
								});
								$("#Course").focus();
								return false;
							}	
							return true;
						}
						})
						$("#ItButton").click(function(){
						var TechName=$("#TechName").val();
						var Duration=$("#Duration").val();
						var SkillLevelID=$("#SkillLevelID").val();
						var CV_ID=$("#CVID").val();
						if(valateit()){
						$.ajax({
							type : "POST",
							url :  locat+'/edu/itsave.act',
							data : {
								CV_ID:CV_ID,
								TechName:TechName,
								Duration:Duration,
								SkillLevelID:SkillLevelID,
								tm : new Date().getTime()
							},
							dataType : 'json',
							cache : false,
							success : function(data) {
								showinfo();
								$("input[name='editit']").trigger("click");
								$('#It').modal('hide');
							}
						});
						}
					
					function valateit(){
						var TechName=$("#TechName").val();
						if (TechName== "") {
							$("#TechName").tips({
								side : 2,
								msg : '请输入名称',
								bg : '#AE81FF',
								time : 3
							});
							$("#TechName").focus();
							return false;
						}	
						var Duration=$("#Duration").val();
						if (Duration== "") {
							$("#Duration").tips({
								side : 2,
								msg : '请输入使用时间',
								bg : '#AE81FF',
								time : 3
							});
							$("#Duration").focus();
							return false;
						}	
						var SkillLevelID=$("#SkillLevelID").val();
						if (SkillLevelID== "") {
							$("#SkillLevelID").tips({
								side : 2,
								msg : '请输入使用时间',
								bg : '#AE81FF',
								time : 3
							});
							$("#SkillLevelID").focus();
							return false;
						}	
						return true;
					}
					})
					$("#HonButton").click(function(){
						var HonorName=$("#HonorName").val();
						var BeginDate=$("#BeginDatehon").val();
						var CV_ID=$("#CVID").val();
						if(valatehon()){
						$.ajax({
							type : "POST",
							url :  locat+'/edu/honsave.act',
							data : {
								CV_ID:CV_ID,
								HonorName:HonorName,
								BeginDate:BeginDate,
								tm : new Date().getTime()
							},
							dataType : 'json',
							cache : false,
							success : function(data) {
								$("input[name='edithon']").trigger("click");
								$('#hon').modal('hide');
								showinfo();
							}
						});
						}
					function valatehon(){
						var HonorName=$("#HonorName").val();
						if (HonorName== "") {
							$("#HonorName").tips({
								side : 2,
								msg : '请输入名称',
								bg : '#AE81FF',
								time : 3
							});
							$("#HonorName").focus();
							return false;
						}	
						var BeginDate=$("#BeginDatehon").val();
						if (BeginDate== "") {
							$("#BeginDatehon").tips({
								side : 2,
								msg : '请输入时间',
								bg : '#AE81FF',
								time : 3
							});
							$("#BeginDatehon").focus();
							return false;
						}	
						return true;
					}
					})
					$("#Schoolupdate").autocomplete({
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
						        	$("#Schoolupdate").val(ui.item.label);
						        	$("#schoolupdate_id").val(ui.item.schoolId);
						          }
						    });
						function Eduupdate(){
							var CV_ID=$("#CVID").val();
							var INFO_ID=$("#info_id").val();
							var school=$("#Schoolupdate").val();
							if (school == "") {
								$("#Schoolupdate").tips({
									side : 2,
									msg : '请输入学校名称',
									bg : '#AE81FF',
									time : 3
								});
								$("#Schoolupdate").focus();
								return false;
							}
							var start=$("#BeginDateupdate").val();
							if (start == "") {
								$("#BeginDateupdate").tips({
									side : 2,
									msg : '请输入开始时间',
									bg : '#AE81FF',
									time : 3
								});
								$("#BeginDateupdate").focus();
								return false;
							}
							var end=$("#EndDateupdate").val();
							if (end == "") {
								$("#EndDateupdate").tips({
									side : 2,
									msg : '请输入开始时间',
									bg : '#AE81FF',
									time : 3
								});
								$("#EndDateupdate").focus();
								return false;
							}
							var Major=$("#Majorupdate").val();
							if (Major == "") {
								$("#Majorupdate").tips({
									side : 2,
									msg : '请输入专业',
									bg : '#AE81FF',
									time : 3
								});
								$("#Majorupdate").focus();
								return false;
							}
							var EduBackground=$("#EduBackgroundupdate").val();
							if (EduBackground== "") {
								$("#EduBackgroundupdate").tips({
									side : 2,
									msg : '请选择学历',
									bg : '#AE81FF',
									time : 3
								});
								$("#EduBackgroundupdate").focus();
								return false;
							}
							var HasOverseas=$("input:radio[name='HasOverseasupdate']:checked").val();
							$.ajax({
								type : "POST",
								url :  locat+'/edu/updateedu.act',
								data : {
									CV_ID:CV_ID,
									INFO_ID:INFO_ID,
									school_name: school,
									start_time:start,
									end_time:end,
									specialty:Major,
									education:EduBackground,
									overseas_study:HasOverseas,
									tm : new Date().getTime()
								},
								dataType : 'json',
								cache : false,
								success : function(data) {
									$('#eEdu').modal('hide');
									showinfo();
									//location.reload();
								}
							});	
						}
						function LanUpdate() {
							var LanguageID=$("#LanguageIDupdate").val();
							if (LanguageID == "") {
								$("#LanguageIDupdate").tips({
									side : 2,
									msg : '请选择语言',
									bg : '#AE81FF',
									time : 3
								});
								$("#LanguageIDupdate").focus();
								return false;
							}
							var CV_ID=$("#CVID").val();
							var INFO_ID=$("#laninfo_id").val();
							var DWID=$("#DWIDupdate").val();
							if (DWID == "") {
								$("#DWIDupdate").tips({
									side : 2,
									msg : '请选择读写能力',
									bg : '#AE81FF',
									time : 3
								});
								$("#DWIDupdate").focus();
								return false;
							}
							var LSID=$("#LSIDupdate").val();
							if (LSID == "") {
								$("#LSIDupdate").tips({
									side : 2,
									msg : '请选择听力能力',
									bg : '#AE81FF',
									time : 3
								});
								$("#LSIDupdate").focus();
								return false;
							}
							$.ajax({
								type : "POST",
								url :  locat+'/edu/updatelan.act',
								data : {
									CV_ID:CV_ID,
									INFO_ID:INFO_ID,
									LanguageID: LanguageID,
									DWID:DWID,
									LSID:LSID,
									tm : new Date().getTime()
								},
								dataType : 'json',
								cache : false,
								success : function(data) {
									showinfo();
								}
							});
					}
						function Workupdate(){
							//企业名称
							var CompanyName=$("#CompanyNameupdate").val();
							//企业性质
							var CompanyNatureID=$("#CompanyNatureIDupdate").val();
							var CompanyIndustryID=$("#CompanyIndustryIDupdate").val();
							//部门
							var Department=$("#Departmentupdate").val();
							//职位
							var Job=$("#Jobupdate").val();
							var INFO_ID=$("#workinfo_id").val();
							//开始时间
							var WorkBeginDate=$("#BeginDateupdatework").val();
							//结束时间
							var WorkEndDate=$("#EndDateupdatework").val();
							//下属人数
							var Underling=$("#Underlingupdate").val();
							if(Underling==''){
								var Underling=0;
							}
							//职责描述
							var Description=$("#Descriptionupdate").val();
							var CV_ID=$("#CVID").val();
							if(valiteworkedit()){
							$.ajax({
								type : "POST",
								url :  locat+'/edu/updatework.act',
								data : {
									CV_ID:CV_ID,
									INFO_ID:INFO_ID,
									CompanyName:CompanyName,
									CompanyNatureID:CompanyNatureID,
									CompanyIndustryID:CompanyIndustryID,
									Department:Department,
									Job:Job,
									WorkBeginDate:WorkBeginDate,
									WorkEndDate:WorkEndDate,
									Underling:Underling,
									Description:Description,
									tm : new Date().getTime()
								},
								dataType : 'json',
								cache : false,
								success : function(data) {
									showinfo();
									$('#WorkEdit').modal('hide');
									return false;
								}
							});
							}
					}
					function valiteworkedit(){
						var CompanyName=$("#CompanyNameupdate").val();
						if (CompanyName == "") {
							$("#CompanyNameupdate").tips({
								side : 2,
								msg : '请输入企业名称',
								bg : '#AE81FF',
								time : 3
							});
							$("#CompanyNameupdate").focus();
							return false;
						}
						//企业性质
						var CompanyNatureID=$("#CompanyNatureIDupdate").val();
						if (CompanyNatureID == "") {
							$("#CompanyNatureIDupdate").tips({
								side : 2,
								msg : '请选择企业性质',
								bg : '#AE81FF',
								time : 3
							});
							$("#CompanyNatureIDupdate").focus();
							return false;
						}
						//行业类别
						var CompanyIndustryID=$("#CompanyIndustryIDupdate").val();
						if (CompanyIndustryID == "") {
							$("#CompanyIndustryIDupdate").tips({
								side : 2,
								msg : '请选择行业类别',
								bg : '#AE81FF',
								time : 3
							});
							$("#CompanyIndustryIDupdate").focus();
							return false;
						}
						//部门
						var Department=$("#Departmentupdate").val();
						if (Department == "") {
							$("#Departmentupdate").tips({
								side : 2,
								msg : '请输入部门',
								bg : '#AE81FF',
								time : 3
							});
							$("#Departmentupdate").focus();
							return false;
						}
						//职位
						var Job=$("#Jobupdate").val();
						if (Job == "") {
							$("#Jobupdate").tips({
								side : 2,
								msg : '请输入职位',
								bg : '#AE81FF',
								time : 3
							});
							$("#Jobupdate").focus();
							return false;
						}
						//开始时间
						var WorkBeginDate=$("#BeginDateupdatework").val();
						if (WorkBeginDate == "") {
							$("#BeginDateupdatework").tips({
								side : 2,
								msg : '请输入开始时间',
								bg : '#AE81FF',
								time : 3
							});
							$("#BeginDateupdatework").focus();
							return false;
						}
						//结束时间
						var WorkEndDate=$("#EndDateupdatework").val();
						/*if (WorkEndDate == "") {
							$("#EndDateupdate").tips({
								side : 2,
								msg : '请输入结束时间',
								bg : '#AE81FF',
								time : 3
							});
							$("#EndDateupdate").focus();
							return false;
						}*/
						if(WorkBeginDate.length>0&&WorkEndDate.length>0){
				    		if(WorkBeginDate>WorkEndDate)
				    		{
				    		$("#EndDateupdatework").tips({
				    			side : 3,
				    			msg : '结束日期不能小于开始日期！',
				    			bg : '#AE81FF',
				    			time : 2
				    		});
				    		$("#EndDateupdatework").focus();
				    		return false;		
				    		}
				    	}
						//下属人数
						var Underling=$("#Underlingupdate").val();
						if(Underling==''){
							var Underling=0;
						}
						return true;
					}
					function proupdate() {
						var CV_ID=$("#CVID").val();
						var INFO_ID=$("#proinfo_id").val();
						var ProgramName = $("#ProgramNameupdate").val();
						var BeginDate = $("#BeginDateproupdate").val();
						var EndDate = $("#EndDateproupdate").val();
						var Tools = $("#Toolsupdate").val();
						var ITTechID = $("#ITTechIDupdate").val();
						//项目描述
						var ProDescription = $("#ProDescriptionupdate").val();
						var Responsibility = $("#Responsibilityupdate").val();
						if(vilateproedit()){
 						$.ajax({
							type : "POST",
							url :  locat+'/edu/proupdate.act',
									data : {
										CV_ID : CV_ID,
										INFO_ID:INFO_ID,
										ProgramName : ProgramName,
										BeginDate : BeginDate,
										EndDate : EndDate,
										Tools : Tools,
										ITTechId : ITTechID,
										ProDescription : ProDescription,
										Responsibility : Responsibility,
										tm : new Date().getTime()
									},
									dataType : 'json',
									cache : false,
									success : function(data) {
										showinfo();
										$('#Programedit').modal('hide');
										//location.reload();
										return false;
									}
								});
							}
						}
						function vilateproedit() {
							//项目名称
							var ProgramName = $("#ProgramNameupdate").val();
							if (ProgramName == "") {
								$("#ProgramNameupdate").tips({
									side : 2,
									msg : '请输入项目名称',
									bg : '#AE81FF',
									time : 3
								});
								$("#ProgramNameupdate").focus();
								return false;
							}
							//开始时间
							var BeginDate = $("#BeginDateproupdate").val();
							if (BeginDate == "") {
								$("#BeginDateproupdate").tips({
									side : 2,
									msg : '请输入开始时间',
									bg : '#AE81FF',
									time : 3
								});
								$("#BeginDateproupdate").focus();
								return false;
							}
							//结束时间
							var EndDate = $("#EndDateproupdate").val();
							if (EndDate == "") {
								$("#EndDateproupdate").tips({
									side : 2,
									msg : '请输入结束时间',
									bg : '#AE81FF',
									time : 3
								});
								$("#EndDateproupdate").focus();
								return false;
							}
							var Tools = $("#Toolsupdate").val();
							var ITTechID = $("#ITTechIDupdate").val();
							//项目描述
							var ProDescription = $("#ProDescriptionupdate").val();
							if (ProDescription == "") {
								$("#ProDescriptionupdate").tips({
									side : 2,
									msg : '请输入项目描述',
									bg : '#AE81FF',
									time : 3
								});
								$("#ProDescriptionupdate").focus();
								return false;
							}
							//职责描述
							var Responsibility = $("#Responsibilityupdate").val();
							if (Responsibility == "") {
								$("#Responsibilityupdate").tips({
									side : 2,
									msg : '请输入职责',
									bg : '#AE81FF',
									time : 3
								});
								$("#Responsibilityupdate").focus();
								return false;
							}
							return true;
						}
						function updatetra() {
							var TrainCompany=$("#TrainCompanyupdate").val();
							//开始时间
							var BeginDate=$("#BeginDatetraupdate").val();
							//结束时间
							var EndDate=$("#EndDatetraupdate").val();
							var Certificate=$("#Certificateupdate").val();
							var CV_ID=$("#CVID").val();
							var INFO_ID=$("#trainfo_id").val();
							var Course=$("#Courseupdate").val();
							if(valatetraupdate()){
							$.ajax({
								type : "POST",
								url :  locat+'/edu/traupdate.act',
								data : {
									CV_ID:CV_ID,
									INFO_ID:INFO_ID,
									TrainCompany:TrainCompany,
									BeginDate:BeginDate,
									EndDate:EndDate,
									Certificate:Certificate,
									Course:Course,
									tm : new Date().getTime()
								},
								dataType : 'json',
								cache : false,
								success : function(data) {
									showinfo();
								}
							});
					}
							}
						function valatetraupdate(){
							var TrainCompany=$("#TrainCompanyupdate").val();
							if (TrainCompany == "") {
								$("#TrainCompanyupdate").tips({
									side : 2,
									msg : '请输入培训机构名称',
									bg : '#AE81FF',
									time : 3
								});
								$("#TrainCompanyupdate").focus();
								return false;
							}	
							//开始时间
							var BeginDatetra=$("#BeginDatetraupdate").val();
							if (BeginDatetra== "") {
								$("#BeginDatetraupdate").tips({
									side : 2,
									msg : '请输入开始时间',
									bg : '#AE81FF',
									time : 3
								});
								$("#BeginDatetraupdate").focus();
								return false;
							}	
							//结束时间
							var EndDatetra=$("#EndDatetraupdate").val();
							if (EndDatetra== "") {
								$("#EndDatetraupdate").tips({
									side : 2,
									msg : '请输入结束时间',
									bg : '#AE81FF',
									time : 3
								});
								$("#EndDatetraupdate").focus();
								return false;
							}	
							var Certificate=$("#Certificateupdate").val();
							if (Certificate== "") {
								$("#Certificateupdate").tips({
									side : 2,
									msg : '请输入证书',
									bg : '#AE81FF',
									time : 3
								});
								$("#Certificateupdate").focus();
								return false;
							}	
							var Course=$("#Courseupdate").val();
							if (Course== "") {
								$("#Courseupdate").tips({
									side : 2,
									msg : '请输入课程',
									bg : '#AE81FF',
									time : 3
								});
								$("#Courseupdate").focus();
								return false;
							}	
							return true;
						}
						function Itupdate() {
							var TechName=$("#TechNameupdate").val();
							var Duration=$("#Durationupdate").val();
							var SkillLevelID=$("#SkillLevelIDupdate").val();
							var CV_ID=$("#CVID").val();
							var INFO_ID=$("#itinfo_id").val();
							if(valateitupdate()){
							$.ajax({
								type : "POST",
								url :  locat+'/edu/itupdate.act',
								data : {
									CV_ID:CV_ID,
									INFO_ID:INFO_ID,
									TechName:TechName,
									Duration:Duration,
									SkillLevelID:SkillLevelID,
									tm : new Date().getTime()
								},
								dataType : 'json',
								cache : false,
								success : function(data) {
									showinfo();
								}
							});
					}
							}
						
						function valateitupdate(){
							var TechName=$("#TechNameupdate").val();
							if (TechName== "") {
								$("#TechNameupdate").tips({
									side : 2,
									msg : '请输入名称',
									bg : '#AE81FF',
									time : 3
								});
								$("#TechNameupdate").focus();
								return false;
							}	
							var Duration=$("#Durationupdate").val();
							if (Duration== "") {
								$("#Durationupdate").tips({
									side : 2,
									msg : '请输入使用时间',
									bg : '#AE81FF',
									time : 3
								});
								$("#Durationupdate").focus();
								return false;
							}	
							var SkillLevelID=$("#SkillLevelIDupdate").val();
							if (SkillLevelID== "") {
								$("#SkillLevelIDupdate").tips({
									side : 2,
									msg : '请输入使用时间',
									bg : '#AE81FF',
									time : 3
								});
								$("#SkillLevelIDupdate").focus();
								return false;
							}	
							return true;
						}
						function Honupdate() {
							var HonorName=$("#HonorNameupdate").val();
							var BeginDate=$("#BeginDatehonupdate").val();
							var CV_ID=$("#CVID").val();
							var INFO_ID=$("#honinfo_id").val();
							if(valatehonupdate()){
							$.ajax({
								type : "POST",
								url :locat+'/edu/honupdate.act',
								data : {
									CV_ID:CV_ID,
									INFO_ID:INFO_ID,
									HonorName:HonorName,
									BeginDate:BeginDate,
									tm : new Date().getTime()
								},
								dataType : 'json',
								cache : false,
								success : function(data) {
									showinfo();
								}
							});
					}}
						
						function valatehonupdate(){
							var HonorName=$("#HonorNameupdate").val();
							if (HonorName== "") {
								$("#HonorNameupdate").tips({
									side : 2,
									msg : '请输入名称',
									bg : '#AE81FF',
									time : 3
								});
								$("#HonorNameupdate").focus();
								return false;
							}	
							var BeginDate=$("#BeginDatehonupdate").val();
							if (BeginDate== "") {
								$("#BeginDatehonupdate").tips({
									side : 2,
									msg : '请输入时间',
									bg : '#AE81FF',
									time : 3
								});
								$("#BeginDatehonupdate").focus();
								return false;
							}	
							return true;
						}
						function Deletehon(){
							var CV_ID=$("#CVID").val();
							var INFO_ID=$("#delhoninfoid").val();
							$.ajax({
								type : "POST",
								url :  locat+'/edu/deletehon.act',
								data : {
									CV_ID:CV_ID,
									INFO_ID:INFO_ID,
									tm : new Date().getTime()
								},
								dataType : 'json',
								cache : false,
								success : function(data) {
									showinfo();
									$('#delhon').modal('hide');
								}
							});
						}
						function jiaoyu(){
							$("#jbxx").hide();
							$("#jiaoyu").show();
							scrollTo(0,0);
							$("#li1").removeClass("on");
							$("#li2").addClass("on");
						}
						function eduDelete(info_id) {
							$("#delectinfoid").val(info_id);
						}
						function lanDelete(info_id) {
							$("#dellaninfoid").val(info_id);
						}
						function workDelete(info_id) {
							$("#delworkinfoid").val(info_id);
						}
						function deletepro(info_id){
							$("#delproinfoid").val(info_id);
						}
						function deletetra(info_id){
							$("#deltrainfoid").val(info_id);
						}
						function itDelete(info_id){
							$("#delitinfoid").val(info_id);
						}
						function honDelete(info_id){
							$("#delhoninfoid").val(info_id);
						}
						$(document).ready(function() {
								locat=document.getElementsByTagName('base')[0].href
								$.ajax({
									type : "POST",
									url :  locat+'/myresume/countcv.act',
											data : {
												tm : new Date().getTime()
											},
											dataType : 'json',
											cache : false,
											success : function(data) {
												var num=data.numcv;
												if(num>=3){
													return false;
												}
											}
										});
								$("#Province").change(function() {
									BindCId();
								});
							});
							function BindCId() {
								var PID = $("#Province").val();
								$("#City").find('option').remove();
								$("<option value=''>---市---</option>").appendTo("#City");
								$.post(locat+'/myresume/getCities.act', {
									'PID' : PID
								}, function(data) {
									$.each(data.cityList, function(i, list) {
										$(
												"<option value='" + list.region_id + "'>"
														+ list.region_name + "</option>")
												.appendTo("#City");
									});
								});
								$("#City").val('');
							}
							function DB() {
								//职位类别
								if ($("#JobType").val() != null) {
									var st = $("#JobType").val();
									var cklist = st.split(',');
									for (var i = 0; i < cklist.length; i++) {
										var cid = cklist[i];
										document.getElementById(cid).checked = true;
									}
									if ($("input[name='Job']:checked").length >= 1) {
										$("[name='Job']").each(function() {
											if (!$(this).is(":checked")) {
												$(this).attr("disabled", true);
											}
										});
									}
								}
							}
							function D() {
						        //行业
						        if ($("#inId").val() != null) {
						            var st = $("#inId").val();
						            var cklist = st.split(',');
						            for (var i = 0; i < cklist.length; i++) {
						                var cid = cklist[i];
						                document.getElementById(cid).checked = true;
						            }
						            if ($("input[name='Ind']:checked").length >= 5) {
						                $("[name='Ind']").each(function () {
						                    if (!$(this).is(":checked")) {
						                        $(this).attr("disabled", true);
						                    }
						                });
						            }
						        }
						    }

							function Industrycheck() {
								var relateIds = "";
								var texts = "";
								$("input[name='Ind']:checked").each(function() {
									relateIds += $(this).attr('value') + ",";
								});//能到选中复选框的value
								relateIds = relateIds.substring(0, relateIds.length - 1);

								$("input[name='Ind']:checked").each(
										function() {
											texts += $(this).parent().text().replace(
													"undefined", "")
													+ ',';
										});//能到选中复选框的text  
								if (texts.length > 150) {
									texts = texts.substring(0, texts.length - 100) + "....";
								} else {
									texts = texts.substring(0, texts.length - 1);
								}
								if (texts == "") {
									$("#Industry").text("请选择行业");
									$("#Industry").append('&nbsp;<b class="caret"></b>')
									$("#inId").val("");
									$("#AddIndustry").val("")
								} else {
									$("#Industry").text(texts);
									$("#inId").val(relateIds);
									$("#AddIndustry").val(texts)
								}
								$("[name='Ind']").removeAttr("checked");//取消全选
							}

							$("[name='Ind']").bind("click", function() {
								var n = $("input[name='Ind']:checked").length;
								if (n >= 5) {
									$("[name='Ind']").each(function() {
										if (!$(this).is(":checked")) {
											$(this).attr("disabled", true);
										}
									});
								} else {
									$("[name='Ind']").each(function() {
										$(this).attr("disabled", false);
									});
								}
							})
							$("[name='Job']").bind("click", function() {
								var n = $("input[name='Job']:checked").length;
								if (n >= 1) {
									$("[name='Job']").each(function() {
										if (!$(this).is(":checked")) {
											$(this).attr("disabled", true);
										}
									});
								} else {
									$("[name='Job']").each(function() {
										$(this).attr("disabled", false);
									});
								}
							})

							function Jobcheck() {
								var relateIds = "";
								var texts = "";
								$("input[name='Job']:checked").each(function() {
									relateIds += $(this).attr('value') + ",";
								});//能到选中复选框的value
								relateIds = relateIds.substring(0, relateIds.length - 1);

								$("input[name='Job']:checked").each(
										function() {
											texts += $(this).parent().text().replace(
													"undefined", "");
										});//能到选中复选框的text  
								if (texts == "") {
									$("#JobText").text("请选择职位类别");
									$("#JobText").append('&nbsp;<b class="caret"></b>')
									$("#JobTypeText").val("");
									$("#JobType").val("");
								} else {

									$("#JobText").text(texts);
									$("#JobType").val(relateIds);
									$("#JobTypeText").val(texts);
								}
								$("[name='Job']").removeAttr("checked");//取消全选
							}
							function saveinfo() {
								//简历名称
								var ResumeName=$("#ResumeName").val();
								if(ResumeName == "") {
									$("#ResumeName").tips({
										side : 2,
										msg : '请输入简历名称',
										bg : '#AE81FF',
										time : 3
									});
									$("#ResumeName").focus();
									return false;
								}
								//省
								var Province = $("#Province").val();
								if (Province == "") {
									$("#Province").tips({
										side : 2,
										msg : '请选择省份',
										bg : '#AE81FF',
										time : 3
									});
									$("#Province").focus();
									return false;
								} 
								//市
								var City = $("#City").val();
								 if (City == "") {
									$("#City").tips({
										side : 2,
										msg : '请选择市',
										bg : '#AE81FF',
										time : 3
									});
									$("#City").focus();
									return false;
								}
								//QQ
								var QQ = $("#qq").val();
								if(QQ == ""){
									$("#qq").tips({
			                            side : 2,
			                            msg : '请输入QQ',
			                            bg : '#AE81FF',
			                            time : 3
			                        });
			                        $("#qq").focus();
			                        return false;
								}
								//自我评价
								var CommentContent=$("#CommentContent").val();
								 if (CommentContent == "") {
									$("#CommentContent").tips({
										side : 2,
										msg : '请输入自我评价',
										bg : '#AE81FF',
										time : 3
									});
									$("#CommentContent").focus();
									return false;
								}
								//期望工作性质
								var PoliticalLandscape1=$("#PoliticalLandscape1").val();
								if (PoliticalLandscape1 == "") {
									$("#PoliticalLandscape1").tips({
										side : 2,
										msg : '请选择期望工作性质',
										bg : '#AE81FF',
										time : 3
									});
									$("#PoliticalLandscape1").focus();
									return false;
								}
								//行业
								var Industry=$("#inId").val();
								if (Industry == "") {
									$("#Industry").tips({
										side : 2,
										msg : '请选择期望行业',
										bg : '#AE81FF',
										time : 3
									});
									$("#inId").focus();
									return false;
								}
								//职位
								var JobText = $("#JobType").val();
								if (JobText == "") {
									$("#JobText").tips({
										side : 2,
										msg : '请选择职位',
										bg : '#AE81FF',
										time : 3
									});
									$("#JobType").focus();
									return false;
								}
								//期望月薪
								var HopeSalaryID=$("#HopeSalaryID").val();
								if (HopeSalaryID == "") {
									$("#HopeSalaryID").tips({
										side : 2,
										msg : '请选择月薪',
										bg : '#AE81FF',
										time : 3
									});
									$("#HopeSalaryID").focus();
									return false;
								}
								//工作状态
								var Status=$("input:radio[name='status1']:checked").val();
								$.ajax({
									type : "POST",
									url :  locat+'/myresume/save.act',
									data : {
										Resumename: ResumeName,
										PoliticalLandscape1:PoliticalLandscape1,
										Province:Province,
										City:City,
										QQ:QQ,
										SelfEvaluation:CommentContent,
										Industry:Industry,
										JobText:JobText,
										HopeSalaryID:HopeSalaryID,
										Status:Status,
										tm : new Date().getTime()
									},
									dataType : 'json',
									cache : false,
									success : function(data) {
										if ("success" == data.result) {
											var cv_id=data.CV_ID;
											$("#CVID").val(cv_id);
											showinfo();
											jiaoyu();
											//window.location.href = "http://itwb.dlsoa.org/account/reg";
										} 
									}
								});
						}
							/* ××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××× */
							//模态框初始加载教育背景
							function eduUpdate(info_id) {
								var CV_ID = $("#CVID").val();
								$.ajax({
									type : "POST",
									url : locat+'/edu/selecteduinfo.act',
									data : {
										info_id:info_id,
										CV_ID:CV_ID,
										tm : new Date().getTime()
									},
									dataType : 'json',
									cache : false,
									success : function(data) {
										console.log(data);
										var school_name=data.school_name;
										var start_time=data.start_time;
										var end_time=data.end_time;
										var specialty=data.specialty;
										var education=data.education;
										var education1=data.education1;
										var overseas_study=data.overseas_study;
										$("#Schoolupdate").val(school_name);
										$("#BeginDateupdate").val(start_time);
										$("#EndDateupdate").val(end_time);
										$("#Majorupdate").val(specialty);
										$("#option1").text(education1);
										$("#option1").val(education);
										$("#info_id").val(info_id);
										if(overseas_study=='0'){
										$("input[type=radio][name=HasOverseasupdate][value=0]").attr("checked",'checked')
										}else{
										$("input[type=radio][name=HasOverseasupdate][value=1]").attr("checked",'checked')
										}
										//$("input:radio[name='HasOverseasupdate']");
										return false;
									}
								});	
							}
							/* ××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××× */
							//模态框初始加载语言能力
							function lanUpdate(info_id){
								var CV_ID=$("#CVID").val();
								$.ajax({
									type : "POST",
									url :  locat+'/edu/selectlaninfo.act',
									data : {
										info_id:info_id,
										CV_ID:CV_ID,
										tm : new Date().getTime()
									},
									dataType : 'json',
									cache : false,
									success : function(data) {
										console.log(data);
										var languages=data.languages;
										var languages1=data.languages1;
										var listen_say_skill=data.listen_say_skill;
										var listen_say_skill1=data.listen_say_skill1;
										var read_write_skill=data.read_write_skill;
										var read_write_skill1=data.read_write_skill1;
										$("#lan1").val(languages);
										$("#lan1").text(languages1);
										$("#lan2").val(listen_say_skill);
										$("#lan2").text(listen_say_skill1);
										$("#lan3").val(read_write_skill);
										$("#lan3").text(read_write_skill1);
										$("#laninfo_id").val(info_id);
									}
								});	
							}
							/* ××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××× */
							//工作经历模态框初始化
							function workrefresh(info_id){
								var CV_ID=$("#CVID").val();
								$.ajax({
									type : "POST",
									url :  locat+'/edu/selectworkinfo.act',
									data : {
										info_id:info_id,
										CV_ID:CV_ID,
										tm : new Date().getTime()
									},
									dataType : 'json',
									cache : false,
									success : function(data) {
										var department=data.department;
										var end_time=data.end_time;
										var enterprise_name=data.enterprise_name;
										var enterprise_nature=data.enterprise_nature;
										var enterprise_nature1=data.enterprise_nature1;
										var industry_type=data.industry_type;
										var industry_type1=data.industry_type1;
										var job_description=data.job_description;
										var positions=data.positions;
										var start_time=data.start_time;
										var subordinates=data.subordinates;
										$("#CompanyNameupdate").val(enterprise_name);
										$("#work1").text(enterprise_nature1);
										$("#work1").val(enterprise_nature);
										$("#work2").val(industry_type);
										$("#work2").text(industry_type1);
										$("#Departmentupdate").val(department);
										$("#Jobupdate").val(positions);
										$("#BeginDateupdatework").val(start_time);
										$("#EndDateupdatework").val(end_time);
										$("#Underlingupdate").val(subordinates);
										$("#Descriptionupdate").val(job_description);
										$("#workinfo_id").val(info_id);
									}
								});	
							}
							/* ××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××× */
							//项目经验模态框初始化
							function prorefresh(info_id){
								var CV_ID=$("#CVID").val();
								$.ajax({
									type : "POST",
									url :  locat+'/edu/selectprokinfo.act',
									data : {
										info_id:info_id,
										CV_ID:CV_ID,
										tm : new Date().getTime()
									},
									dataType : 'json',
									cache : false,
									success : function(data) {
										console.log(data);
										 var project_name=data.project_name;
										var end_time=data.end_time;
										var development_tool=data.development_tool;
										var job_description=data.job_description;
										var technology=data.technology;
										var start_time=data.start_time;
										var project_description=data.project_description;
										$("#ProgramNameupdate").val(project_name);
										$("#Toolsupdate").val(development_tool);
										$("#ITTechIDupdate").val(technology);
										//$("#ProDescriptionupdate").val(industry_type);
										$("#ProDescriptionupdate").val(project_description);
										$("#Responsibilityupdate").val(job_description);
										$("#BeginDateproupdate").val(start_time);
										$("#EndDateproupdate").val(end_time);
										$("#proinfo_id").val(info_id);
									}
								});	
							}
							/* ××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××× */
							//培训经历模态框初始化
							function trarefresh(info_id){
								var CV_ID=$("#CVID").val();
								$.ajax({
									type : "POST",
									url :  locat+'/edu/selecttrainfo.act',
									data : {
										info_id:info_id,
										CV_ID:CV_ID,
										tm : new Date().getTime()
									},
									dataType : 'json',
									cache : false,
									success : function(data) {
										console.log(data);
									 	var certificate=data.certificate;
										var end_time=data.end_time;
										var course=data.course;
										var training_institutions=data.training_institutions;
										var start_time=data.start_time;
										$("#TrainCompanyupdate").val(training_institutions);
										$("#BeginDatetraupdate").val(start_time);
										$("#EndDatetraupdate").val(end_time);
										$("#Certificateupdate").val(certificate);
										$("#Courseupdate").val(course);
										$("#trainfo_id").val(info_id);
									}
								});	
							}
							/* ××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××× */
							//it技能模态框初始化
							function itrefresh(info_id){
								var CV_ID=$("#CVID").val();
								$.ajax({
									type : "POST",
									url :  locat+'/edu/selectitinfo.act',
									data : {
										info_id:info_id,
										CV_ID:CV_ID,
										tm : new Date().getTime()
									},
									dataType : 'json',
									cache : false,
									success : function(data) {
										console.log(data);
									 	var skill_level=data.skill_level;
										var skill_level1=data.skill_level1;
										var skill_name=data.skill_name;
										var use_month=data.use_month;
										$("#TechNameupdate").val(skill_name);
										$("#Durationupdate").val(use_month);
										$("#it1").val(skill_level);
										$("#it1").text(skill_level1);
										$("#itinfo_id").val(info_id)
									}
								});	
							}
							/* ××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××× */
							//荣誉证书模态框初始化
							function honrefresh(info_id){
								var CV_ID=$("#CVID").val();
								$.ajax({
									type : "POST",
									url :  locat+'/edu/selecthoninfo.act',
										data : {
											info_id : info_id,
											CV_ID : CV_ID,
											tm : new Date().getTime()
										},
										dataType : 'json',
										cache : false,
										success : function(data) {
											console.log(data);
											var certificate_name = data.certificate_name;
											var get_time = data.get_time;
											$("#HonorNameupdate").val(certificate_name);
											$("#BeginDatehonupdate").val(get_time);
											$("#honinfo_id").val(info_id);
										}
									});
								}