package com.raulbuzila.model;

/**
 * Created by raulbuzila on 5/9/2017.
 */
public class UserProduct {
    // properties
    private String user_username;
    private int product_id;
    // constructors
    public UserProduct(){}
    public UserProduct(String username,int productID){
        this.user_username=username;
        this.product_id=productID;
    }
    // methods
    public String getUser_username() {
        return user_username;
    }
    public void setUser_username(String user_username) {
        this.user_username = user_username;
    }
    public int getProduct_id() {
        return product_id;
    }
    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }
}
