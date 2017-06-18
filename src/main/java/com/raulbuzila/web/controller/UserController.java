package com.raulbuzila.web.controller;

import com.raulbuzila.dao.UserDAO;
import com.raulbuzila.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
/**
 * Created by raulbuzila on 4/10/2017.
 */
@Controller
public class UserController {
    @Autowired
    private UserDAO userDAO;

    // redirect to register page from index
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public ModelAndView returnRegistration(ModelAndView model) {
        User user = new User();
        model.addObject("user", user);
        model.setViewName("register");
        return model;
    }

    // controller to insert a use into DB
    @RequestMapping(value = "/saveUser", method = RequestMethod.POST)
    public ModelAndView saveUsername(@ModelAttribute User user) {
        userDAO.saveUser(user);
        userDAO.saveUserRole(user);
        ModelAndView modelAndView= new ModelAndView("welcome");
        return modelAndView;
    }

    @RequestMapping(value = "/account",method = RequestMethod.GET)
    public ModelAndView viewAccountDetails(ModelAndView model){
        model.setViewName("account");
        return  model;
    }
}