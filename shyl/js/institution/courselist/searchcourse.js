/**
 *课程列表页
 * @param  {[type]} $ [description]
 * @return {[type]}   [description]
 */
(function($) {
	var methodurl = $("#methodurl").val();
	var regexstr = /<[^>]*>/ig;
	function Model() {
		this.config = {
			lableSetting : false, //一级标签设置
			lableSecondSetting : false, //二级标签设置
		}
	}
	Model.prototype = {
		ajaxLoad : function(url, dataInfo, func) {
			$.ajax({
				type : "post",
				url : methodurl + url,
				data : dataInfo,
				dataType : "json",
				//async : false,
				beforeSend : function() {
					$(".course-loading").show();
					$(".loading-bg").show();
				},
				success : func,
				complete : function() {
					$(".course-loading").hide();
					$(".loading-bg").hide();
					 $.footerPosition({ cur: '.newfooter', pre: '#classList' });
				}
			});
		},
		ajax : function() {
			var arg = Array.prototype.slice.call(arguments), success = arg.length > 2 ? arg[2]
					: function() {
					}, error = arg.length > 3 ? arg[3] : function() {
			};
			$.ajax({
				type : "post",
				url : methodurl + arg[0],
				data : arg[1],
				dataType : "json",
				async : false,
				success : success,
				error : error
			});
		},
		init : function() {
			this.main();
			// this.lableSetting();
			// this.lableSecondSetting();
			this.event();
		},
		lableSetting : function() {
			var _this = this;
			this.ajax('courseapp/configItem.app', {}, function(result) {
				if (result && (result.status == 1 || result.status == 2)) {
					_this.config.lableSetting = true;
				}
			})
		},
		lableSecondSetting : function() {
			var _this = this;
			this.ajax('courseapp/courses.app', {}, function(result) {
				if (result && result.status == 1) {
					_this.config.lableSecondSetting = true;
				}
			});

		},
		getSearch : function() {
			var data = {}, status, _this = this;
			data.itemOneId = $("#itemOneLists").find("li.course-active").attr(
					'ids');
			data.itemSecondId = $("#itemSecondLists").find("li.course-active")
					.attr('ids');
			if (_this.config.lableSetting
					&& $("#courseLables").find("li.course-active").attr('ids'))
				data.itemTag = $("#courseLables").find("li.course-active")
						.attr('ids');
			if (_this.config.lableSecondSetting
					&& $("#courseSecondLables").find("li.course-active").attr(
							'ids'))
				data.itemTag2 = $("#courseSecondLables").find(
						"li.course-active").attr('ids');
			data.cusorder = $("#courseTypes").find("li.statefind-active").attr(
					'ids');
			data.courseFlag = $("#list-type").find("li.course-active").attr(
					'ids');
			if ($("#searchContent").data('name'))
				data.name = $("#searchContent").data('name');
			return data;
		},
		searchByName : function() {
			var data, _this = this;

			//选中全部学科
			$('#itemOneLists li').eq(0).addClass('course-active')
					.siblings('li').removeClass('course-active');
			//选中‘全部’授课方式
			$("#list-type").eq(0).addClass('course-active').siblings('li')
					.removeClass('course-active');
			//选中‘最新’排序方式
			$('.aacc').eq(0).addClass('statefind-active').siblings('li')
					.removeClass('statefind-active');
			//隐藏学科小类、一级标签、二级标签
			$('#itemTwoListChoose,.itemtagLists,.itemtagSecondLists').hide();
			//清空学科小类、一级标签、二级标签里面的内容
			$('#itemSecondLists,#courseLables,#courseSecondLables').html('');

			data = this.getSearch();
			data.name = $.trim($("#searchContent").val());
			data.page=1;
			/*if (!data.name) {
				$.msg('请输入课程名称');
				return;
			}*/
			this.ajaxLoad(
							'courseapp/courses.app',
							data,
							function(result) {
								var html = '<div class="class-list classfind-list"><ul class="clear">';
								if(result!=null && result.data!=undefined && result.data.result.length>0){
								$
										.each(
												result.data.result,
												function(i, tag) {
													var flag = new Array();
													if (tag.faceFlag == '1') {
														flag.push('面授');
													}
													if (tag.liveFlag == '1') {
														flag.push('直播');
													}
													if (tag.videoFlag == '1') {
														flag.push('录播');
													}
													if (tag.remoteFlag == '1') {
														flag.push('其他');
													}
													html += '<li data-id="'
															+ tag.classTypeId
															+ '"> <div class="parcel-box"> <div class="picture" style="background-image:url('
															+ tag.cover
															+ ')"></div>'
															+ '<div><div class="stageMove"><h5>'
															+ tag.name
															+ '</h5><p>'
															+ tag.detailDesc.replace(regexstr,'')
															+ '</p></div>'
															+ '<div class="stage-price"><div class="allsta-bot"><div class="clear"><span class="rmb fl"> <b>￥'
															+ tag.realPrice
															+ '</b><s>￥'
															+ tag.originalPrice
															+ '</s> </span> <span class="people fr"><i class="iconfont"></i><em>'
															+ tag.buyNum
															+ '</em></span> </div>'
															+ '<p class="pattern"> 授课模式：'
															//+ flag.join(' | ')
															+ '录播'
															+ '</p></div></div> </div></div></li>';
												});
								html += '</ul></div><div class="pages pages-find"><ul class="pagination"></ul></div>'
								$("#classList").html(html);
								$(".pagination")
										.pagination(
												result.data.rowCount,
												{
													num_edge_entries : 2,
													num_display_entries : 4,
													prev_text : '上一页',
													next_text : '下一页',
													link_to : "javascript:void(0)",
													num_display_entries : 8,
													items_per_page : result.data.pageSize,
													current_page : result.data.pageNo - 1,
													num_edge_entries : 1,
													callback : function(page,
															jq) {
														var pageNo = page + 1;
														_model
																.queryPageByCommodity(pageNo);
													}
												});
								
								//$('.name-search').show();
								}else{
									$("#classList").html('<div class="wrap public-content" style="width: 1200px;padding: 0px;">'+
											'<div class="contents empty"> <div class="icon"></div><p>没有相关数据~</p></div>');	
								}
								$("#guanjianci,#searchContent").text(data.name)
								.data('name', data.name);
								$.footerPosition({
									cur : '.newfooter',
									pre : '#classList'
								});
							})
		},
		loadItemOneData : function(callback) {
			var html = '<li class="course-active" ids="">全部</li>';
			$("#itemOneLists").html("");
			this.ajax('courseapp/configItem.app', {}, function(jsonData) {
				$.each(jsonData.data, function(i, item) {
					if (item.parentId == null) {
						html += '<li ids=' + item.id + '>' + item.itemName
								+ '</li>';
					}
				})
				$("#itemOneLists").html(html);
				if (callback && typeof callback == 'function')
					callback();
			});
		},
		loadItemSecondData : function(callback) {
			var id = $("#itemOneLists").find("li.course-active").attr('ids'), html = '<li class="titPtop course-active" ids="">全部</li>';
			if(id==''){
				return;
			}
			this.ajax('courseapp/configItem.app', {
				'parentId' : id
			}, function(jsonData) {
				if (!jsonData.data.length) {
					$('#itemTwoListChoose').hide();
				} else {
					$('#itemTwoListChoose').show();
				}

				$.each(jsonData.data, function(i, item) {
					if (item.parentId == id) {
						html += '<li class="titPtop"  ids=' + item.id + '>'
								+ item.itemName + '</li>';
					}
				})
				$("#itemSecondLists").html(html);
				if (callback && typeof callback == 'function')
					callback();
			});
		},
		loadConditions : function() {
			var _this = this;
			$('#itemOneLists > li').each(function(){
				if($(this).attr("ids") == $("#oneItemIdSearchKey").val()){
						$(this).addClass("course-active").siblings("li").removeClass("course-active");
						if (!$(this).attr('ids')) {
							$('#itemTwoListChoose').hide();
							$('#itemSecondLists').html('');
						}else{
							_this.loadItemSecondData();
						}
						$('.itemtagLists,.itemtagSecondLists').addClass(
								'none');
						$('#courseLables,#courseSecondLables').html('');
				}
			});
		},
		/**
		 * 查询商品
		 */
		queryPageByCommodity : function(page, condition) {
			var search = condition || this.getSearch(), _this = this;
			search.page = page ? page : 1;
			this.ajaxLoad(
							'courseapp/courses.app',
							search,
							function(result) {
								var html = '<div class="class-list classfind-list"><ul class="clear">';
								if(result!=null && result.data!=undefined && result.data.result.length>0){
								$.each(
												result.data.result,
												function(i, tag) {
													var flag = new Array();
													if (tag.faceFlag == '1') {
														flag.push('面授');
													}
													if (tag.liveFlag == '1') {
														flag.push('直播');
													}
													if (tag.videoFlag == '1') {
														flag.push('录播');
													}
													if (tag.remoteFlag == '1') {
														flag.push('其他');
													}
													html += '<li data-id="'
															+ tag.classTypeId
															+ '"> <div class="parcel-box"> <div class="picture" style="background-image:url('
															+ tag.cover
															+ ')"></div>'
															+ '<div><div class="stageMove"><h5>'
															+ tag.name
															+ '</h5><p>'
															+ tag.detailDesc.replace(regexstr,'')
															+ '</p></div>'
															+ '<div class="stage-price"><div class="allsta-bot"><div class="clear"><span class="rmb fl"> <b>￥'
															+ tag.realPrice
															+ '</b><s>￥'
															+ tag.originalPrice
															+ '</s> </span> <span class="people fr"><i class="iconfont"></i><em>'
															+ tag.buyNum
															+ '</em></span> </div>'
															+ '<p class="pattern"> 授课模式：'
															//+ flag.join(' | ')
															+ '录播'
															+ '</p></div></div> </div></div></li>';
												});
								html += '</ul></div><div class="pages pages-find"><ul class="pagination"></ul></div>'
								$("#classList").html(html);
								$(".pagination")
										.pagination(
												result.data.rowCount,
												{
													num_edge_entries : 2,
													num_display_entries : 4,
													prev_text : '上一页',
													next_text : '下一页',
													link_to : "javascript:void(0)",
													num_display_entries : 8,
													items_per_page : result.data.pageSize,
													current_page : result.data.pageNo - 1,
													num_edge_entries : 1,
													callback : function(page,
															jq) {
														var pageNo = page + 1;
														_model
																.queryPageByCommodity(pageNo);
													}
												});
								}else{
									$("#classList").html('<div class="wrap public-content" style="width: 1200px;padding: 0px;">'+
									'<div class="contents empty"> <div class="icon"></div><p>没有相关数据~</p></div>');	
								}
								$(".newclass").removeClass("none");
							})
		},
		event : function() {
			var _this = this;
			//学科
			$("#itemOneLists")
					.on(
							'click',
							'li',
							function() {
								$("#searchContent").data('name', '');
								if ($(this).hasClass("course-active"))
									return;
								$(this).addClass("course-active")
										.siblings("li").removeClass(
												"course-active");
								if (!$(this).attr('ids')) {
									$('#itemTwoListChoose').hide();
									$('#itemSecondLists').html('');
								}
								$('.itemtagLists,.itemtagSecondLists')
										.addClass('none');
								$('#courseLables,#courseSecondLables').html('');
								_this.loadItemSecondData();
								_this.queryPageByCommodity(1);
							});
			//学科小类
			$("#itemSecondLists").on(
					'click',
					'li',
					function() {
						if ($(this).hasClass("course-active")) {
							return;
						}
						$(this).addClass("course-active").siblings("li")
								.removeClass("course-active");
						_this.queryPageByCommodity(1);
					});
			//标签
			$("#courseLables,#courseSecondLables").on(
					'click',
					'li',
					function() {
						if (!$(this).hasClass("course-active")) {
							$(this).addClass("course-active").siblings("li")
									.removeClass("course-active");
							_this.queryPageByCommodity();
						}
					});
			//搜索
			$(".icon").on('click', 'i.searchbtn', function() {
				_this.searchByName();
			})
			$("#searchContent").keydown(function(event) {
				if (event.keyCode == 13) {
					_this.searchByName();
					return false;
				}
			});
			//授课类型
			$("#list-type").on(
					'click',
					'li',
					function() {
						if (!$(this).hasClass("course-active")) {
							$(this).addClass("course-active").siblings("li")
									.removeClass("course-active");
							_this.queryPageByCommodity(1);
						}
					});
			//最新，最热，综合排序
			$("#courseTypes").on(
					'click',
					'li.aacc',
					function() {
						$(this).addClass('statefind-active').siblings()
								.removeClass('statefind-active');
						_this.queryPageByCommodity(1);
					});
			//进入课程详情
			$(document).on(
					'click',
					'.classfind-list li',
					function() {
						var id = $(this).data('id');
						if (id)
							window.open(methodurl
									+ 'institution/notFreeCourse.act?classTypeId=' + id);
					});
		},
		/**
		 * 入口函数，此页面为学科、学科小类、课程列表页面三合一
		 * @return {[type]} [description]
		 */
		main : function() {
			var _this = this;
			
			//默认情况查询所有课程
			_this.loadItemOneData();
			_this.loadConditions();
			_this.queryPageByCommodity();

		}

	}
	/**
	 * 页面加载完成后执行
	 */
	$(function() {
		var model = new Model();
		model.init();
		window._model = model;
	});
})(jQuery);
