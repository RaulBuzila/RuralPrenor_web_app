package com.raulbuzila.web.controller;

import com.raulbuzila.dao.CommentDAO;
import com.raulbuzila.dao.ProductDAO;
import com.raulbuzila.model.Comment;
import com.raulbuzila.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by raulbuzila on 6/20/2017.
 */
@Controller
public class AdminController {
  @Autowired
  ProductDAO productDAO;

  @Autowired
  CommentDAO commentDAO;

  @RequestMapping(value = "/admin", method = RequestMethod.GET)
  public ModelAndView adminPage() {
    List<Product> productList = productDAO.list();
    List<Comment> unapprovedCommentsList = commentDAO.readAllUnapprovedComments();
    List<Comment> approvedCommentsList = commentDAO.readAllComments();
    ModelAndView model = new ModelAndView();
    model.addObject("unapprovedCommentsList", unapprovedCommentsList);
    model.addObject("approvedCommentsList", approvedCommentsList);
    model.addObject("productList", productList);
    model.setViewName("/admin");
    return model;
  }

  @RequestMapping(value = "/approveComment", method = RequestMethod.GET)
  public ModelAndView approveComment(@ModelAttribute Comment comment, HttpServletRequest request) {
    int commentId = Integer.parseInt(request.getParameter("id"));
    commentDAO.approveComment(commentId);
    ModelAndView model = new ModelAndView();
    model.setViewName("/admin");
    return model;
  }

  @RequestMapping(value = "/deleteComment", method = RequestMethod.GET)
  public ModelAndView deleteComment(@ModelAttribute Comment comment, HttpServletRequest request) {
    int commentId = Integer.parseInt(request.getParameter("id"));
    commentDAO.deleteComment(commentId);
    ModelAndView model = new ModelAndView();
    model.setViewName("/admin");
    return model;
  }

  // DELETE FROM DB Controller
  @RequestMapping(value = "/deleteProductAdmin", method = {RequestMethod.GET, RequestMethod.DELETE})
  public ModelAndView deleteProductAdmin(HttpServletRequest request) {
    int productID = Integer.parseInt(request.getParameter("id"));
    productDAO.delete(productID);
    return new ModelAndView("redirect:/admin");
  }
}