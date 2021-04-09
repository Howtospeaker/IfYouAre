<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" +
            request.getServerName() + ":" + request.getServerPort() +
            request.getContextPath() + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>后台登录页面</title>
    <script type="text/javascript" src="jQuery/jquery-3.5.1.js"></script>
    <script>
        $(function () {
            //页面加载完毕后，让用户的文本框自动获得焦点
            $("#loginAct").focus();
            //为登录按钮绑定时间，执行登录操作
            $("#submitBtn").click(function () {
                login();
            })
            //为当前登录页窗口绑定敲键盘时间
            $(window).keydown(function (event) {
                // alert(event.keyCode);
                //如果取得的键位的码值是13，表示敲的是回车键
                if (event.keyCode==13){
                    login();
                }
            })
        })

        function login() {
            // alert("执行登录验证功能")
            //验证账号密码不能为空
            //取得账号密码
            var loginAct = $.trim($("#loginAct").val());
            var loginPwd = $.trim($("#loginPwd").val());

            if (loginAct==""||loginPwd==""){
                $("#msg").html("账号密码不能为空");
                //如果账号密码为空，需要及时终止该方法
                return false;
            }
            //去后台验证登录相关操作
            $.ajax({
                url:"admin/login.do",
                data:{
                    "loginAct":loginAct,
                    "loginPwd":loginPwd
                },
                type:"post",
                dataType:"json",
                success:function (data) {
                    /*
                    * data:{"success":true/false,"msg":"哪错了"}
                    * */
                    //如果登录成功
                    if (data.success){
                        //跳转到工作台的初始页
                        window.location.href="behind/main/index.jsp";
                    } else {
                        $("#msg").html(data.msg)
                    }
                }
            })
        }
    </script>
</head>
<body>
<center>
    <form action="behind/main/index.jsp" method="post">
        <div>
            <div style="width: 350px;">
                <input  type="text" placeholder="用户名" id="loginAct">
            </div>
            <div style="width: 350px; position: relative;top: 20px;">
                <input  type="password" placeholder="密码" id="loginPwd">
            </div>
            <div style="position: relative;top: 30px; left: 10px;">

                <span id="msg"style="color:palevioletred;"></span>

            </div>
            <button id="submitBtn" type="button" style="width: 350px; position: relative;top: 45px;">登录</button>
        </div>
    </form>
</center>
</body>
</html>
