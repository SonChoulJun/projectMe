package kr.co.bitcamp.service.user;

import java.util.List;

import kr.co.bitcamp.service.domain.Activity;
import kr.co.bitcamp.service.domain.Alram;
import kr.co.bitcamp.service.domain.User;

public interface UserDao {
	
	public boolean addUser(User user) throws Exception ;
	
	public User login(String userId) throws Exception ;
	
	public boolean removeUser(String userId) throws Exception ;
	
	public User updateUser(User user) throws Exception ;
	
	public User getUser(String userId) throws Exception ;

	public List<User> getFollow(int userNo) throws Exception ;
	
	public boolean removeFollower(int userNo, int followNo) throws Exception ;
	
	public boolean removeFollowing(int userNo, int followingNo) throws Exception ;
	
	public boolean addFollow(int userNo, int followNo) throws Exception ;
	
	public List<Alram> getAlram(int userNo) throws Exception ;
	
	public List<Activity> getActivity(int userNo) throws Exception ;

	public boolean setActivity(Activity activity) throws Exception ;
	
	public boolean pwCheak(User user) throws Exception ;
	
	public int getFollwerCount(int userNo) throws Exception;
	
	public int getFollwingCount(int userNo) throws Exception;
}


