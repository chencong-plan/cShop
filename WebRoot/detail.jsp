<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset=utf-8>
<meta http-equiv=x-ua-compatible content="ie=edge">
<meta name=viewport content="width=device-width,initial-scale=1">
<link rel=dns-prefetch href="resourses/bootstrap/css/bootstrap.css" />

<title>商品详情--电商平台</title>
<link
	href="//s.happymmall.com/mmall_fe/dist/css/common.css?9dd65f513c150dbd6188"
	rel="stylesheet">
<link
	href="//s.happymmall.com/mmall_fe/dist/css/detail.css?9dd65f513c150dbd6188"
	rel="stylesheet">

<script type="text/javascript" src="resourses/jquery-3.2.1.min.js"></script>
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
					//未登录
					$(".not-login").css("display", "block");
					$(".login").css("display", "none");
				}
				if (result.status == "0") {
					//登录 显示用户名
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
				url : "userLogout!userLogout",
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

		//添加进入购物车操作
		//数量增加 减少
		$("#number_add").click(function() {
			var number = parseInt($("#number_value").val());
			var number_stock = parseInt($("#number_stock").html());
			if(number < number_stock){
				$("#show_msg").css("display","none");
				$("#number_value").val(number + 1);
			}
			if(number == number_stock){
				$("#show_msg").css("display","block");
				$("#show_msg").html("别点啦，没那么多货啦");
			}
			
			
		});
		$("#number_sub").click(function() {
			var number = parseInt($("#number_value").val());
			if (number > 1) {
				$("#show_msg").css("display","none");
				$("#number_value").val(number - 1);
			}
			if (number == 1) {
				$("#show_msg").html("我也是有底线的→_→");
				$("#show_msg").css("display", "block");
			}
		});

		//加入购物车操作
		$("#btn_add_cart").click(function() {
			//获得到当前各个输入框的值
			var number = $("#number_value").val(); //加入购物车的数量
			var number_stock = parseInt($("#number_stock").html()); // 当前该商品的库存
			if (number <= number_stock) {
				//加入购物车
				alert(${sessionScope.product.id});
				var productId = $("#product_id").html();
				window.location.href="addCart!addCart?productId="+productId+"&count="+number;
			} else {
				//不允许操作
				$("#show_msg").html("买太多啦，都没库存了");
				$("#show_msg").css("display", "block");
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
				<input class=search-input id=search-input placeholder=请输入商品名称 />
				<button class=search-btn id=search-btn>搜索</button>
			</div>
		</div>
	</div>
	<div class="crumb">
		<div class="w">
			<div class="crumb-list">
				<a href="index.jsp" class="crumb-item">ccoder</a> <span>></span> <span
					class="crumb-item">商品详情</span>
			</div>
		</div>
	</div>
	<div class="page-container w">
		<c:choose>
			<c:when test="${empty sessionScope.product}">
				<p class="err-tip">此商品太淘气，找不到了</p>
			</c:when>
			<c:otherwise>
				<!-- 找到了该商品 -->
				<!-- 显示商品详情 -->
				<span id="product_id" style="display: none">${product.id}</span>
				<div class="intro-wrap clear">
					<!-- 商品图片详情 -->
					<div class="p-img-wrap">
						<div class="main-img-con">
							<img class="main-img" src="image/product/${product.mainImage}">
						</div>
						<ul class="p-img-list">
							<li class="p-img-item"><img class="p-img"
								src="image/product/${product.mainImage}"></li>
							<li class="p-img-item"><img class="p-img"
								src="image/product/${product.mainImage}"></li>
						</ul>
					</div>
					<!-- 商品描述详情 -->
					<div class="p-info-wrap">
						<p class="p-name">${product.subtitle}</p>
						<p class="p-subtitle">${product.name}</p>
						<div class="info-item p-price-con">
							<span class="label">价格:</span> <span class="p-price">￥${product.price}</span>
						</div>
						<div class="info-item p-quantity-con">
							<span class="label" >库存:</span> 
							<span class="p-price" id="number_stock" >${product.stock}</span>
						</div>
						<div class="info-item" style="position: relative;">
							<span class="label">数量:</span> 
							<input class="p-count" readonly="readonly" id="number_value" value="1"> 
							<span class="p-count-btn plus" id="number_add" data-opera-type="plus">+</span>
							<span class="p-count-btn minus" id="number_sub" data-opera-type="minus">-</span> 
							<span id="show_msg" class="label" style="position: absolute; left: 150px;top: 15px;display: none;width:130px;color: red"></span>
						</div>

						<div class="info-item">
							<a class="btn cart-add" id="btn_add_cart">加入购车</a>
						</div>
					</div>
				</div>
				<!-- 显示商品大图片 -->
				<div class="detail-wrap">
					<div class="detail-tab-con">
						<ul class="tab-list">
							<li class="table-item active">商品详情</li>
						</ul>
					</div>
					<div class="detail-con">
						<p>
							<img src="image/product/${product.mainImage}" width="700px"
								height="468px"> <br>
						</p>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
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
