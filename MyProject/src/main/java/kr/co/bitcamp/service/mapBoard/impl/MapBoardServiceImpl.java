package kr.co.bitcamp.service.mapBoard.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.bitcamp.service.mapBoard.MapBoardDao;
import kr.co.bitcamp.service.mapBoard.MapBoardService;
import kr.co.bitcamp.service.user.UserDao;

@Service
public class MapBoardServiceImpl implements MapBoardService {
    
    @Autowired
    @Qualifier("mapBoardDaoImpl")
    private MapBoardDao boardDao;
    
    
    public MapBoardServiceImpl() {
        super();
        System.out.println("MapBoardServiceImpl  생성");
        // TODO Auto-generated constructor stub
    }


    public void setBoardDao(MapBoardDao boardDao) {
        this.boardDao = boardDao;
    }
    
    
    
}
