package kr.co.bitcamp.service.domain;

import java.sql.Date;

public class Alram {
  
  private String sendId;
  private String text;
  private Date alarmDate;

  public Alram(){
    
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
  
  
}
