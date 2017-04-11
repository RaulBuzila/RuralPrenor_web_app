package com.raulbuzila.dao;

import com.raulbuzila.model.ProductType;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by raulbuzila on 4/9/2017.
 */
public class ProductTypeImpl implements ProductTypeDAO {
    // connection with database
    private JdbcTemplate jdbcTemplate;

    // constructor for UserDAOImpl
    public ProductTypeImpl(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }


    @Override
    public List<ProductType> getTypeName() {
        // SQL statement
        String sql="SELECT * from product_type";

        // list will be the result of query
        List<ProductType> listProductType = jdbcTemplate.query(sql, new RowMapper<ProductType>(){

            @Override
            public ProductType mapRow(ResultSet resultSet, int i) throws SQLException {
                ProductType productType=new ProductType();

                productType.setId(resultSet.getInt("id"));
                productType.setType(resultSet.getString("type"));

                return productType;
            }
        });

        return listProductType;
    }
}
