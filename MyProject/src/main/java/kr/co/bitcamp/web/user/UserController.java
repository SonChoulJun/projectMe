package kr.co.bitcamp.web.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.bitcamp.service.domain.Activity;
import kr.co.bitcamp.service.domain.Alram;
import kr.co.bitcamp.service.domain.Chat;
import kr.co.bitcamp.service.domain.PhotoFolder;
import kr.co.bitcamp.service.domain.User;
import kr.co.bitcamp.service.mapBoard.MapBoardService;
import kr.co.bitcamp.service.user.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {
    

    @Autowired
    @Qualifier("userServiceImpl")
    private UserService userService;
    
    @Autowired
    @Qualifier("mapBoardServiceImpl")
    private MapBoardService boardService;

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
    public String loginUser(@ModelAttribute("user") User user, HttpSession session,Model model) 
        throws Exception{
      
      System.out.println("[login() start........................]");
      
      User user01=userService.login(user);
      user01.setActivity(true);
      session.setAttribute("myUser", user01);
      userService.updateUserActivity(user01.getUserNo(), true);
      
      System.out.println("[login() end...............]\n");
      List<Activity> list=userService.getActivity(user01.getUserNo());
      //timeline을 첫페이지로.////////////////////////
     
      //////////////////////////////////////
          if(list.size()==0){
            
            Activity activity=new Activity();
            activity.setUserNo(user01.getUserNo());
            activity.setActivityText("회원가입을 환영합니다. 새로운 추억을 만들어가세요~");
            userService.setActivity(activity);
          }else{
            System.out.println("이래서 안되는 거였니???????");
          }
      
      
      return "forward:/profile/mainProfile";
      
     
    }
    /*@RequestMapping("getNewsFeed")
    public String getNewsFeed(@RequestParam("userNo") int userNo,Model model)throws Exception{
      List<PhotoFolder> newsfeed =boardService.getNewsFeed(userNo,1);
      model.addAttribute("newsfeed",newsfeed);
      System.out.println("newfeed"+newsfeed);
      return "forward:/user/timeLine.jsp";
    }*/
    
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
    
    @RequestMapping("logout/{userNo}")
    public String logoutUser(@PathVariable int userNo,HttpSession session) throws Exception{
      
      
        System.out.println("[로그아웃시작]");
        
        session.invalidate();
        userService.updateUserActivity(userNo, false);
        
        System.out.println("[로그아웃 완료");
        
      
      
      return "forward:/index.jsp";
    }
    
    
    @RequestMapping("remove")
    public String removeUser(@RequestParam("password") String pw, HttpSession session) throws Exception{
      System.out.println("\n:: ==> remove() start.....");
     
      User user = (User)session.getAttribute("myUser");
      user.setUserId(user.getUserId());
      user.setPassword(pw);
      userService.removeUser(user);
      return "forward:/user/removeUser.jsp";
    }
    
    @RequestMapping("get")
    public String getUser(@RequestParam("userId") String userId, HttpSession session , Model model ) throws Exception{
      User user =(User)session.getAttribute("myUser");
      System.out.println("/getUser()  개인정보 불러와!!" );
  
      User user1 = userService.getUser(userId.trim());
      
      
         model.addAttribute("user", user1);
    
      return "forward:/user/getUser.jsp?";
    }
    
    @RequestMapping("updateUserView")
    public String updateUserView(HttpSession session , Model model ) throws Exception{
      User user =(User)session.getAttribute("myUser");
      System.out.println("/updateUserView 수정창  불러와!!" );

      User user1 = userService.getUser(user.getUserId().trim());

      model.addAttribute("user", user1);
    
      return "forward:/user/updateMyProfile.jsp";
    }
    
    @RequestMapping("updateStatus")
    public @ResponseBody Map<String,String> updateStatus(@RequestBody User user1 ,HttpSession session, Model model)throws Exception{
    
      User user=(User)session.getAttribute("myUser");
      int userNo=user.getUserNo();
      
      userService.updateStatus(user1.getStatus(), userNo);
      
      String status=user1.getStatus();
      Map<String,String> map = new HashMap<String,String>();
      map.put("status", status);
      
      session.setAttribute("myUser", user1);
      
      System.out.println("맵"+map);
      return map;
    }
    
    
    
    
    @RequestMapping("update")
    public String updateUser( @ModelAttribute("user") User user, HttpSession session) throws Exception{
      
      System.out.println("/updateUser 업데이트 된 개인정보 불러와!!!!!!!!!!!" );
      userService.updateUser(user);
      
      String sessionId=((User)session.getAttribute("myUser")).getUserId();
      if(sessionId.equals(user.getUserId())){
        session.setAttribute("myUser", user);
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
    @RequestMapping("getFollowing/{userNo}")
    public @ResponseBody List<User> getFollowing(@PathVariable int userNo , Model model)throws Exception{
      
      List<User> followingList=userService.getFollowing(userNo);
      System.out.println("이 사람이 팔로잉 한 사람들은 누구누구???"+followingList);
      
      
      return followingList;
       
    }
    
    @RequestMapping("getFollower/{userNo}")
    public @ResponseBody List<User> getFollower(@PathVariable int userNo , Model model)throws Exception{
      
      List<User> followerList=userService.getFollower(userNo);
      System.out.println("이 사람을 팔로워 한 사람들은 누구누구???"+followerList);
 
      
      return followerList;
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
      public void addFollow(@RequestParam("userNo") int userNo,@RequestParam("followNo") int followNo,Model model,
                                @RequestParam("followId") String followId,HttpSession session) throws Exception{
      
        Activity activity=new Activity();
        activity.setUserNo(userNo);
        User user=userService.getUser(followId);
        User user1 = (User)session.getAttribute("myUser");
        Alram alram = new Alram();
        alram.setUserNO(followNo);
        alram.setSendId(user1.getUserId());
        alram.setText("팔로우 하였습니다.");
        userService.addAlram(alram);
       
        if(userService.followOk(userNo, followNo)){
            userService.addFollow(userNo, followNo);
            model.addAttribute("followOk","insert");
            model.addAttribute("followCount",userService.getFollwerCount(followNo));
            System.out.println(userNo);
            
            activity.setActivityText(user.getUserName()+"님을 팔로잉 하셨습니다.");
            
        }else{
            userService.removeFollower(userNo, followNo);
            model.addAttribute("followOk","remove");
            model.addAttribute("followCount",userService.getFollwerCount(followNo));
            
            activity.setActivityText(user.getUserName()+"님을 팔로잉 해제 하셨습니다.");
        }
        userService.setActivity(activity);
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
        User user=(User)session.getAttribute("myUser");
        int userNo=user.getUserNo();
        
        List<Activity> activityList =userService.getActivity(userNo);
       
        
        System.out.println("액티비티 리스트 불러왔나 확인해바랏~~!!!!!!!!!!");
        model.addAttribute("user", user);
        model.addAttribute("activity", activityList);
        
        return "forward:/user/MyActivity.jsp";
      }
      
      @RequestMapping("setActivity")
      public void setActivity(Activity activity)throws Exception{
        
          userService.setActivity(activity);
 
        
      }
      @RequestMapping("myTravel")
      public String travelPage(HttpSession session, Model model)throws Exception{
        
        System.out.println("login 객체 가지고 가야지!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        User user=(User)session.getAttribute("myUser");
        //int userNo=user.getUserNo();
        
        model.addAttribute("targetUser", user);
        
        return "forward:/user/profile.jsp";
      }
      
      @RequestMapping("removeActivity")
      public void removeActivity(@RequestParam("activityNo") int activityNo , HttpSession session)throws Exception{
        
        
        userService.removeActivity(activityNo);
        
      }
      
      @RequestMapping("moveChat")
      public String moveChat(HttpSession session,Model model)throws Exception{
        
        int userNo=((User)session.getAttribute("myUser")).getUserNo();
        List<User> userList =userService.getAllFollower(userNo);
        model.addAttribute("userList",userList);
        return "forward:/chat/chat.jsp";
        
      }
      
      @RequestMapping("aaaa")
      public String aaaa(HttpSession session,Model model)throws Exception{
        
        int userNo=((User)session.getAttribute("myUser")).getUserNo();
        List<User> userList =userService.getAllFollower(userNo);
        model.addAttribute("userList",userList);
        return "forward:/NewFile2.jsp";
        
      }
      
      
      @RequestMapping( value="insertMsg", method=RequestMethod.POST )
      public void insertMsg(@RequestBody Chat chat,
                            HttpSession session,
                            Model model) throws Exception{
      
              System.out.println("chat들어옴"+chat);
              userService.insertMsg(chat);
       }
      
      @RequestMapping( value="getMsg/{roomNo}", method=RequestMethod.POST )
      public void getMsg(@PathVariable String roomNo,
                            HttpSession session,
                            Model model) throws Exception{
      
              System.out.println("chat들어옴"+roomNo);
              List<Chat> chatList =userService.gettMsg(roomNo);
              System.out.println("chat들어옴"+chatList);
              model.addAttribute("chatList",chatList);
              
       }



      
      
      /*@RequestMapping("firstActivity")
      public void firstActivity(HttpSession session)throws Exception{
        
        userService.firstActivity();
        
        User user=(User)session.getAttribute("myUser");
        
        Activity activity=new Activity();
        activity.setUserNo(user.getUserNo());
        activity.setActivityText(user.getUserName()+"님의 회원가입을 환영합니다. 새로운 추억을 만들어가세요~");
        userService.setActivity(activity);
      }*/
      
      @RequestMapping( value="updateAlramCount" )
      public void mgAlramcount(HttpSession seseion) throws Exception{

           User user =(User)seseion.getAttribute("myUser");
           userService.updateAlram(user);
           
      }
      
      
      
     
      

}
