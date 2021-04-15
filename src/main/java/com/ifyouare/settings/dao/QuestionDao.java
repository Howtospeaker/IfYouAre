package com.ifyouare.settings.dao;

import com.ifyouare.settings.entity.Question;
import com.ifyouare.settings.entity.User;

import java.util.List;

public interface QuestionDao {
    int addQuestion(Question question);

    List<Question> selectAllQuestion();

    int deleteById(Integer id);

    Question selectById(Integer questionId);

    int updateQuestion(Question question);
}
