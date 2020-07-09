package com.csw.dao.impl;

import com.csw.dao.DescriptionDao;
import com.csw.entity.Description;
import com.csw.util.DBUtil;

import java.sql.ResultSet;

/**
 * @Auther: 行路
 * @Date: Created on 2020/6/9 12:33 星期二
 * @Description: com.csw.dao.impl
 * @version: 1.0
 * Copyright(c)2020-2025 陈圣文 All rights reserved.
 */
public class DescriptionDaoImpl implements DescriptionDao {

    /**
     * 查询个人描述
     * @return
     * @throws Exception
     */
    @Override
    public Description selDescription() throws Exception {
        Description description=null;
        String sql="select * from description";
        ResultSet resultSet = DBUtil.executeQuery(sql);
        while (resultSet.next()){
            description=new Description();
            description.setId(Integer.parseInt(resultSet.getString("id")));
            description.setName(resultSet.getString("name"));
            description.setConstellation(resultSet.getString("constellation"));
            description.setExperience(resultSet.getString("experience"));
            description.setSentence(resultSet.getString("sentence"));
            description.setIdol(resultSet.getString("idol"));
            description.setCharacter(resultSet.getString("character1"));
            description.setContact(resultSet.getString("contact"));
            description.setInformation(resultSet.getString("information"));
            description.setLanguage(resultSet.getString("language"));
        }
        DBUtil.closeAll();
        resultSet.close();
        return description;
    }

    /**
     * 更新个人描述内容
     * @param description
     * @return 成功返回1，失败返回0
     * @throws Exception
     */
    @Override
    public int updDescription(Description description) throws Exception {
        int i=0;
        String sql="update description set name=?,constellation=?,experience=?,sentence=?,idol=?,character1=?,contact=?,information=?,language=?";
        Object[] object=new Object[]{
                description.getName(),
                description.getConstellation(),
                description.getExperience(),
                description.getSentence(),
                description.getIdol(),
                description.getCharacter(),
                description.getContact(),
                description.getInformation(),
                description.getLanguage()
        };

        i = DBUtil.executeUpdate(sql, object);
        DBUtil.closeAll();
        return i;
    }

    /**
     * 新增个人描述
     * @param description
     * @return 成功返回1，失败返回0
     * @throws Exception
     */
    @Override
    public int insDescription(Description description) throws Exception {
        int i=0;
        String sql="insert into description values(1,?,?,?,?,?,?,?,?,?)";
        Object[] object=new Object[]{
                description.getName(),
                description.getConstellation(),
                description.getExperience(),
                description.getSentence(),
                description.getIdol(),
                description.getCharacter(),
                description.getContact(),
                description.getInformation(),
                description.getLanguage()};
        i=DBUtil.executeUpdate(sql,object);
        DBUtil.closeAll();
        return i;
    }
}
