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
import kr.co.bitcamp.service.domain.User;
import kr.co.bitcamp.service.user.UserService;

import kr.co.bitcamp.service.user.impl.UserServiceImpl;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/context-aspect.xml",
                                    "classpath:config/context-common.xml",  
                                    "classpath:config/context-mybatis.xml",  
                                    "classpath:config/context-transaction.xml",  
})
public class UserServiceTest {

  // ==>@RunWith,@ContextConfiguration �̿� Wiring, Test �� instance DI
  @Autowired
  @Qualifier("userServiceImpl")
  private UserService userService;

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

  @Test
  public void testGetActivity() throws Exception{
    System.out.println("getActivity() 실행 했냡ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ");
    
    String userId="jw688@naver.com";
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
	  
//	  List<Alram> alram=userService.getAlram(10000);
//	  System.out.println("일단 불러왔어");
//	  System.out.println(alram);
//	  ((Alram) alram).setAlramNo(40000);
//	  ((Alram) alram).setSendId("123123");
//	  ((Alram) alram).setText("123123");
//	  
//	  List<Alram> alram01=userService.getAlram(10000);
//	  System.out.println("빠귀었니?");
//	  System.out.println(alram01);
	  
  }

  /*
   * @Test public void testAddUser() throws Exception {
   * 
   * User user = new User(); user.setUserId("testUserId2");
   * user.setUserName("testUserName"); user.setPassword("testPasswd");
   * user.setSsn("1111112222222"); user.setPhone("111-2222-3333");
   * user.setAddr("��⵵"); user.setEmail("test@test.com");
   * 
   * userService.addUser(user);
   * 
   * user = userService.getUser("testUserId2");
   * 
   * //==> console Ȯ�� //System.out.println(user);
   * 
   * //==> API Ȯ��
   * 
   * Assert.assertEquals("testUserId2", user.getUserId());
   * Assert.assertEquals("testUserName", user.getUserName());
   * Assert.assertEquals("testPasswd", user.getPassword());
   * Assert.assertEquals("111-2222-3333", user.getPhone());
   * Assert.assertEquals("��⵵", user.getAddr());
   * Assert.assertEquals("test@test.com", user.getEmail()); }
   */

