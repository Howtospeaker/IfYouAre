
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