package kr.co.bitcamp.service.user.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.bitcamp.service.domain.Activity;
import kr.co.bitcamp.service.domain.Alram;
import kr.co.bitcamp.service.domain.User;
import kr.co.bitcamp.service.user.UserDao;
import kr.co.bitcamp.service.user.UserService;

@Service
public class UserServiceImpl implements UserService {
    
    @Autowired
    @Qualifier("userDaoImpl")
    private UserDao userDAO;

    
    
    public UserServiceImpl() {
        super();
        System.out.println("UserServiceImpl  �깮�꽦");
        // TODO Auto-generated constructor stub
    }


    public void setUserDAO(UserDao userDAO) {
        this.userDAO = userDAO;
    }


	@Override
	public boolean addUser(User user) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}


	@Override
	public User login(User user) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public boolean removeUser(String userId) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}


	@Override
	public User updateUser(User user) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public User getUser(String userId) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<User> getFollow(String UserId) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public boolean removeFollower(String userId, String followId) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}


	@Override
	public boolean removeFollowing(String userId, String followingId) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}


	@Override
	public boolean addFollow(String userId, String followId) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}


	@Override
	public List<Alram> getAlram(String userId) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<Activity> getActivity(String userId) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public boolean setActivity(Activity activity) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}


	@Override
	public boolean pwCheak(User user) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}
    
    
}
