package kr.co.bitcamp.service.domain;

import java.sql.Date;

public class Activity {
  
  private String activityDate;
  private String activityTime;
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

public String getActivityDate() {
    return activityDate;
  }

  public void setActivityDate(String activityDate) {
    this.activityDate = activityDate;
  }

  public String getActivityText() {
    return activityText;
  }

  public void setActivityText(String activityText) {
    this.activityText = activityText;
  }
  
  

  public String getActivityTime() {
    return activityTime;
  }
  public void setActivityTime(String activityTime) {
    this.activityTime = activityTime;
  }
  
  @Override
  public String toString() {
    return "Activity [activityDate=" + activityDate + ", activityTime=" + activityTime + ", activityText="
        + activityText + ", user=" + user + ", activityNo=" + activityNo + "]";
  }
 
  
 
  
  

}
