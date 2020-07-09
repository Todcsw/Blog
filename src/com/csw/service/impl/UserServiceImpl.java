package com.csw.service.impl;

import com.csw.dao.UserDao;
import com.csw.dao.impl.UserDaoImpl;
import com.csw.entity.User;
import com.csw.service.UserService;

/**
 * @Auther: 行路
 * @Date: Created on 2020/6/10 20:09 星期三
 * @Description: com.csw.service.impl
 * @version: 1.0
 */
public class UserServiceImpl implements UserService {

    UserDao userDao=new UserDaoImpl();

    @Override
    public int selUserByAccount(String account) throws Exception {
        return userDao.selUserByAccount(account);
    }

    @Override
    public User Login(String account, String password) throws Exception {
        return userDao.Login(account,password);
    }

    @Override
    public int register(User user) throws Exception {
        return userDao.register(user);
    }

    @Override
    public User findPassword(User user) throws Exception {
        return userDao.findPassword(user);
    }

    @Override
    public String findProblem(String account) throws Exception {
        return userDao.findProblem(account);
    }

    @Override
    public int updUser(User user) throws Exception {
        return userDao.updUser(user);
    }

    @Override
    public int updPassword(String account, String password, String newPassword) throws Exception {
        return userDao.updPassword(account,password,newPassword);
    }


}
