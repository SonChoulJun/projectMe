package kr.co.bitcamp.service.domain;

import java.sql.Date;
import java.util.ArrayList;

public class Photo {
  
  private int photoNo;
  private int themeNo;
  private String folderName;
  private String title;
  private String text;
  private String photoDate;
  private String gpsB;
  private String gpsH;
  
  public Photo(){
    
  }
  
  public int getThemeNo() {
    return themeNo;
  }

  public void setThemeNo(int themeNo) {
      this.themeNo = themeNo;
  }

    public int getPhotoNo() {
    return photoNo;
  }
  public void setPhotoNo(int photoNo) {
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
  public String getPhotoDate() {
    return photoDate;
  }
  public void setPhotoDate(String photoDate) {
    this.photoDate = photoDate;
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
    return "Photo [photoNo=" + photoNo + ", themeNo=" + themeNo + ", folderName=" + folderName + ", title=" + title
            + ", text=" + text + ", photoDate=" + photoDate + ", gpsB=" + gpsB + ", gpsH=" + gpsH + "]";
}


  
  
  
}
