<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!doctype html>
<html>
<head>
<meta charset=utf-8 />
<meta http-equiv=x-ua-compatible content="ie=edge">
<link rel=dns-prefetch href=//s.happymmall.com />
<link rel=dns-prefetch href=//cdn.bootcss.com / />
<title>修改密码--电商平台</title>
<link
	href="//s.happymmall.com/mmall_fe/dist/css/common.css?9dd65f513c150dbd6188"
	rel="stylesheet">
<link
	href="//s.happymmall.com/mmall_fe/dist/css/pass-update.css?9dd65f513c150dbd6188"
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
					class="link link-login">登录</span> <span class="link link-register"
					href="register.jsp">注册</span>
				</span> <span class="site-user login"> <span class=link-text>欢迎，<span
						class="username" id="username"></span></span> <span
					class="link link-logout">退出</span>
				</span>
			</div>
			<ul class=nav-list>
				<li class=nav-item><a class=link href="cart.jsp"> <i
						class="fa fa-shopping-cart"></i> 购物车(<span class=cart-count>0</span>)
				</a></li>
				<li class=nav-item><a class=link href="order-list.jsp">我的订单</a>
				</li>
				<li class=nav-item><a class=link href="user-center.jsp">我的MMall</a>
				</li>
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
				<a href="../index.jsp" class="crumb-item">ccoder</a> <span>></span>
				<span class="crumb-item">订单详情</span>
			</div>
		</div>
	</div>
	<div class="pass-update-wrap w">
		<div class="left-con">
			<ul class="menu">
	    		<li class="menu-item "><a class="link" href="user-center.jsp">个人中心</a></li>
				<li class="menu-item "><a class="link" href="order-list.jsp">我的订单</a></li>
				<li class="menu-item active"><a class="link" href="pass-update.jsp">修改密码</a></li>
				<li class="menu-item"><a class="link" href="about.jsp">关于ccoder</a></li>
    		</ul>
		</div>
		<div class="right-con">
			<div class="panel">
				<div class="panel-title">修改密码</div>
				<div class="panel-body">
					<div class="pass-info">
						<div class="text-line">
							<span class="text">原始密码：</span> <input type="password"
								class="password" id="password" autocomplete="off" />
						</div>
						<div class="text-line">
							<span class="text">新 密 码 ： </span> <input type="password"
								class="password" id="password-new" autocomplete="off" />
						</div>
						<div class="text-line">
							<span class="text">确认密码：</span> <input type="password"
								class="password" id="password-confirm" autocomplete="off" />
						</div>
						<div class="text-line">
							<span class="btn btn-mini btn-submit">提交修改</span>
						</div>
					</div>
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
