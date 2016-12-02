package kr.co.bitcamp.service.user.impl;

import java.util.List;

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
		return null;
	}
/////
	@Override
	public User getUser(String userId) throws Exception {
		// TODO Auto-generated method stub

	  return (User)sqlSession.selectOne("UserMapper.getUser", userId.trim());
	}
//////
	@Override
	public List<User> getFollow(String UserId) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
/////
	@Override
	public boolean removeFollower(String userId, String followId) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}
////
	@Override
	public boolean removeFollowing(String userId, String followingId) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}
/////
	@Override
	public boolean addFollow(String userId, String followId) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}
//////
	@Override
	public List<Alram> getAlram(String userId) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
/////
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


}
