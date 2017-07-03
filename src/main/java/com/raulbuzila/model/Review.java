package com.raulbuzila.model;

/**
 * Created by raulbuzila on 6/27/2017.
 */
public class Review {
  // members
  private String id;
  private int score;
  private int productId;

  // constructors
  public Review(){}
  public Review(String id,int score,int productId){
    this.id=id;
    this.score=score;
    this.productId=productId;
  }
  public Review(int score,int productId){
    this.score=score;
    this.productId=productId;
  }

  // getters and setters
  public int getProductId() {
    return productId;
  }

  public void setProductId(int productId) {
    this.productId = productId;
  }

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public int getScore() {
    return score;
  }

  public void setScore(int score) {
    this.score = score;
  }
}
