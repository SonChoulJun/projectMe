package kr.co.bitcamp.service.domain;

import java.sql.Date;
import java.util.List;

public class PhotoFolder {
  String pfNo;
  String title;
  String text;
  Date photoDate;
  List<String[]> photoTheme;
  public String getPfNo() {
    return pfNo;
  }
  public void setPfNo(String pfNo) {
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
  public List<String[]> getPhotoTheme() {
    return photoTheme;
  }
  public void setPhotoTheme(List<String[]> photoTheme) {
    this.photoTheme = photoTheme;
  }  
}
