package com.raulbuzila.model;

/**
 * Created by raulbuzila on 4/10/2017.
 */

public class User {
    // properties
    private String username;
    private String password;
    private String email;
    private String address;

    // constructors
    public User(){}
    public User(String email, String username, String address){
        this.email=email;
        this.username=username;
        this.address=address;
    }
    public User(String email, String username, String address,String password){
        this.email=email;
        this.username=username;
        this.address=address;
        this.password=password;
    }

    // methods
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }

    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }

    public void setPassword(String password){this.password=password; }
    public String getPassword() {
        return password;
    }
}
