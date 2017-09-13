<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel=dns-prefetch href=//cdn.bootcss.com/ />
    <title>找回密码--电商平台</title>
    <link href="//s.happymmall.com/mmall_fe/dist/css/common.css?9dd65f513c150dbd6188" rel="stylesheet">
    <link href="//s.happymmall.com/mmall_fe/dist/css/pass-reset.css?9dd65f513c150dbd6188" rel="stylesheet">
</head>
<body>
<div class=header-simple>
    <div class=w><a href=./index.html class=logo>ccoder</a></div>
</div>
<div class="user-wrap">
    <div class="user-con w">
        <div class="user-title">找回密码</div>
        <div class="user-box">
            <div class="err-item">
                <i class="fa fa-minus-circle err-icon"></i>
                <p class="err-msg">Error</p>
            </div>
            <div class="step-con step-username">
                <p class="user-item-text">请输入用户名：</p>
                <div class="user-item">
                    <label class="user-label" for="username"><i class="fa fa-user"></i></label>
                    <input type="text" class="user-content" id="username" placeholder="请输入用户名" autocomplete="off"/>
                </div>
                <a class="user-btn" id="submit-username">下一步</a>
            </div>
            <div class="step-con step-question">
                <p class="user-item-text">密码提示问题为: <span id="question"></span></p>
                <p class="user-item-text">请输入密码提示答案:</p>
                <div class="user-item">
                    <label class="user-label" for="answer"><i class="fa fa-key"></i></label>
                    <input type="text" class="user-content" id="answer" placeholder="请输入密码提示答案" autocomplete="off"/>
                </div>
                <a class="user-btn" id="submit-question">下一步</a>
            </div>
            <div class="step-con step-password">
                <p class="user-item-text">请输入新密码：</p>
                <div class="user-item">
                    <label class="user-label" for="password"><i class="fa fa-lock"></i></label>
                    <input type="password" class="user-content" id="password" placeholder="请输入新密码" autocomplete="off"/>
                </div>
                <a class="user-btn" id="submit-password">提交</a>
            </div>
        </div>
    </div>
</div>
<div class=footer>
    <div class=w>
        <div class=links><a class=link href=http://www.imooc.com/ >慕课网</a> | <a class=link href=http://www.baidu.com/ >百度</a>
            | <a class=link href=http://www.zhihu.com/ >知乎</a> | <a class=link href=http://www.taobao.com/ >淘宝</a></div>
        <p class=copyright> Copyright © 2017 happymmall.com All Rights Reserved </p></div>
</div>
<script src=//cdn.bootcss.com/jquery/1.11.3/jquery.js></script>
</body>
</html>

