<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" +
            request.getServerName() + ":" + request.getServerPort() +
            request.getContextPath() + "/";
%>
<html>
<head>
    <title>Title</title>
    <base href="<%=basePath%>">
    <script type="text/javascript" src="jQuery/jquery-3.5.1.js"></script>
    <SCRIPT type="text/javascript" src="js/common.js"></SCRIPT>
    <script type="text/javascript">

        $(function () {
            //在当前页面dom对象加载后，执行loadStudentData()
            loadStudentData();

            $("#btnLoader").click(function (){
                loadStudentData();
            })
        })

        function loadStudentData() {
            $.ajax({
                url:"admin/selectAllUser.do",
                type:"get",
                dataType:"json",
                success:function (data) {
                    //清楚旧的数据
                    $("#info").html("");
                    //添加新的数据
                    $.each(data,function (i,n){
                        $("#info").append("<tr>")
                            .append("<td><input type='checkbox' onclick="+fun1()+"/>全选/全不选</td>")
                            // .html("<td><input type='checkbox' onclick='fun1()'/>全选全不选</td>")
                            .append("<td>"+n.id+"</td>")
                            .append("<td>"+n.name+"</td>")
                            .append("<td>"+n.sex+"</td>")
                            .append("<td>"+n.age+"</td>")
                            .append("<td>"+n.email+"</td>")
                            .append("<td>"+n.phone+"</td>")
                            .append("<td>"+n.nickName+"</td>")
                            .append("<td>"+n.loginId+"</td>")
                            .append("<td>"+n.loginPwd+"</td>")
                            .append("<td>"+n.point+"</td>")
                            .append("<td>"+n.school+"</td>")
                            .append("<td>"+n.major+"</td>")
                            .append("<td><a href='admin/findById.do?id="+n.id+"'>修改信息</a></td>")
                            .append("<td><a href='admin/deleteById.do?id="+n.id+"'>删除</a></td>")
                            // .html("<td><a href='user/findById?id=n.id'>详细信息</a></td>")
                            .append("</tr>")
                    })
                }
            })
        }
    </script>
</head>
<body>
<table border="2">
    <thead>
    <tr>
        <td><input type="checkbox" onclick="fun1()"/>全选/全不选</td>
        <td>编号</td>
        <td>姓名</td>
        <td>性别</td>
        <td>年龄</td>
        <td>邮箱</td>
        <td>电话</td>
        <td>昵称</td>
        <td>账号</td>
        <td>密码</td>
        <td>分数</td>
        <td>学校</td>
        <td>专业</td>
        <td colspan="2">操作</td>
    </tr>
    </thead>
    <tbody id="info">
    <input type="button" id="btnLoader" value="刷新"/>
    </tbody>
</table>
</body>
</html>
