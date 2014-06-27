<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title><{$_TITLE}></title>
<meta name="keywords" content="<{$_KEYWORDS}>" />
<meta name="description" content="<{$_DESCRIPTION}>" />
<script>
	document
			.write('<script charset="utf-8"'
					+ ' type="text/javascript" src="http://www.res.meizu.com/resources/www/js/mz-config.js?v=201405270940'
					+ '"></'+'script>');
</script>
<script>
	loadResource("common/css/default/mzhead20130905.css", "hk");
	loadResource("common/js/site/M20130902.js");
</script>
<script>
	loadResource("common-pkg/css/juqery-ui.css");
	loadResource("common/css/default/control_part.css");
	loadResource("pkg/css/common-www.css", "hk");
	loadResource("www/css/default/mz-web-0626.css", "hk");
</script>
</head>
<body>
	<script type="text/javascript">
		var _isCht = 'false';
		var _t_login = '登录';
		var _t_logout = '退出';
		var _t_actmgr = '账户管理';
		var _t_reg = '注册';
		var _t_orderMsg = '我的订单';
		var _register = "https://member.meizu.com/register.jsp?service=www&appuri=http%3A%2F%2Fwww.meizu.com%2Flogin&useruri=";
		var _login = "https://member.meizu.com/login/login.html?service=www&appuri=http%3A%2F%2Fwww.meizu.com%2Flogin&useruri=";

		var _loginDom = '';
		if (_isCht === 'true') {
			_loginDom = "<span><div class='custHead'></div><a id='mzCustName' title='"+_t_actmgr
				+"' href='https://flyme.meizu.com/account/actmanage.jsp' class='longdot' hidefocus></a>"
					+ "<span class='line_head'>|</span>"
					+ "<a id='mzLogout' href='javascript:void(0);' thref='/logout.jsp?useruri=' hidefocus>"
					+ _t_logout + "</a></span>";
		} else {
			_loginDom = "<span><div class='custHead'></div><a id='mzCustName' title='"+_t_actmgr
				+"' href='https://flyme.meizu.com/account/actmanage.jsp' class='longdot' hidefocus></a>"
					+ "<span class='line_head'>|</span><a id='orderNum' href='http://store.meizu.com/myorder/index.htm' thref='' hidefocus>"
					+ _t_orderMsg
					+ "<span class='num'>0</span></a><span class='line_head'>|</span>"
					+ "<a id='mzLogout' href='javascript:void(0);' thref='/logout.jsp?useruri=' hidefocus>"
					+ _t_logout + "</a></span>";
		}

		var _unLoginDom = "<span class='unlogin'><div class='custHead'></div><div class='atag' id='mzLoginArea4'>"
				+ "<a id='mzLogin' href='javascript:void(0);' thref='"
				+ _login
				+ "' hidefocus>"
				+ _t_login
				+ "</a></div>"
				+ "<div  id='mzLoginArea3'>/</div>"
				+ "<div class='atag' id='mzLoginArea2'><a id='mzRegister' href='javascript:void(0);' thref='"
				+ _register + "' hidefocus>" + _t_reg + "</a></div></span>";

		function getFlymeAndOrderNumber(data) {
			var _reply = data["reply"];
			var _error = _reply["error"];
			if (_error != null && _error != undefined) {
				window.document.getElementById("mzCust").innerHTML = _unLoginDom;
			} else {
				window.document.getElementById("mzCust").innerHTML = _loginDom;

				var _flyme = _reply["flyme"];
				var _orderNum = _reply["order_number"];
				if (_flyme != null && _flyme != undefined) {
					_flyme = _flyme.length > 10 ? _flyme.slice(0, 9) + "..."
							: _flyme;
					window.document.getElementById("mzCustName").innerHTML = _flyme;
				}

				if (_orderNum != null && _orderNum != undefined
						&& _isCht != 'true') {
					window.document.getElementById("orderNum").innerHTML = _t_orderMsg
							+ "<span class='num'>" + _orderNum + "</span>";
				}
			}

		}
	</script>

	<div class="mz_header" id="mzHeader">
		<div class="m_top">
			<div class="logo">
				<a href="http://www.meizu.com/index.html"></a>
			</div>
			<ul class="c_menu">

				<li><a href="http://store.meizu.com" class="r_store" hidefocus><span
						class="">在线商店</span><span class="hideLeft"></span></a></li>

				<li><a href="http://www.meizu.com/products/mx3fun.html"
					class="r_prd " hidefocus><span class="">产品</span><span
						class="hideLeft"></span></a></li>
				<li><a href="http://retail.meizu.com" class="r_buy" hidefocus><span
						class="">专卖店</span><span class="hideLeft"></span></a></li>
				<li><a href="http://www.meizu.com/services" class="r_tech"
					hidefocus><span class="">服务支持</span><span class="hideLeft"></span></a></li>
				<li><a href="http://flyme.meizu.com" class="r_flyme" hidefocus><span
						class="">Flyme</span><span class="hideLeft"></span></a></li>
				<li><a href="http://bbs.meizu.cn" target="_blank" class="r_bbs"
					hidefocus><span class="">互动社区</span><span class="hideLeft"></span></a></li>
			</ul>


			<div id='mzCust'>
				<span class="unlogin">
					<div class='custHead'></div>
					<div class='atag' id='mzLoginArea4'>
						<a id='mzLogin' href='javascript:void(0);'
							thref='https://member.meizu.com/login/login.html?service=www&appuri=http%3A%2F%2Fwww.meizu.com%2Flogin&useruri='
							hidefocus>登录</a>
					</div>
					<div id='mzLoginArea3'>/</div>
					<div class='atag' id='mzLoginArea2'>
						<a id='mzRegister' href='javascript:void(0);'
							thref='https://member.meizu.com/register.jsp?service=www&appuri=http%3A%2F%2Fwww.meizu.com%2Flogin&useruri='
							hidefocus>注册</a>
					</div>
				</span>
			</div>

		</div>
	</div>


	<script>
		var G_isCht = false;
		var G_logouting = '正在退出...';
		function jM_fn_loaded() {

			function bind(je, t, fn) {
				var e = je.get(0);
				if (e.addEventListener) {
					e.addEventListener(t, fn, false);
				} else if (e.attachEvent) {
					e.attachEvent("on" + t, fn);
				}
			}

			function handLogin(id) {
				var jdom = jM(id);
				if (!jdom.get(0))
					return;
				jdom
						.attr(
								'thref',
								(jdom.attr('thref') + encodeURIComponent(window.location.href)));
				bind(jdom, 'click', function() {
					window.location.href = jdom.attr('thref');
					return false;
				});
			}
			handLogin('mzRegister');
			handLogin('mzLogin');
			handLogin('mzLogout');

			var f = jM('flymeSearch');
			if (f.get(0)) {
				var sv = jM('flymeSearchBG').attr('sv'), tag = "搜索联系人", svalue = '';
				switch (sv) {
				case ('1'):
					tag = "搜索应用中心";
					svalue = '/search/0?key=';
					break;
				case ('10'):
					tag = storesRes.searchtag;
					break
				}
				if (f.get(0).value == null || f.get(0).value == '')
					f.get(0).value = tag;
				if (sv == '1') {
					jM('flymeSearchBtn')
							.B(
									'click',
									(function(data) {
										return function() {
											var _this = jM('flymeSearch')
													.get(0), val = _this.value;
											if (val == ""
													|| val.trim() == ""
													|| _this.className == "S_out") {
												_this.focus();
												return false
											}
											window.location.href = data
													+ encodeURIComponent(val);
										};
									})(svalue));
				}
				f.B('focus', function() {
					if (this.value == tag) {
						this.value = '';
					}
					this.className = 'S_foucs';
				}).B('blur', function() {
					var val = this.value;
					if (val == '' || val == tag) {
						this.className = 'S_out'
					}
					if (val == '') {
						this.value = tag
					}
				}).B('keyup', function(e) {
					if (e.keyCode == 13 && this.id == "flymeSearch") {
						jM('flymeSearchBtn').get(0).click();
					}
				});
			}

		}
	</script>


	<script type="text/javascript">
		function getCookie(objName) {
			var arrStr = document.cookie.split("; ");
			for ( var i = 0; i < arrStr.length; i++) {
				var temp = arrStr[i].split("=");
				if (temp[0] == objName)
					return unescape(temp[1]);
			}
		}

		var _isLogin = getCookie("_islogin");
		if (_isLogin === 'true'
				|| window.location.href.indexOf('www.meizu.cn') > -1) {
			window.document.getElementById("mzCust").innerHTML = _loginDom;

			window.document
					.write("<script src='https://member.meizu.com/service/accounts/fetchOrder.jsonp?callback=getFlymeAndOrderNumber&v="
							+ Math.random() + "'><\/script>");

		} else {
			window.document.getElementById("mzCust").innerHTML = _unLoginDom;
		}
	</script>
	<style>
