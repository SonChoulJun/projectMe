package kr.co.bitcamp.service.user.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.co.bitcamp.service.user.UserDao;

@Repository
public class UserDaoImpl implements UserDao{
    
    @Autowired
    @Qualifier("sqlSessionTemplate")
    private SqlSession sqlSession;
    
    public UserDaoImpl(){
        System.out.println("UserDaoImpl  생성");
    }
    
    public void setSqlSession(SqlSession sqlSession){
      this.sqlSession = sqlSession;
    }

}
