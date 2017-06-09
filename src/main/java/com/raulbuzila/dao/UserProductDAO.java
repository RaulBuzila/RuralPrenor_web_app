package com.raulbuzila.dao;

import com.raulbuzila.model.Product;
import com.raulbuzila.model.User;
import com.raulbuzila.model.UserProduct;

/**
 * Created by raulbuzila on 5/9/2017.
 */
public interface UserProductDAO {
    public void saveUserProduct(UserProduct userProduct);
}
