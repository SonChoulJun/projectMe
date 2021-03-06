package test;

import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import kr.co.bitcamp.service.domain.Activity;
import kr.co.bitcamp.service.domain.Alram;
import kr.co.bitcamp.service.domain.Comment;
import kr.co.bitcamp.service.domain.PhotoFolder;
import kr.co.bitcamp.service.domain.Photo;
import kr.co.bitcamp.service.domain.User;
import kr.co.bitcamp.service.mapBoard.MapBoardService;
import kr.co.bitcamp.service.user.UserService;

import kr.co.bitcamp.service.user.impl.UserServiceImpl;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/context-aspect.xml",
                                    "classpath:config/context-common.xml",  
                                    "classpath:config/context-mybatis.xml",  
                                    "classpath:config/context-transaction.xml"  
})
public class UserServiceTest {

  // ==>@RunWith,@ContextConfiguration �̿� Wiring, Test �� instance DI
  @Autowired
  @Qualifier("userServiceImpl")
  private UserService userService;
  
  @Autowired
  @Qualifier("mapBoardServiceImpl")
  private MapBoardService boardService;

  //@Test
  public void testAddUser() throws Exception {

    User user = new User();
    user.setUserId("123@123.123");
    user.setPassword("123123");

    boolean a = userService.removeUser(user);

    // ==> console Ȯ��
    System.out.println(a);
  }
  
  //@Test
    public void testGetUser() throws Exception{
      System.out.println("getUser 실행 되었냐!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
      User user=userService.getUser("krh2122@naver.com");
      System.out.println(user);
      
    }
  
  //@Test
    public void testUpdateUser() throws Exception{
      System.out.println("updateUser 실행 했냐!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"); 
      
     User user=userService.getUser("krh2122@naver.com");
     System.out.println("일단 불러왔어");
      System.out.println(user);
      user.setUserNo(10000);
      user.setUserName("cheoljune"); 
      user.setPhone("777-7777-7777");
      user.setPassword("456456");
    
          User user01=userService.updateUser(user);
      System.out.println("바뀌었니?");
      System.out.println(user01);
     
    }

  //@Test
    public void testGetActivity() throws Exception{
      System.out.println("getActivity() 실행 했냡ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ");
      
      String userId="krh2122@naver.com";
      User user=userService.getUser(userId);
      System.out.println("뭐먹징");
      List<Activity> listActivity = userService.getActivity(user.getUserNo());
      System.out.println(listActivity);
    }

  //@Test
    public void testGetAlram() throws Exception{
  	  	  
  	  System.out.println("getAlram 실행 했냐!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
  	  
  	  String userId="krh2122@naver.com";
  	  User user=userService.getUser(userId);
  	  System.out.println("dddddddddddd"+user);
  	  
  	  List<Alram> listAlram = userService.getAlram(user.getUserNo());
  	  System.out.println("뽑아줘제발"+listAlram);
  
    }
  
  //@Test
    public void testSetComment() throws Exception{
  	  
  	  System.out.println("SetCommen 실행 했냐!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
  	  
  	  String userId="krh2122@naver.com";
  	  User user=userService.getUser(userId);
  	  Comment comment = new Comment();
  	  comment.setText("택스트 드감? ㅇㅈ? ㅇ ㅇㅈ");
  	  comment.setUserId(user.getUserId());
  	  comment.setFolderNo(20000);
  	  boardService.setComment(comment);
    }

  //@Test
    public void testGetComment() throws Exception{
  	  	  
  	  System.out.println("getComment 실행 했냐!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
  	  
  	  String userId="krh2122@naver.com";
  	  User user=userService.getUser(userId);
  	  System.out.println("dddddddddddd"+user);
  	  
  	  List<Comment> listComment = boardService.getComment(user.getUserNo());
  	  System.out.println("뽑아줘제발"+listComment);
    }

  //@Test
    public void testUpdateComment() throws Exception{
      System.out.println("UpdateComment 실행 했냐!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
  	List<Comment> commentList = boardService.getComment(20000);
      System.out.println("일단 불러왔어");
      System.out.println(commentList);
      
      Comment comment = new Comment();
  	comment.setText("택스트 드감? ");
  	boardService.setComment(comment);
  	System.out.println(comment);
  
    }
  
  //@Test
    public void testGetFollowing() throws Exception{
      System.out.println("testGetFollowing start().............................................");
      int userNo=10000;
      List<User> list =userService.getFollowing(userNo);
      
      System.out.println("내가 팔로잉한 사람아 나와주세요~"+list);
    }
  
    //@Test
    public void testGetFollower() throws Exception{
      System.out.println("testGetFollower start().............................................");
      int userNo=10000;
      List<User> list =userService.getFollower(userNo);
      
      System.out.println("나를 팔로워한 사람아 나와주세요~"+list);
    }
    
    //@Test
    public void testSearchBoard() throws Exception{
      System.out.println("searchBoard start().................................");
      List<PhotoFolder> list=boardService.searchBoard("유럽여행");
      System.out.println("searchBoard end()................................."+list);
      
      System.out.println("사진 불러오기");
      System.out.println(list.get(0).getPhotoTheme().get(0).getPhotoList());
    }
    //@Test
    public void aaaa() throws Exception{
        Photo photo = new Photo();
        photo.setPhotoNo(10109);
        photo.setGpsH("128.02697096354166");
        photo.setGpsB("37.45708761844412");
        boardService.updateGSP(photo);
    }
    //@Test
    public void testLikeMember()throws Exception{
      List<User> list=boardService.getLikeMember(10152);
      System.out.println("like list불러와라 얍얍얍!!!"+list);
    }
   
 }
