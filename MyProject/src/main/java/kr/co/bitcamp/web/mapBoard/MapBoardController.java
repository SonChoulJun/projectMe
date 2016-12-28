package kr.co.bitcamp.web.mapBoard;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.sanselan.ImageReadException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.bitcamp.common.util.MetadataExample;
import kr.co.bitcamp.service.domain.Activity;
import kr.co.bitcamp.service.domain.Comment;
import kr.co.bitcamp.service.domain.Photo;
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
    
    @Autowired
    @Qualifier("userServiceImpl")
    private UserService userService;

    public MapBoardController() {
        super();
        System.out.println("MapBoardController 생성");
    }
    
    public void setBoardService(MapBoardService boardService) {
        this.boardService = boardService;
    }
    
    
    @RequestMapping("addFolder")
    public void addFolder(@RequestBody PhotoFolder photoFolder,HttpSession session, Model model) throws Exception{
      int userNo = ((User)session.getAttribute("myUser")).getUserNo();
      photoFolder.setUserNo(userNo);
      boolean ok =boardService.addFolder(photoFolder);
      if(ok){
          List<PhotoFolder> photoFolder1 = boardService.getSideBar(userNo);
          model.addAttribute("folderNo",photoFolder1.get(0).getPfNo());
          model.addAttribute("addFolderOk","ok");
          
          Activity activity=new Activity();
          activity.setActivityText("새로운 여행을 등록하였습니다 ! 추억이 쌓여가요~!!");
          activity.setUserNo(userNo);
          userService.setActivity(activity);
      }else{
          model.addAttribute("addFolderOk","no");
      }
      
      
   
    }
    
    @RequestMapping(value = "addphoto/{folderNo}", method=RequestMethod.POST) //ajax에서 호출하는 부분
    //@ResponseBody 
    public void addphoto(@PathVariable int folderNo,MultipartHttpServletRequest multipartRequest) { //Multipart로 받는다.
      
      System.out.println("들왓니?");
        ArrayList<Photo> photoList =new ArrayList<Photo>();
        Iterator<String> itr =  multipartRequest.getFileNames();

        String filePath = "C:\\Users\\BitCamp\\git-realProject\\projectMe\\MyProject\\src\\main\\webapp\\html\\assets\\img\\uploadedPhoto"; //설정파일로 뺀다.
         
        while (itr.hasNext()) { //받은 파일들을 모두 돌린다.
             
            /* 기존 주석처리
            MultipartFile mpf = multipartRequest.getFile(itr.next());
            String originFileName = mpf.getOriginalFilename();
            System.out.println("FILE_INFO: "+originFileName); //받은 파일 리스트 출력'
            */
            Photo photo = new Photo(); 
            MultipartFile mpf = multipartRequest.getFile(itr.next());
      
            String originalFilename = mpf.getOriginalFilename(); //파일명
      
            String fileFullPath = filePath+"\\"+originalFilename; //파일 전체 경로
      
            try {
                //파일 저장
                mpf.transferTo(new File(fileFullPath)); //파일저장 실제로는 service에서 처리
                 
                System.out.println("originalFilename => "+originalFilename);
                
                System.out.println("fileFullPath => "+fileFullPath);
                
                File outputfile = new File(fileFullPath);
                
                try {
                    MetadataExample metadataExample = new MetadataExample();
                    metadataExample.metadataExample(outputfile);
                    if(metadataExample.getLatitude()!=0 && metadataExample.getLongitude()!=0){
                      photo.setGpsB(metadataExample.getLatitude()+"");
                      photo.setGpsH(metadataExample.getLongitude()+"");
                    }else{
                    
                    }
                    
                    String date =metadataExample.getDate();
                    if(date!=null){
                      String[] dateArray=date.split("'");
                      photo.setPhotoDate(dateArray[1]);
                    }
                      photo.setFolderName(originalFilename);
                      photoList.add(photo);
                    
                } catch (ImageReadException | IOException e) {
                  // TODO Auto-generated catch block
                  e.printStackTrace();
                }
                
            } catch (Exception e) {
                System.out.println("postTempFile_ERROR======>"+fileFullPath);
                e.printStackTrace();
                //return "Upload Failed";
            }
                          
       }
        
        try {
            System.out.println(boardService.addPhoto(folderNo, photoList));
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
          

    }
    
    
    @RequestMapping("getPhotoFolder/{folderNum}")
    public String getPhotoFolder(@PathVariable int folderNum, Model model){ 
        try {
            PhotoFolder photoFolderOne= boardService.getPhotoFolder(folderNum);
            List<Comment> comment = boardService.getComment(folderNum);
            System.out.println(comment);
            model.addAttribute("photoFolderOne", photoFolderOne);
            model.addAttribute("commentList", comment);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
      return "forward:/user/photoFolderOne.jsp";
    }
    
    
    @RequestMapping("getPhotoFolder")
    public String getPhotoFolderEx(@RequestParam("folderNum") int folderNum,Model model,HttpSession session){ 
        try {
          
            System.out.println(folderNum+"++++++++++++++++++++++++++++++++++++");
            PhotoFolder photoFolderOne= boardService.getPhotoFolder(folderNum);
            List<Comment> comment = boardService.getComment(folderNum);
            model.addAttribute("photoFolderOne", photoFolderOne);
            System.out.println("getPhotoFolder"+photoFolderOne);
            model.addAttribute("commentList", comment);
            model.addAttribute("likeOk", boardService.likeOk(folderNum, ((User)session.getAttribute("myUser")).getUserNo()));
            model.addAttribute("likeCount", boardService.getLikeCount(folderNum));
            int commentCount=boardService.getComment(folderNum).size();
            model.addAttribute("commentCount",commentCount);
            System.out.println(comment);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
      return "forward:/user/photoFolderOne.jsp";
    }
    
    
    @RequestMapping( value="getSideBar", method=RequestMethod.GET )
	public String getSideBar( HttpSession session, Model model ) throws Exception {
    	User user =(User)session.getAttribute("myUser");
    	int userNo = user.getUserNo();
    	System.out.println("폴더 불러 오구연!!!!!!!!!!!!!!!!!!!");
		//Business Logic
    	List<PhotoFolder> photoFolder = boardService.getSideBar(userNo);
    	PhotoFolder pFolder =photoFolder.get(0);
    	System.out.println("폴더 불러 오구연!!!!!!!!!!!!!!!!!!!"+pFolder.toString());

		// Model 과 View 연결
		    model.addAttribute("photoFolder", photoFolder);
		
		    return "forward:/user/profile.jsp";
    }
    
    @RequestMapping("getMainPhoto")
    public String getMainPhoto(String pfNo){
      return "";
    }
    @RequestMapping("getSubPhoto")
    public String getSubPhoto(String themeNo){
      return "";
    }
    

    @RequestMapping( value="setLike/{userNo}/{pfNo}", method=RequestMethod.GET )
    public void jsonSetLike(@PathVariable("userNo") int userNo,@PathVariable("pfNo") int pfNo,
                                     Model model) throws Exception{
      
      if(boardService.likeOk(pfNo, userNo)){
        boardService.setLike(pfNo, userNo);
        model.addAttribute("likeOk", "add");
        model.addAttribute("likeCount", boardService.getLikeCount(pfNo));
      }
      else{
        boardService.removeLike(pfNo, userNo);
        model.addAttribute("likeOk", "remove");
        model.addAttribute("likeCount", boardService.getLikeCount(pfNo));
      }
      
      /*PhotoFolder pf=boardService.getPhotoFolder(pfNo);
      boolean likeCode = boardService.setLike(pfNo, userNo);
      
      
    
      
      if(likeCode==true){
        pf.setLikeCode(1);
      }else{
        pf.setLikeCode(0);
      }*/
    }
      


    @RequestMapping("setComment")
    public String setComment( @ModelAttribute("comment") Comment comment , Model model , HttpSession session) throws Exception{      
		System.out.println("/domain/Comment");
		System.out.println(comment);
		boolean ok = boardService.setComment(comment);
		int commentCount=boardService.getComment(comment.getFolderNo()).size();
		
		if(ok){
          model.addAttribute("setCommentOk","ok");
		}else{
          model.addAttribute("setCommentOk","no");
		}
		
		model.addAttribute("commentCount", commentCount);
		return "forward:/mapBoard/getPhotoFolder?folderNum="+comment.getFolderNo();
    	}
    
    
    
    
    @RequestMapping("jsonSetComment")
    public void jsonSetComment(@RequestBody Comment comment, Model model , HttpSession session) throws Exception{      
    System.out.println("/domain/Comment");

    boolean ok = boardService.setComment(comment);
    List<Comment> comentList=boardService.getComment(comment.getFolderNo());
    int commentCount=boardService.getComment(comment.getFolderNo()).size();
    Comment comment2 = comentList.get(commentCount-1);
    
    if(ok){
          model.addAttribute("setCommentOk","ok");
    }else{
          model.addAttribute("setCommentOk","no");
    }
    
    model.addAttribute("commentCount", commentCount);
    model.addAttribute("comment", comment2);
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
  	public void getComment( @RequestParam("folderNo")int userNo ,String userId, String folderNo, Model model ) throws Exception {
    	
    	System.out.println("getComment받아와랏!!!!!!!!!!!!!");
  		//Business Logic
    	User user = userService.getUser(userId);
    	List<Comment> comment = boardService.getComment(userNo);
  		// Model 과 View 연결
    	model.addAttribute("user", user);
  		model.addAttribute("comment", comment);

    }

    @RequestMapping("removeComment")
    public void removeComment(@RequestParam("commentNo") int commentNo, HttpSession session) throws Exception{
        System.out.println("\n:: ==> remove() start.....");
        
       /* User user = (User)session.getAttribute("myUser");
        user.setUserId(user.getUserId());*/
        boardService.removeComment(commentNo);
        
       
    }
    
    @RequestMapping("getNewsFeed")
    public String getNewsFeed(@RequestParam("userNo") int userNo,Model model)throws Exception{
      List<PhotoFolder> newsfeed =boardService.getNewsFeed(userNo);
      model.addAttribute("newsfeed",newsfeed);
      System.out.println("newfeed"+newsfeed);
      return "forward:/user/timeLine.jsp";
    }   
   
}
