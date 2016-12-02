package kr.co.bitcamp.service.domain;

import java.sql.Date;

public class Activity {
  
  private int ActivityNo;
  private Date activityDate;
  private String activityText;
  
  public Activity(){
    
  }
  
  

  public int getActivityNo() {
    return ActivityNo;
  }
  
  
  
  public void setActivityNo(int activityNo) {
      ActivityNo = activityNo;
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
