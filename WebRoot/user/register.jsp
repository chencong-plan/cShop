<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset=utf-8>
<link href="../resourses/bootstrap/css/bootstrap.css">
<title>用户注册--电商平台</title>
<link
	href="//s.happymmall.com/mmall_fe/dist/css/common.css?9dd65f513c150dbd6188"
	rel="stylesheet">
<link
	href="//s.happymmall.com/mmall_fe/dist/css/register.css?9dd65f513c150dbd6188"
	rel="stylesheet">
<!-- 加入jQuery包 -->
<script type="text/javascript" src="../resourses/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		//定义一个状态是否可以提交
		var flag = false;
		//验证用户名是否使用了
		$("#username").blur(function() {
			var username = $("#username").val();
			if (username === "") {
				$(".err-item").css("display", "block");
				$(".err-msg").html("用户名不能为空");
				flag = false;
			} else {
				$.ajax({
					url : "../checkUser!checkUsername",
					data : {
						"user.username" : username
					},
					type : "POST",
					success : function(data) {
					var result = JSON.parse(data);
						if (result.msg === "username_is_exists") {
							$(".err-item").css("display", "block");
							$(".err-msg").html("用户名已经存在");
							flag = false;
						} else {
							$(".err-item").css("display", "none");
							//可以提交
							flag = true;
						}
					}
				});
			}
		});

		//验证邮箱是否使用了
		$("#email").blur(function() {
			var email = $("#email").val();
			if (email === "") {
				$(".err-item").css("display", "block");
				$(".err-msg").html("邮箱不能为空");
				flag = false;
			} else {
				$.ajax({
					url : "../checkUser!checkUserEmail",
					data : {
						"user.email" : email
					},
					type : "POST",
					success : function(data) {
						if (data === "email_is_exists") {
							$(".err-item").css("display", "block");
							$(".err-msg").html("邮箱已经存在");
							flag = false;
						} else {
							$(".err-item").css("display", "none");
							flag = true;
						}
					}
				});
			}
		});

		/* 密码 */
		$("#password").blur(function() {
			var password = $("#password").val();
			if (password === "") {
				$(".err-item").css("display", "block");
				$(".err-msg").html("密码不能为空");
				flag = false;
			}
		});
		//校验再次密码
		$("#password-confirm").blur(function() {
			var passwordConfirm = $("#password-confirm").val();
			if (passwordConfirm === "") {
				$(".err-item").css("display", "block");
				flag = false;
			} else {
				//判断两次密码是否一致
				if (passwordConfirm === $("#password").val()) {
					$(".err-item").css("display", "none");
					flag = true;
				} else {
					$(".err-item").css("display", "block");
					$(".err-msg").html("两次密码不一致");
					flag = false;
				}
			}
		});

		/* 电话 */
		$("#phone").blur(function() {
			var password = $("#phone").val();
			if (password === "") {
				$(".err-item").css("display", "block");
				$(".err-msg").html("电话不能为空");
				flag = false;
			}
		});

		/* 密保问题 */
		$("#question").blur(function() {
			var password = $("#question").val();
			if (password === "") {
				$(".err-item").css("display", "block");
				$(".err-msg").html("密保问题不能为空");
				flag = false;
			}
		});

		/* 密保答案 */
		$("#answer").blur(function() {
			var password = $("#answer").val();
			if (password === "") {
				$(".err-item").css("display", "block");
				$(".err-msg").html("密保答案不能为空");
				flag = false;
			}
		});

		/* 提交注册信息 */
		$("#submit").click(function() {
			var username = $("#username").val();
			var password = $("#password").val();
			var phone = $("#phone").val();
			var email = $("#email").val();
			var question = $("#question").val();
			var answer = $("#answer").val();
			if (flag) {
				$.ajax({
					url : "../userRegister!register",
					data : {
						"user.username" : username,
						"user.password" : password,
						"user.phone" : phone,
						"user.email" : email,
						"user.question" : question,
						"user.answer" : answer
					},
					type : "POST",
					success : function(data) {
						if (data === "register_success") {
							window.location.href = "userlogin.jsp";
						}
						if (data === "register_fail") {
							$(".err-item").css("display", "block");
							$(".err-msg").html("注册失败");
						}
					}
				});
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
			<div class="user-title">新用户注册</div>
			<div class="user-box">
				<div class="err-item">
					<i class="fa fa-minus-circle err-icon"></i>
					<p class="err-msg"></p>
				</div>
				<div class="user-item">
					<label class="user-label" for="username"><i
						class="fa fa-user"></i></label> <input type="text" class="user-content"
						id="username" name="username" placeholder="输入用户名"
						autocomplete="off" />
				</div>
				<div class="user-item">
					<label class="user-label" for="password"><i
						class="fa fa-lock"></i></label> <input type="password"
						class="user-content" id="password" placeholder="输入密码" />
				</div>
				<div class="user-item">
					<label class="user-label" for="password-confirm"><i
						class="fa fa-lock"></i></label> <input type="password"
						class="user-content" id="password-confirm" placeholder="再次输入密码" />
				</div>
				<div class="user-item">
					<label class="user-label" for="phone"><i
						class="fa fa-phone"></i></label> <input type="text" class="user-content"
						id="phone" placeholder="输入电话" autocomplete="off" />
				</div>
				<div class="user-item">
					<label class="user-label" for="email"><i
						class="fa fa-envelope"></i></label> <input type="email"
						class="user-content" id="email" placeholder="输入邮箱"
						autocomplete="off" />
				</div>
				<div class="user-item">
					<label class="user-label" for="question"><i
						class="fa fa-question"></i></label> <input type="text"
						class="user-content" id="question" placeholder="输入密码提示问题"
						autocomplete="off" />
				</div>
				<div class="user-item">
					<label class="user-label" for="answer"><i class="fa fa-key"></i></label>
					<input type="text" class="user-content" id="answer"
						placeholder="输入密码提示答案" autocomplete="off" />
				</div>
				<button class="user-btn" id="submit">立即注册</button>
				<div class="link-item">
					<a class="link pass-forget" href="userlogin.jsp">已有帐号，去登录>></a>
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
