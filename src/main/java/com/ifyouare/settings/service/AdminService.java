package com.ifyouare.settings.service;

import com.ifyouare.exception.LoginException;
import com.ifyouare.settings.entity.Admin;

public interface AdminService {
    Admin login(String loginAct, String loginPwd,String ip) throws LoginException;
}
