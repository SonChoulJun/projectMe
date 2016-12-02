package kr.co.bitcamp.web.user;

import java.io.File;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.ResultType;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.bitcamp.service.domain.Activity;
import kr.co.bitcamp.service.domain.User;
import kr.co.bitcamp.service.user.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {
    

    @Autowired
    @Qualifier("userServiceImpl")
    private UserService userService;

    public UserController() {
        super();
        System.out.println("UserController 생성");
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    
    @RequestMapping("add")
    public String addUser(@ModelAttribute("user") User user,Model model){
      
      System.out.println(user+"sssss");
      try {
        boolean ok =userService.addUser(user);
        if(ok)
            model.addAttribute("registerOk", "ok");
        else
            model.addAttribute("registerOk", "no");
        return "forward:/login.jsp";
        
      } catch (Exception e) {
          // TODO Auto-generated catch block
          e.printStackTrace();
          return "";
      }
      
      
    }
    
    
    @RequestMapping("login")
    public String loginUser(@ModelAttribute("user") User user, HttpSession session) 
        throws Exception{
      
      System.out.println("[login() start........................]");
      
      User user01=userService.login(user);
    
      session.setAttribute("user", user01);
      
      System.out.println("[login() end...............]\n");
      
      return "forward:/profile.jsp";
      
     
    }
    
    ///////////////////////////////////////
    @RequestMapping( value="jsonLogin", method=RequestMethod.POST )
    public void jsonLogin(@RequestBody User user1,
                          HttpSession session,
                          Model model) throws Exception{
    
      System.out.println("/user/jsonLogin : GET"+user1.toString());
      User user = userService.getUser(user1.getUserId().trim());
      System.out.println("/user/jsonLogin : GET"+user);
      if( user != null && user.getPassword().equals(user.getPassword())){
        model.addAttribute("userOk", "false");
      }else{
        model.addAttribute("userOk", "true");
      }

    }
    
    
    @RequestMapping("remove")
    public String removeUser(@RequestParam("password") String pw, HttpSession session) throws Exception{
      System.out.println("\n:: ==> remove() start.....");
     
      User user = (User)session.getAttribute("sessionUser");
      user.setUserId(user.getUserId());
      user.setPassword(pw);
      userService.removeUser(user);
      return "forward:/user/removeUser.jsp";
    }
    
    @RequestMapping("update")
     public String updateUser(User user){
      /*  User user01=userService.getUser(userId);
      
        User user1=userService.updateUser(user);
        */
      return "";
    }
    
    @RequestMapping("/getUser")
    public String getUser(@RequestParam("userId") String userId, 
                                    Model model,
                    HttpServletRequest request) throws Exception{
      System.out.println("[getUser() start........................]");
      
      User user=userService.getUser(userId);
     
      model.addAttribute("user", user);
      
      System.out.println("[getUser() end...............]\n");
      
      return "";
    }
    
//    @RequestMapping( value="getUser", method=RequestMethod.GET )
//	public String getUser( @RequestParam("userId") String userId , Model model ) throws Exception {
//		
//		System.out.println("/user/getUser : GET");
//		//Business Logic
//		User user = userService.getUser(userId);
//		// Model 과 View 연결
//		model.addAttribute("user", user);
//		
//		return "forward:/user/getUser.jsp";
//	}
    
    @RequestMapping("getFollower")
    public String getFollow(String userId){
      
      return "";
    }
    
    @RequestMapping("removeFollower")
    public String removeFollower(String followerId){
      
      return "";
    }
    
    @RequestMapping("removeFollowing")
    public String removeFollowing(String followingId){
      
      return "";
    }
    
    @RequestMapping("addFollower")
      public String addFollow(String follerId){
        
        return "";
      }
      
      @RequestMapping("getAlram")
      public String getAlram(){
        
        return "";
      }
      
      @RequestMapping("getActivity")
      public String getActivity(){
        return "";
      }
      
      @RequestMapping("setActivity")
      public String setActivity(Activity activity){
        
        return "";
      }
      
      @RequestMapping(value = "fileUpload/post", method=RequestMethod.POST) //ajax에서 호출하는 부분
      //@ResponseBody 이거 쓰면 멘트뿌려줄수있음.
      public String upload(MultipartHttpServletRequest multipartRequest) { //Multipart로 받는다.
        
        System.out.println("들왓니?");
        
          Iterator<String> itr =  multipartRequest.getFileNames();

          String filePath = "C:/test"; //설정파일로 뺀다.
           
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
              }
                            
         }
            
          return "Upload Success";
      }
    
    
    

}
