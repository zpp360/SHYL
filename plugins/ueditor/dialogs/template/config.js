/**
 * Created with JetBrains PhpStorm.
 * User: xuheng
 * Date: 12-8-8
 * Time: 下午2:00
 * To change this template use File | Settings | File Templates.
 */
var templates = [
    {
        "pre":"pre0.png",
        'title':lang.blank,
        'preHtml':'<p class="ue_t">&nbsp;欢迎使用UEditor！</p>',
        "html":'<p class="ue_t">欢迎使用UEditor！</p>'

    },
    {
        "pre":"pre1.png",
        'title':lang.blog,
        'preHtml':'<h1 label="Title center" name="tc" style="border-bottom-color:#cccccc;border-bottom-width:2px;border-bottom-style:solid;padding:0px 4px 0px 0px;text-align:center;margin:0px 0px 20px;"><span style="color:#c0504d;">深入理解Range</span></h1><p style="text-align:center;"><strong class=" ">UEditor二次开发</strong></p><h3><span class=" " style="font-family:幼圆">什么是Range</span></h3><p style="text-indent:2em;">对于“插入”选项卡上的库，在设计时都充分考虑了其中的项与文档整体外观的协调性。 </p><br /><h3><span class=" " style="font-family:幼圆">Range能干什么</span></h3><p style="text-indent:2em;">在“开始”选项卡上，通过从快速样式库中为所选文本选择一种外观，您可以方便地更改文档中所选文本的格式。</p>',
        "html":'<h1 class="ue_t" label="Title center" name="tc" style="border-bottom-color:#cccccc;border-bottom-width:2px;border-bottom-style:solid;padding:0px 4px 0px 0px;text-align:center;margin:0px 0px 20px;"><span style="color:#c0504d;">[键入文档标题]</span></h1><p style="text-align:center;"><strong class="ue_t">[键入文档副标题]</strong></p><h3><span class="ue_t" style="font-family:幼圆">[标题 1]</span></h3><p class="ue_t"  style="text-indent:2em;">对于“插入”选项卡上的库，在设计时都充分考虑了其中的项与文档整体外观的协调性。 您可以使用这些库来插入表格、页眉、页脚、列表、封面以及其他文档构建基块。 您创建的图片、图表或关系图也将与当前的文档外观协调一致。</p><h3><span class="ue_t" style="font-family:幼圆">[标题 2]</span></h3><p class="ue_t"  style="text-indent:2em;">在“开始”选项卡上，通过从快速样式库中为所选文本选择一种外观，您可以方便地更改文档中所选文本的格式。 您还可以使用“开始”选项卡上的其他控件来直接设置文本格式。大多数控件都允许您选择是使用当前主题外观，还是使用某种直接指定的格式。 </p><h3><span class="ue_t" style="font-family:幼圆">[标题 3]</span></h3><p class="ue_t">对于“插入”选项卡上的库，在设计时都充分考虑了其中的项与文档整体外观的协调性。 您可以使用这些库来插入表格、页眉、页脚、列表、封面以及其他文档构建基块。 您创建的图片、图表或关系图也将与当前的文档外观协调一致。</p><p class="ue_t"><br /></p>'

    },
    {
        "pre":"pre2.png",
        'title':lang.resume,
        'preHtml':'<h1 label="Title left" name="tl" style="border-bottom-color:#cccccc;border-bottom-width:2px;border-bottom-style:solid;padding:0px 4px 0px 0px;margin:0px 0px 10px;"><span style="color:#e36c09;" class=" ">WEB前端开发简历</span></h1><table width="100%" border="1" bordercolor="#95B3D7" style="border-collapse:collapse;"><tbody><tr><td width="100" style="text-align:center;"><p><span style="background-color:transparent;">插</span><br /></p><p>入</p><p>照</p><p>片</p></td><td><p><span style="background-color:transparent;"> 联系电话：</span><span class="ue_t" style="background-color:transparent;">[键入您的电话]</span><br /></p><p><span style="background-color:transparent;"> 电子邮件：</span><span class="ue_t" style="background-color:transparent;">[键入您的电子邮件地址]</span><br /></p><p><span style="background-color:transparent;"> 家庭住址：</span><span class="ue_t" style="background-color:transparent;">[键入您的地址]</span><br /></p></td></tr></tbody></table><h3><span style="color:#E36C09;font-size:20px;">目标职位</span></h3><p style="text-indent:2em;" class=" ">WEB前端研发工程师</p><h3><span style="color:#e36c09;font-size:20px;">学历</span></h3><p><span style="display:none;line-height:0px;" id="_baidu_bookmark_start_26">﻿</span></p><ol style="list-style-type:decimal;"><li><p><span class="ue_t">[起止时间]</span> <span class="ue_t">[学校名称] </span> <span class="ue_t">[所学专业]</span> <span class="ue_t">[所获学位]</span></p></li></ol><h3><span style="color:#e36c09;font-size:20px;" class="ue_t">工作经验</span></h3><p><br /></p>',
        "html":'<h1 label="Title left" name="tl" style="border-bottom-color:#cccccc;border-bottom-width:2px;border-bottom-style:solid;padding:0px 4px 0px 0px;margin:0px 0px 10px;"><span style="color:#e36c09;" class="ue_t">[此处键入简历标题]</span></h1><p><span style="color:#e36c09;"><br /></span></p><table width="100%" border="1" bordercolor="#95B3D7" style="border-collapse:collapse;"><tbody><tr><td width="200" style="text-align:center;" class="ue_t">【此处插入照片】</td><td><p><br /></p><p> 联系电话：<span class="ue_t">[键入您的电话]</span></p><p><br /></p><p> 电子邮件：<span class="ue_t">[键入您的电子邮件地址]</span></p><p><br /></p><p> 家庭住址：<span class="ue_t">[键入您的地址]</span></p><p><br /></p></td></tr></tbody></table><h3><span style="color:#e36c09;font-size:20px;">目标职位</span></h3><p style="text-indent:2em;" class="ue_t">[此处键入您的期望职位]</p><h3><span style="color:#e36c09;font-size:20px;">学历</span></h3><p><span style="display:none;line-height:0px;" id="_baidu_bookmark_start_26">﻿</span></p><ol style="list-style-type:decimal;"><li><p><span class="ue_t">[键入起止时间]</span> <span class="ue_t">[键入学校名称] </span> <span class="ue_t">[键入所学专业]</span> <span class="ue_t">[键入所获学位]</span></p></li><li><p><span class="ue_t">[键入起止时间]</span> <span class="ue_t">[键入学校名称]</span> <span class="ue_t">[键入所学专业]</span> <span class="ue_t">[键入所获学位]</span></p></li></ol><h3><span style="color:#e36c09;font-size:20px;" class="ue_t">工作经验</span></h3><ol style="list-style-type:decimal;"><li><p><span class="ue_t">[键入起止时间]</span> <span class="ue_t">[键入公司名称]</span> <span class="ue_t">[键入职位名称]</span> </p></li><ol style="list-style-type:lower-alpha;"><li><p><span class="ue_t">[键入负责项目]</span> <span class="ue_t">[键入项目简介]</span></p></li><li><p><span class="ue_t">[键入负责项目]</span> <span class="ue_t">[键入项目简介]</span></p></li></ol><li><p><span class="ue_t">[键入起止时间]</span> <span class="ue_t">[键入公司名称]</span> <span class="ue_t">[键入职位名称]</span> </p></li><ol style="list-style-type:lower-alpha;"><li><p><span class="ue_t">[键入负责项目]</span> <span class="ue_t">[键入项目简介]</span></p></li></ol></ol><p><span style="color:#e36c09;font-size:20px;">掌握技能</span></p><p style="text-indent:2em;"> &nbsp;<span class="ue_t">[这里可以键入您所掌握的技能]</span><br /></p>'

    },
    {
        "pre":"pre3.png",
        'title':lang.richText,
        'preHtml':'<h1 label="Title center" name="tc" style="border-bottom-color:#cccccc;border-bottom-width:2px;border-bottom-style:solid;padding:0px 4px 0px 0px;text-align:center;margin:0px 0px 20px;" class="ue_t">[此处键入文章标题]</h1><p><img src="http://img.baidu.com/hi/youa/y_0034.gif" width="150" height="100" border="0" hspace="0" vspace="0" style="width:150px;height:100px;float:left;" />图文混排方法</p><p>图片居左，文字围绕图片排版</p><p>方法：在文字前面插入图片，设置居左对齐，然后即可在右边输入多行文</p><p><br /></p><p><img src="http://img.baidu.com/hi/youa/y_0040.gif" width="100" height="100" border="0" hspace="0" vspace="0" style="width:100px;height:100px;float:right;" /></p><p>还有没有什么其他的环绕方式呢？这里是居右环绕</p><p><br /></p><p>欢迎大家多多尝试，为UEditor提供更多高质量模板！</p>',
        "html":'<p><br /></p><h1 label="Title center" name="tc" style="border-bottom-color:#cccccc;border-bottom-width:2px;border-bottom-style:solid;padding:0px 4px 0px 0px;text-align:center;margin:0px 0px 20px;" class="ue_t">[此处键入文章标题]</h1><p><img src="http://img.baidu.com/hi/youa/y_0034.gif" width="300" height="200" border="0" hspace="0" vspace="0" style="width:300px;height:200px;float:left;" />图文混排方法</p><p>1. 图片居左，文字围绕图片排版</p><p>方法：在文字前面插入图片，设置居左对齐，然后即可在右边输入多行文本</p><p><br /></p><p>2. 图片居右，文字围绕图片排版</p><p>方法：在文字前面插入图片，设置居右对齐，然后即可在左边输入多行文本</p><p><br /></p><p>3. 图片居中环绕排版</p><p>方法：亲，这个真心没有办法。。。</p><p><br /></p><p><br /></p><p><img src="http://img.baidu.com/hi/youa/y_0040.gif" width="300" height="300" border="0" hspace="0" vspace="0" style="width:300px;height:300px;float:right;" /></p><p>还有没有什么其他的环绕方式呢？这里是居右环绕</p><p><br /></p><p>欢迎大家多多尝试，为UEditor提供更多高质量模板！</p><p><br /></p><p>占位</p><p><br /></p><p>占位</p><p><br /></p><p>占位</p><p><br /></p><p>占位</p><p><br /></p><p>占位</p><p><br /></p><p><br /></p>'
    },
    {
        "pre":"pre4.png",
        'title':lang.sciPapers,
        'preHtml':'<h2 style="border-bottom-color:#cccccc;border-bottom-width:2px;border-bottom-style:solid;padding:0px 4px 0px 0px;margin:0px 0px 10px;text-align:center;" class="ue_t">[键入文章标题]</h2><p><strong><span style="font-size:12px;">摘要</span></strong><span style="font-size:12px;" class="ue_t">：这里可以输入很长很长很长很长很长很长很长很长很差的摘要</span></p><p style="line-height:1.5em;"><strong>标题 1</strong></p><p style="text-indent:2em;"><span style="font-size:14px;" class="ue_t">这里可以输入很多内容，可以图文混排，可以有列表等。</span></p><p style="line-height:1.5em;"><strong>标题 2</strong></p><ol style="list-style-type:lower-alpha;"><li><p class="ue_t">列表 1</p></li><li><p class="ue_t">列表 2</p></li><ol style="list-style-type:lower-roman;"><li><p class="ue_t">多级列表 1</p></li><li><p class="ue_t">多级列表 2</p></li></ol><li><p class="ue_t">列表 3<br /></p></li></ol><p style="line-height:1.5em;"><strong>标题 3</strong></p><p style="text-indent:2em;"><span style="font-size:14px;" class="ue_t">来个文字图文混排的</span></p><p style="text-indent:2em;"><br /></p>',
        'html':'<h2 style="border-bottom-color:#cccccc;border-bottom-width:2px;border-bottom-style:solid;padding:0px 4px 0px 0px;margin:0px 0px 10px;text-align:center;" class="ue_t">[键入文章标题]</h2><p><strong><span style="font-size:12px;">摘要</span></strong><span style="font-size:12px;" class="ue_t">：这里可以输入很长很长很长很长很长很长很长很长很差的摘要</span></p><p style="line-height:1.5em;"><strong>标题 1</strong></p><p style="text-indent:2em;"><span style="font-size:14px;" class="ue_t">这里可以输入很多内容，可以图文混排，可以有列表等。</span></p><p style="line-height:1.5em;"><strong>标题 2</strong></p><p style="text-indent:2em;"><span style="font-size:14px;" class="ue_t">来个列表瞅瞅：</span></p><ol style="list-style-type:lower-alpha;"><li><p class="ue_t">列表 1</p></li><li><p class="ue_t">列表 2</p></li><ol style="list-style-type:lower-roman;"><li><p class="ue_t">多级列表 1</p></li><li><p class="ue_t">多级列表 2</p></li></ol><li><p class="ue_t">列表 3<br /></p></li></ol><p style="line-height:1.5em;"><strong>标题 3</strong></p><p style="text-indent:2em;"><span style="font-size:14px;" class="ue_t">来个文字图文混排的</span></p><p style="text-indent:2em;"><span style="font-size:14px;" class="ue_t">这里可以多行</span></p><p style="text-indent:2em;"><span style="font-size:14px;" class="ue_t">右边是图片</span></p><p style="text-indent:2em;"><span style="font-size:14px;" class="ue_t">绝对没有问题的，不信你也可以试试看</span></p><p><br /></p>'
    },
    {
        "pre":"pre4.png",
        'title':lang.title,
        'preHtml':'<section class="" style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"><section style="margin-right: auto;margin-left: auto;max-width: 100%;box-sizing: border-box;border: 0px;text-align: center;word-wrap: break-word !important;"><section style="margin-right: auto;margin-left: auto;max-width: 100%;display: inline-block;width: 42px;height: 50px;vertical-align: top;line-height: 50px;color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;background-image: url(images/red_number.png);background-size: auto 50px;background-repeat: no-repeat;"><p style="max-width: 100%;line-height: 10px;min-height: 1em;font-size: 20px;border: 0px;box-sizing: border-box !important;word-wrap: break-word !important;">0<span class="" style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;">1</span></p></section><section style="margin-right: auto;margin-left: auto;max-width: 100%;display: inline-block;text-align: left;height: 50px;box-sizing: border-box !important;word-wrap: break-word !important;background-image: url(images/number_title_bg.png);background-size: auto 50px;background-repeat: no-repeat;"><section style="padding-left: 10px;max-width: 100%;box-sizing: border-box;display: inline-block;line-height: 50px;color: rgb(51, 51, 51);vertical-align: top;word-wrap: break-word !important;"><p style="max-width: 100%;line-height: 22px;min-height: 1em;font-size: 14px;border: 0px;box-sizing: border-box !important;word-wrap: break-word !important;"><strong style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-family: 微软雅黑;text-align: justify;white-space: pre-wrap;font-size: 16px;box-sizing: border-box !important;word-wrap: break-word !important;">年后招工难</span></strong></p></section></section><section style="margin-right: auto;margin-left: auto;max-width: 100%;display: inline-block;text-align: left;width: 17px;height: 50px;vertical-align: top;box-sizing: border-box !important;word-wrap: break-word !important;background-image: url(images/number_title_bg_end.png);background-size: auto 50px;background-repeat: no-repeat;"></section></section></section>',
        'html':'<section class="" style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"><section style="margin-right: auto;margin-left: auto;max-width: 100%;box-sizing: border-box;border: 0px;text-align: center;word-wrap: break-word !important;"><section style="margin-right: auto;margin-left: auto;max-width: 100%;display: inline-block;width: 42px;height: 50px;vertical-align: top;line-height: 50px;color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;background-image: url(images/red_number.png);background-size: auto 50px;background-repeat: no-repeat;"><p style="max-width: 100%;line-height: 10px;min-height: 1em;font-size: 20px;border: 0px;box-sizing: border-box !important;word-wrap: break-word !important;">0<span class="" style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;">1</span></p></section><section style="margin-right: auto;margin-left: auto;max-width: 100%;display: inline-block;text-align: left;height: 50px;box-sizing: border-box !important;word-wrap: break-word !important;background-image: url(images/number_title_bg.png);background-size: auto 50px;background-repeat: no-repeat;"><section style="padding-left: 10px;max-width: 100%;box-sizing: border-box;display: inline-block;line-height: 50px;color: rgb(51, 51, 51);vertical-align: top;word-wrap: break-word !important;"><p style="max-width: 100%;line-height: 22px;min-height: 1em;font-size: 14px;border: 0px;box-sizing: border-box !important;word-wrap: break-word !important;"><strong style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-family: 微软雅黑;text-align: justify;white-space: pre-wrap;font-size: 16px;box-sizing: border-box !important;word-wrap: break-word !important;">年后招工难</span></strong></p></section></section><section style="margin-right: auto;margin-left: auto;max-width: 100%;display: inline-block;text-align: left;width: 17px;height: 50px;vertical-align: top;box-sizing: border-box !important;word-wrap: break-word !important;background-image: url(images/number_title_bg_end.png);background-size: auto 50px;background-repeat: no-repeat;"></section></section></section><p style="max-width: 100%;min-height: 1em;text-align: justify;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-family: 微软雅黑;box-sizing: border-box !important;word-wrap: break-word !important;">每年过完年，都会有报道，说什么企业招工难。</span></p><p style="max-width: 100%;min-height: 1em;text-align: justify;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-family: 微软雅黑;box-sizing: border-box !important;word-wrap: break-word !important;">现在呢？反过来了，没有年轻人再想进工厂当工人了，老板们也牛不起来了，舔着脸好话说尽，连哄带骗的，招人也难。</span></p><p style="max-width: 100%;min-height: 1em;text-align: justify;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-family: 微软雅黑;box-sizing: border-box !important;word-wrap: break-word !important;">一大批中小制造业如今世道不好，之所以还能勉强维持，是因为有一批60后、70后的农民工在支撑，他们上有老下有小，不敢歇，也不敢闹，他们拼命干活的动力是子女绝不再进厂当工人，能够改变家族命运。</span></p><p style="max-width: 100%;min-height: 1em;text-align: justify;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-family: 微软雅黑;box-sizing: border-box !important;word-wrap: break-word !important;">现在的80后、90后，进厂打工主要是找对象谈恋爱，顺便长点见识，对于学习专业、钻研技术，根本不感兴趣。</span></p><p style="max-width: 100%;min-height: 1em;text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><img class="" data-copyright="0" data-ratio="0.6666666666666666" data-s="300,640" data-src="https://mmbiz.qpic.cn/mmbiz_jpg/B03BUUOU1bnHONMdXK5aBX64tzqP4G1GxKJWlQxDynQX2GBDM6jdOATaVA71n8DTTymcwAMU8r5RWQD99jlSLQ/640?wx_fmt=jpeg" data-type="jpeg" data-w="1080" style="line-height: 1.6; box-sizing: border-box !important; word-wrap: break-word !important; visibility: visible !important; width: auto !important; height: auto !important;" _width="auto" src="https://mmbiz.qpic.cn/mmbiz_jpg/B03BUUOU1bnHONMdXK5aBX64tzqP4G1GxKJWlQxDynQX2GBDM6jdOATaVA71n8DTTymcwAMU8r5RWQD99jlSLQ/640?wx_fmt=jpeg&amp;tp=webp&amp;wxfrom=5&amp;wx_lazy=1" data-fail="0"></p></div><section class="" style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"><section style="margin-right: auto;margin-left: auto;max-width: 100%;box-sizing: border-box;border: 0px;text-align: center;word-wrap: break-word !important;"><section style="margin-right: auto;margin-left: auto;max-width: 100%;display: inline-block;width: 42px;height: 50px;vertical-align: top;line-height: 50px;color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;background-image: url(images/red_number.png);background-size: auto 50px;background-repeat: no-repeat;"><p style="max-width: 100%;line-height: 10px;min-height: 1em;font-size: 20px;border: 0px;box-sizing: border-box !important;word-wrap: break-word !important;">0<span class="" style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;">2</span></p></section><section style="margin-right: auto;margin-left: auto;max-width: 100%;display: inline-block;text-align: left;height: 50px;box-sizing: border-box !important;word-wrap: break-word !important;background-image: url(images/number_title_bg.png);background-size: auto 50px;background-repeat: no-repeat;"><section style="padding-left: 10px;max-width: 100%;box-sizing: border-box;display: inline-block;line-height: 50px;color: rgb(51, 51, 51);vertical-align: top;word-wrap: break-word !important;"><p style="max-width: 100%;line-height: 22px;min-height: 1em;font-size: 14px;border: 0px;box-sizing: border-box !important;word-wrap: break-word !important;"><strong style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-family: 微软雅黑;text-align: justify;white-space: pre-wrap;font-size: 16px;box-sizing: border-box !important;word-wrap: break-word !important;">年后招工难</span></strong></p></section></section><section style="margin-right: auto;margin-left: auto;max-width: 100%;display: inline-block;text-align: left;width: 17px;height: 50px;vertical-align: top;box-sizing: border-box !important;word-wrap: break-word !important;background-image: url(images/number_title_bg_end.png);background-size: auto 50px;background-repeat: no-repeat;"></section></section></section><p style="max-width: 100%;min-height: 1em;text-align: justify;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-family: 微软雅黑;box-sizing: border-box !important;word-wrap: break-word !important;">每年过完年，都会有报道，说什么企业招工难。</span></p><p style="max-width: 100%;min-height: 1em;text-align: justify;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-family: 微软雅黑;box-sizing: border-box !important;word-wrap: break-word !important;">现在呢？反过来了，没有年轻人再想进工厂当工人了，老板们也牛不起来了，舔着脸好话说尽，连哄带骗的，招人也难。</span></p><p style="max-width: 100%;min-height: 1em;text-align: justify;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-family: 微软雅黑;box-sizing: border-box !important;word-wrap: break-word !important;">一大批中小制造业如今世道不好，之所以还能勉强维持，是因为有一批60后、70后的农民工在支撑，他们上有老下有小，不敢歇，也不敢闹，他们拼命干活的动力是子女绝不再进厂当工人，能够改变家族命运。</span></p><p style="max-width: 100%;min-height: 1em;text-align: justify;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-family: 微软雅黑;box-sizing: border-box !important;word-wrap: break-word !important;">现在的80后、90后，进厂打工主要是找对象谈恋爱，顺便长点见识，对于学习专业、钻研技术，根本不感兴趣。</span></p><p style="max-width: 100%;min-height: 1em;text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><img class="" data-copyright="0" data-ratio="0.6666666666666666" data-s="300,640" data-src="https://mmbiz.qpic.cn/mmbiz_jpg/B03BUUOU1bnHONMdXK5aBX64tzqP4G1GxKJWlQxDynQX2GBDM6jdOATaVA71n8DTTymcwAMU8r5RWQD99jlSLQ/640?wx_fmt=jpeg" data-type="jpeg" data-w="1080" style="line-height: 1.6; box-sizing: border-box !important; word-wrap: break-word !important; visibility: visible !important; width: auto !important; height: auto !important;" _width="auto" src="https://mmbiz.qpic.cn/mmbiz_jpg/B03BUUOU1bnHONMdXK5aBX64tzqP4G1GxKJWlQxDynQX2GBDM6jdOATaVA71n8DTTymcwAMU8r5RWQD99jlSLQ/640?wx_fmt=jpeg&amp;tp=webp&amp;wxfrom=5&amp;wx_lazy=1" data-fail="0"></p>'
    }

];