<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
<meta charset=utf-8>
<meta http-equiv=x-ua-compatible content="ie=edge">
<meta name=viewport content="width=device-width,initial-scale=1">
<link rel=dns-prefetch href="../resourses/bootstrap/css/bootstrap.css" />

<title>购物车--电商平台</title>
<link
	href="//s.happymmall.com/mmall_fe/dist/css/common.css?9dd65f513c150dbd6188"
	rel="stylesheet">
<link
	href="//s.happymmall.com/mmall_fe/dist/css/cart.css?9dd65f513c150dbd6188"
	rel="stylesheet">

<!-- 加入jquery -->
<script type="text/javascript" src="../resourses/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$.ajax({
			url : "../checkLogin!checkLogin",
			data : {},
			type : "POST",
			success : function(data) {
				var result = JSON.parse(data);
				if (result.status == "10") {
					//未登录,跳转去登陆界面
					window.location.href = "userlogin.jsp";

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
		//退出登录
		$(".link-logout").click(function() {
			$.ajax({
				url : "../userLogout!userLogout",
				data : {},
				type : "POST",
				success : function(data) {
					alert(data);
					var result = JSON.parse(data);
					alert(result.status);
					if (result.status == "0") {
						window.location.reload();
					}

				}
			});
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
				<li class=nav-item><a class=link href="cart.jsp"> <i
						class="fa fa-shopping-cart"></i> 购物车(<span class=cart-count>0</span>)
				</a></li>
				<li class=nav-item><a class=link href="order-list.jsp">我的订单</a></li>
				<li class=nav-item><a class=link href="user-center.jsp">我的MMall</a></li>
				<li class=nav-item><a class=link href="about.jsp">关于MMall</a></li>
			</ul>
		</div>
	</div>
	<div class=header>
		<div class=w>
			<a class=logo href="../index.jsp">ccoder</a>
			<div class=search-form>
				<input class=search-input id=search-input placeholder=请输入商品名称 />
				<button class=search-btn id=search-btn>搜索</button>
			</div>
		</div>
	</div>
	<div class="crumb">
		<div class="w">
			<div class="crumb-list">
				<a href="../index.jsp" class="crumb-item">MMall</a> <span>></span> <span
					class="crumb-item">我的购物车</span>
			</div>
		</div>
	</div>
	<!-- 显示购物车 -->
	<div class="cart-wrap w">
		<!-- 表单头部描述 -->
		<div class="cart-header">
			<table class="cart-table">
				<tbody>
					<tr>
						<th class="cart-cell cell-check">
							<label>
								<input class="cart-select-all" checked="checked" type="checkbox">
								<span>全选</span>
							</label>
						</th>
						<th class="cart-cell cell-info">商品详情</th>
						<th class="cart-cell cell-price">单价</th>
						<th class="cart-cell cell-count">数量</th>
						<th class="cart-cell cell-total">合计</th>
						<th class="cart-cell cell-opera">操作</th>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- 将遍历显示商品信息 -->
		<div class="cart-list">
			<table class="cart-table" data-product-id="34" data-checked="1">
				<tbody>
					<c:choose>
						<c:when test="${empty sessionScope.cartMap}">
							<p class="err-tip">购物车空空的</p>
						</c:when>
						<c:otherwise>
						<c:forEach items="${sessionScope.cartMap.productMap}" var="cart">
							<tr>
							<td class="cart-cell cell-check">
								<input type="checkbox" class="cart-select" checked="checked">
							</td>
							<td class="cart-cell cell-img">
								<a href="" target="_bank">
									<img class="p-img" src="image/product/${cart.key.mainImage}" alt="${cart.key.subtitle}">
								</a>
							</td>
							<td class="cart-cell cell-info">
								<a class="link p-name" href="getProduct!getProductById?productId=${cart.key.id }" target="_bank">${cart.key.subtitle}</a>
							</td>
							<td class="cart-cell cell-price">￥${cart.key.price }</td>
							<td class="cart-cell cell-count">
								<span class="count-btn" data-opera-type="minus" >-</span>
								<input class="count-input" data-max="3434" value="1">
								<span class="count-btn" data-opera-type="plus">+</span>
							</td>
							<td class="cart-cell cell-total">￥${sessionScope.cartMap.totalPricce}</td>
							<td class="cart-cell cell-opera">
								<a class="link cart-delete">删除</a>
							</td>
						</tr>
						</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
		<div class="cart-footer"></div>
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
