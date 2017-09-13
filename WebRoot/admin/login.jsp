<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'login1.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script type="text/javascript" src="../resourses/jquery-3.2.1.min.js"></script>
<link rel="stylesheet"
	href="../resourses/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="../resourses/admin/css/login.css" />
<script src="../resourses/bootstrap/js/bootstrap.js"></script>
</head>

<body>
	<form action="userLogin" method="post" onsubmit="return checkLogin()">
	<div class="mycenter">
			<div class="mysign">
				<div class="col-lg-11 text-center text-info">
					<h2>登录</h2>
				</div>
				<div class="col-lg-10">
					<input type="text" class="form-control" name="user.username"
						id="username" placeholder="请输入账户名" required autofocus />
				</div>
				<div class="col-lg-10"></div>
				<div class="col-lg-10">
					<input type="password" class="form-control" name="user.password"
						id="password" placeholder="请输入密码" required autofocus />
				</div>
				<div class="col-lg-10"></div>
				<div class="col-lg-10 mycheckbox checkbox">
					<input type="checkbox" class="col-lg-1">记住密码</input> 
				</div>
				<div class="col-lg-10"></div>
				<div class="col-lg-10">
					<button type="submit" id="btn_login"
						class="btn btn-success col-lg-12">登录</button>
				</div>
			</div>
		</div>
	</form>
</body>
</html>
