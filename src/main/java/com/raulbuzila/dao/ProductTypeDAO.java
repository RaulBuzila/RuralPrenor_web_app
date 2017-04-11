package com.raulbuzila.dao;

import com.raulbuzila.model.ProductType;

import java.util.List;

/**
 * Created by raulbuzila on 4/9/2017.
 */

public interface ProductTypeDAO {
    public List<ProductType> getTypeName();
}