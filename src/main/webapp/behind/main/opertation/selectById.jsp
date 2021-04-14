<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" +
            request.getServerName() + ":" + request.getServerPort() +
            request.getContextPath() + "/";
%>
<html>
<head>
    <title>查询单个用户</title>
    <base href="<%=basePath%>">
    <script type="text/javascript" src="jQuery/jquery-3.5.1.js"></script>
    <script type="text/javascript">
        $(function sex() {
            var sex = ${user.sex};
            if (sex==0){
                var radio = document.getElementById("man");
                radio.checked='checked';
            } else {
                var radio = document.getElementById("woman");
                radio.checked='checked';
            }
        })
    </script>
</head>
<body>
<center>
    <h1>下面是${user.name}的详细信息</h1>
    <form action="admin/updateUser.do" method="post">
        <table>
            <tr>
                <td>编号</td>
                <td><input type="text" name="id" value="${user.id}" readonly/></td>
            </tr>
            <tr>
                <td>姓名</td>
                <td><input type="text" name="name" value="${user.name}"/></td>
            </tr>
            <tr>
                <td>性别</td>
                <td><input type="radio" name="sex"  value="0" id="man"/>男
                    <input type="radio" name="sex"  value="1" id="woman"/>女
                </td>
            </tr>
            <tr>
                <td>年龄</td>
                <td><input type="text" name="age" value="${user.age}"/></td>
            </tr>
            <tr>
                <td>邮箱</td>
                <td><input type="text" name="email" value="${user.email}"/></td>
            </tr>
            <tr>
                <td>电话</td>
                <td><input type="text" name="phone" value="${user.phone}"/></td>
            </tr>
            <tr>
                <td>昵称</td>
                <td><input type="text" name="nickName" value="${user.nickName}"/></td>
            </tr>
            <tr>
                <td>账号</td>
                <td><input type="text" name="loginId" value="${user.loginId}"/></td>
            </tr>
            <tr>
                <td>密码</td>
                <td><input type="password" name="loginPwd" value="${user.loginPwd}"/></td>
            </tr>
            <tr>
                <td>分数</td>
                <td><input type="text" name="point" value="${user.point}"/></td>
            </tr>
            <tr>
                <td>学校</td>
                <td><input type="text" name="school" value="${user.school}"/></td>
            </tr>
            <tr>
                <td>专业</td>
                <td><input type="text" name="major" value="${user.major}"/></td>
            </tr>
            <tr>
                <td><input type="submit" value="修改信息"/></td>
            </tr>
        </table>
    </form>
    <h1 style="color: palevioletred">${msg}</h1>
</center>
</body>
</html>
