package com.raulbuzila.model;

/**
 * Created by raulbuzila on 5/27/2017.
 */
public class Comment {
  // properties
  private int id;
  private String name;
  private String content;
  private int status;
  private int productId;

  // constructors
  public Comment(){}
  public Comment(int id, String name, String content, int productId){
    this.id=id;
    this.name=name;
    this.content=content;
    this.productId=productId;
  }
  // methods
  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public int getProductId() {
    return productId;
  }

  public void setProductId(int productId) {
    this.productId = productId;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public int getStatus() {
    return status;
  }

  public void setStatus(int status) {
    this.status = status;
  }
}
