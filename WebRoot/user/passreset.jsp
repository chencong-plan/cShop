<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<link rel=dns-prefetch href=//cdn.bootcss.com / />
<title>找回密码--电商平台</title>
<link
	href="//s.happymmall.com/mmall_fe/dist/css/common.css?9dd65f513c150dbd6188"
	rel="stylesheet">
<link
	href="//s.happymmall.com/mmall_fe/dist/css/pass-reset.css?9dd65f513c150dbd6188"
	rel="stylesheet">
<!-- 引入jquery -->
<script type="text/javascript" src="../resourses/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		//显示用户名输入框
		$(".step-username").css("display", "block");
		//点击 下一步
		$("#submit-username").click(function() {
			//判断输入框是否为空
			var username = $("#username").val();
			if (username === "") {
				$(".err-item").css("display", "block");
				$("#err-msg").html("用户名不能为空");
			} else {
				//调用ajax判断用户名是否存在
				$.ajax({
					url : "../checkUser!checkUsername",
					data : {
						"user.username" : username
					},
					type : "POST",
					success : function(data) {
						var result = JSON.parse(data);
						if (result.msg === "username_no_exists") {
							$(".err-item").css("display", "block");
							$("#err-msg").html("用户名不存在");
						}
						if (result.msg === "username_is_exists") {
							//验证密保问题
							//隐藏输入用户名框
							$(".step-username").css("display", "none");
							checkQuestion(result, username);
						}
					}
				});
			}
		});

		//演示密保问题，然后验证密保问题 用户名是否匹配
		function checkQuestion(result, username) {
			//显示密保问题，显示密保答案输入框
			$(".step-question").css("display", "block");
			//将错误提示隐藏
			$(".err-item").css("display", "none");
			$("#question").html(result.data);
			//点击提交 下一步
			$("#submit-question").click(function() {
				var answer = $("#answer").val();
				if (answer === "") {
					$(".err-item").css("display", "block");
					$("#err-msg").html("密保答案不能为空");
				} else {
					//校验用户名 密码一系列是否正确
					$.ajax({
						url : "../passreset!checkUserQuestionAndAnswer",
						data : {
							"user.username" : username,
							"user.question" : result.data,
							"user.answer" : answer
						},
						type : "POST",
						success : function(data) {
							if (data === "check_fail") {
								//密保问题错误
								$(".err-item").css("display", "block");
								$("#err-msg").html("密保答案错误");
							}
							if (data === "check_success") {

								//执行更新方法
								//隐藏输入密保答案框
								$(".step-question").css("display", "none");
								updatePassword(username);
							}
						}
					});
				}
			});
		}

		//修改密码
		function updatePassword(username) {
			//修改密码
			//设置新密码
			$(".step-password").css("display", "block");
			$(".err-item").css("display", "none");
			$("#submit-password").click(function() {
				var password = $("#password").val();
				if (password === "") {
					$(".err-item").css("display", "block");
					$("#err-msg").html("密码不能为空");
				} else {
					$.ajax({
						url : "../passreset!updateUserPassword",
						data : {
							"user.password" : password,
							"user.username" : username
						},
						type : "POST",
						success : function(data) {
							if (data === "update_success") {
								//跳转登录
								window.location.href="userlogin.jsp";
							}
							if (data === "update_fail") {
								$(".err-item").css("display", "block");
								$("#err-msg").html("密码修改失败");
							}
						}
					});
				}
			});
		}
	});
</script>
</head>
<body>
	<div class=header-simple>
		<div class=w>
			<a href=./index.html class=logo>ccoder</a>
		</div>
	</div>
	<div class="user-wrap">
		<div class="user-con w">
			<div class="user-title">找回密码</div>
			<div class="user-box">
				<div class="err-item">
					<i class="fa fa-minus-circle err-icon"></i>
					<p class="err-msg" id="err-msg"></p>
				</div>
				<div class="step-con step-username">
					<p class="user-item-text">请输入用户名：</p>
					<div class="user-item">
						<label class="user-label" for="username"><i
							class="fa fa-user"></i></label> <input type="text" class="user-content"
							id="username" placeholder="请输入用户名" autocomplete="off" />
					</div>
					<a class="user-btn" id="submit-username">下一步</a>
				</div>
				<div class="step-con step-question">
					<p class="user-item-text">
						密码提示问题为: <span id="question"></span>
					</p>
					<p class="user-item-text">请输入密码提示答案:</p>
					<div class="user-item">
						<label class="user-label" for="answer"><i
							class="fa fa-key"></i></label> <input type="text" class="user-content"
							id="answer" placeholder="请输入密码提示答案" autocomplete="off" />
					</div>
					<a class="user-btn" id="submit-question">下一步</a>
				</div>
				<div class="step-con step-password">
					<p class="user-item-text">请输入新密码：</p>
					<div class="user-item">
						<label class="user-label" for="password"><i
							class="fa fa-lock"></i></label> <input type="password"
							class="user-content" id="password" placeholder="请输入新密码"
							autocomplete="off" />
					</div>
					<a class="user-btn" id="submit-password">提交</a>
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

