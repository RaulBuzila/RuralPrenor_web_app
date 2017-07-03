package com.raulbuzila.dao;

import com.raulbuzila.model.Comment;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by raulbuzila on 6/3/2017.
 */
public class CommentDAOImpl implements CommentDAO{
  // members
  private JdbcTemplate jdbcTemplate;

  // constructor
  public CommentDAOImpl(DataSource dataSource) {
    jdbcTemplate = new JdbcTemplate(dataSource);
  }

  @Override
  public void saveComment(Comment comment) {
    String SQL = "INSERT INTO comment(name,content,status,productId) VALUES(?,?,0,?)";
    jdbcTemplate.update(SQL,comment.getName(),comment.getContent(),comment.getProductId());
  }

  @Override
  public void approveComment(int commentId) {
    String SQL ="UPDATE comment SET status=1 where id=?";
    jdbcTemplate.update(SQL,commentId);
  }

  @Override
  public void deleteComment(int commentId) {
    String SQL="DELETE FROM comment WHERE id=?";
    jdbcTemplate.update(SQL,commentId);
  }

  @Override
  public List<Comment> readAllApprovedComments(int productId) {
    // sql statement
    String SQL="SELECT id,name,status,content from COMMENT WHERE status=1 AND productid="+productId+"";

    List<Comment> listComment= jdbcTemplate.query(SQL, new RowMapper<Comment>() {
      @Override
      public Comment mapRow(ResultSet resultSet, int i) throws SQLException {
        return CreateCommentInstance(resultSet);
      }
    });
    return listComment;
  }

  @Override
  public List<Comment> readAllUnapprovedComments() {
    // sql statement
    String SQL="SELECT c.id,c.status,c.name,c.content from comment c,product p WHERE c.status=0 and c.productId=p.product_id;";

    List<Comment> unapprovedCommentsList= jdbcTemplate.query(SQL, new RowMapper<Comment>() {
      @Override
      public Comment mapRow(ResultSet resultSet, int i) throws SQLException {
        return CreateCommentInstance(resultSet);
      }
    });
    return unapprovedCommentsList;
  }

  @Override
  public List<Comment> readAllComments() {
    // sql statement
    String SQL="SELECT id,name,status,content from COMMENT WHERE status=1";

    List<Comment> listComment= jdbcTemplate.query(SQL, new RowMapper<Comment>() {
      @Override
      public Comment mapRow(ResultSet resultSet, int i) throws SQLException {
        return CreateCommentInstance(resultSet);
      }
    });
    return listComment;
  }

  @Override
  public Comment readCommentById(int commentId) {
      String SQL="SELECT id,name,status,content from comment WHERE comment.id ="+commentId;
    return jdbcTemplate.query(SQL, new ResultSetExtractor<Comment>() {
      public Comment extractData(ResultSet resultSet) throws SQLException {
        if (resultSet.next()) {
          return CreateCommentInstance(resultSet);
        }
        return null;
      }
    });
  }

  private Comment CreateCommentInstance(ResultSet resultSet)throws SQLException{
    Comment comment=new Comment();

    comment.setId(resultSet.getInt("id"));
    comment.setName(resultSet.getString("name"));
    comment.setStatus(resultSet.getInt("status"));
    comment.setContent(resultSet.getString("content"));

    return comment;
  }

}


