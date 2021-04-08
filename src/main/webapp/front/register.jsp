<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" +
            request.getServerName() + ":" + request.getServerPort() +
            request.getContextPath() + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>用户注册</title>
</head>
<body>
<center>
    <h1>欢迎来到用户注册页面</h1>
    <form action="user/register.do" method="post">
        <table>
            <tr>
                <td>姓名</td>
                <td><input type="text" name="name"></td>
            </tr>
            <tr>
                <td>性别</td>
                <td><input type="radio" name="sex" value="0"/>男
                    <input type="radio" name="sex" value="1"/>女
                </td>
            </tr>
            <tr>
                <td>年龄</td>
                <td><input type="text" name="age"></td>
            </tr>
            <tr>
                <td>邮箱</td>
                <td><input type="text" name="email"></td>
            </tr>
            <tr>
                <td>电话</td>
                <td><input type="text" name="phone"></td>
            </tr>
            <tr>
                <td>昵称</td>
                <td><input type="text" name="nickName"></td>
            </tr>
            <tr>
                <td>账号</td>
                <td><input type="text" name="loginId"></td>
            </tr>
            <tr>
                <td>密码</td>
                <td><input type="text" name="loginPwd"></td>
            </tr>
            <tr>
                <td>学校</td>
                <td><input type="text" name="school"></td>
            </tr>
            <tr>
                <td>专业</td>
                <td><input type="text" name="major"></td>
            </tr>
            <tr>
                <td><input type="submit" value="提交"></td>
            </tr>
        </table>
    </form>
</center>
</body>
</html>
