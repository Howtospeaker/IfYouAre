package com.ifyouare.settings.dao;

import com.ifyouare.settings.entity.User;

import java.util.Map;

public interface UserDao {
    User login(Map<String, String> map);

    int addUser(User user);

    int updateUser(User user);
}
