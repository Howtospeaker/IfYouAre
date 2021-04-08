package com.ifyouare.settings.service.impl;

import com.ifyouare.exception.LoginException;
import com.ifyouare.settings.dao.UserDao;
import com.ifyouare.settings.entity.User;
import com.ifyouare.settings.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;
    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    public User login(String loginId, String loginPwd) throws LoginException {
        Map<String,String> map = new HashMap<>();
        map.put("loginId",loginId);
        map.put("loginPwd",loginPwd);
        User user = userDao.login(map);
        if (user==null){
            throw new LoginException("账号密码错误");
        }
        //如果程序能够执行到该行，说明账号密码正确，继续验证
        //验证失效时间
        /*String expireTime = user.getExpireTime();
        String currentTime = DateTimeUtil.getSysTime();
        if (expireTime.compareTo(currentTime)<0){
            throw new LoginException("账号已失效");
        }
*/
        //判断锁定状态
        /*String lockState =user.getLockState();
        if ("0".equals(lockState)){
            throw new LoginException("账号已锁定");
        }*/

        //判断ip地址
        /*String allowIps = user.getAllowIps();
        if(allowIps.contains(ip)){
            throw new LoginException("ip地址受限");
        }*/
        return user;
    }

    @Override
    public int register(User user) {
        return userDao.addUser(user);
    }
}
