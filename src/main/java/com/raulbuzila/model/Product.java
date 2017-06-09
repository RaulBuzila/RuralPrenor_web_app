package com.raulbuzila.model;

/**
 * Created by raulbuzila on 4/9/2017.
 */

public class Product {
    // Properties
    private int product_id;
    private String product_name;
    private String description;
    private int price;
    private int productType_id;
    private String productType_name;

    // Constructors
    public Product(){}
    public Product(String product_name,String description,int price,int productType_id){
        this.product_name=product_name;
        this.description=description;
        this.price=price;
        this.productType_id=productType_id;
    }

    // Methods
    public int getProduct_id() {
        return product_id;
    }
    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getProductType_id() {
        return productType_id;
    }
    public void setProductType_id(int productType_id) {
        this.productType_id = productType_id;
    }

    public float getPrice() {
        return price;
    }
    public void setPrice(int price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }

    public String getProduct_name() {
        return product_name;
    }
    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getProductType_name() {
        return productType_name;
    }
    public void setProductType_name(String productType_name) {
        this.productType_name = productType_name;
    }
}