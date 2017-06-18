package com.raulbuzila.web.controller;

import com.raulbuzila.dao.CommentDAO;
import com.raulbuzila.dao.ProductDAO;
import com.raulbuzila.dao.ProductTypeDAO;
import com.raulbuzila.dao.UserProductDAO;
import com.raulbuzila.model.Comment;
import com.raulbuzila.model.Product;
import com.raulbuzila.model.ProductType;
import com.raulbuzila.model.UserProduct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

@Controller
public class ProductController {
  // MEMBERS
  @Autowired
  ProductDAO productDAO;
  @Autowired
  UserProductDAO userProductDAO;
  @Autowired
  ProductTypeDAO productTypeDAO;
  @Autowired
  CommentDAO commentDAO;

  // METHODS
  // INSERT INTO DB Controller
  @RequestMapping(value = "/saveProduct", method = RequestMethod.GET)
  public ModelAndView save(@ModelAttribute Product product, HttpServletRequest request) {
    String username = request.getParameter("username");
    int productId =product.getProduct_id();
    UserProduct userProduct = new UserProduct(username,productId);
    productDAO.save(product);
    userProductDAO.saveUserProduct(userProduct);
    return new ModelAndView("redirect:added");
  }

  // EDIT PRODUCT
  @RequestMapping(value = "/editingProduct", method = RequestMethod.GET)
  public ModelAndView editProduct(@ModelAttribute Product product) {
    productDAO.edit(product);
    return new ModelAndView("redirect:edited");
  }

  // READ ALL FROM DB Controller
  @RequestMapping(value = "/product", method = RequestMethod.GET)
  public ModelAndView viewProduct(ModelAndView modelAndView) throws IOException {
    List<Product> listProduct = productDAO.list();
    modelAndView.addObject("listProduct", listProduct);
    modelAndView.setViewName("ViewProduct");
    return modelAndView;
  }

  // DELETE FROM DB Controller
  @RequestMapping(value = "/deleteProduct", method = {RequestMethod.GET, RequestMethod.DELETE})
  public ModelAndView deleteProduct(HttpServletRequest request) {
    int productID = Integer.parseInt(request.getParameter("id"));
    productDAO.delete(productID);
    return new ModelAndView("redirect:/manageProducts");
  }

  // NON-CRUD operations
  // controller for New Product Form
  @RequestMapping(value = "/newProduct", method = RequestMethod.GET)
  public ModelAndView newProduct(ModelAndView modelAndView) {
    UserProduct userProduct = new UserProduct();
    Product newProduct = new Product();
    List<ProductType> productTypeList = productTypeDAO.getTypeName();
    modelAndView.addObject("productTypeList", productTypeList);
    modelAndView.addObject("product", newProduct);
    modelAndView.addObject("userProduct", userProduct);
    modelAndView.setViewName("product");
    return modelAndView;
  }

  @RequestMapping(value = "/editProduct", method = RequestMethod.GET)
  public ModelAndView editProduct(HttpServletRequest request) {
    int productID = Integer.parseInt(request.getParameter("id"));
    Product product = productDAO.getProductById(productID);
    List<ProductType> productTypeList = productTypeDAO.getTypeName();
    ModelAndView modelAndView = new ModelAndView("editProduct");
    modelAndView.addObject("productTypeList", productTypeList);
    modelAndView.addObject("product", product);
    return modelAndView;
  }

  // controller to see details of product
  @RequestMapping(value = "/viewDetails", method = RequestMethod.GET)
  public ModelAndView viewProductDetails(HttpServletRequest request) {
    int productID = Integer.parseInt(request.getParameter("id"));
    Product product = productDAO.getProductById(productID);
    List<Comment> listComment = commentDAO.readAllComments(productID);
    Comment comment = new Comment();
    ModelAndView modelAndView = new ModelAndView("productDetails");
    modelAndView.addObject("product", product);
    modelAndView.addObject("comment", comment);
    modelAndView.addObject("listComment", listComment);
    return modelAndView;
  }

  @RequestMapping(value = "/added")
  public ModelAndView confirmProductAdded(ModelAndView modelAndView) {
    modelAndView.setViewName("added");
    return modelAndView;
  }

  @RequestMapping(value = "/edited")
  public ModelAndView confirmProductModified(ModelAndView modelAndView) {
    modelAndView.setViewName("edited");
    return modelAndView;
  }
  // controller for category sort
  @RequestMapping(value = "/category", method = RequestMethod.GET)
  public ModelAndView ViewProductsByCategory(HttpServletRequest request) {
    int productTypeId = Integer.parseInt(request.getParameter("id"));
    String categoryName = getCategoryName(productTypeId);
    List<Product> listProduct = productDAO.listProductByCategory(productTypeId);
    ModelAndView modelAndView = new ModelAndView("ViewProductCategory");
    modelAndView.addObject("categoryName", categoryName);
    modelAndView.addObject("listProduct", listProduct);
    return modelAndView;
  }

  private String getCategoryName(int categoryId) {
    String categoryName;
    switch (categoryId) {
      case 1:
        categoryName = "Fructe";
        break;
      case 2:
        categoryName = "Legume";
        break;
      case 3:
        categoryName = "Lactate";
        break;
      case 4:
        categoryName = "Alte tipuri de produse";
        break;
      default:
        categoryName = "";
        break;
    }
    return categoryName;
  }
}