package kr.co.bitcamp.service.domain;

import java.sql.Date;

public class Comment {

	private int commentNo;
	private int folderNo;
	private String text;
	private Date date;
	private String userId;
	private int userNo;

	public Comment() {

	}

	public int getFolderNo() {
		return folderNo;
	}

	public void setFolderNo(int folderNo) {
		this.folderNo = folderNo;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
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

    @Override
    public String toString() {
        return "Comment [commentNo=" + commentNo + ", folderNo=" + folderNo + ", text=" + text + ", date=" + date
                + ", userId=" + userId + ", userNo=" + userNo + "]";
    }
    
    
    


}
