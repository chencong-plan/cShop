<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset=utf-8>
<meta http-equiv=x-ua-compatible content="ie=edge">
<meta name=viewport content="width=device-width,initial-scale=1">
<link rel=dns-prefetch href=//cdn.bootcss.com / />

<title>用户中心--MMall电商平台</title>
<link
	href="//s.happymmall.com/mmall_fe/dist/css/common.css?9dd65f513c150dbd6188"
	rel="stylesheet">
<link
	href="//s.happymmall.com/mmall_fe/dist/css/user-center.css?9dd65f513c150dbd6188"
	rel="stylesheet">
</head>
<body>

	<div class=site-nav>
		<div class=w>
			<div class=user-info>
				<span class="site-user not-login"> <span
					class="link link-login">登录</span> <span class="link link-register"
					href=./register.html>注册</span>
				</span> <span class="site-user login"> <span class=link-text>欢迎，<span
						class=username></span></span> <span class="link link-logout">退出</span>
				</span>
			</div>
			<ul class=nav-list>
				<li class=nav-item><a class=link href=./cart.html> <i
						class="fa fa-shopping-cart"></i> 购物车(<span class=cart-count>0</span>)
				</a></li>
				<li class=nav-item><a class=link href=./order-list.html>我的订单</a></li>
				<li class=nav-item><a class=link href=./user-center.html>我的MMall</a></li>
				<li class=nav-item><a class=link href=./about.html>关于MMall</a></li>
			</ul>
		</div>
	</div>
	<div class=header>
		<div class=w>
			<a class=logo href=./index.html>MMall</a>
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
					class="crumb-item">个人中心</span>
			</div>
		</div>
	</div>
	<div class="pass-update-wrap w">
		<div class="left-con"></div>
		<div class="right-con">
			<div class="panel">
				<div class="panel-title">我的信息</div>
				<div class="panel-body">
					<div class="loading"></div>
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
</body>
</html>