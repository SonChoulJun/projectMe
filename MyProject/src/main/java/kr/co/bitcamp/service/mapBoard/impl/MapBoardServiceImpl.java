package kr.co.bitcamp.service.mapBoard.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.bitcamp.service.domain.Comment;
import kr.co.bitcamp.service.domain.Photo;
import kr.co.bitcamp.service.domain.PhotoFolder;
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


    @Override
    public boolean addFolder(String folderName) throws Exception {
        // TODO Auto-generated method stub
        return false;
    }


    @Override
    public boolean addPhone(List photoList) throws Exception {
        // TODO Auto-generated method stub
        return false;
    }


    @Override
    public List<PhotoFolder> getPhotoFolder(String userId) throws Exception {
        // TODO Auto-generated method stub
        return null;
    }


    @Override
    public List<Photo> getMainPhoto(String pfNo) throws Exception {
        // TODO Auto-generated method stub
        return null;
    }


    @Override
    public List<Photo> getSubPhoto(String themeNo) throws Exception {
        // TODO Auto-generated method stub
        return null;
    }


    @Override
    public boolean setLike(String photoFolderNo, String userId) throws Exception {
        // TODO Auto-generated method stub
        return false;
    }


    @Override
    public boolean setComment(Comment comment, String folderNo) throws Exception {
        // TODO Auto-generated method stub
        return false;
    }


    @Override
    public List<Comment> getComment(String folderNo) throws Exception {
        // TODO Auto-generated method stub
        return null;
    }


    @Override
    public boolean updateComment(Comment comment) throws Exception {
        // TODO Auto-generated method stub
        return false;
    }


    @Override
    public boolean removeComment(String commentNum) throws Exception {
        // TODO Auto-generated method stub
        return false;
    }


    @Override
    public List<PhotoFolder> getNewsFeed(String userId) throws Exception {
        // TODO Auto-generated method stub
        return null;
    }


	@Override
	public List<PhotoFolder> getSideBar(String userNo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("들어왔나요");
		return boardDao.getSideBar(userNo);
	}
    
    
    
}
