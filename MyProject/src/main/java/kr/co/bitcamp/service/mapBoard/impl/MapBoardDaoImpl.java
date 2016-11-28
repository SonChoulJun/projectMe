package kr.co.bitcamp.service.mapBoard.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.bitcamp.service.mapBoard.MapBoardDao;

@Repository
public class MapBoardDaoImpl implements MapBoardDao {
    
    @Autowired
    @Qualifier("sqlSessionTemplate")
    private SqlSession sqlSession;
    
    public MapBoardDaoImpl(){
        System.out.println("MapBoardDaoImpl  생성");
    }
    
    public void setSqlSession(SqlSession sqlSession){
      this.sqlSession = sqlSession;
    }
}
