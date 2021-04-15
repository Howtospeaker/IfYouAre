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
    <script type="text/javascript" src="jQuery/jquery-3.5.1.js"></script>
</head>
<body>
<center>
    <h1>下面是编号为${question.questionId}问题的详细信息</h1>
    <form action="question/updateQuestion.do" method="post">
        <table>
            <tr>
                <td>问题编号</td>
                <td><input type="text" name="questionId" value="${question.questionId}" readonly/></td>
            </tr>
            <tr>
                <td>详细问题</td>
                <td><input type="text" name="detail" value="${question.detail}"/></td>
            </tr>
            <tr>
                <td>性别类型</td>
                <td>
                    <input type="text" name="sexType"  value="${question.sexType}" />
                </td>
            </tr>
            <tr>
                <td>选项A</td>
                <td><input type="text" name="ansA" value="${question.ansA}"/></td>
            </tr>
            <tr>
                <td>选项B</td>
                <td><input type="text" name="ansB" value="${question.ansB}"/></td>
            </tr>
            <tr>
                <td>选项C</td>
                <td><input type="text" name="ansC" value="${question.ansC}"/></td>
            </tr>
            <tr>
                <td>选项D</td>
                <td><input type="text" name="ansD" value="${question.ansD}"/></td>
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
