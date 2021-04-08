package com.ifyouare.settings.service;

import com.ifyouare.exception.LoginException;
import com.ifyouare.settings.entity.User;

public interface UserService {
    User login(String loginAct, String loginPwd) throws LoginException;
    int register(User user);
}
