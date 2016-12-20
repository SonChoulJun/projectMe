package kr.co.bitcamp.service.user.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.co.bitcamp.service.domain.Activity;
import kr.co.bitcamp.service.domain.Alram;
import kr.co.bitcamp.service.domain.User;
import kr.co.bitcamp.service.user.UserDao;

@Repository
public class UserDaoImpl implements UserDao {

  @Autowired
  @Qualifier("sqlSessionTemplate")
  private SqlSession sqlSession;

  public UserDaoImpl() {
    System.out.println("UserDaoImpl   실행!!!!!");
  }

  public void setSqlSession(SqlSession sqlSession) {
    this.sqlSession = sqlSession;
  }
////////////
  @Override
  public boolean addUser(User user) throws Exception {
    int insertOk=sqlSession.insert("UserMapper.addUser",user);
    if(insertOk==0){
        return true;
    }else{
        return false;
    }
  }
////////////
  @Override
  public boolean removeUser(String userId) throws Exception {
    int count = sqlSession.delete("UserMapper.removeUser", userId);
    // 1개의삭제가 되었다는 가정
    if (count == 1) {
      return true;
    } else {
      return false;
    }
  }



	@Override
	public User login(String userId) throws Exception {
		// TODO Auto-generated method stub
	  
	  System.out.println("dao왔냐!!!!!!!!!!!!!!!");
	   User user =(User)sqlSession.selectOne("UserMapper.getUser", userId.trim());
	   System.out.println(user);
	  return user;
		
	}
/////////////

	@Override
	public User updateUser(User user) throws Exception {
		// TODO Auto-generated method stub
	  sqlSession.update("UserMapper.updateUser", user);
		return user;
	}
/////
	@Override
	public User getUser(String userId) throws Exception {
		// TODO Auto-generated method stub

	  return (User)sqlSession.selectOne("UserMapper.getUser", userId.trim());
	}
//////

	@Override
	public List<Activity> getActivity(int userNo) throws Exception {
		// TODO Auto-generated method stub
	  List<Activity> activityList=sqlSession.selectList("ActivityMapper.getActivity", userNo);
	 
	  for(int i=0;i<activityList.size()-1;i++){
  	  String[] dateArray=activityList.get(i).getActivityDate().split(" ");
      activityList.get(i).setActivityDate(dateArray[0]);
      activityList.get(i).setActivityTime(dateArray[1]);
	  }
    
	  
		return  activityList;
	}


	@Override
	public boolean setActivity(Activity activity) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean pwCheak(User user) throws Exception {
    if (sqlSession.selectOne("UserMapper.findUser", user) != null) {
      return true;
    } else {
      return false;
    }
  }

    @Override
    public int getFollwerCount(int userNo) throws Exception {
        return sqlSession.selectOne("UserMapper.getFollwerCount",userNo);
    }

    @Override
    public int getFollwingCount(int userNo) throws Exception {
        // TODO Auto-generated method stub
        return sqlSession.selectOne("UserMapper.getFollwingCount",userNo);
    }

    @Override
    public List<User> getFollow(int UserNo) throws Exception {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public void removeFollower(int UserNo, int followNo) throws Exception {
        // TODO Auto-generated method stub
        Map map = new HashMap();
        map.put( "myId", UserNo );
        map.put( "follwerId", followNo );
        sqlSession.delete("UserMapper.removeFollower",map);
    }

    @Override
    public boolean removeFollowing(int UserNo, int followingNo) throws Exception {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public void addFollow(int UserNo, int followNo) throws Exception {
        // TODO Auto-generated method stub
        Map map = new HashMap();
        map.put( "myId", UserNo );
        map.put( "follwerId", followNo );
        System.out.println(map);
        sqlSession.insert("UserMapper.addFollowing",map);
    }

    @Override
    public List<Alram> getAlram(int UserNo) throws Exception {
        // TODO Auto-generated method stub
        return sqlSession.selectList("UserMapper.getAlram", UserNo);
    }

    @Override
    public List<User> searchUser(String userId) throws Exception {
        // TODO Auto-generated method stub
        System.out.println(sqlSession.selectList("UserMapper.searchUser", "%"+userId+"%"));
        return sqlSession.selectList("UserMapper.searchUser", "%"+userId+"%");
    }

    @Override
    public boolean FollowOk(int userNo, int followNo) throws Exception {
        // TODO Auto-generated method stub
        Map map = new HashMap();
        map.put( "myId", userNo );
        map.put( "follwerId", followNo );
        String a =sqlSession.selectOne("UserMapper.getOneFollwer", map);
        System.out.println("followerOk"+a);
        if(a==null){
            return true;
        }else{
            return false;
        }
    }


}
