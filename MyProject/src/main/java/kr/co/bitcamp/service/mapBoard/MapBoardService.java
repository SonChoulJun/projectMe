package kr.co.bitcamp.service.mapBoard;

import java.util.List;

import kr.co.bitcamp.service.domain.Comment;
import kr.co.bitcamp.service.domain.Photo;
import kr.co.bitcamp.service.domain.PhotoFolder;

public interface MapBoardService {

    public boolean addFolder(PhotoFolder photoFolder) throws Exception;
    
    public boolean addPhoto(int folderNo,List<Photo> photoList) throws Exception;
    
    public PhotoFolder getPhotoFolder(int folderNo) throws Exception;
    
    public List<Photo> getMainPhoto(int pfNo) throws Exception;
    
    public List<Photo> getSubPhoto(int themeNo) throws Exception;

    public boolean setLike(int photoFolderNo,int UserNo) throws Exception;
    
    public boolean setComment(Comment comment) throws Exception;
    
    public List<Comment> getComment(int folderNo) throws Exception;
    
    public boolean updateComment(Comment comment) throws Exception;
    
    public boolean removeComment(int commentNo) throws Exception;
    
    public List<PhotoFolder> getNewsFeed(int UserNo) throws Exception;
    
    public List<PhotoFolder> getSideBar(int userNo) throws Exception;
    
}
