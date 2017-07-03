package com.raulbuzila.dao;

import com.raulbuzila.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by raulbuzila on 4/10/2017.
 */

public class UserDAOImpl implements UserDAO {
  @Autowired
  private PasswordEncoder passwordEncoder;

  // connection with database
  private JdbcTemplate jdbcTemplate;

  // constructor for UserDAOImpl
  public UserDAOImpl(DataSource dataSource) {
    jdbcTemplate = new JdbcTemplate(dataSource);
  }

  @Override
  public void saveUser(User user) {
    // insert statement
    String sql = "INSERT INTO users (username,address,email,password)"
            + " VALUES (?, ?, ?,?)";

    // encode password
    PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
    user.setPassword(passwordEncoder.encode(user.getPassword()));
    jdbcTemplate.update(sql, user.getUsername(), user.getAddress(), user.getEmail(), user.getPassword());
  }

  public void saveUserRole(User user) {
    String sql = "INSERT INTO user_roles (username, role)" + "VALUES (?,?)";
    String userRole = "ROLE_USER";
    jdbcTemplate.update(sql, user.getUsername(), userRole);
  }

  @Override
  public User getUser(String UserName) {
    String sql = "SELECT username,address,email,password from users where username='" + UserName + "'";

    return jdbcTemplate.query(sql, new ResultSetExtractor<User>() {
      @Override
      public User extractData(ResultSet resultSet) throws SQLException, DataAccessException {
        if (resultSet.next()) {
          User user = new User();
          user.setUsername(resultSet.getString("username"));
          user.setEmail(resultSet.getString("email"));
          user.setAddress(resultSet.getString("address"));
          user.setPassword(resultSet.getString("password"));

          return user;
        }
        return null;
      }
    });
  }

  @Override
  public void updateUsername(User user) {
    String SQL = "UPDATE users SET address=?,email=?,password=? WHERE username=?";
    // encode password
    PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
    user.setPassword(passwordEncoder.encode(user.getPassword()));
    jdbcTemplate.update(SQL, user.getAddress(), user.getEmail(), user.getPassword(), user.getUsername());
  }

  @Override
  public String checkUsername(String username) {
    String SQL="SELECT username,email,address,password from users WHERE username='"+username+"'";

    return jdbcTemplate.query(SQL, new ResultSetExtractor<String>() {
      @Override
      public String extractData(ResultSet resultSet) throws SQLException, DataAccessException {
        if (resultSet.next()) {
          User user = new User();
          user.setUsername(resultSet.getString("username"));
          user.setEmail(resultSet.getString("email"));
          user.setAddress(resultSet.getString("address"));
          user.setPassword(resultSet.getString("password"));

          return user.getUsername();
        }
        return null;
      }
    });
  }
}
