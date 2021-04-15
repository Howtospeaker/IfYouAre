package com.ifyouare.settings.service;

import com.ifyouare.settings.entity.Question;
import com.ifyouare.settings.entity.User;

import java.util.List;

public interface QuestionService {
    int addQuestion(Question question);

    List<User> selectAllQuestion();
}
