package kr.co.bitcamp.common.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.bitcamp.service.domain.User;




public class LogonCheckInterceptor extends HandlerInterceptorAdapter {

	///Field
	
	///Constructor
	public LogonCheckInterceptor(){
		System.out.println("\nCommon :: "+this.getClass()+"\n");		
	}
	
	///Method
	public boolean preHandle(	HttpServletRequest request,
														HttpServletResponse response, 
														Object handler) throws Exception {
	  
	  System.out.println("\n[LogonCheckInterceptor start..........");
    
    HttpSession session=request.getSession(true);
    User sessionUser=null;
    if((sessionUser=(User)session.getAttribute("sessionUser"))==null){
      sessionUser=new User();
    }
    
    if(sessionUser.isActivity()){
      String uri=request.getRequestURI();
      if(uri.indexOf("logonAction")!=-1||uri.indexOf("logon")!=-1){
        request.getRequestDispatcher("/user/home.jsp").forward(request, response);
        System.out.println("[로그인 상태..로그인 후 불필요한 요구....]");
        System.out.println("[LogonCheckInterceptor end......]\n");
        return false;
      }
      System.out.println("[로그인 상태...]");
      System.out.println("[LogonCheckInterceptor end.........]\n");
      return true;
    }else{
      String uri=request.getRequestURI();
      if(uri.indexOf("logonAction")!=-1||uri.indexOf("logon")!=-1){
        System.out.println("[로그 시도 상태.....]");
        System.out.println("[LogonCheckInterceptor end.......]\n");
        return true;
      }
      
      request.getRequestDispatcher("/user/logon.jsp").forward(request, response);
      System.out.println("[로그인 이전...]");
      System.out.println("[LogonCheckInterceptor end...........]");
      return false;
    }
		
	   
	}
}//end of class