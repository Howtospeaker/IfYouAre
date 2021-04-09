package com.ifyouare.settings.service.impl;

import com.ifyouare.exception.LoginException;
import com.ifyouare.settings.dao.AdminDao;
import com.ifyouare.settings.entity.Admin;
import com.ifyouare.settings.entity.User;
import com.ifyouare.settings.service.AdminService;
import com.ifyouare.utils.DateTimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminDao adminDao;
    @Override
    public Admin login(String loginAct, String loginPwd,String ip) throws LoginException {
        Map<String,String> map = new HashMap<>();
        map.put("loginAct",loginAct);
        map.put("loginPwd",loginPwd);
        Admin admin = adminDao.login(map);
        if (admin==null){
            throw new LoginException("账号密码错误");
        }
        //如果程序能够执行到该行，说明账号密码正确，继续验证
        //验证失效时间
        String expireTime = admin.getExpireTime();
        String currentTime = DateTimeUtil.getSysTime();
        if (expireTime.compareTo(currentTime)<0){
            throw new LoginException("账号已失效");
        }
        //判断锁定状态
        String lockState =admin.getLockState();
        if ("0".equals(lockState)){
            throw new LoginException("账号已锁定");
        }

        //判断ip地址
        String allowIps = admin.getAllowIps();
        if(allowIps.contains(ip)){
            throw new LoginException("ip地址受限");
        }
        return admin;
    }
}
