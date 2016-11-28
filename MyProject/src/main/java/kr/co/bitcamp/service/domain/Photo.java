package kr.co.bitcamp.service.domain;

import java.sql.Date;
import java.util.ArrayList;

public class Photo {
  
  String photoNo;
  String folderName;
  String title;
  String text;
  Date photoDate;
  ArrayList arrayPhoto;
  String gpsB;
  String gpsH;
  public String getPhotoNo() {
    return photoNo;
  }
  public void setPhotoNo(String photoNo) {
    this.photoNo = photoNo;
  }
  public String getFolderName() {
    return folderName;
  }
  public void setFolderName(String folderName) {
    this.folderName = folderName;
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
  public ArrayList getArrayPhoto() {
    return arrayPhoto;
  }
  public void setArrayPhoto(ArrayList arrayPhoto) {
    this.arrayPhoto = arrayPhoto;
  }
  public String getGpsB() {
    return gpsB;
  }
  public void setGpsB(String gpsB) {
    this.gpsB = gpsB;
  }
  public String getGpsH() {
    return gpsH;
  }
  public void setGpsH(String gpsH) {
    this.gpsH = gpsH;
  }
  
}
