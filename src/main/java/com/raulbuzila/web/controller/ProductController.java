package com.raulbuzila.web.controller;

import com.raulbuzila.dao.ProductDAO;
import com.raulbuzila.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.util.List;

@Controller
public class ProductController {

    @Autowired
    ProductDAO productDAO;

    // controller to insert a product into DB
    @RequestMapping(value = "/addproduct", method = RequestMethod.GET)
    public ModelAndView saveProduct(@ModelAttribute Product product){
        productDAO.save(product);
        return new ModelAndView("redirect:/added");
    }

    // controller to see all products added in DB
    @RequestMapping(value = "/product", method = RequestMethod.GET)
    public ModelAndView viewProduct(ModelAndView modelAndView) throws IOException {
        List<Product> listProduct=productDAO.list();

        modelAndView.addObject("listProduct",listProduct);
        modelAndView.setViewName("ViewProduct");

        return modelAndView;
    }
}



