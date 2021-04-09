<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" +
            request.getServerName() + ":" + request.getServerPort() +
            request.getContextPath() + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>后台初始界面</title>
</head>
<body>
<center>
<h1>欢迎来到后台页面</h1>
    <h2>
    <a href="behind/login.jsp">登录</a>
    </h2>
</center>
</body>
</html>
