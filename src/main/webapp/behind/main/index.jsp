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

<div id="container" style="width:100%">

    <div id="header" style="background-color:#FFA500;">
        <h1 style="margin-bottom:0;">
            <center>
            欢迎来到校园相亲网后台
            </center>
        </h1>
    </div>

    <div id="menu" style="background-color:#FFD700;height:100%;width:20%;float:left;">
        <b>菜单</b><br>
        <p><a href="behind/main/opertation/selectAllUser.jsp" target="iframe_a">用户查询</a></p><br>
        <p><a href="behind/main/opertation/addUser.jsp" target="iframe_a">添加用户</a></p><br>
        <p><a href="behind/main/opertation/simpleQuery.jsp" target="iframe_a">简单查询</a></p><br>
        <p><a href="behind/main/opertation/charts.jsp" target="iframe_a">图表视图</a></p><br>
        <p><a href="behind/main/opertation/selectAllQuestion.jsp" target="iframe_a">问题查询</a></p><br>
        <p><a href="behind/main/opertation/addQuestion.jsp" target="iframe_a">添加问题</a></p><br>
    </div>

    <div id="content" style="background-color:#EEEEEE;height:100%;width:80%;float:left;">
        <iframe name="iframe_a" height="100%" width="100%" frameborder="0"></iframe>
    </div>

    <div id="footer" style="background-color:#FFA500;clear:both;text-align:center;">
        版权 © IfYouAre.com
    </div>

</div>
</body>
</html>
