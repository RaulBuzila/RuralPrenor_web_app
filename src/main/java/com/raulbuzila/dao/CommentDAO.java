package com.raulbuzila.dao;

import com.raulbuzila.model.Comment;
import java.util.List;

/**
 * Created by raulbuzila on 6/3/2017.
 */
public interface CommentDAO {
  public void saveComment(Comment comment);

  public void deleteComment(int commentId);

  public List<Comment> readAllApprovedComments(int productId);

  public List<Comment> readAllUnapprovedComments();

  public Comment readCommentById(int comment);

  public void approveComment(int commentId);

  public List<Comment> readAllComments();
}
