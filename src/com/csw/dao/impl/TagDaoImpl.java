package com.csw.dao.impl;

import cn.hutool.core.date.CalendarUtil;
import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUnit;
import cn.hutool.db.DbUtil;
import com.csw.dao.TagDao;
import com.csw.entity.Blog;
import com.csw.entity.Tag;
import com.csw.util.DBUtil;
import sun.util.resources.cldr.CalendarData;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @Auther: 行路
 * @Date: Created on 2020/6/8 12:51 星期一
 * @Description: com.csw.dao.impl
 * @version: 1.0
 * Copyright(c)2020-2025 陈圣文 All rights reserved.
 */
public class TagDaoImpl implements TagDao {


    /**
     * 查询所有标签的数量
     * @return
     * @throws SQLException
     */
    @Override
    public int selAllTagCount() throws SQLException {
        ResultSet rs=null;
        int count=0;
        try {
            String sql="select count(id) from tag where deleted=0;";
            rs= DBUtil.executeQuery(sql);
            while (rs.next()){
                count=rs.getInt(1);
            }
        }catch (Exception e){
            throw e;
        }finally {
            try {
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {
                throw e;
            }
            DBUtil.closeAll();
        }
        return count;
    }

    /**
     * 新增标签的数量
     * @param tag
     * @return 成功返回1，失败返回0
     * @throws Exception
     */
    @Override
    public int insTag(Tag tag) throws Exception {
        int i=0;
        ResultSet resultSet = DBUtil.executeQuery("select * from tag where name=?", new Object[]{tag.getName()});

        if(resultSet.next()){
            System.out.println("next");
             i = DBUtil.executeUpdate("update tag set deleted=0,createTime=? where name=?", new Object[]{DateTime.now(), tag.getName()});
        }else{
            String sql="insert into tag values(default,?,0,?)";
            i= DBUtil.executeUpdate(sql, new Object[]{tag.getName(), tag.getCreateTime()});
        }
        DBUtil.closeAll();
        return i;
    }

    /**
     * 查询所有的标签
     * @return
     * @throws Exception
     */
    @Override
    public List<Tag> selAllTag() throws Exception {
        List<Tag> list=new ArrayList<>();
        Tag tag=null;
        String sql="select * from tag where deleted=0 order by createTime desc ;";
        ResultSet resultSet = DBUtil.executeQuery(sql);
        while (resultSet.next()){
            tag=new Tag(Integer.parseInt(resultSet.getString("id")),resultSet.getString("name"),
                    Integer.parseInt(resultSet.getString("deleted")),  DateTime.of(resultSet.getString("createTime"),"yyyy-MM-dd HH:mm:ss"));
            list.add(tag);
        }
        DBUtil.closeAll();
        resultSet.close();
        return list;
    }

    /**
     * 删除标签根据标签的id
     * @param id
     * @return 成功返回1，失败返回0
     * @throws Exception
     */
    @Override
    public int delTag(int id) throws Exception {
        int i=0;
        String sql="update tag set deleted=1 where id=? ";
        i=DBUtil.executeUpdate(sql,new Object[]{id});
        DBUtil.closeAll();
        return i;
    }

    /**
     * 查询所有的标签进行分页
     * @param currentPage 当前页
     * @param pageCount 每页的数量
     * @return
     * @throws Exception
     */
    @Override
    public List<Tag> selTagByPage(int currentPage, int pageCount) throws Exception {
        Tag tag=null;
        List<Tag>  list=new ArrayList<>();
        String sql="SELECT * FROM tag where deleted=0 ORDER BY createTime desc LIMIT ?, ?";
        Object[] object=new Object[]{currentPage,pageCount};
        ResultSet resultSet = DBUtil.executeQuery(sql, object);
        while(resultSet.next()){
            tag=new Tag(Integer.parseInt(resultSet.getString("id")),resultSet.getString("name"),
                    Integer.parseInt(resultSet.getString("deleted")),  DateTime.of(resultSet.getString("createTime"),"yyyy-MM-dd HH:mm:ss"));
            list.add(tag);
        }
        DBUtil.closeAll();
        resultSet.close();
        return list;
    }


}
