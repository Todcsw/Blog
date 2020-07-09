package com.csw.service;

import com.csw.entity.User;

/**
 * @Auther: 行路
 * @Date: Created on 2020/6/10 20:09 星期三
 * @Description: com.csw.service
 * @version: 1.0
 */
public interface UserService {

    public int selUserByAccount(String account) throws  Exception;

    public User Login(String account,String password) throws Exception;

    public int register(User user)throws Exception;

    public User findPassword(User user) throws Exception;

    public String findProblem(String account) throws Exception;

    public int updUser(User user) throws  Exception;

    public int updPassword(String account,String password,String newPassword) throws  Exception;


}
