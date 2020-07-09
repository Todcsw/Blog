package com.csw.dao.impl;

import com.csw.dao.InformationDao;
import com.csw.entity.Information;
import com.csw.entity.Site;
import com.csw.util.DBUtil;

import java.sql.ResultSet;

/**
 * @Auther: 行路
 * @Date: Created on 2020/6/8 15:10 星期一
 * @Description: com.csw.dao.impl
 * @version: 1.0
 * Copyright(c)2020-2025 陈圣文 All rights reserved.
 */
public class InformationDaoImpl implements InformationDao {

    /**
     * 查询右边栏的个人信息
     * @return
     * @throws Exception
     */
    @Override
    public Information selInformation() throws Exception {
        Information information = null;
        ResultSet rs = null;
        try {
            String sql = "select * from information";
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                information = new Information();
                information.setId(Integer.parseInt(rs.getString("id")));
                information.setPhoto(rs.getString("photo"));
                information.setEmail(rs.getString("email"));
                information.setSentence(rs.getString("sentence"));
                information.setGithub(rs.getString("github"));
                information.setName(rs.getString("name"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            rs.close();
            DBUtil.closeAll();
        }
        return information;
    }

    /**
     * 更新右边栏的个人信息
     * @param information
     * @return 成功返回1，失败返回0
     * @throws Exception
     */
    @Override
    public int updInformation(Information information) throws Exception {
        String sql="update information set photo=?,sentence=?,email=?,github=?,name=? where id=?";
        int i = DBUtil.executeUpdate(sql, new Object[]{information.getPhoto(), information.getSentence(), information.getEmail(), information.getGithub(),information.getName(), information.getId()});
        DBUtil.closeAll();
        return i;
    }

    /**
     * 新增右边栏的个人信息
     * @param information
     * @return 成功返回1，失败返回0
     * @throws Exception
     */
    @Override
    public int insInformation(Information information) throws Exception {
        int i=0;
        String sql="insert into information values(default,?,?,?,?,?)";
        Object[] object=new Object[]{information.getPhoto(),information.getSentence(),information.getEmail(),information.getGithub(),information.getName()};
        i = DBUtil.executeUpdate(sql, object);
        DBUtil.closeAll();
        return i;
    }
}

