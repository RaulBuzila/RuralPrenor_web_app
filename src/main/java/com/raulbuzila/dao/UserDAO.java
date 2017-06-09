package com.raulbuzila.dao;

import com.raulbuzila.model.User;

/**
 * Created by raulbuzila on 4/10/2017.
 */

public interface UserDAO {
    public void saveUser(User user);
    public void saveUserRole(User user);
    public User getUser(String username);
}
