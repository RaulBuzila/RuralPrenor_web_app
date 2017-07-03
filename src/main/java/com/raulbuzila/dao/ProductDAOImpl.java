package com.raulbuzila.dao;

import com.raulbuzila.model.Product;
import com.raulbuzila.model.ProductType;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by raulbuzila on 4/9/2017.
 */
public class ProductDAOImpl implements ProductDAO {
  // members
  private JdbcTemplate jdbcTemplate;

  // constructor
  public ProductDAOImpl(DataSource dataSource) {
    jdbcTemplate = new JdbcTemplate(dataSource);
  }

  // methods
  @Override
  public void save(Product product) {
    // insert
    String SQL = "INSERT INTO product (product_id,product_name, description, price, productType_id)"
            + " VALUES (?, ?, ?, ?, ?)";
    jdbcTemplate.update(SQL, product.getProduct_id(), product.getProduct_name(), product.getDescription(), product.getPrice(), product.getProductType_id());
  }

  @Override
  public void edit(Product product) {
    // if(product.getProduct_id()>0){
    String SQL = "UPDATE product SET product_name =?,description=?,price=? WHERE product_id=?";
    jdbcTemplate.update(SQL, product.getProduct_name(), product.getDescription(), product.getPrice(), product.getProduct_id());
    // }
  }

  @Override
  public List<Product> list() {
    // sql statement
    String sql = "SELECT p.product_id,p.product_name,p.description,p.price,p.productType_id,pt.type FROM product p, product_type pt WHERE p.productType_id=pt.id";

    List<Product> listProduct = jdbcTemplate.query(sql, new RowMapper<Product>() {
      @Override
      public Product mapRow(ResultSet resultSet, int i) throws SQLException {
        return CreateProductViewModel(resultSet);
      }
    });
    return listProduct;
  }

  public List<Product> list(String username) {
    // sql statement
    String sql = "SELECT p.product_id,p.product_name,p.description,p.price,p.productType_id,pt.type FROM product p, product_type pt,user_product up WHERE p.productType_id=pt.id AND p.product_id=up.product_id and up.user_username=?";

    List<Product> listProduct = jdbcTemplate.query(sql, new RowMapper<Product>() {
      @Override
      public Product mapRow(ResultSet resultSet, int i) throws SQLException {
        return CreateProductViewModel(resultSet);
      }
    },username);
    return listProduct;
  }

  @Override
  public List<Product> listProductByCategory(int productTypeId) {
    // sql statement
    String sql = "SELECT p.product_id,p.product_name,p.description,p.price,p.productType_id,pt.type from product p, product_type pt where p.productType_id=pt.id and pt.id='" + productTypeId + "' ";

    List<Product> listProduct = jdbcTemplate.query(sql, new RowMapper<Product>() {
      @Override
      public Product mapRow(ResultSet resultSet, int i) throws SQLException {
        return CreateProductInstance(resultSet);
      }
    });
    return listProduct;
  }

  @Override
  public List<Product> readAllProducts() {
    return null;
  }

  private Product CreateProductViewModel(ResultSet resultSet) throws SQLException{
    Product product = new Product();

    product.setProduct_id(resultSet.getInt("product_id"));
    product.setProduct_name(resultSet.getString("product_name"));
    product.setDescription(resultSet.getString("description"));
    product.setPrice(resultSet.getInt("price"));
    product.setProductType_id(resultSet.getInt("productType_id"));
    product.setProductType_name(resultSet.getString("type"));

    return product;
  }

  private Product CreateProductInstance(ResultSet resultSet) throws SQLException {
    Product product = new Product();

    product.setProduct_id(resultSet.getInt("product_id"));
    product.setProduct_name(resultSet.getString("product_name"));
    product.setDescription(resultSet.getString("description"));
    product.setPrice(resultSet.getInt("price"));

    return product;
  }

  @Override
  public Product getProductById(int productID) {
    // sql statement
    String sql = "SELECT product_id,product_name,description,price FROM product p WHERE product_id=" + productID;

    return jdbcTemplate.query(sql, new ResultSetExtractor<Product>() {
      public Product extractData(ResultSet resultSet) throws SQLException {
        if (resultSet.next()) {
          return CreateProductInstance(resultSet);
        }
        return null;
      }
    });
  }

  @Override
  public void delete(int productID) {
    String sql = "DELETE FROM product WHERE product_id=?";
    jdbcTemplate.update(sql, productID);
  }
}
