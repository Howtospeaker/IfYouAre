package com.ifyouare.settings.dao;

import com.ifyouare.settings.entity.Admin;

import java.util.Map;

public interface AdminDao {
    Admin login(Map<String, String> map);
}
