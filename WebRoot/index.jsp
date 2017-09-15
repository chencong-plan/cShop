<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset=utf-8>
<meta http-equiv=x-ua-compatible content="ie=edge">
<meta name=viewport content="width=device-width,initial-scale=1">
<link rel=dns-prefetch href="resourses/bootstrap/css/bootstrap.css" />

<title>电商平台</title>

<link
	href="//s.happymmall.com/mmall_fe/dist/css/common.css?9dd65f513c150dbd6188"
	rel="stylesheet">
<link
	href="//s.happymmall.com/mmall_fe/dist/css/index.css?9dd65f513c150dbd6188"
	rel="stylesheet">
<!-- 加入jquery -->
<script type="text/javascript" src="resourses/jquery-3.2.1.min.js"></script>
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

		//每次刷新加载查询以便session数据
		$.ajax({
			url : "category!getCategories",
			data : {},
			type : "POST",
			success : function(data) {
				//window.location.reload();
			}
		});

	});
</script>
</head>
<body>
	<div class=site-nav>
		<div class=w>
			<div class=user-info>
				<span class="site-user not-login" style="display: block"> <span
					class="link link-login">登录</span> <span class="link link-register">注册</span>
				</span> <span class="site-user login" style="display: none"> <span
					class=link-text>欢迎， <span class="username" id="username"></span>
				</span> <span class="link link-logout">退出</span>
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
			<a class=logo href=index.jsp>ccoder</a>
			<div class=search-form>
				<input class=search-input id=search-input placeholder=请输入商品名称 />
				<button class=search-btn id=search-btn>搜索</button>
			</div>
		</div>
	</div>
	<div class="w">
		<div class="cate-wrap">
			<ul class="cate-list">
				<li class="cate-item"><a class="cate-link" target="_blank"
					href="./list.html?keyword=手机">手机</a> <a class="cate-link"
					target="_blank" href="./list.html?keyword=数码">数码</a></li>
				<li class="cate-item"><a class="cate-link" target="_blank"
					href="./list.html?keyword=电脑">电脑</a> <a class="cate-link"
					target="_blank" href="./list.html?keyword=办公配件">办公配件</a></li>
				<li class="cate-item"><a class="cate-link" target="_blank"
					href="./list.html?keyword=电视">电视</a> <a class="cate-link"
					target="_blank" href="./list.html?keyword=空调">空调</a> <a
					class="cate-link" target="_blank" href="./list.html?keyword=冰箱">冰箱</a>
					<a class="cate-link" target="_blank" href="./list.html?keyword=洗衣机">洗衣机</a>
				</li>
				<li class="cate-item"><a class="cate-link" target="_blank"
					href="./list.html?keyword=厨卫家电">厨卫家电</a> <a class="cate-link"
					target="_blank" href="./list.html?keyword=小家电">小家电</a></li>
				<li class="cate-item"><a class="cate-link" target="_blank"
					href="./list.html?keyword=家居">家居</a> <a class="cate-link"
					target="_blank" href="./list.html?keyword=家具">家具</a> <a
					class="cate-link" target="_blank" href="./list.html?keyword=家装">家装</a>
				</li>
				<li class="cate-item"><a class="cate-link" target="_blank"
					href="./list.html?keyword=个护化妆">个护化妆</a> <a class="cate-link"
					target="_blank" href="./list.html?keyword=清洁">清洁</a> <a
					class="cate-link" target="_blank" href="./list.html?keyword=纸品">纸品</a>
				</li>
				<li class="cate-item"><a class="cate-link" target="_blank"
					href="./list.html?keyword=母婴">母婴</a> <a class="cate-link"
					target="_blank" href="./list.html?keyword=玩具">玩具</a> <a
					class="cate-link" target="_blank" href="./list.html?keyword=童装童鞋">童装童鞋</a>
				</li>
				<li class="cate-item"><a class="cate-link" target="_blank"
					href="./list.html?keyword=鞋靴">鞋靴</a> <a class="cate-link"
					target="_blank" href="./list.html?keyword=箱包">箱包</a> <a
					class="cate-link" target="_blank" href="./list.html?keyword=钟表">钟表</a>
					<a class="cate-link" target="_blank" href="./list.html?keyword=珠宝">珠宝</a>
				</li>
				<li class="cate-item"><a class="cate-link" target="_blank"
					href="./list.html?keyword=运动户外">运动户外</a> <a class="cate-link"
					target="_blank" href="./list.html?keyword=足球">足球</a> <a
					class="cate-link" target="_blank" href="./list.html?keyword=汽车生活">汽车生活</a>
				</li>
				<li class="cate-item"><a class="cate-link" target="_blank"
					href="./list.html?keyword=图书">图书</a> <a class="cate-link"
					target="_blank" href="./list.html?keyword=音像">音像</a> <a
					class="cate-link" target="_blank" href="./list.html?keyword=电子书">电子书</a>
				</li>
			</ul>
		</div>
		<div class="banner-wrap">
			<div class="banner">
				<ul>
					<li><a href="http://coding.imooc.com/class/109.html"
						target="_blank"> <img class="banner-img"
							src="//s.happymmall.com/mmall_fe/dist/resource/banner-fe.jpg" />
					</a></li>

				</ul>
			</div>
			<div class="banner-arrow prev" data-forword="prev">
				<i class="fa fa-angle-left" aria-hidden="true"></i>
			</div>
			<div class="banner-arrow next" data-forword="next">
				<i class="fa fa-angle-right" aria-hidden="true"></i>
			</div>
		</div>
	</div>
	<div class="w">
		<c:forEach items="${sessionScope.categoryMap}" var="map"
			varStatus="status">
			<div class="floor-wrap">
				<h1 class="floor-title">F${status.count} ${map.key.name}</h1>
				<c:forEach items="${map.value}" var="list">
					<ul class="floor-con">
						<li class="floor-item"><a
							href="list.jsp?categoryId=${list.id}"> <span
								class="floor-text">${list.name}</span> <img class="floor-img"
								src="image/category/${list.imageUrl}" alt="${list.name}" />
						</a></li>
					</ul>
				</c:forEach>
			</div>
		</c:forEach>

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
