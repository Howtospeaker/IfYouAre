package com.ifyouare.settings.dao;

import com.ifyouare.settings.entity.Question;
import com.ifyouare.settings.entity.User;

import java.util.List;

public interface QuestionDao {
    int addQuestion(Question question);

    List<User> selectAllQuestion();
}
