package com.ifyouare.settings.web.controller;

import com.ifyouare.settings.entity.Question;
import com.ifyouare.settings.entity.User;
import com.ifyouare.settings.service.QuestionService;
import com.ifyouare.utils.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/question")
public class QuestionController {
    @Autowired
    private QuestionService questionService;

    //添加问题
    @RequestMapping("/addUser.do")
    public ModelAndView addUser(Question question){
        ModelAndView mv = new ModelAndView();
        String tips = "添加失败";
        int flag = questionService.addQuestion(question);
        if (flag ==1){
            tips = "添加成功";
        }
        mv.addObject("msg",tips);
        mv.setViewName("result");
        return mv;
    }

    //查询所有问题
    @RequestMapping("/selectAllQuestion.do")
    @ResponseBody
    public List<Question> selectAllUser(){
        return questionService.selectAllQuestion();
    }

    //删除用户
    @RequestMapping("/deleteById.do")
    public ModelAndView deleteUser(Integer questionId){
        ModelAndView mv = new ModelAndView();
        String tips = "删除失败";
        int flag = questionService.deleteQuestion(questionId);
        if (flag ==1){
            tips = "删除成功";
        }
        mv.addObject("msg",tips);
        mv.setViewName("result");
        return mv;
    }

    //更新用户信息
    @RequestMapping("/updateQuestion.do")
    @ResponseBody
    public ModelAndView updateUser(Question question){
        ModelAndView mv = new ModelAndView();
        String tips = "修改失败";
        if (questionService.updateQuestion(question)==1)
            tips = "修改成功";
        mv.addObject("msg",tips);
        mv.setViewName("../behind/main/opertation/QuestionSelectById");
        return mv;
    }

    //查询单个用户信息，并可以修改
    @RequestMapping(value = "/findById.do")
    @ResponseBody
    public ModelAndView selectById(Integer questionId){
        ModelAndView mv = new ModelAndView();
        Question question = questionService.selectById(questionId);
        mv.addObject("question",question);
        mv.setViewName("../behind/main/opertation/QuestionSelectById");
        return mv;
    }
}
