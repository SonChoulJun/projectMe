package kr.co.bitcamp.service.domain;

import java.sql.Date;

public class User {
  
  private String userId;
  private String password;
  private String userName;
  private String addr;
  private String phone;
  private String phoneType;
  private boolean activity;
  private Date joinDate;
  private boolean alramActivity;
  private int alramCount;
  
  public User(){
    
  }

  public String getUserId() {
    return userId;
  }

  public void setUserId(String userId) {
    this.userId = userId;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public String getUserName() {
    return userName;
  }

  public void setUserName(String userName) {
    this.userName = userName;
  }

  public String getAddr() {
    return addr;
  }

  public void setAddr(String addr) {
    this.addr = addr;
  }

  public String getPhone() {
    return phone;
  }

  public void setPhone(String phone) {
    this.phone = phone;
  }

  public String getPhoneType() {
    return phoneType;
  }

  public void setPhoneType(String phoneType) {
    this.phoneType = phoneType;
  }

  public boolean isActivity() {
    return activity;
  }

  public void setActivity(boolean activity) {
    this.activity = activity;
  }

  public Date getJoinDate() {
    return joinDate;
  }

  public void setJoinDate(Date joinDate) {
    this.joinDate = joinDate;
  }

  public boolean isAlramActivity() {
    return alramActivity;
  }

  public void setAlramActivity(boolean alramActivity) {
    this.alramActivity = alramActivity;
  }

  public int getAlramCount() {
    return alramCount;
  }

  public void setAlramCount(int alramCount) {
    this.alramCount = alramCount;
  }
  
  

}
