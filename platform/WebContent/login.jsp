<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
<meta charset="UTF-8">
<title>Login</title>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Content-Language" content="zh-CN" />
    <link rel="stylesheet" type="text/css" href="login.css"/>
</head>
<body>
    <div id="login">
    	<h1>Login</h1>
        <form method="get" action="loginCL.jsp">
            <input type="text" required="required" placeholder="用户名" name="user_id"></input>
            <input type="password" required="required" placeholder="密码" name="user_password"></input>
            <select name="type" class="bu" >
                <option value="student">学生</option>
                <option value="root">管理员</option>
                <option value="review">评审导师</option>
                <option value="guidance">指导导师</option>
            </select>
            <br />
            <button class="but" type="submit">登录</button>
       </form>
       <br>
       <form action="register.html">
       		<button class="but" type="submit">注册</button>
       </form>
    </div>
</body>
</html>