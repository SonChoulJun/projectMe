package kr.co.bitcamp.web.mapBoard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.bitcamp.service.domain.Comment;
import kr.co.bitcamp.service.mapBoard.MapBoardService;

@Controller
@RequestMapping("/mapBoard/*")
public class MapBoardController {
    
    @Autowired
    @Qualifier("mapBoardServiceImpl")
    private MapBoardService boardService;

    public MapBoardController() {
        super();
        System.out.println("MapBoardController 생성");
    }
    
    public void setBoardService(MapBoardService boardService) {
        this.boardService = boardService;
    }
    @RequestMapping(value="addFolder")
    public String addFolder(String folderName){
      return "";
    }
    @RequestMapping(value="addPhoto")
    public String addPhoto(List photoList){
      return "";
    }
    @RequestMapping(value="getPhotoFolder")
    public String getPhotoFolder(String userId){
      return "";
    }
    @RequestMapping(value="getMainPhoto")
    public String getMainPhoto(String pfNo){
      return "";
    }
    @RequestMapping(value="getSubPhoto")
    public String getSubPhoto(String themeNo){
      return "";
    }
    @RequestMapping(value="setLike") 
    public String setLike(String photoFolderNo, String userId){
      return "";
    }
    @RequestMapping(value="setComment")
    public String setComment(Comment comment){
      return "";
    }
    @RequestMapping(value="updateComment")
    public String updateComment(Comment comment){
      return "";
    }
    @RequestMapping(value="getComment")
    public String getComment(String folderNo){
      return "";
    }
    @RequestMapping(value="removeComment")
    public String removeComment(String commentNum){
      return "";
    }
    @RequestMapping(value="getNewsFeed")
    public String getNewsFeed(String userId){
      return "";
    }   
   
}
