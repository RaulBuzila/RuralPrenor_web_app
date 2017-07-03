package com.raulbuzila.dao;

import com.raulbuzila.model.Review;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by raulbuzila on 6/27/2017.
 */
public class ReviewDAOImpl implements ReviewDAO {
  // members
  private JdbcTemplate jdbcTemplate;

  // constructor
  public ReviewDAOImpl(DataSource dataSource) {
    jdbcTemplate = new JdbcTemplate(dataSource);
  }

  @Override
  public void saveReview(Review review) {
      String SQL="INSERT INTO review(id,score,productId)VALUES(?,?,?)";
      jdbcTemplate.update(SQL,review.getId(),review.getScore(),review.getProductId());
  }

  @Override
  public int getNumberOfReviews(int productId) {
    int count=0;
    String SQL ="SELECT COUNT(*) FROM review WHERE productId=?";
    if(jdbcTemplate.queryForObject(SQL, new Object[] { productId }, Integer.class)>0)
      count =jdbcTemplate.queryForObject(SQL, new Object[] { productId }, Integer.class);
    return count;
  }

  @Override
  public float getAverageReview(int productId) {
    int average=0;
    if(this.getNumberOfReviews(productId) >0 ){
      String SQL ="SELECT AVG (score) FROM review WHERE productId=?";
      average = jdbcTemplate.queryForObject(SQL, new Object[] { productId }, Integer.class);
    }
    return average;
  }

}
