package kr.co.bitcamp.web.profile;

import java.io.File;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

import kr.co.bitcamp.service.domain.Activity;
import kr.co.bitcamp.service.domain.PhotoFolder;
import kr.co.bitcamp.service.domain.User;
import kr.co.bitcamp.service.mapBoard.MapBoardService;
import kr.co.bitcamp.service.user.UserService;

@Controller
@RequestMapping("/profile/*")
public class ProfileController {
    

    @Autowired
    @Qualifier("userServiceImpl")
    private UserService userService;
    
    @Autowired
    @Qualifier("mapBoardServiceImpl")
    private MapBoardService boardService;

    public ProfileController() {
        super();
        System.out.println("UserController 생성");
    }
    //get,set
    public void setBoardService(MapBoardService boardService) {
        this.boardService = boardService;
    }
    

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("mainProfile")
    public String mainProfile(HttpSession session, Model model) throws Exception{
        User user = (User)session.getAttribute("myUser");
        int userNo =user.getUserNo(); // 세션에서 넘버거져오고
        System.out.println(user);
       
        session.setAttribute("targetUser",user);
        List<PhotoFolder> photoFolder = boardService.getSideBar(userNo);  // 사이트바 위해 포토폴더 받아오기
        System.out.println("asdasdsasad"+photoFolder);
        
        List<PhotoFolder> BestphotoFolder = boardService.getBest();
        System.out.println("getBest : "+BestphotoFolder);
        try{
            session.setAttribute("BestfolderList", BestphotoFolder);
            session.setAttribute("folderList", photoFolder);
            session.setAttribute("getFollwerCount",userService.getFollwerCount(userNo));
            session.setAttribute("getFollwingCount",userService.getFollwingCount(userNo));
        }catch (Exception e) {
            e.getMessage();
        }

            return "forward:/user/profile.jsp";
    }
    
    
    @RequestMapping("subProfile")
    public String subProfile(@RequestParam("userId") String userId,HttpSession session, Model model) throws Exception{
        User myUser = (User)session.getAttribute("myUser");
        User user = userService.getUser(userId);
        System.out.println(user);
        int userNo =user.getUserNo();
       
        session.setAttribute("targetUser",user);
        List<PhotoFolder> photoFolder = boardService.getSideBar(userNo);
        System.out.println("asdasdsasad"+photoFolder);
        try{
            session.setAttribute("followerOk",userService.followOk(myUser.getUserNo(), userNo) );
            session.setAttribute("folderList", photoFolder);
            session.setAttribute("getFollwerCount",userService.getFollwerCount(userNo));
            session.setAttribute("getFollwingCount",userService.getFollwingCount(userNo));
        }catch (Exception e) {
            e.getMessage();
        }

            return "forward:/user/profile.jsp";
    }

    @RequestMapping("addprfphoto")
    public void addprfphoto(HttpSession session, MultipartHttpServletRequest multipartRequest, Model model)throws Exception { //Multipart로 받는다.
      
      System.out.println("들왓니?");
      
        Iterator<String> itr =  multipartRequest.getFileNames();

        String filePath = "C:\\Users\\BitCamp\\git-realProject\\projectMe\\MyProject\\src\\main\\webapp\\html\\dist\\img\\profile\\"; //설정파일로 뺀다.
         
        while (itr.hasNext()) { //받은 파일들을 모두 돌린다.
             
            /* 기존 주석처리
            MultipartFile mpf = multipartRequest.getFile(itr.next());
            String originFileName = mpf.getOriginalFilename();
            System.out.println("FILE_INFO: "+originFileName); //받은 파일 리스트 출력'
            */
             
            MultipartFile mpf = multipartRequest.getFile(itr.next());
      
            String originalFilename = mpf.getOriginalFilename(); //파일명
            //int index = originalFilename.indexOf(".");

            User user = (User)session.getAttribute("myUser");
            
            
            String filename1 = originalFilename.substring(originalFilename.indexOf("."), originalFilename.length());
            System.out.println(filename1); //filename1=>.jpg
            originalFilename=user.getUserNo()+filename1;
            String fileFullPath = filePath+originalFilename; //파일 전체 경로
            
            userService.updatepfphoto(user.getUserNo(), originalFilename);
            
            model.addAttribute("originalFilename" , originalFilename);
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
    

    
    
    
    @RequestMapping("photoPage/{folderNo}")
    public String photoPage(@PathVariable String folderNo,HttpSession session, Model model) throws Exception{
        User user = (User)session.getAttribute("myUser");
        int userNo =user.getUserNo();
        List<PhotoFolder> photoFolder = boardService.getSideBar(userNo);
        session.setAttribute("folderList", photoFolder);
        System.out.println(folderNo);
        model.addAttribute("folderNo",folderNo);
        return "forward:/photo/mainUpload.jsp";
    }
    
    
    @RequestMapping("search")
    public String search(@RequestParam("searchText") String searchTest,
                              Model model) throws Exception{
        List<User> userList =userService.searchUser(searchTest);
        List<PhotoFolder>boardList= boardService.searchBoard(searchTest);
        model.addAttribute("listUser",userList);
        model.addAttribute("boardList", boardList);
        
        return "forward:/user/searchList.jsp";
    }
    

}
