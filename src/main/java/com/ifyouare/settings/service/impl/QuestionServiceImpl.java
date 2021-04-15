package com.ifyouare.settings.service.impl;

import com.ifyouare.settings.dao.QuestionDao;
import com.ifyouare.settings.entity.Question;
import com.ifyouare.settings.entity.User;
import com.ifyouare.settings.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QuestionServiceImpl implements QuestionService {
    @Autowired
    private QuestionDao questionDao;

    @Override
    public int addQuestion(Question question) {
        return questionDao.addQuestion(question);
    }

    @Override
    public List<User> selectAllQuestion() {
        return questionDao.selectAllQuestion();
    }
}
