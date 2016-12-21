package kr.co.bitcamp.service.domain;

import java.sql.Date;
import java.util.List;

public class PhotoFolder {
  private int pfNo;
  private int userNo;
  private User user;
  private String title;
  private String text;
  private Date photoDate;
  private List<PhotoTheme> photoTheme;
  
  public PhotoFolder(){
    
  }
  
  
  
  public User getUser() {
    return user;
  }



  public void setUser(User user) {
      this.user = user;
  }



public int getUserNo() {
    return userNo;
  }

  public void setUserNo(int userNo) {
      this.userNo = userNo;
  }

    public int getPfNo() {
    return pfNo;
  }
  public void setPfNo(int pfNo) {
    this.pfNo = pfNo;
  }
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  }
  public String getText() {
    return text;
  }
  public void setText(String text) {
    this.text = text;
  }
  public Date getPhotoDate() {
    return photoDate;
  }
  public void setPhotoDate(Date photoDate) {
    this.photoDate = photoDate;
  }
  public List<PhotoTheme> getPhotoTheme() {
    return photoTheme;
  }
  public void setPhotoTheme(List<PhotoTheme> photoTheme) {
    this.photoTheme = photoTheme;
  }



  @Override
  public String toString() {
      return "PhotoFolder [pfNo=" + pfNo + ", userNo=" + userNo + ", user=" + user + ", title=" + title + ", text=" + text
              + ", photoDate=" + photoDate + ", photoTheme=" + photoTheme + "]";
  }


  
  
  
}
