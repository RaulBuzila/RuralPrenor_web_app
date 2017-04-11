package com.raulbuzila.web.controller;

import com.raulbuzila.dao.UserDAO;
import com.raulbuzila.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by raulbuzila on 4/10/2017.
 */
@Controller
public class RegisterController {


    private UserDAO userDAO;

    // redirect to register page from index
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public ModelAndView newUser(ModelAndView model) {
        User newUser = new User();
        model.addObject("user", newUser);
        model.setViewName("register");
        return model;
    }

    // controller to insert a use into DB
    @RequestMapping(value = "/saveUser", method = RequestMethod.POST)
    public ModelAndView saveContact(@ModelAttribute User user) {
        userDAO.saveUser(user);
        return new ModelAndView("redirect:/");
    }
}