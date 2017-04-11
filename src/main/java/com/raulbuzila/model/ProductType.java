package com.raulbuzila.model;

/**
 * Created by raulbuzila on 4/9/2017.
 */
public class ProductType {
    private int id;
    private String type;

    public ProductType(){

    }

    public ProductType(String type){
        this.type=type;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}