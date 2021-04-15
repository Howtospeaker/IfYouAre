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
    <script src="js/echarts.min.js"></script>
</head>
<body>
<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
<div id="sexChart1" style="width: 400px;height:400px;"></div>
<div id="sexChart2" style="width: 400px;height:400px;"></div>

<div id="ageChart1" style="width: 400px;height:400px;"></div>
<div id="ageChart2" style="width: 400px;height:400px;"></div>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var sexChart1 = echarts.init(document.getElementById('sexChart1'));
    var sexChart2 = echarts.init(document.getElementById('sexChart2'));
    var ageChart1 = echarts.init(document.getElementById('ageChart1'));
    var ageChart2 = echarts.init(document.getElementById('ageChart2'));

    $(function () {
        $.get('user/sexNum.do').done(function (data) {
            sexChart1.hideLoading();
            sexChart1.setOption({
                title: {
                    text: '用户性别柱状图'
                },
                tooltip: {},
                legend: {
                    data:['人数']
                },
                xAxis: {
                    data: ["男","女"]
                },
                yAxis: {},
                series: [{
                    name: '人数',
                    type: 'bar',
                    data: [data.boy,data.girl]
                }]
            });
            sexChart2.hideLoading();
            sexChart2.setOption({
                series : [
                    {
                        name: '访问来源',
                        type: 'pie',
                        radius: '55%',
                        data:[
                            {value:data.boy, name:'男生'},
                            {value:data.girl, name:'女生'},
                        ]
                    }
                ]
            });
        });
        $.get('user/ageNum.do').done(function (data) {
            // alert(data);
            ageChart1.hideLoading();
            ageChart1.setOption({
                title: {
                    text: '用户年龄柱状图'
                },
                tooltip: {},
                legend: {
                    data:['人数']
                },
                xAxis: {
                    data: ["0-20","21-40","41-60","61-80"]
                },
                yAxis: {},
                series: [{
                    name: '人数',
                    type: 'bar',
                    data:[data.ageZtoT,data.ageTtoF,data.ageFtoX,data.ageStoE]
                    // data:[5,4,2,1]
                }]
            });
            ageChart2.hideLoading();
            ageChart2.setOption({
                series : [
                    {
                        name: '访问来源',
                        type: 'pie',
                        radius: '55%',
                        roseType: 'angle',
                        data:[
                            {value:data.ageZtoT, name:'0到20岁之间'},
                            {value:data.ageTtoF, name:'20到40岁之间'},
                            {value:data.ageFtoX, name:'40到60岁之间'},
                            {value:data.ageStoE, name:'60到80岁之间'},
                        ]
                    }
                ]
            });
        });
    })
</script>
</body>
</html>
