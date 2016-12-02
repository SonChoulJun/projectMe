package kr.co.bitcamp.web.user;

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
