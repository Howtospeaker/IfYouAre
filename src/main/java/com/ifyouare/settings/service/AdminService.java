package com.ifyouare.settings.service;

import com.ifyouare.exception.LoginException;
import com.ifyouare.settings.entity.Admin;
import com.ifyouare.settings.entity.User;

import java.util.List;

public interface AdminService {
    Admin login(String loginAct, String loginPwd,String ip) throws LoginException;

    List<User> selectAllUser();

    int deleteUser(Integer id);

    User selectById(Integer id);
}
