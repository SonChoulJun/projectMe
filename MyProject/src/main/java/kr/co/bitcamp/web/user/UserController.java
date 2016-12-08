package kr.co.bitcamp.web.user;

import java.io.File;
import java.util.Iterator;
import java.util.List;

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
import kr.co.bitcamp.service.domain.Alram;
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
        return "forward:/user/login.jsp";
        
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
      user01.setActivity(true);
    
      session.setAttribute("user", user01);
      
      System.out.println("[login() end...............]\n");
      
      return "forward:/profile/mainProfile";
      
     
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
    
    @RequestMapping("get")
    public String getUser(HttpSession session , Model model ) throws Exception{
      User user =(User)session.getAttribute("user");
      System.out.println("/getUser()  개인정보 불러와!!" );
  
      User user1 = userService.getUser(user.getUserId().trim());
      
      
         model.addAttribute("user", user1);
    
      return "forward:/user/getUser.jsp";
    }
    
    @RequestMapping("updateUserView")
    public String updateUserView(HttpSession session , Model model ) throws Exception{
      User user =(User)session.getAttribute("user");
      System.out.println("/updateUserView 수정창  불러와!!" );

      User user1 = userService.getUser(user.getUserId().trim());

      model.addAttribute("user", user1);
    
      return "forward:/user/updateMyProfile.jsp";
    }
    
    
    
    
    @RequestMapping("update")
    public String updateUser( @ModelAttribute("user") User user, HttpSession session) throws Exception{
      
      System.out.println("/updateUser 업데이트 된 개인정보 불러와!!!!!!!!!!!" );
      userService.updateUser(user);
      
      String sessionId=((User)session.getAttribute("user")).getUserId();
      if(sessionId.equals(user.getUserId())){
        session.setAttribute("user", user);
      } 
      
      return "forward:/user/getUser.jsp";
    }
    
    @RequestMapping("read")
    public String readUser(@RequestParam("userId") String userId, 
                                    Model model,
                    HttpServletRequest request) throws Exception{
      System.out.println("[readUser() start........................]");
      
      User user=userService.getUser(userId);
     
      model.addAttribute("user", user);
      
      System.out.println("[readUser() end...............]\n");
      
      return "";
    }
    
    
    
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
      
    @RequestMapping( value="getAlram")
  	public String getAlram( @RequestParam("userNo") int userNo , String userId, Model model ) throws Exception {
  		
  		System.out.println("알람 받아오구연 지리구연!!!!!!!!!!!!!!!!!!!");
  		//Business Logic
  		User user = userService.getUser(userId);
  		List<Alram> alram = userService.getAlram(userNo);
  		// Model 과 View 연결
  		model.addAttribute("user", user);
  		model.addAttribute("alram", alram);
  		
  		return "";
  	}
      
      @RequestMapping("getActivity")
      public String getActivity(HttpSession session , Model model )throws Exception{
       
        System.out.println("하하하하하하하하하핫");
        User user=(User)session.getAttribute("user");
        int userNo=user.getUserNo();
        
        List<Activity> activityList =userService.getActivity(userNo);
       
        
        System.out.println("액티비티 리스트 불러왔나 확인해바랏~~!!!!!!!!!!");
        model.addAttribute("targetUser", user);
        model.addAttribute("activity", activityList);
        
        return "forward:/user/MyActivity.jsp";
      }
      
      @RequestMapping("setActivity")
      public String setActivity(Activity activity){
 
        return "";
      }
      @RequestMapping("myTravel")
      public String travelPage(HttpSession session, Model model)throws Exception{
        
        System.out.println("login 객체 가지고 가야지!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        User user=(User)session.getAttribute("user");
        //int userNo=user.getUserNo();
        
        model.addAttribute("targetUser", user);
        
        return "forward:/user/profile.jsp";
      }
      
      @RequestMapping("removeActivity")
      public String removeActivity(HttpSession session)throws Exception{
        
        session.getAttribute("user");
        
        return "";
      }
      

}
