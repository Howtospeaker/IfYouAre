<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" +
            request.getServerName() + ":" + request.getServerPort() +
            request.getContextPath() + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>欢迎页面</title>
</head>
<body>
<center>
    <h1>Welcome to 非诚勿扰</h1>
    <h3><a href="front/register.jsp">用户注册</a></h3>
    <h3><a href="front/login.jsp">用户登录</a></h3>
</center>
</body>
</html>
