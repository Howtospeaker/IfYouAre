package com.ifyouare.settings.web.controller;

import com.ifyouare.settings.entity.User;
import com.ifyouare.settings.service.UserService;
import com.ifyouare.utils.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    //下面方法使用RequestMapping来映射，例如@RequestMapping("/addUser.do")
    //要用@ResponseBody响应ajax

    //用户登录
    @RequestMapping("/login.do")
    @ResponseBody
    private Map<String,Object> login(String loginId, String loginPwd, HttpServletRequest request){
        Map<String,Object> map = new HashMap<>();

        System.out.println("进入到验证登录操作");
        //将密码的明文形式转换为MD5的密文形式
        loginPwd = MD5Util.getMD5(loginPwd);
        //接收浏览器端的ip地址
//        String ip = request.getRemoteAddr();
//        System.out.println("  ip  :"+ip);

        User user = null;
        try {
            user = userService.login(loginId,loginPwd);
            request.getSession().setAttribute("user",user);
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
    //用户注册
    @RequestMapping("/register.do")
    public ModelAndView userInsert(User user){
        ModelAndView mv = new ModelAndView();
        String tips = "注册失败";
        user.setLoginPwd(MD5Util.getMD5(user.getLoginPwd()));
        int flag = userService.register(user);
        if (flag ==1){
            tips = "注册成功";
        }
        mv.addObject("msg",tips);
        mv.setViewName("result");
        return mv;
    }

    //简单查询
    @RequestMapping("/findBySimple.do")
    @ResponseBody
    public List<User> findBySimple(Integer sex,Integer minage,Integer maxage,Integer minpoint,Integer maxpoint){
        return userService.selectBySimple(sex,minage,maxage,minpoint,maxpoint);
    }

    //男女数量图表
    @RequestMapping("/sexNum.do")
    @ResponseBody
    public Map<String,Integer> sexNum(){
        Map<String,Integer> map = new HashMap<>();
        map.put("boy",userService.boyNum());
        map.put("girl",userService.girlNum());
        return map;
    }


    @RequestMapping("/ageNum.do")
    @ResponseBody
    public Map<String,Object> ageNum(){
        return userService.ageNum();
    }
}
