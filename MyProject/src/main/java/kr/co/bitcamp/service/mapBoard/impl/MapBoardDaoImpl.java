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
import kr.co.bitcamp.service.domain.PhotoTheme;
import kr.co.bitcamp.service.domain.User;
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
    public PhotoTheme getSubPhoto(int themeNo) throws Exception {
        return sqlSession.selectOne("BoardMapper.getThemeOne", themeNo);
    }
    @Override
    public boolean likeOk(int photoFolderNo, int userNo) throws Exception{
      Map map=new HashMap();
      map.put("pfNo", photoFolderNo);
      map.put("userNo", userNo);
      
        if(sqlSession.selectOne("LikeMapper.getLikeOk", map)==null){
          return true;
        }
        else{
          return false;
        }
    }

    @Override
    public void setLike(int photoFolderNo,int userNo) throws Exception {
        // TODO Auto-generated method stub
      
      Map map=new HashMap();
      map.put("pfNo", photoFolderNo);
      map.put("userNo", userNo);
      
      System.out.println("map에 들어가 있는 값은?"+map);
      
      sqlSession.insert("LikeMapper.addLike",map);
    }
    
    @Override
    public void removeLike(int pfNo, int userNo)throws Exception{
      Map map=new HashMap();
      map.put("pfNo", pfNo);
      map.put("userNo", userNo);
      
      sqlSession.delete("LikeMapper.removeLike", map);
    }
    
    @Override
    public int getLikeCount(int pfNo)throws Exception{
      
      return sqlSession.selectList("LikeMapper.getLikeList", pfNo).size();
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
    public void removeComment(int commentNum) throws Exception {
        // TODO Auto-generated method stub
        sqlSession.delete("BoardMapper.removeComment", commentNum);
      /*	int count = sqlSession.delete("BoardMapper.removeComment", commentNum);
    	// 1개의삭제가 되었다는 가정
        if (count == 1) {
          return true;
        } else {
          return false;
        }*/
      }

    @Override
    public List<PhotoFolder> getNewsFeed(int UserNo,int col) throws Exception {
        Map<String, Integer> map = new HashMap<>();
        map.put("userNo", UserNo);
        map.put("startRowNum", 5*(col-1)+1);
        map.put("endRowNum", 5*(col));
        return sqlSession.selectList("BoardMapper.getTimeline", map );
    }

    @Override
    public boolean addTheme(int photoFolderNo,List<Photo> photoList) {
        Map<Object, Object> themeMap = new HashMap<Object, Object>();
        themeMap.put("photoFolderNo", photoFolderNo);
        themeMap.put("themeName", "제목");
        System.out.println("sdasdasdasdasdasdsadsadasdasd테마맵맵"+themeMap); 
        sqlSession.insert("BoardMapper.setTheme",themeMap);
        int setThemeNo =Integer.parseInt(themeMap.get("TM_NO").toString());
        System.out.println(setThemeNo+"1231231");
        for (Photo photo : photoList) {
            System.out.println(photo);
            photo.setThemeNo(setThemeNo);
            if(photo.getPhotoDate()==null){
                sqlSession.insert("BoardMapper.setMainPhotoNull",photo);
            }else{
                sqlSession.insert("BoardMapper.setMainPhoto",photo);
            }
        }
        
        return true;
    }

    @Override
    public List<PhotoFolder> getBest() throws Exception {
      // TODO Auto-generated method stub
      return sqlSession.selectList("BoardMapper.getBest");
    }
    
    @Override
    public List<PhotoFolder> searchBoard(String text) throws Exception {
      // TODO Auto-generated method stub
      
      System.out.println(sqlSession.selectList("UserMapper.searchUser", "%"+text+"%"));
      return sqlSession.selectList("BoardMapper.searchBoard", "%"+text+"%");
    }
    
    @Override
    public void updateGSP(Photo photo) throws Exception {
        // TODO Auto-generated method stub
        sqlSession.update("BoardMapper.updateGPS", photo);
        System.out.println(sqlSession.update("BoardMapper.updateGPS",photo));
    }

    @Override
    public boolean addSubPhoto(int themeNo, List<Photo> photoList) throws Exception {
        for (Photo photo : photoList) {
            System.out.println(photo);
            photo.setThemeNo(themeNo);
            if(photo.getPhotoDate()==null){
                sqlSession.insert("BoardMapper.setSubPhotoNull",photo);
            }else{
                sqlSession.insert("BoardMapper.setSubPhoto",photo);
            }
        }
        return true;
    }

    @Override
    public List<User> getLikeMember(int pfNo) throws Exception {
      // TODO Auto-generated method stub
      return sqlSession.selectList("UserMapper.getLikeUser",pfNo);
    }
    
    

	
}
