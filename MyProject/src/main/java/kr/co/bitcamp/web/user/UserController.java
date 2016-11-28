package kr.co.bitcamp.web.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.bitcamp.service.user.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {
    
/*    @Autowired
    @Qualifier("userServieImpl")
    private UserService userService;

    public UserController() {
        super();
        System.out.println("UserController 생성");
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }*/
    
    
    
    

}
