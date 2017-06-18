package com.raulbuzila.dao;

import com.raulbuzila.model.Product;
import com.raulbuzila.model.ProductType;

import java.util.List;

/**
 * Created by raulbuzila on 4/9/2017.
 */
public interface ProductDAO {
  public void save(Product product);

  public void edit(Product product);

  public List<Product> list();

  public List<Product> list(String username);

  public List<Product> listProductByCategory(int productTypeId);

  public Product getProductById(int productID);

  public void delete(int productID);
}
