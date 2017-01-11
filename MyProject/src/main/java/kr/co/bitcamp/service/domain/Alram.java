package kr.co.bitcamp.service.domain;

import java.sql.Date;

public class Alram {
 
  private int alramNo;
  private int userNO;
  private int polderNo;
  private String sendId;
  private String text;
  private Date alarmDate;
  private User user;





public User getUser() {
    return user;
}


public void setUser(User user) {
    this.user = user;
}


public int getUserNO() {
    return userNO;
}


public void setUserNO(int userNO) {
    this.userNO = userNO;
}


public int getPolderNo() {
    return polderNo;
}


public void setPolderNo(int polderNo) {
    this.polderNo = polderNo;
}


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
    return "Alram [alramNo=" + alramNo + ", userNO=" + userNO + ", polderNo=" + polderNo + ", sendId=" + sendId
            + ", text=" + text + ", alarmDate=" + alarmDate + "]";
}


  
  
}
