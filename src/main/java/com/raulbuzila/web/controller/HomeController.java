package com.raulbuzila.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by raulbuzila on 4/9/2017.
 */

@Controller
public class HomeController {

    @RequestMapping(value = { "/", "/home" }, method = RequestMethod.GET)
    public ModelAndView homepage(){

        ModelAndView model = new ModelAndView();
        model.setViewName("home");
        return model;
    }

    // just for logout
//    @RequestMapping(value = { "/", "/home" }, method = RequestMethod.POST)
//    public ModelAndView toHome(){
//
//        ModelAndView model = new ModelAndView();
//        model.setViewName("home");
//        return model;
//    }
}
