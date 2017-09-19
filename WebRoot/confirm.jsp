<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset=utf-8 />
<meta http-equiv=x-ua-compatible content="ie=edge">
<link rel=dns-prefetch href=//s.happymmall.com />
<link rel=dns-prefetch href= "resourses/bootstrap/css/bootstrap.css" />

<title>订单确认--电商平台</title>
<link
	href="//s.happymmall.com/mmall_fe/dist/css/common.css?9dd65f513c150dbd6188"
	rel="stylesheet">
<link
	href="//s.happymmall.com/mmall_fe/dist/css/confirm.css?9dd65f513c150dbd6188"
	rel="stylesheet">
	
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
					//未登录,跳转去登陆界面
					window.location.href = "user/userlogin.jsp";

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
		
		//添加新的地址
		$(".address-new").click(function(){
			$(".modal-wrap").css("display","block");
		});
		//管理添加地址窗口
		$("#address_closes").click(function(){
			$(".modal-wrap").css("display","none");
		});
		//更新地址窗口
		$(".address-update").click(function(){
			$(".modal-wrap").css("display","block");
			//通过id获得到当前收货实体信息 
			var shippingId = $(this).attr("value");
			$.ajax({
				url:"getShipping!getShippingById",
				data:{
					"shippingId":shippingId
				},
				type:"POST",
				success:function(data){
					alert(data);
					var result = JSON.parse(data);
					//给弹出地址框赋值
					$("#receiver-id").val(result.data.id);
					$("#receiver-name").val(result.data.name);
					$("#receiver-address").val(result.data.address);
					$("#receiver-phone").val(result.data.phone);
				}
			});
		});
		//根据收货地址id 删除该收货地址
		// 直接通过地址跳转
		$(".address-delete").click(function(){
			var shippingId = $(this).attr("value");
			window.location.href="deleteShipping!deleteShippingById?shippingId="+shippingId;
		});
		
		//选中当前地址信息
		var shippingId ="";
		$(".address-item").click(function(){
			 $(".address-item").removeClass("active");
			 $(this).addClass("active");
			 //alert($(this).attr("value"));
			 shippingId = $(this).attr("value");
		});
		
		//提交订单
		$(".order-submit").click(function(){
			 if(shippingId ==""){
			 	alert("未选中");
			 }else{
			 	window.location.href="addOrder!addOrder?shippingId="+shippingId;
			 }
		});
		
	});
