package com.raulbuzila.web.controller;

import com.raulbuzila.dao.CommentDAO;
import com.raulbuzila.dao.ReviewDAO;
import com.raulbuzila.model.Comment;
import com.raulbuzila.model.Review;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.UUID;

/**
 * Created by raulbuzila on 6/3/2017.
 */
@Controller
public class CommentController {
  @Autowired
  CommentDAO commentDAO;

  @Autowired
  ReviewDAO reviewDAO;

  @RequestMapping(value = "/saveComment", method = RequestMethod.GET)
  public ModelAndView saveComment(@ModelAttribute Comment comment, HttpServletRequest request) {
    commentDAO.saveComment(comment);
    int productId=comment.getProductId();
    int score= Integer.parseInt(request.getParameter("score"));
    String reviewId= UUID.randomUUID().toString();
    Review review= new Review(reviewId,score,productId);
    reviewDAO.saveReview(review);
    return new ModelAndView("redirect:/viewDetails?id=" + comment.getProductId());
  }
}
