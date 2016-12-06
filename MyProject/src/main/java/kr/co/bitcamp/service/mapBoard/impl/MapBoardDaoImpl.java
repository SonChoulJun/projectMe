package kr.co.bitcamp.service.mapBoard.impl;

import java.util.List;

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
    public boolean updateComment(Comment comment) throws Exception {
        // TODO Auto-generated method stub
        return false;
    }


    
    @Override
	public List<PhotoFolder> getSideBar(int userNo) throws Exception {
		return sqlSession.selectList("BoardMapper.getfolder", userNo );
	}

    @Override
    public List<PhotoFolder> getPhotoFolder(int UserNo) throws Exception {
        // TODO Auto-generated method stub
        return null;
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
    public boolean setComment(Comment comment, int folderNo) throws Exception {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public List<Comment> getComment(int folderNo) throws Exception {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public boolean removeComment(int commentNum) throws Exception {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public List<PhotoFolder> getNewsFeed(int UserNo) throws Exception {
        // TODO Auto-generated method stub
        return null;
    }

	
}