  // @Test
  /*
   * public void testGetUser() throws Exception {
   * 
   * User user = new User(); //==> �ʿ��ϴٸ�... // user.setUserId("testUserId");
   * // user.setUserName("testUserName"); // user.setPassword("testPasswd"); //
   * user.setSsn("1111112222222"); // user.setPhone("111-2222-3333"); //
   * user.setAddr("��⵵"); // user.setEmail("test@test.com");
   * 
   * user = userService.getUser("testUserId");
   * 
   * //==> console Ȯ�� //System.out.println(user);
   * 
   * //==> API Ȯ�� Assert.assertEquals("testUserId", user.getUserId());
   * Assert.assertEquals("testUserName", user.getUserName());
   * Assert.assertEquals("testPasswd", user.getPassword());
   * Assert.assertEquals("111-2222-3333", user.getPhone());
   * Assert.assertEquals("��⵵", user.getAddr());
   * Assert.assertEquals("test@test.com", user.getEmail());
   * 
   * Assert.assertNotNull(userService.getUser("user02"));
   * Assert.assertNotNull(userService.getUser("user05")); }
   * 
   * //@Test public void testUpdateUser() throws Exception{
   * 
   * User user = userService.getUser("testUserId"); Assert.assertNotNull(user);
   * 
   * Assert.assertEquals("testUserName", user.getUserName());
   * Assert.assertEquals("111-2222-3333", user.getPhone());
   * Assert.assertEquals("��⵵", user.getAddr());
   * Assert.assertEquals("test@test.com", user.getEmail());
   * 
   * user.setUserName("change"); user.setPhone("777-7777-7777");
   * user.setAddr("change"); user.setEmail("change@change.com");
   * 
   * userService.updateUser(user);
   * 
   * user = userService.getUser("testUserId"); Assert.assertNotNull(user);
   * 
   * //==> console Ȯ�� //System.out.println(user);
   * 
   * //==> API Ȯ�� Assert.assertEquals("change", user.getUserName());
   * Assert.assertEquals("777-7777-7777", user.getPhone());
   * Assert.assertEquals("change", user.getAddr());
   * Assert.assertEquals("change@change.com", user.getEmail()); }
   * 
   * //@Test public void testCheckDuplication() throws Exception{
   * 
   * //==> �ʿ��ϴٸ�... // User user = new User(); //
   * user.setUserId("testUserId"); // user.setUserName("testUserName"); //
   * user.setPassword("testPasswd"); // user.setSsn("1111112222222"); //
   * user.setPhone("111-2222-3333"); // user.setAddr("��⵵"); //
   * user.setEmail("test@test.com"); // // userService.addUser(user);
   * 
   * //==> console Ȯ��
   * //System.out.println(userService.checkDuplication("testUserId"));
   * //System.out.println(userService.checkDuplication("testUserId"+System.
   * currentTimeMillis()) );
   * 
   * //==> API Ȯ�� Assert.assertFalse(
   * userService.checkDuplication("testUserId") ); Assert.assertTrue(
   * userService.checkDuplication("testUserId"+System.currentTimeMillis()) );
   * 
   * }
   * 
   * //==> �ּ��� Ǯ�� �����ϸ�.... //@Test public void testGetUserListAll() throws
   * Exception{
   * 
   * Search search = new Search(); search.setCurrentPage(1);
   * search.setPageSize(3); Map<String,Object> map =
   * userService.getUserList(search);
   * 
   * List<Object> list = (List<Object>)map.get("list"); Assert.assertEquals(3,
   * list.size());
   * 
   * //==> console Ȯ�� //System.out.println(list);
   * 
   * Integer totalCount = (Integer)map.get("totalCount");
   * System.out.println(totalCount);
   * 
   * System.out.println("=======================================");
   * 
   * search.setCurrentPage(1); search.setPageSize(3);
   * search.setSearchCondition("0"); search.setSearchKeyword(""); map =
   * userService.getUserList(search);
   * 
   * list = (List<Object>)map.get("list"); Assert.assertEquals(3, list.size());
   * 
   * //==> console Ȯ�� //System.out.println(list);
   * 
   * totalCount = (Integer)map.get("totalCount");
   * System.out.println(totalCount); }
   * 
   * //@Test public void testGetUserListByUserId() throws Exception{
   * 
   * Search search = new Search(); search.setCurrentPage(1);
   * search.setPageSize(3); search.setSearchCondition("0");
   * search.setSearchKeyword("admin"); Map<String,Object> map =
   * userService.getUserList(search);
   * 
   * List<Object> list = (List<Object>)map.get("list"); Assert.assertEquals(1,
   * list.size());
   * 
   * //==> console Ȯ�� //System.out.println(list);
   * 
   * Integer totalCount = (Integer)map.get("totalCount");
   * System.out.println(totalCount);
   * 
   * System.out.println("=======================================");
   * 
   * search.setSearchCondition("0");
   * search.setSearchKeyword(""+System.currentTimeMillis()); map =
   * userService.getUserList(search);
   * 
   * list = (List<Object>)map.get("list"); Assert.assertEquals(0, list.size());
   * 
   * //==> console Ȯ�� //System.out.println(list);
   * 
   * totalCount = (Integer)map.get("totalCount");
   * System.out.println(totalCount); }
   * 
   * @Test public void testGetUserListByUserName() throws Exception{
   * 
   * Search search = new Search(); search.setCurrentPage(1);
   * search.setPageSize(3); search.setSearchCondition("1");
   * search.setSearchKeyword("SCOTT"); Map<String,Object> map =
   * userService.getUserList(search);
   * 
   * List<Object> list = (List<Object>)map.get("list"); Assert.assertEquals(3,
   * list.size());
   * 
   * //==> console Ȯ�� System.out.println(list);
   * 
   * Integer totalCount = (Integer)map.get("totalCount");
   * System.out.println(totalCount);
   * 
   * System.out.println("=======================================");
   * 
   * search.setSearchCondition("1");
   * search.setSearchKeyword(""+System.currentTimeMillis()); map =
   * userService.getUserList(search);
   * 
   * list = (List<Object>)map.get("list"); Assert.assertEquals(0, list.size());
   * 
   * //==> console Ȯ�� System.out.println(list);
   * 
   * totalCount = (Integer)map.get("totalCount");
   * System.out.println(totalCount); }
   */}