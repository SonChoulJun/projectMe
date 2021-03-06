package kr.co.bitcamp.service.mapBoard.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.bitcamp.service.domain.Comment;
import kr.co.bitcamp.service.domain.Photo;
import kr.co.bitcamp.service.domain.PhotoFolder;
import kr.co.bitcamp.service.domain.PhotoTheme;
import kr.co.bitcamp.service.domain.User;
import kr.co.bitcamp.service.mapBoard.MapBoardDao;
import kr.co.bitcamp.service.mapBoard.MapBoardService;
import kr.co.bitcamp.service.user.UserDao;

@Service
public class MapBoardServiceImpl implements MapBoardService {
    
    @Autowired
    @Qualifier("mapBoardDaoImpl")
    private MapBoardDao boardDao;
    
    @Autowired
    @Qualifier("userDaoImpl")
    private UserDao userDAO;
    

    public MapBoardServiceImpl() {
        super();
        System.out.println("MapBoardServiceImpl  생성");
        // TODO Auto-generated constructor stub
    }


    public void setBoardDao(MapBoardDao boardDao) {
        this.boardDao = boardDao;
    }


    @Override
    public boolean addFolder(PhotoFolder photoFolder) throws Exception {
        // TODO Auto-generated method stub
        return boardDao.addFolder(photoFolder);
    }


    @Override
    public boolean addPhoto(int folderNo,List<Photo> photoList) throws Exception {
            System.out.println("몇번들어오나욧 형님들~~");
            boardDao.addTheme(folderNo,photoList);
         return true;
    }
    
    
    @Override
    public boolean addSubPhoto(int folderNo,List<Photo> photoList) throws Exception {
            System.out.println("몇번들어오나욧 형님들~~");
            boardDao.addSubPhoto(folderNo,photoList);
         return true;
    }




    @Override
    public boolean updateComment(Comment comment) throws Exception {
        // TODO Auto-generated method stub
    	boolean ok = boardDao.updateComment(comment);
    	if(ok){
  	      return true; 
  	  }else{
  	      return false;
  	  }
  	}


	@Override
	public List<PhotoFolder> getSideBar(int userNo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("들어왔나요");
		return boardDao.getSideBar(userNo);
	}


    @Override
    public PhotoFolder getPhotoFolder(int folderNo) throws Exception {
        // TODO Auto-generated method stub
        return boardDao.getPhotoFolder(folderNo);
    }


    @Override
    public List<Photo> getMainPhoto(int pfNo) throws Exception {
        // TODO Auto-generated method stub
        return null;
    }


    @Override
    public PhotoTheme getSubPhoto(int themeNo) throws Exception {
        // TODO Auto-generated method stub
        return boardDao.getSubPhoto(themeNo);
    }
    @Override
    public boolean likeOk(int photoFolderNo, int userNo)throws Exception{
      return boardDao.likeOk(photoFolderNo, userNo);
    }


    @Override
    public void setLike(int photoFolderNo, int userNo) throws Exception {
        // TODO Auto-generated method stub
      boardDao.setLike(photoFolderNo, userNo);
      
    }
    
    @Override
    public void removeLike(int pfNo, int userNo) throws Exception{
      
      boardDao.removeLike(pfNo, userNo);
     
    }
    
    @Override
    public int getLikeCount(int pfNo)throws Exception{
      return boardDao.getLikeCount(pfNo);
    }
    
    


    @Override
    public boolean setComment(Comment comment) throws Exception {
        // TODO Auto-generated method stub
    	return boardDao.setComment(comment);    
    }


    @Override
    public List<Comment> getComment(int folderNo) throws Exception {
        // TODO Auto-generated method stub
        return boardDao.getComment(folderNo);
    }


    @Override
    public void removeComment(int commentNo) throws Exception {
        // TODO Auto-generated method stub
    	boardDao.removeComment(commentNo);
    	  
      }


    @Override
    public List<PhotoFolder> getNewsFeed(int UserNo,int col) throws Exception {
        // TODO Auto-generated method stub
        return boardDao.getNewsFeed(UserNo,col);
    }


    @Override
    public void updateGSP(Photo photo) throws Exception {
        boardDao.updateGSP(photo);
        
    }


    @Override
    public List<PhotoFolder> searchBoard(String text) throws Exception {
      // TODO Auto-generated method stub
      return boardDao.searchBoard(text);
    }


    @Override
    public List<PhotoFolder> getBest() throws Exception {
      // TODO Auto-generated method stub
      return boardDao.getBest();
    }


    @Override
    public List<User> getLikeMember(int pfNo) throws Exception {
      // TODO Auto-generated method stub
      return boardDao.getLikeMember(pfNo);
    }



    
    
}
