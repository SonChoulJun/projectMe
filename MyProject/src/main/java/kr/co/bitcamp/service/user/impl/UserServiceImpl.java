package kr.co.bitcamp.service.user.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.bitcamp.service.user.UserDao;
import kr.co.bitcamp.service.user.UserService;

@Service
public class UserServiceImpl implements UserService {
    
    @Autowired
    @Qualifier("userDaoImpl")
    private UserDao userDAO;

    
    
    public UserServiceImpl() {
        super();
        System.out.println("UserServiceImpl  생성");
        // TODO Auto-generated constructor stub
    }


    public void setUserDAO(UserDao userDAO) {
        this.userDAO = userDAO;
    }
    
    
}
