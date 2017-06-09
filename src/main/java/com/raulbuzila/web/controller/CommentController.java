package com.raulbuzila.web.controller;

import com.raulbuzila.dao.CommentDAO;
import com.raulbuzila.model.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by raulbuzila on 6/3/2017.
 */
@Controller
public class CommentController {
  @Autowired
  CommentDAO commentDAO;

  @RequestMapping(value ="/saveComment", method = RequestMethod.GET)
  public ModelAndView saveComment(@ModelAttribute Comment comment){
    commentDAO.saveComment(comment);
     return new ModelAndView("redirect:/viewDetails?id="+ comment.getProductId());
  }
}
