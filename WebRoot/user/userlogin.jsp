<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset=utf-8>
<meta http-equiv=x-ua-compatible content="ie=edge">
<meta name=viewport content="width=device-width,initial-scale=1">
<link href="../resourses/bootstrap/css/bootstrap.css">

<title>用户登录--电商平台</title>

<link
	href="//s.happymmall.com/mmall_fe/dist/css/common.css?9dd65f513c150dbd6188"
	rel="stylesheet">
<link
	href="//s.happymmall.com/mmall_fe/dist/css/login.css?9dd65f513c150dbd6188"
	rel="stylesheet">
<!-- 加入jQuery包 -->
<script type="text/javascript" src="../resourses/jquery-3.2.1.min.js"></script>
<script src="../resourses/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript">
	$(function() {
		$("#submit").click(function() {
			var username = $("#username").val();
			var password = $("#password").val();
			$(".err-item").css("display", "block");
			if (username === "") {
				$("#err-msg").html("用户名不能为空");
			} else {
				if (password === "") {
					$("#err-msg").html("密码不能为空");
				} else {
					//开始登录
					$.ajax({
						url : "../Login!userLogin",
						data : {
							"user.username" : username,
							"user.password" : password
						},
						type : "POST",
						success : function(data) {
							if (data === "login_fail") {
								$("#err-msg").html("用户名或密码错误");
							}
							if(data === "login_fail_noActive"){
								$("#err-msg").html("账户未激活，前去注册邮箱激活吧");
							} 
							if(data === "login_success") {
								//管理显示错误页面
								$(".err-item").css("display", "none");
								window.location.href = "../index.jsp";
							}
						}
					});
				}
			}

		});
	});
</script>
</head>
<body>
	<div class=header-simple>
		<div class=w>
			<a href=../index.jsp class=logo>ccoder</a>
		</div>
	</div>
	<div class="user-wrap">
		<div class="user-con w">
			<div class="user-title">用户登录</div>
			<div class="user-box">
				<div class="err-item">
					<i class="fa fa-minus-circle err-icon"></i>
					<p class="err-msg" id="err-msg"></p>
				</div>
				<div class="user-item">
					<label class="user-label" for="username"><i
						class="fa fa-user"></i></label> <input type="text" class="user-content"
						id="username" placeholder="请输入用户名" autocomplete="off" required
						autofocus />
				</div>
				<div class="user-item">
					<label class="user-label" for="password"><i
						class="fa fa-lock"></i></label> <input type="password"
						class="user-content" id="password" placeholder="请输入密码" required
						autofocus />
				</div>
				<a class="user-btn" id="submit">登录</a>
				<div class="link-item">
					<a class="link pass-forget" href="passreset.jsp" target="_blank">忘记密码</a>
					<a class="link register" href="register.jsp" target="_blank">免费注册</a>
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