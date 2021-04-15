<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" +
            request.getServerName() + ":" + request.getServerPort() +
            request.getContextPath() + "/";
%>
<html>
<head>
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
                url:"question/selectAllQuestion.do",
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
                            .append("<td>"+n.questionId+"</td>")
                            .append("<td>"+n.detail+"</td>")
                            .append("<td>"+n.sexType+"</td>")
                            .append("<td>"+n.ansA+"</td>")
                            .append("<td>"+n.ansB+"</td>")
                            .append("<td>"+n.ansC+"</td>")
                            .append("<td>"+n.ansD+"</td>")
                            .append("<td><a href='question/findById.do?id="+n.id+"'>修改信息</a></td>")
                            .append("<td><a href='question/deleteById.do?id="+n.id+"'>删除</a></td>")
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
        <td>问题编号</td>
        <td>详细问题</td>
        <td>性别类型</td>
        <td>选项A</td>
        <td>选项B</td>
        <td>选项C</td>
        <td>选项D</td>
        <td>账号</td>
        <td colspan="2">操作</td>
    </tr>
    </thead>
    <tbody id="info">
    <input type="button" id="btnLoader" value="刷新"/>
    </tbody>
</table>
</body>
</html>
