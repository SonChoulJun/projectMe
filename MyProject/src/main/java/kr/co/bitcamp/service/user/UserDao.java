package kr.co.bitcamp.service.user;

import java.util.List;

import kr.co.bitcamp.service.domain.Activity;
import kr.co.bitcamp.service.domain.Alram;
import kr.co.bitcamp.service.domain.Chat;
import kr.co.bitcamp.service.domain.User;

public interface UserDao {
	
	public boolean addUser(User user) throws Exception ;
	
	public User login(String userId) throws Exception ;
	
	public boolean removeUser(String userId) throws Exception ;
	
	public User updateUser(User user) throws Exception ;
	
	public User getUser(String userId) throws Exception ;
	
	public List<User> getFollowing(int userNo)throws Exception;

	public List<User> getFollower(int userNo) throws Exception ;
	
	public void removeFollower(int userNo, int followNo) throws Exception ;
	
	public boolean removeFollowing(int userNo, int followingNo) throws Exception ;
	
	public void addFollow(int userNo, int followNo) throws Exception ;
	
	public boolean FollowOk(int userNo, int followNo) throws Exception ;
	
	public void addAlram(Alram alram) throws Exception;
	
	public List<Alram> getAlram(int userNo) throws Exception ;
	
	public List<Activity> getActivity(int userNo) throws Exception ;

	public void setActivity(Activity activity) throws Exception ;
	
	public boolean pwCheak(User user) throws Exception ;
	
	public int getFollwerCount(int userNo) throws Exception;
	
	public int getFollwingCount(int userNo) throws Exception;
	
	public List<User> searchUser(String userId) throws Exception;
	
	public void updateStatus(String status, int userNo) throws Exception;
	
	public void updatepfphoto(int userNo, String originalFilename)throws Exception;
	
	public void removeActivity(int activityNo)throws Exception;
	
	public void updateUserActivity(int UserNo,boolean cheak) throws Exception;
	
	public List<User> getAllFollower(int userNo) throws Exception;
	
  public void insertMsg(Chat chat) throws Exception;
  
  public List<Chat> gettMsg(String roomNo) throws Exception;
  
  public void updateAlram(User user) throws Exception;
}


