<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset=utf-8>
<meta http-equiv=x-ua-compatible content="ie=edge">
<meta name=viewport content="width=device-width,initial-scale=1">
<link rel=dns-prefetch href="../resourses/bootstrap/css/bootstrap.css" />

<title>订单列表--ccoder电商平台</title>
<link
	href="//s.happymmall.com/mmall_fe/dist/css/common.css?9dd65f513c150dbd6188"
	rel="stylesheet">
<link
	href="//s.happymmall.com/mmall_fe/dist/css/order-list.css?9dd65f513c150dbd6188"
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
				<a href="./index.html" class="crumb-item">MMall</a> <span>></span> <span
					class="crumb-item">我的订单</span>
			</div>
		</div>
	</div>
	<div class="order-list-wrap w">
		<div class="left-con">
			<ul class="menu">
				<li class="menu-item"><a class="link" href="user-center.jsp">个人中心</a></li>
				<li class="menu-item active"><a class="link" href="order-list">我的订单</a></li>
				<li class="menu-item"><a class="link" href="pass-update.jsp">修改密码</a></li>
				<li class="menu-item"><a class="link" href="about.jsp">关于ccoder</a></li>
			</ul>
		</div>
		<div class="right-con">
			<div class="panel">
				<div class="panel-title">我的订单</div>
				<div class="panel-body">
					<div class="order-list">
						<!-- <div class="loading"></div> -->
						<table class="order-list-table header">
							<tbody>
								<tr>
									<th class="order-list-cell cell-img">&nbsp;</th>
									<th class="order-list-cell cell-info">商品信息</th>
									<th class="order-list-cell cell-price">单价</th>
									<th class="order-list-cell cell-count">数量</th>
									<th class="order-list-cell cell-total">合计</th>
								</tr>
							</tbody>
						</table>
						<table class="order-list-table order-item">
							<tbody>
								<tr>
									<td class="order-info" colspan="6"><span
										class="order-text"> <span>订单号：</span> <a class="link"
											href="./order-detail.html?orderNumber=1505828191296">20170919223234</a>
									</span> <span class="order-text">2017-09-19 21:36:31</span> <span
										class="order-text"> <span>收件人：聪聪</span>
									</span> <span class="order-text"> <span>订单状态：已取消</span>
									</span> <span class="order-text"> <span>订单总价：</span> <span
											class="enhance">￥3299</span>
									</span> <a class="link pull-right"
										href="order-detail.jsp">查看详情&gt;</a>
									</td>
								</tr>
								<tr>
									<td class="order-list-cell cell-img"><a
										href="./detail.html?productId=27" target="_blank"><img
											class="p-img"
											src="http://img.happymmall.com/ac3e571d-13ce-4fad-89e8-c92c2eccf536.jpeg"
											alt="【测试学习使用】Midea/美的 BCD-535WKZM(E)冰箱双开门无霜智能家用厨卫家电"></a></td>
									<td class="order-list-cell cell-info"><a
										class="link p-name" href="./detail.html?productId=27"
										target="_blank">【测试学习使用】Midea/美的
											BCD-535WKZM(E)冰箱双开门无霜智能家用厨卫家电</a></td>
									<td class="order-list-cell cell-price">￥3299</td>
									<td class="order-list-cell cell-count">1</td>
									<td class="order-list-cell cell-total">￥3299</td>
								</tr>
							</tbody>
						</table>

						<table class="order-list-table order-item">
							<tbody>
								<tr>
									<td class="order-info" colspan="6"><span
										class="order-text"> <span>订单号：</span> <a class="link"
											href="./order-detail.html?orderNumber=1505784934973">20170919223233</a>
									</span> <span class="order-text">2017-09-19 09:35:34</span> <span
										class="order-text"> <span>收件人：聪聪</span>
									</span> <span class="order-text"> <span>订单状态：未支付</span>
									</span> <span class="order-text"> <span>订单总价：</span> <span
											class="enhance">￥7914.4</span>
									</span> <a class="link pull-right"
										href="order-detail.jsp">查看详情&gt;</a>
									</td>
								</tr>
								<tr>
									<td class="order-list-cell cell-img"><a
										href="./detail.html?productId=39" target="_blank"><img
											class="p-img"
											src="http://img.happymmall.com/b896ec40-e643-4924-97ff-c8456f0a9034.jpg"
											alt="【测试学习使用】【mayi摄影】Canon/佳能 PowerShot SX620 HS高清长焦数码照相机"></a>
									</td>
									<td class="order-list-cell cell-info"><a
										class="link p-name" href="./detail.html?productId=39"
										target="_blank">【测试学习使用】【mayi摄影】Canon/佳能 PowerShot SX620
											HS高清长焦数码照相机</a></td>
									<td class="order-list-cell cell-price">￥1499</td>
									<td class="order-list-cell cell-count">5</td>
									<td class="order-list-cell cell-total">￥7495</td>
								</tr>
								<tr>
									<td class="order-list-cell cell-img"><a
										href="./detail.html?productId=56" target="_blank"><img
											class="p-img"
											src="http://img.happymmall.com/ea5d09b9-bcb7-4a2a-8cb2-744191c44fb6.png"
											alt="【测试学习使用】德国进口欧德堡超高温灭菌3.5%全脂纯牛奶 200ml*24"></a></td>
									<td class="order-list-cell cell-info"><a
										class="link p-name" href="./detail.html?productId=56"
										target="_blank">【测试学习使用】德国进口欧德堡超高温灭菌3.5%全脂纯牛奶 200ml*24</a></td>
									<td class="order-list-cell cell-price">￥69.9</td>
									<td class="order-list-cell cell-count">6</td>
									<td class="order-list-cell cell-total">￥419.4</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="pagination"></div>
				</div>
			</div>
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
	<script src=//cdn.bootcss.com/jquery/1.11.3/jquery.js></script>
</body>
</html>