<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" +
            request.getServerName() + ":" + request.getServerPort() +
            request.getContextPath() + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>后台页面</title>
    <script type="text/javascript" src="jQuery/jquery-3.5.1.js"></script>
</head>
<body>
<center>
    <h1>欢迎来到校园相亲网后台</h1>
</center>
</body>
</html>
