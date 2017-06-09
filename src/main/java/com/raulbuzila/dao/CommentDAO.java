package com.raulbuzila.dao;

import com.raulbuzila.model.Comment;
import java.util.List;

/**
 * Created by raulbuzila on 6/3/2017.
 */
public interface CommentDAO {
  public void saveComment(Comment comment);

  public void deleteComment(Comment comment);

  public List<Comment> readAllComments(int productId);
}
