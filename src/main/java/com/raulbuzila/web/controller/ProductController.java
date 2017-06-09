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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
    public ModelAndView saveOrUpdate(@ModelAttribute Product product){
        productDAO.saveOrUpdate(product);
        return new ModelAndView("redirect:/added");
 //        String username= request.getParameter("user_username");
//         int product_id= Integer.parseInt(request.getParameter("product_id"));
//        UserProduct userProduct=new UserProduct("raul",product_id);
//        userProductDAO.saveUserProduct(userProduct);
    }

    // READ ALL FROM DB Controller
    @RequestMapping(value = "/product", method = RequestMethod.GET)
    public ModelAndView viewProduct(ModelAndView modelAndView) throws IOException {
        List<Product> listProduct=productDAO.list();
        modelAndView.addObject("listProduct",listProduct);
        modelAndView.setViewName("ViewProduct");
        return modelAndView;
    }

    // DELETE FROM DB Controller
    @RequestMapping(value = "/deleteProduct",method = {RequestMethod.GET,RequestMethod.DELETE})
    public ModelAndView deleteProduct(HttpServletRequest request) {
        int productID = Integer.parseInt(request.getParameter("id"));
        productDAO.delete(productID);
        return new ModelAndView("redirect:/manageProducts");
    }

    // NON-CRUD operations
    // controller for New Product Form
    @RequestMapping(value = "/newProduct", method = RequestMethod.GET)
    public ModelAndView newProduct(ModelAndView modelAndView){
        UserProduct userProduct= new UserProduct();
        Product newProduct=new Product();
        List<ProductType> productTypeList=productTypeDAO.getTypeName();
        modelAndView.addObject("productTypeList",productTypeList);
        modelAndView.addObject("product",newProduct);
        modelAndView.addObject("userProduct",userProduct);
        modelAndView.setViewName("product");
        return modelAndView;
    }

    @RequestMapping(value = "/editProduct", method = RequestMethod.GET)
    public ModelAndView editProduct(HttpServletRequest request) {
      int productID = Integer.parseInt(request.getParameter("id"));
      Product product = productDAO.getProductById(productID);
      List<ProductType> productTypeList=productTypeDAO.getTypeName();
      ModelAndView modelAndView= new ModelAndView("product");
      modelAndView.addObject("productTypeList",productTypeList);
      modelAndView.addObject("product",product);
      return modelAndView;
    }

    // controller to see details of product
    @RequestMapping(value = "/viewDetails",method = RequestMethod.GET)
    public ModelAndView viewProductDetails(HttpServletRequest request){
      int productID = Integer.parseInt(request.getParameter("id"));
      Product product = productDAO.getProductById(productID);
      List<Comment> listComment = commentDAO.readAllComments(productID);
      Comment comment=new Comment();

      ModelAndView modelAndView=new ModelAndView("productDetails");
      modelAndView.addObject("product",product);
      modelAndView.addObject("comment",comment);
     modelAndView.addObject("listComment",listComment);
      return modelAndView;
    }

    @RequestMapping(value = "/added")
    public ModelAndView confirmProductAdded(ModelAndView modelAndView){
      modelAndView.setViewName("added");
      return modelAndView;
    }

  // controller for category sort
  @RequestMapping(value = "/category",method = RequestMethod.GET)
  public ModelAndView ViewProductsByCategory(HttpServletRequest request){
    int productTypeId=Integer.parseInt(request.getParameter("id"));
    List<Product> listProduct = productDAO.listProductByCategory(productTypeId);
    ModelAndView modelAndView = new ModelAndView("ViewProductCategory");
    modelAndView.addObject("listProduct",listProduct);
    return modelAndView;
  }
}