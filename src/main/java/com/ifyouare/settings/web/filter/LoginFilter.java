package com.ifyouare.settings.web.filter;

import com.ifyouare.settings.entity.User;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        System.out.println("进入到验证有没有登录过的过滤器");
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        HttpSession sesion = request.getSession();
        User user = (User)sesion.getAttribute("user");

        //如果user不为空，说明登录过
        if (user!=null){
            filterChain.doFilter(request,response);
        } else {
            //重定向到登录页
            /*
                重定向路径无论是前端后端都一律要使用绝对路径
            */
        }
    }

    @Override
    public void destroy() {

    }
}
