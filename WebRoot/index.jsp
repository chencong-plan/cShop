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
			url:"category!getCategories",
			data:{},
			type:"POST",
			success:function(data){
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
		<c:forEach items="${sessionScope.categoryMap}" var="map" varStatus="status">
			<div class="floor-wrap">
				<h1 class="floor-title">F${status.count} ${map.key.name}</h1>
				<c:forEach items="${map.value}" var = "list">
					<ul class="floor-con">
					<li class="floor-item"><a href="./list.html?categoryId=100010">
							<span class="floor-text">${list.name}</span> <img class="floor-img"
							src="data:image/jpeg;base64,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"
							alt="热水器" />
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
