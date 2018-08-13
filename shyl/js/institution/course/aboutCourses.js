			//模态框初始加载合同
				function delCourse(id) {
					$("#delectinfoid").val(id);
					}
				function Delete(){
							var id =$("#delectinfoid").val();
							$.ajax({
								type : "POST",
								url :document.getElementsByTagName('base')[0].href+'institutionCtrl/deleteCourse.act',
							data : {
								id : id
							},
							dataType : 'json',
							cache : false,
							success : function(data) {
								$('#deledu').modal('hide');
								location.reload();
							}
							});
				}