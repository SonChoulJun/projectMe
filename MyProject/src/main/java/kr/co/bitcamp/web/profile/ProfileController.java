package kr.co.bitcamp.web.profile;

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
    public String mainProfile(HttpSession session,Model model) throws Exception{
        User user = (User)session.getAttribute("user");
        int userNo =user.getUserNo();
        System.out.println(user);
        model.addAttribute("targetUser",user);
        List<PhotoFolder> photoFolder = boardService.getSideBar(userNo);
        System.out.println("asdasdsasad"+photoFolder);
        try{
            model.addAttribute("folderList", photoFolder);
            model.addAttribute("getFollwerCount",userService.getFollwerCount(userNo));
            model.addAttribute("getFollwingCount",userService.getFollwingCount(userNo));
        }catch (Exception e) {
            e.getMessage();
        }
        return "forward:/profile.jsp";
    }
    
    
    

}
