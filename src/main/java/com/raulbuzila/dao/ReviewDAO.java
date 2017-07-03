package com.raulbuzila.dao;

import com.raulbuzila.model.Review;

/**
 * Created by raulbuzila on 6/27/2017.
 */
public interface ReviewDAO {
  public void saveReview(Review review);

  public int getNumberOfReviews(int productId);

  public float getAverageReview(int productId);
}
