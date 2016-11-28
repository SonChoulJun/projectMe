package kr.co.bitcamp.service.domain;

import java.sql.Date;

public class Comment {
  String commentNo;
  String text;
  Date date;
  String userId;
  public String getCommentNo() {
    return commentNo;
  }
  public void setCommentNo(String commentNo) {
    this.commentNo = commentNo;
  }
  public String getText() {
    return text;
  }
  public void setText(String text) {
    this.text = text;
  }
  public Date getDate() {
    return date;
  }
  public void setDate(Date date) {
    this.date = date;
  }
  public String getUserId() {
    return userId;
  }
  public void setUserId(String userId) {
    this.userId = userId;
  }
}
