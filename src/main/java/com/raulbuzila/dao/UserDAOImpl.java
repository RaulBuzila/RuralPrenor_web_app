package com.raulbuzila.dao;

import com.raulbuzila.model.User;
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

    // connection with database
    private JdbcTemplate jdbcTemplate;

    // constructor for UserDAOImpl
    public UserDAOImpl(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }


    @Override
    public void saveUser(User user) {

        // insert statement
        String sql = "INSERT INTO USER (email, username, address)"
                + " VALUES (?, ?, ?)";
        jdbcTemplate.update(sql, user.getEmail(),
                user.getUsername(), user.getAddress());
    }

    @Override
    public User get(String UserName) {
        String sql="SELECT * from user where username=" +UserName;

        return jdbcTemplate.query(sql, new ResultSetExtractor<User>() {
            @Override
            public User extractData(ResultSet resultSet) throws SQLException, DataAccessException {
                if(resultSet.next()){
                    User user=new User();
                    user.setUsername(resultSet.getString("name"));
                    user.setEmail(resultSet.getString("email"));
                    user.setUsername(resultSet.getString("address"));

                    // encode password
                    PasswordEncoder passwordEncoder= new BCryptPasswordEncoder();
                    String encodedPassword=passwordEncoder.encode(resultSet.getString("parola"));

                    user.setPassword(encodedPassword);

                    return user;
                }

                return null;
            }
        });
    }
}
