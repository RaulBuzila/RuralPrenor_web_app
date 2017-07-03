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

import javax.servlet.http.HttpServletRequest;

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
    ModelAndView modelAndView;
    String inputUsername = user.getUsername();
    String dbUsername = userDAO.checkUsername(inputUsername);

    // if an User with same name exists the return error
    if(inputUsername.equals(dbUsername)){
      String message="Numele de utilizator ales exista deja!";
      modelAndView = new ModelAndView("register");
      modelAndView.addObject("message",message);
    }
    else{
      userDAO.saveUser(user);
      userDAO.saveUserRole(user);
      modelAndView = new ModelAndView("welcome");
    }
    return modelAndView;
  }

  // return account page
  @RequestMapping(value = "/account", method = RequestMethod.GET)
  public ModelAndView viewAccountDetails(ModelAndView model, HttpServletRequest request) {
    String username = request.getParameter("username");
    User user = userDAO.getUser(username);
    model.addObject("user", user);
    model.setViewName("account");
    return model;
  }

  // modify account info
  @RequestMapping(value = "/updateUserInfo", method = RequestMethod.POST)
  public ModelAndView UpdateUserInfo(@ModelAttribute User user) {
    userDAO.updateUsername(user);
    ModelAndView modelAndView = new ModelAndView("account");
    return modelAndView;
  }

  @RequestMapping(value = "/userProfile",method = RequestMethod.GET)
  public ModelAndView ReturnUserProfile(ModelAndView modelAndView,HttpServletRequest request){
    String username = request.getParameter("username");
    User currentUser = userDAO.getUser(username);

    modelAndView.addObject("currentUser",currentUser);
    modelAndView.setViewName("userProfile");
    return modelAndView;
  }
}