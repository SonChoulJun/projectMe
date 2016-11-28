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
    System.out.println("UserDaoImpl  �깮�꽦");
  }

  public void setSqlSession(SqlSession sqlSession) {
    this.sqlSession = sqlSession;
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
    int count = sqlSession.delete("UserMapper.removeUser", userId);
    // 1개의삭제가 되었다는 가정
    if (count == 1) {
      return true;
    } else {
      return false;
    }

  }

  @Override
  public User updateUser(User user) throws Exception {
    // TODO Auto-generated method stub
    return null;
  }

  @Override
  public User getUser(User user) throws Exception {
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
    if (sqlSession.selectOne("UserMapper.findUser", user) != null) {
      return true;
    } else {
      return false;
    }
  }
}
