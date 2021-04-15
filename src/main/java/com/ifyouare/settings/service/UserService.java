package com.ifyouare.settings.service;

import com.ifyouare.exception.LoginException;
import com.ifyouare.settings.entity.User;

import java.util.List;
import java.util.Map;

public interface UserService {
    User login(String loginId, String loginPwd) throws LoginException;
    int register(User user);

    int updateUser(User user);

    List<User> selectBySimple(Integer sex, Integer minage, Integer maxage, Integer minpoint, Integer maxpoint);

    int boyNum();

    int girlNum();

    Map<String, Object> ageNum();
}
