package com.raulbuzila.dao;

import com.raulbuzila.model.Product;
import com.raulbuzila.model.UserProduct;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserProductImpl implements UserProductDAO {
  // connection with database
  private JdbcTemplate jdbcTemplate;

  // constructor for UserProductImpl
  public UserProductImpl(DataSource dataSource) {
    jdbcTemplate = new JdbcTemplate(dataSource);
  }

  @Override
  public void saveUserProduct(UserProduct userProduct) {
    String sql = "INSERT INTO user_product(user_username,product_id)" + "VALUES(?,?)";
    jdbcTemplate.update(sql, userProduct.getUser_username(), userProduct.getProduct_id());
  }

  @Override
  public UserProduct getUserProduct(int productId) {
    String SQL = "SELECT user_username,product_id FROM user_product WHERE product_id="+productId;
    return jdbcTemplate.query(SQL, new ResultSetExtractor<UserProduct>() {
      public UserProduct extractData(ResultSet resultSet) throws SQLException {
        if (resultSet.next()) {
          UserProduct userProduct = new UserProduct();

          userProduct.setUser_username(resultSet.getString("user_username"));
          userProduct.setProduct_id(resultSet.getInt("product_id"));

          return userProduct;
        }
        return null;
      }
    });
  }
}
