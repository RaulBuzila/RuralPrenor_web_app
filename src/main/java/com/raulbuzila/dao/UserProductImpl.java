package com.raulbuzila.dao;

import com.raulbuzila.model.UserProduct;
import org.springframework.jdbc.core.JdbcTemplate;
import javax.sql.DataSource;

public class UserProductImpl implements UserProductDAO {
    // connection with database
    private JdbcTemplate jdbcTemplate;

    // constructor for UserProductImpl
    public UserProductImpl(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }

    @Override
    public void saveUserProduct(UserProduct userProduct) {
       String sql="INSERT INTO user_product(user_username,product_id)"+"VALUES(?,?)";
        jdbcTemplate.update(sql,userProduct.getUser_username(),userProduct.getProduct_id());
    }
}
