<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset=utf-8 />
<meta http-equiv=x-ua-compatible content="ie=edge">
<meta name=viewport content="width=device-width,initial-scale=1">
<link rel=dns-prefetch href= "resourses/bootstrap/css/bootstrap.css"/>
<title>激活成功--电商平台</title>
<link
	href="//s.happymmall.com/mmall_fe/dist/css/common.css?9dd65f513c150dbd6188"
	rel="stylesheet">
<link
	href="//s.happymmall.com/mmall_fe/dist/css/result.css?9dd65f513c150dbd6188"
	rel="stylesheet">
<script type="text/javascript" src="../resourses/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(".register-success").css("display","block");
	});
</script>
</head>
<body>
	<div class=header-simple>
		<div class=w>
			<a href="../index.jsp" class=logo>ccoder</a>
		</div>
	</div>
	<div class="result-wrap w">
		<div class="result-con register-success">
			<h1 class="result-title">恭喜您，激活成功!</h1>
			<p class="result-content">
				<a class="link" href="userlogin.jsp">立即去登录</a>
			</p>
		</div>
		<div class="result-con pass-reset-success">
			<h1 class="result-title">恭喜您，重置密码成功！</h1>
			<p class="result-content">
				<a class="link" href="./login.html">立即去登录</a>
			</p>
		</div>
		<div class="result-con cart-add-success">
			<h1 class="result-title">您的商品已成功加入购物车</h1>
			<p class="result-content">
				<a class="link" href="index.jsp">继续购物</a> <a class="link"
					href="getCarts!getCartByUserId">去购物车查看</a>
			</p>
		</div>
		<div class="result-con payment-success">
			<h1 class="result-title">您的订单支付成功！</h1>
			<p class="result-content">
				<a class="link" href="./index.html">继续购物</a> <a
					class="link my-order" href="./order-detail.html?orderNumber=">查看我的订单</a>
			</p>
		</div>
		<div class="result-con default-success">
			<h1 class="result-title">恭喜您，操作成功</h1>
			<p class="result-content">
				<a class="link" href="./index.html">返回首页</a>
			</p>
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
</html>