package kr.co.bitcamp.service.domain;

import java.sql.Date;

public class Activity {
  
  private Date activityDate;
  private String activityText;
  private User user;
  private int activityNo;
  
  public Activity(){
    
  }
  public User getUser() {
    return user;
  }
  public void setUser(User user) {
    this.user = user;
  }

  public int getActivityNo() {
    return activityNo;
  }

  public void setActivityNo(int activityNo) {
    this.activityNo = activityNo;
  }

public Date getActivityDate() {
    return activityDate;
  }

  public void setActivityDate(Date activityDate) {
    this.activityDate = activityDate;
  }

  public String getActivityText() {
    return activityText;
  }

  public void setActivityText(String activityText) {
    this.activityText = activityText;
  }

  @Override
  public String toString() {
    return "Activity [activityDate=" + activityDate + ", activityText=" + activityText + "]";
  }
  
  

}
