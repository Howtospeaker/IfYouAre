package com.ifyouare.settings.dao;

import com.ifyouare.settings.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface UserDao {
    User login(Map<String, String> map);

    int addUser(User user);

    int updateUser(User user);

    //多注解需要用@Param
    List<User> selectBySimple(@Param("sex") Integer sex,
                              @Param("minage") Integer minage,
                              @Param("maxage") Integer maxage,
                              @Param("minpoint") Integer minpoint,
                              @Param("maxpoint") Integer maxpoint);

    int selectBoyNum();

    int selectGirlNum();

    Map<String, Object> selectAgeNum();
}