</script>
</head>
<body>
	<div class=site-nav>
		<div class=w>
			<div class=user-info>
				<span class="site-user not-login"> 
					<span class="link link-login">登录</span> 
					<span class="link link-register" href="user/register.jsp">注册</span>
				</span> 
				<span class="site-user login"> 
					<span class=link-text>欢迎，<span
						class="username" id="username"></span></span> <span class="link link-logout">退出</span>
				</span>
			</div>
			<ul class=nav-list>
				<li class=nav-item><a class=link href="user/cart.jsp"> <i
						class="fa fa-shopping-cart"></i> 购物车(<span class=cart-count>0</span>)
				</a></li>
				<li class=nav-item><a class=link href="user/order-list.jsp">我的订单</a>
				</li>
				<li class=nav-item><a class=link href="user/user-center.jsp">我的MMall</a>
				</li>
				<li class=nav-item><a class=link href="user/about.jsp">关于MMall</a>
				</li>
			</ul>
		</div>
	</div>
	<div class=header>
		<div class=w>
			<a class=logo href="index.jsp"">ccoder</a>
			<div class=search-form>
				<input class=search-input id=search-input placeholder=请输入商品名称 />
				<button class=search-btn id=search-btn>搜索</button>
			</div>
		</div>
	</div>
	<div class="crumb">
		<div class="w">
			<div class="crumb-list">
				<a href="index.jsp" class="crumb-item">ccoder</a> <span>></span> <span
					class="crumb-item">订单确认</span>
			</div>
		</div>
	</div>
	<div class="confirm-wrap w">
		<div class="panel">
			<h2 class="panel-title">收货地址</h2>
			<div class="panel-body address-list">
				<c:forEach items="${sessionScope.shippingLists}" var="shipping" varStatus="status">
						<!-- 加载地址 -->
					<a class="address-item" value="${shipping.id}">
						<div class="address-title">
							<span class="city">${shipping.city} ${shipping.province}</span>
							<span class="name">(${shipping.name}  收)</span>
						</div>
						<div class="address-detail">${shipping.district} ${shipping.address} ${shipping.phone}</div>
						<div class="address-opera">
							<span class="link address-update" value="${shipping.id}">编辑</span>
							<span class="link address-delete" value="${shipping.id }">删除</span>
						</div>					
					</a>
				</c:forEach>
				
				<!-- 新增地址 -->
				<div class="address-item add">
					<div class="address-new">
						<i class="fa fa-plus"></i>
						<div class="text">使用新地址</div>
					</div>
				</div>
			</div>
		</div>
		<div class="panel">
			<h2 class="panel-title">商品清单</h2>
			<div class="panel-body order-product">
				<!-- 商品清单 -->
				<table class="product-table" data-product-id data-checked>
					<tbody>
						<tr>
							<th width="10%">&nbsp;</th>
							<th width="30%" align="left">商品描述</th>
							<th width="20%" align="center">价格</th>
							<th width="20%" align="center">数量</th>
							<th width="20%" align="center">小计</th>
						</tr>
						<c:forEach items="${sessionScope.cartVoConfirms}" var="cartVo">
							<tr class="cartVo_confirm">
							<td class="product-cell cell-img">
								<a href="getProduct!getProductById?productId=${cartVo.productId}" target="_blank">
									<img class="p-img" src="image/product/${cartVo.mainImage}" alt="${cartVo.productTitle}">
								</a>
							</td>
							<td align="left">
								<a class="link p-name" href="getProduct!getProductById?productId=${cartVo.productId}" target="_blank">${cartVo.productTitle}</a>
							</td>
							<td align="center">￥${cartVo.productPrice }</td>
							<td align="center">x${cartVo.quantity }</td>
							<td align="center">￥${cartVo.totalPrice}</td>
						</tr>
						</c:forEach>
						
					</tbody>
				</table>
				<!-- 提交 -->
				<div class="submit-con">
					<span>订单总价：</span>
					<span class="submit-total">￥${sessionScope.confirm_totalPrice }</span>
					<span class="btn order-submit">提交订单</span>
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
	
	<!-- 地址 -->
	<div class="modal-wrap" style="display: none;">
			<div class="modal mask close">
				<div class="modal-container">
					<div class="modal-header" style="position: relative;">
						<h1>使用新地址</h1> 
						<span id="address_closes" class="link" style="text-decoration: none;color:black;right:10px;position: absolute;top:13px;">关闭</span> 
					</div>
					<div class="modal-body">
						<form action="addShipping!addShipping" method="post">
						<div class="form">
							<div class="form-line"> 
								<input type="hidden" value="" name="shipping.id" id="receiver-id"/>
								<label class="label"><span class="form-require">*</span>收件人姓名:</label> 
								<input class="form-item name" name="shipping.name" id="receiver-name" type="text" placeholder="请输入收件人姓名" value=""> 
							</div>
							<div class="form-line"> 
							<label class="label">
								<span class="form-require">*</span>所在城市:
							</label>
								<select class="form-item " name="shipping.province" id="province">
									<option value="请选择">请选择</option>
								</select>
								<select class="form-item " name="shipping.city" id="city">
									<option value="请选择">请选择</option>
								</select>
								<select class="form-item " name="shipping.district" id="town">
									<option value="请选择">请选择</option>
								</select>
							</div>
							<div class="form-line"> <label class="label"><span class="form-require">*</span>详细地址:</label> <input class="form-item" id="receiver-address" name="shipping.address" type="text" placeholder="请精确到门牌号" value=""> </div>
							<div class="form-line"> <label class="label"><span class="form-require">*</span>收件人手机号:</label> <input class="form-item" name="shipping.phone" id="receiver-phone" type="text" placeholder="请输入11位手机号" value=""> </div>
							<div class="form-line"> <label class="label">邮政编码:</label> <input class="form-item" name="zip" id="receiver-zip" type="text" placeholder="如：100000" value=""> </div>
							<div class="form-line"> 
								<br>
								<input type="submit" class="btn form-btn address-save" value="保存收货地址" />
							</div>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	
	<script type="text/javascript" src="resourses/area/area.js"></script>
	<script type="text/javascript" src="resourses/area/select.js"></script>
</body>
</html>

