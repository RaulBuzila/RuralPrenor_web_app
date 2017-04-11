package com.raulbuzila.dao;

import com.raulbuzila.model.Product;

import java.util.List;

/**
 * Created by raulbuzila on 4/9/2017.
 */
public interface ProductDAO {
    public void save(Product product);

    public List<Product> list();
}
