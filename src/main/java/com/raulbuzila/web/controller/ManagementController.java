package com.raulbuzila.web.controller;

import com.raulbuzila.dao.ProductDAO;
import com.raulbuzila.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

/**
 * Created by raulbuzila on 4/27/2017.
 */

@Controller
public class ManagementController {

  @Autowired
  ProductDAO productDAO;

  @RequestMapping(method = RequestMethod.GET, value = "/manageProducts")
  public ModelAndView ManageProducts(ModelAndView model, HttpServletRequest request) throws IOException {
    String username= (String) request.getSession().getAttribute("loggedUser");
    List<Product> listProduct = productDAO.list(username);
    model.addObject("listProduct", listProduct);
    model.setViewName("manageProducts");

    return model;
  }
}
