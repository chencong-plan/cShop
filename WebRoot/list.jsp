<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset=utf-8>
<meta http-equiv=x-ua-compatible content="ie=edge">
<meta name=viewport content="width=device-width,initial-scale=1">
<link rel=dns-prefetch href="resourses/bootstrap/css/bootstrap.css" />

<title>商品列表--电商平台</title>
<link
	href="//s.happymmall.com/mmall_fe/dist/css/common.css?9dd65f513c150dbd6188"
	rel="stylesheet">
<link
	href="//s.happymmall.com/mmall_fe/dist/css/list.css?9dd65f513c150dbd6188"
	rel="stylesheet">

<!-- 加入jquery -->
<script type="text/javascript" src="resourses/jquery-3.2.1.min.js"></script>
<!-- 映入bootstrap的分页 -->
<script type="text/javascript" src="resourses/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript">
	$(function() {
		$.ajax({
			url : "checkLogin!checkLogin",
			data : {},
			type : "POST",
			success : function(data) {
				var result = JSON.parse(data);
				if (result.status == "10") {
					//未登录,跳转去登陆界面
					$(".not-login").css("display", "block");
					$(".login").css("display", "none");
				}
				if (result.status == "0") {
					//登录 显示用户名 等一系列信息
					$(".not-login").css("display", "none");
					$(".login").css("display", "block");
					$("#username").html(result.data.username);
				}
			}
		});
		//登录
		$(".link-login").click(function() {
			window.location.href = "user/userlogin.jsp";
		});
		//注册
		$(".link-register").click(function() {
			window.location.href = "user/register.jsp";
		});

		/* 进来后加载该分类数据 */
		//获取到地址栏以及地址栏参数
		(function($) {
			$.getUrlParam = function(name) {
				var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
				var r = window.location.search.substr(1).match(reg);
				if (r != null)
					return unescape(r[2]);
				return null;
			}
		})(jQuery);
		//alert(window.location.href);
		var categoryId = $.getUrlParam("categoryId");
		var keyword = $.getUrlParam("keyword");

		//alert($.getUrlParam("categoryId"));
		$.ajax({
			url : "products!categories",
			data : {
				"categoryId" : categoryId,
				"keyword" : keyword
			},
			type : "POST",
			success : function(data) {
				var result = JSON.parse(data);
				//alert(result.status);
				//加载到数据
				if (result.status == "0") {
					$(".p-list-con").css("display", "block");
					$(".pagination").css("display", "block");
					$(".loading").css("display", "none");
					$(".err-tip").css("display","none");
				} else {
					//没有数据
					$(".err-tip").css("display","block");
					$(".loading").css("display", "block");
				}
			}
		});

	});
</script>

</head>
<body>
	<div class=site-nav>
		<div class=w>
			<div class=user-info>
				<span class="site-user not-login"> <span
					class="link link-login">登录</span> <span class="link link-register">注册</span>
				</span> <span class="site-user login"> <span class=link-text>欢迎，<span
						class="username" id="username"></span></span> <span
					class="link link-logout">退出</span>
				</span>
			</div>
			<ul class=nav-list>
				<li class=nav-item><a class=link href="user/cart.jsp"> <i
						class="fa fa-shopping-cart"></i> 购物车(<span class=cart-count>0</span>)
				</a></li>
				<li class=nav-item><a class=link href="user/order-list.jsp">我的订单</a></li>
				<li class=nav-item><a class=link href="user/user-center.jsp">我的MMall</a></li>
				<li class=nav-item><a class=link href="user/about.jsp">关于MMall</a></li>
			</ul>
		</div>
	</div>
	<div class=header>
		<div class=w>
			<a class=logo href="index.jsp">ccoder</a>
			<div class=search-form>
				<input class=search-input id="search-input" id="search-input"
					placeholder=请输入商品名称 />
				<button class=search-btn id=search-btn>搜索</button>
			</div>
		</div>
	</div>
	<div class="crumb">
		<div class="w">
			<div class="crumb-list">
				<a href="./index.html" class="crumb-item">MMall</a> <span>></span> <span
					class="crumb-item">商品列表</span>
			</div>
		</div>
	</div>
	<div class="list-wrap w">
		<ul class="sorter-con">
			<li class="sorter-item active" data-type="default"><span>推荐排序</span>
			</li>
			<li class="sorter-item" data-type="price"><span>价格</span> <i
				class="fa fa-sort-asc"></i> <i class="fa fa-sort-desc"></i></li>
		</ul>
		<!-- list容器 -->
		<ul class="p-list-con">
			<p class="err-tip">很抱歉，没有找到您需要的商品。</p>
			<li>
				<div class="loading"></div>
			</li>
			<c:forEach items="${sessionScope.productLists}" var="product">
				<li class="p-item">
					<div class="p-img-con">
						<a class="link" href="getProduct!getProductById?productId=${product.id}"
							target="_bank"> <img class="p-img"
							src="image/product/${product.mainImage}"
							alt="${product.name} ${product.subtitle}">
						</a>
					</div>
					<div class="p-price-con">
						<span class="p-price">￥${product.price}</span>
					</div>
					<div class="p-name-con">
						<a href="getProduct!getProductById?productId=${product.id}" target="_bank"
							class="p-name" title="${product.name} ${product.subtitle}">${product.name}
							${product.subtitle}</a>
					</div>
				</li>
			</c:forEach>

		</ul>
		<!-- 分页容器 -->
		<div class="pagination">
		</div>
	</div>
	<div class=footer>
		<div class=w>
			<div class=links>
				<a class=link href=http://www.imooc.com/ >慕课网</a> | <a class=link
					href=http://www.baidu.com/ >百度</a> | <a class=link
					href=http://www.zhihu.com/ >知乎</a> | <a class=link
					href=http://www.taobao.com/ >淘宝</a>
			</div>
			<p class=copyright>Copyright © 2017 happymmall.com All Rights
				Reserved</p>
		</div>
	</div>
</body>
</html>
