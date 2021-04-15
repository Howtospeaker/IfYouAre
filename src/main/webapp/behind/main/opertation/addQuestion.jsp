<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" +
            request.getServerName() + ":" + request.getServerPort() +
            request.getContextPath() + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>Title</title>
</head>
<body>
<center>
    <h1>欢迎来到添加问题页面</h1>
    <form action="question/addUser.do" method="post">
        <table>
            <tr>
                <td>问题编号</td>
                <td><input type="text" name="questionId"></td>
            </tr>
            <tr>
                <td>详细问题</td>
                <td><input type="text" name="detail"></td>
            </tr>
            <tr>
                <td>性别类型</td>
                <td><input type="text" name="sexType"></td>
            </tr>
            <tr>
                <td>选项A</td>
                <td><input type="text" name="ansA"></td>
            </tr>
            <tr>
                <td>选项B</td>
                <td><input type="text" name="ansB"></td>
            </tr>
            <tr>
                <td>选项C</td>
                <td><input type="text" name="ansC"></td>
            </tr>
            <tr>
                <td>选项D</td>
                <td><input type="text" name="ansD"></td>
            </tr>
            <tr>
                <td><input type="submit" value="提交"></td>
            </tr>
        </table>
    </form>
</center>
</body>
</html>
