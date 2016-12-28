package kr.co.bitcamp.service.domain;

import java.sql.Date;

public class User {
  
  private int userNo;
  private String userId;
  private String password;
  private String userName;
  private String phone;
  private boolean activity;
  private Date joinDate;
  private boolean alramActivity;
  private int alramCount;
  private String status;
  private String profileImg;

  public User(){
    
  }

  public int getUserNo() {
    return userNo;
  }

  public void setUserNo(int userNo) {
    this.userNo = userNo;

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



  public String getPhone() {
    return phone;
  }

  public void setPhone(String phone) {
    this.phone = phone;
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
  
  

  public String getStatus() {
    return status;
  }



  public void setStatus(String status) {
    this.status = status;
  }

  public String getProfileImg() {
    return profileImg;
  }

  public void setProfileImg(String profileImg) {
    this.profileImg = profileImg;
  }

  @Override
  public String toString() {
    return "User [userNo=" + userNo + ", userId=" + userId + ", password=" + password + ", userName=" + userName
        + ", phone=" + phone + ", activity=" + activity + ", joinDate=" + joinDate + ", alramActivity=" + alramActivity
        + ", alramCount=" + alramCount + ", status=" + status + ", profileImg=" + profileImg + "]";
  }

}
