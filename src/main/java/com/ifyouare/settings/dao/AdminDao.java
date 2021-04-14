package com.ifyouare.settings.dao;

import com.ifyouare.settings.entity.Admin;
import com.ifyouare.settings.entity.User;

import java.util.List;
import java.util.Map;

public interface AdminDao {
    Admin login(Map<String, String> map);

    List<User> selectAllUser();

    int deleteById(Integer id);

    User selectById(Integer id);
}
