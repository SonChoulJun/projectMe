package kr.co.bitcamp.service.domain;

import java.sql.Date;

public class Alram {
 
  private int alramNo;
  private String sendId;
  private String text;
  private Date alarmDate;

  public Alram(){
    
  }
  
  
  public int getAlramNo() {
    return alramNo;
  }
  
  
  public void setAlramNo(int alramNo) {
      this.alramNo = alramNo;
  }


public String getSendId() {
    return sendId;
  }

  public void setSendId(String sendId) {
    this.sendId = sendId;
  }

  public String getText() {
    return text;
  }

  public void setText(String text) {
    this.text = text;
  }

  public Date getAlarmDate() {
    return alarmDate;
  }

  public void setAlarmDate(Date alarmDate) {
    this.alarmDate = alarmDate;
  }

  @Override
  public String toString() {
    return "Alram [sendId=" + sendId + ", text=" + text + ", alarmDate=" + alarmDate + "]";
  }
  
  
}
