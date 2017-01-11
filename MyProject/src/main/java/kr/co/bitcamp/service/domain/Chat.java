package kr.co.bitcamp.service.domain;

import java.sql.Date;

public class Chat {
    
    private int chatNo;
    private String roomNo;
    private int userNo;
    private int userNo2;
    private String msg;
    private Date date;
    

    public Chat() {
        // TODO Auto-generated constructor stub
    }


    public int getChatNo() {
        return chatNo;
    }


    public void setChatNo(int chatNo) {
        this.chatNo = chatNo;
    }


    public String getRoomNo() {
        return roomNo;
    }


    public void setRoomNo(String roomNo) {
        this.roomNo = roomNo;
    }


    public int getUserNo() {
        return userNo;
    }


    public void setUserNo(int userNo) {
        this.userNo = userNo;
    }


    public int getUserNo2() {
        return userNo2;
    }


    public void setUserNo2(int userNo2) {
        this.userNo2 = userNo2;
    }


    public String getMsg() {
        return msg;
    }


    public void setMsg(String msg) {
        this.msg = msg;
    }


    public Date getDate() {
        return date;
    }


    public void setDate(Date date) {
        this.date = date;
    }


    @Override
    public String toString() {
        return "Chat [chatNo=" + chatNo + ", roomNo=" + roomNo + ", userNo=" + userNo + ", userNo2=" + userNo2
                + ", msg=" + msg + ", date=" + date + "]";
    }


    
    

}