@charset 'utf-8'; 

.left {
	float: left;
}

.pos_re {
	position: relative;
}

.clear {
	zoom: 1;
}

.clear:before,.clear:after {
	content: '';
	display: table;
}

.clear:after {
	clear: both;
}

i {
	display: inline-block;
}

.i_image1 {
	width: 1080px;
	height: 682px;
	background:
		url(http://www.res.meizu.com/resources/www_image/fcc19e5d-aee6-483b-aefd-0a7891a16a75.jpg)
		no-repeat;
}

.i_image2 {
	width: 657px;
	height: 295px;
	background: url(http://www.res.meizu.com/resources/www_image/1599yb.jpg)
		no-repeat;
}

.i_image3 {
	width: 657px;
	height: 295px;
	background:
		url(http://www.res.meizu.com/resources/www_image/Mx3%20pc.jpg)
		no-repeat;
}

.i_image4 {
	width: 294px;
	height: 294px;
	background:
		url(http://www.res.meizu.com/resources/www_image/meizu618.jpg)
		no-repeat;
}

.i_image5 {
	width: 294px;
	height: 138px;
	background: url(http://www.res.meizu.com/resources/www_image/weibo.jpg)
		no-repeat;
}

.i_image6 {
	width: 294px;
	height: 148px;
	background: url(http://www.res.meizu.com/resources/www_image/weixin.jpg)
		no-repeat;
}

.mz_home {
	width: 1080px;
	margin: 0 auto;
	position: relative;
	background: #fff;
}

.home_content {
	width: 960px;
	margin: 0 auto;
}

.home_content img,.product_other .first a,.product_other .second a {
	display: block;
	font-size: 0;
}

.product_other {
	width: 657px;
}

.preorder {
	position: absolute;
	top: 314px;
	left: 147px;
	display: block;
	width: 255px;
	height: 60px;
}

.home_aside {
	margin-left: 9px;
	width: 294px;
	display: inline;
}

.home_aside .weibo,.home_aside .weixin,.product_other .second {
	margin-top: 9px;
}

.activity {
	width: 294px;
	height: 295px;
}

.activity a {
	display: block;
	cursor: pointer;
}

.weibo .go_qq,.weibo .go_sina {
	position: absolute;
	top: 60px;
	width: 40px;
	height: 40px;
	background: url(about:blank);
}

.weibo .go_qq {
	left: 195px;
}

.weibo .go_sina {
	left: 240px;
}

.weibo .go_weixin {
	display: none;
}

.btm_layer {
	position: absolute;
	left: 0;
	top: 622px;
	height: 60px;
	width: 1080px;
}

.mz_footer a.sina,.mz_footer a.tencent {
	display: none;
}
</style>
	<div class='mz_home'>
		<a href='http://store.meizu.com/'><i class='i_image1'></i></a>
		<div class='home_content'>
			<div class='home_main clear'>
				<div class='product_other left'>
					<div class='first'>
						<a href='http://store.meizu.com/category-20.html'><i
							class='i_image2'></i></a>
					</div>
					<div class='second'>
						<a href='http://bbs.meizu.cn/viewthread.php?tid=4588986'><i
							class='i_image3'></i></a>
					</div>
				</div>
				<div class='home_aside left'>
					<div class='activity pos_re'>
						<a href='http://bbs.meizu.cn/thread-5097270-1-1.html'><i
							class='i_image4'></i></a>
					</div>
					<div class='weibo pos_re'>
						<i class='i_image5'></i> <a href='http://e.t.qq.com/meizu_tech'
							target='_blank' class='go_qq' title='腾讯微博'></a> <a
							href='http://e.weibo.com/meizumobile' target='_blank'
							class='go_sina' title='新浪微博'></a> <a href='javascript:;'
							target='_blank' class='go_weixin' title='微信'></a>
					</div>
					<div class='weixin'>
						<i class='i_image6'></i>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		loadResource("pkg/js/res_www.js", "hk");
		loadResource("common-pkg/js/jquery-module.js");
		loadResource("common-pkg/js/mz-common.js");
		loadResource("pkg/js/www-common.js");
	</script>
</body>
</html>
<style>
div.language_menu {
	-moz-box-shadow: 0px 0px 10px #E1E4E8;
	-webkit-box-shadow: 0px 0px 10px #E1E4E8;
	box-shadow: 0px 0px 10px #E1E4E8;
	-moz-border-radius: 2px;
	-webkit-border-radius: 2px;
	-webkit-border-radius: 2px;
	border-radius: 2px;
	background-color: #FEFEFE;
	position: absolute;
	border: solid 1px #E1E4E8;
	display: none;
	overflow: hidden;
}

/**navigate**/
.language {
	background-position: -198px -56px;
	display: inline-block;
	cursor: default;
}

.language img {
	margin: -4px 7px 0 0;
	*margin-top: 0px;
	vertical-align: middle;
	width: 17px;
}

.language_menu {
	bottom: 89px;
	width: 140px;
	height: 200px;
	z-index: 2000;
}

.language_menu a {
	display: block;
	height: 40px;
	line-height: 40px;
	width: 118px;
	margin: 0px auto;
	text-decoration: none;
	border-bottom: solid 1px #E4E7E9;
	font-size: 14px;
	color: #000000;
	text-align: left;
	padding-left: 10px;
}

.language_menu a.ClobalItem:link {
	color: #000000;
}

.language_menu a.ClobalItem:visited {
	color: #000000;
}

.language_menu a.ClobalItem:hover {
	color: #515151;
}

.language_menu a.checked,.language_menu a.checked:hover {
	color: #1daeed;
	text-decoration: none;
}
/**page footer**/
.mz_footer {
	position: relative;
	z-index: 2000;
	width: 1080px;
	margin: 0 auto;
	text-align: center;
	padding: 30px 0 30px;
	background: #fff;
}

.mz_footer p {
	padding: 10px;
}

.footline {
	background-color: #888;
	margin: 0px 5px;
	width: 1px;
	height: 10px;
}

.copyright {
	font-size: 12px;
}

a.sina {
	width: 20px;
	height: 20px;
	background-position: 0px -88px;
	display: inline-block;
	text-decoration: none;
	vertical-align: middle;
	margin-left: 18px;
}

a.tencent {
	width: 20px;
	height: 20px;
	background-position: -20px -88px;
	display: inline-block;
	text-decoration: none;
	vertical-align: middle;
	margin-left: 10px;
}

a.sina:hover {
	background-position: 0px -108px;
	text-decoration: none;
}

a.tencent:hover {
	background-position: -20px -108px;
	text-decoration: none;
}

.footcap {
	padding-left: 20px;
}
/**hk**/
a.facebook {
	width: 20px;
	height: 20px;
	background-position: -134px -88px;
	display: inline-block;
	text-decoration: none;
	vertical-align: middle;
	margin-left: 10px;
}

a.twitter {
	width: 20px;
	height: 20px;
	background-position: -161px -88px;
	display: inline-block;
	text-decoration: none;
	vertical-align: middle;
	margin-left: 10px;
}

a.facebook:hover {
	background-position: -134px -108px;
}

a.twitter:hover {
	background-position: -161px -108px;
}

.footcap img {
	background:
		url(http://common.res.meizu.com/resources/common/images/default/mzhead/head20121226.png)
		repeat-x;
	width: 20px;
	height: 20px;
}

.footcap img.cap1 {
	background-position: -61px -88px
}

.footcap img.cap2 {
	background-position: -95px -88px
}

.longdot {
	white-space: nowrap;
	overflow: hidden;
	-o-text-overflow: ellipsis;
	text-overflow: ellipsis;
}

@media screen and (max-width: 640px) {
	.mz_footer {
		width: auto;
	}
}
</style>
<div class="mz_footer clear_both">
	<div id="globalContainer" class="language_menu">
		<a href="http://www.meizu.cn" title="简体中文" class="checked">简体中文</a> <a
			href="http://www.meizu.com.hk" title="繁體中文" class="ClobalItem">繁體中文</a>
		<a href="http://en.meizu.com" title="English" class="ClobalItem">English</a>
		<a href="http://ru.meizu.com" title="Русский" class="ClobalItem">Русский</a>
		<a href="http://il.meizu.com" title="עברית" class="ClobalItem"
			style="border-width: 0px;">עברית</a>
	</div>
	<p>
		<a href="http://www.meizu.com/about.html" target="_blank" title="关于魅族">关于魅族</a>
		<img class="footline"
			src="http://common.res.meizu.com/resources/common/images/default/space.gif" />
		<a href="http://www.meizu.com/legalStatement.html" target="_blank"
			title="法律声明">法律声明</a> <img class="footline"
			src="http://common.res.meizu.com/resources/common/images/default/space.gif" />
		<a href="http://www.meizu.com/job.html" target="_blank" title="工作机会">工作机会</a>
		<img class="footline"
			src="http://common.res.meizu.com/resources/common/images/default/space.gif" />
		<a href="http://www.meizu.com/contact.html" target="_blank"
			title="联系我们">联系我们</a> <img class="footline"
			src="http://common.res.meizu.com/resources/common/images/default/space.gif" />
		<a href="javascript:void(0);" id="globalName" class='language'
			title="简体中文"><img
			src='http://common.res.meizu.com/resources/common/images/default/earth/earth.png' />简体中文&nbsp;&nbsp;</a>
		<a href="http://weibo.com/meizumobile" target="_blank" class='sina'
			title="新浪微博"></a> <a href="http://t.qq.com/meizu_tech"
			target="_blank" class='tencent' title=腾讯微博></a>

	</p>

	<div class="copyright">
		<span> &copy;2014 Meizu Telecom Equipment Co., Ltd. All rights
			reserved.</span> <a href="http://www.miitbeian.gov.cn/" target="_blank">备案号：粤ICP备13003602号-2</a>
		<a href="http://www.res.meizu.com/resources/www/images/icp2.jpg"
			target="_blank">经营许可证编号：粤B2-20130198</a> <a
			href="http://www.res.meizu.com/resources/www/images/com_licence.jpg"
			target="_blank">营业执照</a> <span class='footcap'> <a
			href="http://210.76.65.188/" rel="nofollow" target="_blank"><img
				src="http://common.res.meizu.com/resources/common/images/default/space.gif"
				class='cap1' border="0"></a> <a
			href="http://210.76.65.188/webrecord/innernet/Welcome.jsp?bano=4404013010531"
			rel="nofollow" target="_blank"><img border="0"
				src="http://common.res.meizu.com/resources/common/images/default/space.gif"
				class='cap2'></a>
		</span>

	</div>
</div>







<!-- 百度统计  -->
<!--
<script type="text/javascript">
(function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'hm.baidu.com/h.js?5820e03d1cb3467b14a06602e491b325';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();
</script>
 -->


<!-- 统计 -->

<script type="text/javascript">
	;
	(function() {
		var ga = document.createElement('script'), s;
		ga.type = 'text/javascript';
		ga.src = ('https:' == document.location.protocol ? 'https://'
				: 'http://')
				+ 'tongji.meizu.com/js/flow.js';
		s = document.getElementsByTagName('script')[0];
		s.parentNode.insertBefore(ga, s);
	})();
</script>


<!-- google流量统计 -->
<script type="text/javascript">
	(function(i, s, o, g, r, a, m) {
		i['GoogleAnalyticsObject'] = r;
		i[r] = i[r] || function() {

			(i[r].q = i[r].q || []).push(arguments)
		}, i[r].l = 1 * new Date();
		a = s.createElement(o),

		m = s.getElementsByTagName(o)[0];
		a.async = 1;
		a.src = g;
		m.parentNode.insertBefore(a, m)

	})(window, document, 'script', '//www.google-analytics.com/analytics.js',
			'ga');

	ga('create', 'UA-51193582-1', 'meizu.com');
	ga('require', 'displayfeatures');
	ga('send', 'pageview');
</script>






<!--品友访客找回 start-->
<script type="text/javascript">
	var _py = _py || [];
	_py.push([ 'a', '3D..WkiRKa1qtELfyrusjDKqN_' ]);
	_py.push([ 'domain', 'stats.ipinyou.com' ]);
	_py.push([ 'e', '' ]);
	-function(d) {
		var s = d.createElement('script'), e = d.body
				.getElementsByTagName('script')[0];
		e.parentNode.insertBefore(s, e), f = 'https:' == location.protocol;
		s.src = (f ? 'https' : 'http') + '://'
				+ (f ? 'fm.ipinyou.com' : 'fm.p0y.cn') + '/j/adv.js';
	}(document);
</script>
<noscript>
	<img src="//stats.ipinyou.com/adv.gif?a=3D..WkiRKa1qtELfyrusjDKqN_&e="
		style="display: none;" />
</noscript>
<!--品友访客找回 end-->