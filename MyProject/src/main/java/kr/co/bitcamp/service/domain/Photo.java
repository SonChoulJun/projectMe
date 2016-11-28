package kr.co.bitcamp.service.domain;

import java.sql.Date;
import java.util.ArrayList;

public class Photo {
  
  private String photoNo;
  private String folderName;
  private String title;
  private String text;
  private Date photoDate;
  private ArrayList arrayPhoto;
  private String gpsB;
  private String gpsH;
  
  public Photo(){
    
  }
  
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

  @Override
  public String toString() {
    return "Photo [photoNo=" + photoNo + ", folderName=" + folderName + ", title=" + title + ", text=" + text
        + ", photoDate=" + photoDate + ", arrayPhoto=" + arrayPhoto + ", gpsB=" + gpsB + ", gpsH=" + gpsH + "]";
  }
  
  
  
}
