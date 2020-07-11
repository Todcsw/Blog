package com.csw.dao.impl;

import cn.hutool.core.date.DateTime;
import cn.hutool.db.Db;
import com.csw.dao.UserDao;
import com.csw.entity.User;
import com.csw.util.DBUtil;
import org.omg.CORBA.INITIALIZE;
import org.omg.CORBA.OBJ_ADAPTER;

import java.sql.ResultSet;

/**
 * @Auther: 行路
 * @Date: Created on 2020/6/10 18:42 星期三
 * @Description: com.csw.dao.impl
 * @version: 1.0
 * Copyright(c)2020-2025 陈圣文 All rights reserved.
 */
public class UserDaoImpl implements UserDao {

    /**
     * 查询用户是否存在根据账户名称
     * @param account
     * @return 存在返回1,不存在返回0
     * @throws Exception
     */
    @Override
    public int selUserByAccount(String account) throws Exception {
        String sql="select * from user where account=?";
        Object[] object=new Object[]{account};
        ResultSet resultSet = DBUtil.executeQuery(sql, object);
        if (resultSet.next()){
            return 1; //找到返回1,找不到返回0
        }
        DBUtil.closeAll();
        resultSet.close();
        return 0;
    }


    /**
     * 判断登录是否成功
     * @param account 账户名称
     * @param password 账户密码
     * @return
     * @throws Exception
     */
    @Override
    public User Login(String account, String password) throws Exception {
        User user=null;
        String sql="select * from user where account=? and password=?";
        Object[] object=new Object[]{account,password};
        ResultSet resultSet = DBUtil.executeQuery(sql,object);
        if(resultSet.next()){
            user=new User();
            user.setId(Integer.parseInt(resultSet.getString("id")));
            user.setAccount(resultSet.getString("account"));
            user.setPassword(resultSet.getString("password"));
            user.setProblem(resultSet.getString("problem"));
            user.setAnswer(resultSet.getString("answer"));
            user.setCreateTime(DateTime.of(resultSet.getString("createTime"),"yyyy-MM-dd HH:mm:ss"));
            user.setIdentify(resultSet.getString("identify"));
        }
        DBUtil.closeAll();
        resultSet.close();
        return user;
    }

    /**
     * 注册账户
     * @param user
     * @return 成功返回1，失败返回0
     * @throws Exception
     */
    @Override
    public int register(User user) throws Exception{
        int i=0;
        String sql="insert into user values(default,?,?,?,?,?,?)";
        Object[] object=new Object[]{user.getAccount(),user.getPassword(),user.getProblem(),user.getAnswer(),user.getCreateTime(),user.getIdentify()};
        i = DBUtil.executeUpdate(sql, object);
        DBUtil.closeAll();
        return i;
    }

    /**
     * 查找密码 根据用户的账户和密保答案
     * @param user
     * @return 找到返回用户信息,找不到返回null
     * @throws Exception
     */
    @Override
    public User findPassword(User user) throws Exception{
        User user1=null;
        String sql="select * from user where account=? and answer=?";
        Object[] object=new Object[]{user.getAccount(),user.getAnswer()};
        ResultSet resultSet = DBUtil.executeQuery(sql, object);
        while (resultSet.next()){
            user1=new User();
            user1.setId(Integer.parseInt(resultSet.getString("id")));
            user1.setAccount(resultSet.getString("account"));
            user1.setPassword(resultSet.getString("password"));
            user1.setProblem(resultSet.getString("problem"));
            user1.setAnswer(resultSet.getString("answer"));
            user1.setCreateTime(DateTime.of(resultSet.getString("createTime"),"yyyy-MM-dd HH:mm:ss"));
            user1.setIdentify(resultSet.getString("identify"));
        }
        resultSet.close();
        DBUtil.closeAll();
        return user1;
    }

    /**
     * 查找密保问题根据用户的账户
     * @param account
     * @return 成功返回密保问题,失败返回Null
     * @throws Exception
     */
    @Override
    public String findProblem(String account) throws Exception{
        String problem;
        String sql="select * from user where account=?";
        Object[] object=new Object[]{account};
        ResultSet resultSet = DBUtil.executeQuery(sql, object);
        if (resultSet.next()){
            problem=resultSet.getString("problem");
            return problem;
        }
        DBUtil.closeAll();
        resultSet.close();
        return "null";
    }

    /**
     * 更新用户信息
     * @param user
     * @return
     * @throws Exception
     */
    @Override
    public int updUser(User user) throws Exception {
        int i=0;
        String sql="update user set account=?,password=?,problem=?,answer=?,identify=? where id=?" ;
        Object[] object=new Object[]{user.getAccount(),user.getPassword(),user.getProblem(),user.getAnswer(),user.getIdentify(),user.getId()};
         i = DBUtil.executeUpdate(sql, object);
        DBUtil.closeAll();
         return i;
    }


    /**
     * 修改密码
     * @param account 账户密码
     * @param password 旧密码
     * @param newPassword 新密码
     * @return
     * @throws Exception
     */
    @Override
    public int updPassword(String account, String password, String newPassword) throws Exception {
       int i=0;
       String sql="update user set password=? where password=? and account=?";
       Object[] object=new Object[]{newPassword,password,account};
       i = DBUtil.executeUpdate(sql, object);
       DBUtil.closeAll();
       return i;
    }
}
