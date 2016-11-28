package kr.co.bitcamp.web.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
    public String addUser(User user){
      
      return "";
    }
    
    @RequestMapping("login")
    public String loginUser(User user){
      
      return "";
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
      
      return "";
    }
    
    @RequestMapping( value="getUser", method=RequestMethod.GET )
	public String getUser( @RequestParam("userId") String userId , Model model ) throws Exception {
      
    	System.out.println("/user/getUser : GET");
		//Business Logic
		User user = userService.getUser(userId);
		// Model 과 View 연결
		model.addAttribute("user", user);
		
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

    
    
    
    

}
