package kr.co.bitcamp.service.mapBoard;

import java.util.List;

import kr.co.bitcamp.service.domain.Comment;
import kr.co.bitcamp.service.domain.Photo;
import kr.co.bitcamp.service.domain.PhotoFolder;
import kr.co.bitcamp.service.domain.PhotoTheme;

public interface MapBoardService {

    public boolean addFolder(PhotoFolder photoFolder) throws Exception;
    
    public boolean addPhoto(int folderNo,List<Photo> photoList) throws Exception;
    
    public boolean addSubPhoto(int themeNo,List<Photo> photoList) throws Exception;
    
    public PhotoFolder getPhotoFolder(int folderNo) throws Exception;
    
    public List<Photo> getMainPhoto(int pfNo) throws Exception;
    
    public PhotoTheme getSubPhoto(int themeNo) throws Exception;
    
    public boolean likeOk(int photoFolderNo, int userNo) throws Exception;

    public void setLike(int photoFolderNo,int UserNo) throws Exception;
    
    public void removeLike(int pfNo, int userNo) throws Exception;
    
    public int getLikeCount(int pfNo) throws Exception;
    
    public boolean setComment(Comment comment) throws Exception;
    
    public List<Comment> getComment(int folderNo) throws Exception;
    
    public boolean updateComment(Comment comment) throws Exception;
    
    public void removeComment(int commentNo) throws Exception;
    
    public List<PhotoFolder> getNewsFeed(int UserNo,int col) throws Exception;
    
    public List<PhotoFolder> getSideBar(int userNo) throws Exception;
    
    public List<PhotoFolder> searchBoard(String text)throws Exception;

    public void updateGSP(Photo photo) throws Exception;
    
}
