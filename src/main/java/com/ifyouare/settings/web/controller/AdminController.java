package com.ifyouare.settings.web.controller;

import com.ifyouare.settings.entity.Admin;
import com.ifyouare.settings.service.AdminService;
import com.ifyouare.utils.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AdminService adminService;


    @RequestMapping("/login.do")
    @ResponseBody
    private Map<String,Object> login(String loginAct, String loginPwd, HttpServletRequest request){
        Map<String,Object> map = new HashMap<>();

        System.out.println("进入到验证登录操作");
        //将密码的明文形式转换为MD5的密文形式
        loginPwd = MD5Util.getMD5(loginPwd);
        //接收浏览器端的ip地址
        String ip = request.getRemoteAddr();
        System.out.println("  ip  :"+ip);

        Admin admin = null;
        try {
            System.out.println(loginAct+"========"+loginPwd);
            admin = adminService.login(loginAct,loginPwd,ip);
            request.getSession().setAttribute("admin",admin);
            //如果程序执行到此处，说明业务层没有为controller抛出任何的异常
            //表示登录成功{"success":true}
            map.put("success",true);
            return map;
        } catch (Exception e) {
            e.printStackTrace();
            //一旦程序执行了catch块的学习，说明业务层为我们验证登录失败，为controller抛出异常
            //表示登录失败
            /*
             * {"success":ture,"msg":?}
             * */
            String msg = e.getMessage();
            /*
             * 我们现在作为controller，需要为ajax请求提供多项信息
             * 可以使用两种手段来处理
             *   1）将多项信息打包成为map，将map解析为json串
             *   2）创建一个vo
             *       private boolean success;
             *       private String msg;
             *  如果对于展现的信息将来还会大量的使用，我们创建一个vo类，使用方便
             *  如果对于展现的信息只有在这个需求中能使用，我们使用map就可以了
             * */
            map.put("success",false);
            map.put("msg",msg);
            return map;
        }
    }
}
