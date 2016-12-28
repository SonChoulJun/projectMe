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
        System.out.println("UserServiceImpl 생성");
        // TODO Auto-generated constructor stub
    }


    public void setUserDAO(UserDao userDAO) {
        this.userDAO = userDAO;
    }


	@Override
	public boolean addUser(User user) throws Exception {
	  boolean ok =userDAO.addUser(user);
	  if(ok){
	      return true;
	  }else{
	      return false;
	  }
	}


	@Override
	public User login(User user) throws Exception {
		// TODO Auto-generated method stub
	  System.out.println("서비스단 진입??????????????????????/");
	  
	  User dbUser=userDAO.login(user.getUserId());
    
    if(dbUser.getPassword().equals(user.getPassword())){
      dbUser.setActivity(true);
    }else{
      dbUser.setActivity(false);
    }
    
    return dbUser;
	}

	@Override
  public boolean removeUser(User user) throws Exception {
	  if(userDAO.pwCheak(user)==true){
	    userDAO.removeUser(user.getUserId());
	    return true;
	  }else {
	  return false;
	  }
  }


  @Override
	public User updateUser(User user) throws Exception {
		// TODO Auto-generated method stub
    
    userDAO.updateUser(user);
		return user;
	}


	@Override
	public User getUser(String userId) throws Exception {
		// TODO Auto-generated method stub
	  User user=userDAO.getUser(userId);
	  System.out.println(user);
		return user;
	}





	@Override
	public void setActivity(Activity activity) throws Exception {
		// TODO Auto-generated method stub
		userDAO.setActivity(activity);
	}


    @Override
    public int getFollwerCount(int userNo) throws Exception {
        // TODO Auto-generated method stub
        return userDAO.getFollwerCount(userNo);
    }


    @Override
    public int getFollwingCount(int userNo) throws Exception {
        // TODO Auto-generated method stub
        return userDAO.getFollwingCount(userNo);
    }
    
    @Override
    public List<User> getFollowing(int userNo)throws Exception{
      
      
      return userDAO.getFollowing(userNo);
    }


    @Override
    public List<User> getFollower(int userNo) throws Exception {
        // TODO Auto-generated method stub
      
        return userDAO.getFollower(userNo);
    }



	@Override
	public List<Activity> getActivity(int  userNo) throws Exception {
		// TODO Auto-generated method stub
	  
		return userDAO.getActivity(userNo);
		
	}
    @Override
    public void removeFollower(int userNo, int followNo) throws Exception {
        // TODO Auto-generated method stub
        userDAO.removeFollower(userNo, followNo);
    }



    @Override
    public boolean removeFollowing(int UserNo, int followingNo) throws Exception {
        // TODO Auto-generated method stub
        return false;
    }


    @Override
    public void addFollow(int UserNo, int followNo) throws Exception {
        userDAO.addFollow(UserNo, followNo);

    }


    @Override
	public List<Alram> getAlram(int userNo) throws Exception {
		// TODO Auto-generated method stub
		return userDAO.getAlram(userNo);
	}


    @Override
    public List<User> searchUser(String userId) throws Exception {
        // TODO Auto-generated method stub
        return userDAO.searchUser(userId);
    }


    @Override
    public boolean followOk(int userNo, int followNo) throws Exception {
       return userDAO.FollowOk(userNo, followNo);
    }


    @Override
    public void updateStatus(String status, int userNo) throws Exception {
      // TODO Auto-generated method stub
      userDAO.updateStatus(status, userNo);
    }
    
    

    



/*	@Override
	public boolean pwCheak(User user) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}
    */
    
}
