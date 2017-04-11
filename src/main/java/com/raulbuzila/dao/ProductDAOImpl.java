package com.raulbuzila.dao;

import com.raulbuzila.model.Product;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by raulbuzila on 4/9/2017.
 */
public class ProductDAOImpl implements ProductDAO {
    private JdbcTemplate jdbcTemplate;

    public ProductDAOImpl(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }

    @Override
    public void save(Product product) {

        // insert
        String sql = "INSERT INTO product (product_name, description, price, productType_id)"
                + " VALUES (?, ?, ?, ?)";
        jdbcTemplate.update(sql, product.getProduct_name(), product.getDescription(),product.getPrice(),product.getProductType_id());
    }

    @Override
    public List<Product> list() {
        // sql statement
        String sql="SELECT p.product_id,p.product_name,p.description,p.price,p.productType_id,pt.type from product p, product_type pt where p.productType_id=pt.id";


        List<Product> listProduct= jdbcTemplate.query(sql, new RowMapper<Product>() {
            @Override
            public Product mapRow(ResultSet resultSet, int i) throws SQLException {
                Product product=new Product();

                product.setProduct_id(resultSet.getInt("product_id"));
                product.setProduct_name(resultSet.getString("product_name"));
                product.setDescription(resultSet.getString("description"));
                product.setPrice(resultSet.getInt("price"));
                product.setProductType_id(resultSet.getInt("productType_id"));
                product.setProductType_name(resultSet.getString("type"));

                return product;
            }
        });

        return listProduct;
    }
}
