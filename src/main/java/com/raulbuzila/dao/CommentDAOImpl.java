package com.raulbuzila.dao;

import com.raulbuzila.model.Comment;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import javax.sql.DataSource;
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
  public void deleteComment(Comment comment) {

  }

  @Override
  public List<Comment> readAllComments(int productId) {
    // sql statement
    String SQL="SELECT name,content from COMMENT WHERE status=1 AND productid="+productId+"";

    List<Comment> listComment= jdbcTemplate.query(SQL, new RowMapper<Comment>() {
      @Override
      public Comment mapRow(ResultSet resultSet, int i) throws SQLException {
        Comment comment=new Comment();

        comment.setId(resultSet.getInt("id"));
        comment.setName(resultSet.getString("name"));
        comment.setStatus(resultSet.getInt("status"));
        comment.setContent(resultSet.getString("content"));

        return comment;
      }
    });
    return listComment;
  }
}
