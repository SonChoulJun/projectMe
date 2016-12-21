package kr.co.bitcamp.service.mapBoard.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.bitcamp.service.domain.Comment;
import kr.co.bitcamp.service.domain.Photo;
import kr.co.bitcamp.service.domain.PhotoFolder;
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

    @Override
    public boolean addFolder(PhotoFolder photoFolder) throws Exception {
        // TODO Auto-generated method stub
        int ok =sqlSession.insert("BoardMapper.setFolder",photoFolder);
        if(ok==1){
            return true;    
        }else
        {
            return false;
        }
    }

    @Override
    public boolean addPhoto(List<Photo> photoList) throws Exception {
/*        sqlSession.insert();*/
        return false;
    }

   

    @Override
    public boolean updateComment(Comment comment) throws Exception {
        // TODO Auto-generated method stub
    	int updateOk = sqlSession.update("BoardMapper.updateComment", comment);
    	if(updateOk==0){
            return true;
        }else{
            return false;
        }
      }

    


    
    @Override
	public List<PhotoFolder> getSideBar(int userNo) throws Exception {
		return sqlSession.selectList("BoardMapper.getfolder", userNo );
	}

    @Override
    public PhotoFolder getPhotoFolder(int folderNo) throws Exception {
        return sqlSession.selectOne("BoardMapper.getfolderOne", folderNo );
    }

    @Override
    public List<Photo> getMainPhoto(int pfNo) throws Exception {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public List<Photo> getSubPhoto(int themeNo) throws Exception {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public boolean setLike(int photoFolderNo, int UserNo) throws Exception {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public boolean setComment(Comment comment) throws Exception {
        // TODO Auto-generated method stub
    	int ok = sqlSession.insert("BoardMapper.setComment", comment);
    	if(ok==1){
          return true;
      }else
      {
          return false;
      }
  }

    @Override
    public List<Comment> getComment(int folderNo) throws Exception {
        // TODO Auto-generated method stub
        return sqlSession.selectList("BoardMapper.getComment", folderNo);
    }

    @Override
    public boolean removeComment(int commentNum) throws Exception {
        // TODO Auto-generated method stub
    	int count = sqlSession.delete("BoardMapper.removeComment", commentNum);
    	// 1개의삭제가 되었다는 가정
        if (count == 1) {
          return true;
        } else {
          return false;
        }
      }

    @Override
    public List<PhotoFolder> getNewsFeed(int UserNo) throws Exception {
        return sqlSession.selectList("BoardMapper.getTimeline", UserNo );
    }

    @Override
    public boolean addTheme(int photoFolderNo,List<Photo> photoList) {
        Map<Object, Object> themeMap = new HashMap<Object, Object>();
        themeMap.put("photoFolderNo", photoFolderNo);
        int themeName =sqlSession.selectOne("BoardMapper.getMaxThemeNo",photoFolderNo);
        themeName++;
        themeMap.put("themeName", themeName);
        System.out.println("sdasdasdasdasdasdsadsadasdasd테마맵맵"+themeMap);        
        sqlSession.insert("BoardMapper.setTheme",themeMap);
        int setThemeNo =sqlSession.selectOne("BoardMapper.getThemeNo",themeMap);
        for (Photo photo : photoList) {
            System.out.println(photo);
            photo.setThemeNo(setThemeNo);
            sqlSession.insert("BoardMapper.setMainPhoto",photo);
        }
        
        return true;
    }

	
}
