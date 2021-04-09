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
                            .append("<td><input type='checkbox' onclick='fun1()'/>全选全不选</td>")
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
                            .append("<td><a href='user/findById.do?id=n.id'>详细信息</a></td>")
                            // .html("<td><a href='user/findById?id=n.id'>详细信息</a></td>")
                            .append("</tr>")
                    })
                }
            })
        }
        window.onload=main;
        function main(){
            //1.为数据行所有checkbox绑定onclick关联fun2
            var domArray = document.getElementsByTagName("input")
            for (let i = 1; i < domArray.length; i++) {
                domArray[i].onclick=fun2;
            }
            //2.为所有数据行绑定onmouseover
            domArray = document.getElementsByTagName("tr")
            for (let i = 1; i < domArray.length; i++) {
                domArray[i].onmouseover = fun3;
                domArray[i].onmouseout = fun4;
            }
        }
        //全选全不选--通过标题行中选中状态控制所有数据行选中状态
        function fun1(){
            var dom = document.getElementsByTagName("input")
            var flag = dom[0].checked;
            for (let i = 0; i < dom.length; i++) {
                dom[i].checked=flag;
            }
        }
        //--通过数据行中选中状态控制标题行选中状态
        function fun2(){
            var dom = document.getElementsByTagName("input")
            var checkedNum = 0;
            for (let i= 1 ;i<dom.length;i++){
                var domArray = dom[i];
                if(domArray.checked === true){
                    checkedNum++;
                }
            }
            if (checkedNum===dom.length-1){
                dom[0].checked=true;
            }else{
                dom[0].checked=false;
            }
        }
        //鼠标悬停【数据行】背景颜色变成红色
        function fun3(){
            this.style.background="grey";
        }
        //鼠标离开【数据行】背景颜色变成白色
        function fun4(){
            this.style.background="white";
        }
    </script>
</head>
<body>
<table border="2">
    <thead>
    <tr>
        <td><input type="checkbox" onclick="fun1()"/>全选全不选</td>
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
    </tr>
    </thead>
    <tbody id="info">
    <input type="button" id="btnLoader" value="刷新"/>
    </tbody>
</table>
</body>
</html>
