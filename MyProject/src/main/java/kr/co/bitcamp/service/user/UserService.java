package kr.co.bitcamp.service.user;

import java.util.List;

import kr.co.bitcamp.service.domain.Activity;
import kr.co.bitcamp.service.domain.Alram;
import kr.co.bitcamp.service.domain.User;

public interface UserService {
	
	public boolean addUser(User user) throws Exception ;
	
	public User login(User user) throws Exception ;
	
	public boolean removeUser(String userId) throws Exception ;
	
	public User updateUser(User user) throws Exception ;
	
	public User getUser(String userId) throws Exception ;

	public List<User> getFollow(String UserId) throws Exception ;
	
	public boolean removeFollower(String userId, String followId) throws Exception ;
	
	public boolean removeFollowing(String userId, String followingId) throws Exception ;
	
	public boolean addFollow(String userId, String followId) throws Exception ;
	
	public List<Alram> getAlram(String userId) throws Exception ;
	
	public List<Activity> getActivity(String userId) throws Exception ;
	
	public boolean setActivity(Activity activity) throws Exception ;
	
	public boolean pwCheak(User user) throws Exception ;
}
