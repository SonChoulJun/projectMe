package kr.co.bitcamp.web.mapBoard;

import java.io.File;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.cglib.reflect.MethodDelegate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.bitcamp.service.domain.Comment;
import kr.co.bitcamp.service.domain.PhotoFolder;
import kr.co.bitcamp.service.domain.User;
import kr.co.bitcamp.service.mapBoard.MapBoardService;
import kr.co.bitcamp.service.user.UserService;

@Controller
@RequestMapping("/mapBoard/*")
public class MapBoardController {
    
    @Autowired
    @Qualifier("mapBoardServiceImpl")
    private MapBoardService boardService;
    private UserService userService;

    public MapBoardController() {
        super();
        System.out.println("MapBoardController 생성");
    }
    
    public void setBoardService(MapBoardService boardService) {
        this.boardService = boardService;
    }
    @RequestMapping("addFolder")
    public String addFolder(PhotoFolder photoFolder,HttpSession session, Model model) throws Exception{
      int userNo = ((User)session.getAttribute("user")).getUserNo();
      photoFolder.setUserNo(userNo);
      boolean ok =boardService.addFolder(photoFolder);
      if(ok){
          List<PhotoFolder> photoFolder1 = boardService.getSideBar(userNo);
          session.setAttribute("folderList", photoFolder1);
          model.addAttribute("addFolderOk","ok");
      }else{
          model.addAttribute("addFolderOk","no");
      }
      return "forward:/profile.jsp";
    }
    @RequestMapping(value = "addphoto", method=RequestMethod.POST) //ajax에서 호출하는 부분
    //@ResponseBody 
    public void addphoto(MultipartHttpServletRequest multipartRequest) { //Multipart로 받는다.
      
      System.out.println("들왓니?");
      
        Iterator<String> itr =  multipartRequest.getFileNames();

        String filePath = "C:/Users/BitCamp/git-realProject/projectMe/MyProject/src/main/webapp/html/assets/img/uploadedPhoto"; //설정파일로 뺀다.
         
        while (itr.hasNext()) { //받은 파일들을 모두 돌린다.
             
            /* 기존 주석처리
            MultipartFile mpf = multipartRequest.getFile(itr.next());
            String originFileName = mpf.getOriginalFilename();
            System.out.println("FILE_INFO: "+originFileName); //받은 파일 리스트 출력'
            */
             
            MultipartFile mpf = multipartRequest.getFile(itr.next());
      
            String originalFilename = mpf.getOriginalFilename(); //파일명
      
            String fileFullPath = filePath+"/"+originalFilename; //파일 전체 경로
      
            try {
                //파일 저장
                mpf.transferTo(new File(fileFullPath)); //파일저장 실제로는 service에서 처리
                 
                System.out.println("originalFilename => "+originalFilename);
                System.out.println("fileFullPath => "+fileFullPath);
      
            } catch (Exception e) {
                System.out.println("postTempFile_ERROR======>"+fileFullPath);
                e.printStackTrace();
                //return "Upload Failed";
            }
                          
       }
          
       // return "Upload Success";
    }
    @RequestMapping("getPhotoFolder")
    public String getPhotoFolder(String userId){    	
      return "";
    }
    @RequestMapping( value="getSideBar", method=RequestMethod.GET )
	public String getSideBar( HttpSession session, Model model ) throws Exception {
    	User user =(User)session.getAttribute("user");
    	int userNo = user.getUserNo();
    	System.out.println("폴더 불러 오구연!!!!!!!!!!!!!!!!!!!");
		//Business Logic
    	List<PhotoFolder> photoFolder = boardService.getSideBar(userNo);
    	PhotoFolder pFolder =photoFolder.get(0);
    	System.out.println("폴더 불러 오구연!!!!!!!!!!!!!!!!!!!"+pFolder.toString());

		// Model 과 View 연결
		model.addAttribute("photoFolder", photoFolder);
		
		return "forward:/profile.jsp";
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
    public String setComment( @ModelAttribute("comment") Comment comment , Model model , HttpSession session) throws Exception{      
		System.out.println("/domain/Comment");
		comment.setCommentNo(((Comment)session.getAttribute("comment")).getCommentNo());
		boolean ok = boardService.setComment(comment);
		if(ok){
          model.addAttribute("setCommentOk","ok");
		}else{
          model.addAttribute("setCommentOk","no");
		}
		return "forward:";
    	}

    @RequestMapping("updateComment")
    public String updateComment(@ModelAttribute("comment")Comment comment,Model model){
    	
        System.out.println(comment+"sssss");
        try {
            boolean ok =boardService.updateComment(comment);
            if(ok)
                model.addAttribute("updateOk", "ok");
            else
                model.addAttribute("updateOk", "no");
            return "";
            
          } catch (Exception e) {
              // TODO Auto-generated catch block
              e.printStackTrace();
              return "";
          }
          
          
        }
    @RequestMapping( value="getComment")
  	public String getComment( @RequestParam("folderNo")int userNo ,String userId, String folderNo, Model model ) throws Exception {
    	
    	System.out.println("getComment받아와랏!!!!!!!!!!!!!");
  		//Business Logic
    	User user = userService.getUser(userId);
    	List<Comment> comment = boardService.getComment(userNo);
  		// Model 과 View 연결
    	model.addAttribute("user", user);
  		model.addAttribute("comment", comment);
    	
    	return "";
    }

    @RequestMapping("removeComment")
    public String removeComment(@RequestParam("commentNum") int commentNum, HttpSession session) throws Exception{
        System.out.println("\n:: ==> remove() start.....");
        
        User user = (User)session.getAttribute("sessionUser");
        user.setUserId(user.getUserId());
        boardService.removeComment(commentNum);
        return "";
    }
    @RequestMapping("getNewsFeed")
    public String getNewsFeed(String userId){
      return "";
    }   
   
}
