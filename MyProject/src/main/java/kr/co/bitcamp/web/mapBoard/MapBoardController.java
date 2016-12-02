package kr.co.bitcamp.web.mapBoard;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.bitcamp.service.domain.Comment;
import kr.co.bitcamp.service.domain.PhotoFolder;
import kr.co.bitcamp.service.domain.User;
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
    @RequestMapping("addFolder")
    public String addFolder(String folderName){
      return "";
    }
    @RequestMapping("addPhoto")
    public String addPhoto(List photoList){
      return "";
    }
    @RequestMapping("getPhotoFolder")
    public String getPhotoFolder(String userId){    	
      return "";
    }
    @RequestMapping( value="getSideBar", method=RequestMethod.GET )
	public String getSideBar( HttpSession session, Model model ) throws Exception {
/*    	User user =(User)session.getAttribute("user");
    	String userNo = user.getUserNo();*/
    	String userNo = "10000";
    	System.out.println("폴더 불러 오구연!!!!!!!!!!!!!!!!!!!");
		//Business Logic
    	List<PhotoFolder> photoFolder = boardService.getSideBar(userNo);
    	PhotoFolder pFolder =photoFolder.get(0);
    	System.out.println("폴더 불러 오구연!!!!!!!!!!!!!!!!!!!"+pFolder.toString());

		// Model 과 View 연결
		model.addAttribute("photoFolder", photoFolder);
		
		return "forword:/profile.jsp";
    }
    
    @RequestMapping("getMainPhoto")
    public String getMainPhoto(String pfNo){
      return "";
    }
    @RequestMapping("getSubPhoto")
    public String getSubPhoto(String themeNo){
      return "";
    }
    @RequestMapping("setLike") 
    public String setLike(String photoFolderNo, String userId){
      return "";
    }
    @RequestMapping("setComment")
    public String setComment(Comment comment){
      return "";
    }
    @RequestMapping("updateComment")
    public String updateComment(Comment comment){
      return "";
    }
    @RequestMapping("getComment")
    public String getComment(String folderNo){
      return "";
    }
    @RequestMapping("removeComment")
    public String removeComment(String commentNum){
      return "";
    }
    @RequestMapping("getNewsFeed")
    public String getNewsFeed(String userId){
      return "";
    }   
   
}
