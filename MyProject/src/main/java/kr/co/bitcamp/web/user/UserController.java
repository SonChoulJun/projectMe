package kr.co.bitcamp.web.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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

    
    @RequestMapping("/add")
    public String addUser(User user){
      
      return "";
    }
    
    @RequestMapping("/login")
    public String loginUser(User user){
      
      return "";
    }
    
    @RequestMapping("/remove")
    public String removeUser(String pw){
      
      return "";
    }
    
    @RequestMapping("/update")
     public String updateUser(User user){
      
      return "";
    }
    
    @RequestMapping("/get")
    public String getUser(String userId){
      
      return "";
    }
    
    @RequestMapping("/getFollower")
    public String getFollow(String userId){
      
      return "";
    }
    
    @RequestMapping("/removeFollower")
    public String removeFollower(String followerId){
      
      return "";
    }
    
    @RequestMapping("/removeFollowing")
    public String removeFollowing(String followingId){
      
      return "";
    }
    
    @RequestMapping("/addFollower")
      public String addFollow(String follerId){
        
        return "";
      }
      
      @RequestMapping("/getAlram")
      public String getAlram(){
        
        return "";
      }
      
      @RequestMapping("/getActivity")
      public String getActivity(){
        
        return "";
      }
      
      @RequestMapping("/setActivity")
      public String setActivity(Activity activity){
        
        return "";
      }

    
    
    
    

}
