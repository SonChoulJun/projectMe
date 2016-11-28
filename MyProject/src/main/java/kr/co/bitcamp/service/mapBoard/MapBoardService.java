package kr.co.bitcamp.service.mapBoard;

import java.util.List;

import kr.co.bitcamp.service.domain.Comment;
import kr.co.bitcamp.service.domain.Photo;
import kr.co.bitcamp.service.domain.PhotoFolder;

public interface MapBoardService {

    public boolean addFolder(String folderName) throws Exception;
    
    public boolean addPhone(List photoList) throws Exception;
    
    public List<PhotoFolder> getPhotoFolder(String userId) throws Exception;
    
    public List<Photo> getMainPhoto(String pfNo) throws Exception;
    
    public List<Photo> getSubPhoto(String themeNo) throws Exception;

    public boolean setLike(String photoFolderNo,String userId) throws Exception;
    
    public boolean setComment(Comment comment,String folderNo) throws Exception;
    
    public List<Comment> getComment(String folderNo) throws Exception;
    
    public boolean updateComment(Comment comment) throws Exception;
    
    public boolean removeComment(String commentNum) throws Exception;
    
    public List<PhotoFolder> getNewsFeed(String userId) throws Exception;
}
