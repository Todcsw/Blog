package com.csw.dao.impl;

import cn.hutool.core.date.DateTime;
import com.csw.dao.BlogDao;
import com.csw.entity.Blog;
import com.csw.util.DBUtil;
import com.csw.util.MarkDownUtil;

import sun.applet.Main;

import java.sql.Array;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @Auther: 行路
 * @Date: Created on 2020/6/8 12:49 星期一
 * @Description: com.csw.dao.impl
 * @version: 1.0
 * Copyright(c)2020-2025 陈圣文 All rights reserved.
 */
public class BlogDaoImpl implements BlogDao  {


    /**
     * 查询博客通过目录名称
     * @param Category
     * @return
     * @throws Exception
     */
    @Override
    public List<Blog> selBlogByCategoryName(String Category) throws Exception {

        Blog blog=null;
        List<Blog>  list=new ArrayList<>();
        String sql1="select * from blog where catalog=? ORDER BY uploadTime desc;";

        Object[] object=new Object[]{Category};
        ResultSet resultSet1 = DBUtil.executeQuery(sql1, object);
        while(resultSet1.next()){
            blog=new Blog();
            blog.setId(Integer.parseInt(resultSet1.getString("id")));
            blog.setTitle(resultSet1.getString("title"));
            blog.setPhoto(resultSet1.getString("photo"));
            blog.setView(Integer.parseInt(resultSet1.getString("view")));
            blog.setTags(resultSet1.getString("tags"));
            blog.setCatalog(resultSet1.getString("catalog"));
            blog.setUpdateTime(DateTime.of(resultSet1.getString("updateTime"),"yyyy-MM-dd HH:mm:ss"));
            blog.setUploadTime(DateTime.of(resultSet1.getString("uploadTime"),"yyyy-MM-dd HH:mm:ss"));
            blog.setContent(resultSet1.getString("content"));
            list.add(blog);
        }
        DBUtil.closeAll();
        resultSet1.close();

        return list;
    }

    /**
     * 查询博客总数
     * @return
     * @throws SQLException
     */
    @Override
    public int selAllBlogCount() throws SQLException {
        ResultSet rs=null;
        int count=0;
        try {
            String sql="select count(id) from blog ;";
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
     * 查询所有博客内容
     * @return
     * @throws Exception
     */
    @Override
    public List<Blog> selAllBlog() throws Exception {
        List<Blog> list=new ArrayList<>();
        Blog blog=null;
        String sql="select * from blog ORDER BY uploadTime desc";
        ResultSet resultSet = DBUtil.executeQuery(sql);
        while (resultSet.next()){
            blog=new Blog();
            blog.setId(Integer.parseInt(resultSet.getString("id")));
            blog.setTitle(resultSet.getString("title"));
            blog.setPhoto(resultSet.getString("photo"));
            blog.setView(Integer.parseInt(resultSet.getString("view")));
            blog.setTags(resultSet.getString("tags"));
            blog.setCatalog(resultSet.getString("catalog"));
            blog.setUpdateTime(DateTime.of(resultSet.getString("updateTime"),"yyyy-MM-dd HH:mm:ss"));
            blog.setUploadTime(DateTime.of(resultSet.getString("uploadTime"),"yyyy-MM-dd HH:mm:ss"));
            blog.setContent(resultSet.getString("content"));
            list.add(blog);
        }
        DBUtil.closeAll();
        resultSet.close();

        return list;

    }

    /**
     * 增加博客
     * @param blog 博客对象
     * @return
     * @throws Exception
     */
    @Override
    public int insBlog(Blog blog) throws Exception {
        String sql="insert into blog values(default,?,?,?,?,?,?,?,?);";
        Object[] object=new Object[]{blog.getTitle(),blog.getPhoto(),blog.getView(),blog.getTags(),blog.getCatalog(),blog.getUploadTime(),blog.getContent(),blog.getUpdateTime()};
        int i=DBUtil.executeUpdate(sql,object);
        DBUtil.closeAll();
        return i;
    }

    /**
     * 删除博客根据博客id号
     * @param id 博客id号
     * @return
     * @throws Exception
     */
    @Override
    public int delBlog(int id) throws Exception {
        String sql="delete from blog where id=?";
        Object[] object=new Object[]{id};
        int i = DBUtil.executeUpdate(sql, object);
        DBUtil.closeAll();
        return i;
    }

    /**
     * 修改博客
     * @param blog
     * @return
     * @throws Exception
     */
    @Override
    public int updBlog(Blog blog) throws Exception {
        String sql="update blog set title=?,photo=?,view=?,tags=?,catalog=?,uploadTime=?,content=?,updateTime=? where id=?";
        Object[] object=new Object[]{
                blog.getTitle(),blog.getPhoto(),blog.getView(),blog.getTags(),
                blog.getCatalog(),blog.getUploadTime(),blog.getContent(),
                blog.getUpdateTime(),blog.getId()
        };
        int i = DBUtil.executeUpdate(sql, object);
        DBUtil.closeAll();
        return i;
    }

    /**
     * 查询博客根据博客Id号
     * @param id 博客id号
     * @return
     * @throws Exception
     */
    @Override
    public Blog selBlogById(int id) throws Exception {
        Blog blog=null;
        String sql="select * from blog where id=?";
        Object[] object=new Object[]{id};
        ResultSet resultSet = DBUtil.executeQuery(sql, object);
        while (resultSet.next()){
            blog=new Blog();
            blog.setId(id);
            blog.setTitle(resultSet.getString("title"));
            blog.setPhoto(resultSet.getString("photo"));
            blog.setView(Integer.parseInt(resultSet.getString("view")));
            blog.setTags(resultSet.getString("tags"));
            blog.setCatalog(resultSet.getString("catalog"));
            blog.setUpdateTime(DateTime.of(resultSet.getString("updateTime"),"yyyy-MM-dd HH:mm:ss"));
            blog.setUploadTime(DateTime.of(resultSet.getString("uploadTime"),"yyyy-MM-dd HH:mm:ss"));
            blog.setContent(resultSet.getString("content"));
        }
        DBUtil.closeAll();
        resultSet.close();
        return blog;
    }

    /**
     * 查询右边栏需要展示的最新5条数据,其实用上面查询所有的博客内容截取5条即可
     * @return
     * @throws Exception
     */
    @Override
    public List<Blog> selRightBlog() throws Exception {
        List<Blog> list=new ArrayList<>();
        Blog blog=null;
        String sql="select * from blog ORDER BY uploadTime desc limit 0,5;";
        ResultSet resultSet = DBUtil.executeQuery(sql);
        while (resultSet.next()){
            blog=new Blog();
            blog.setId(Integer.parseInt(resultSet.getString("id")));
            blog.setTitle(resultSet.getString("title"));
            blog.setPhoto(resultSet.getString("photo"));
            blog.setView(Integer.parseInt(resultSet.getString("view")));
            blog.setTags(resultSet.getString("tags"));
            blog.setCatalog(resultSet.getString("catalog"));
            blog.setUpdateTime(DateTime.of(resultSet.getString("updateTime"),"yyyy-MM-dd HH:mm:ss"));
            blog.setUploadTime(DateTime.of(resultSet.getString("uploadTime"),"yyyy-MM-dd HH:mm:ss"));
            blog.setContent(MarkDownUtil.mdToHtml(resultSet.getString("content")));
            list.add(blog);
        }
        DBUtil.closeAll();
        resultSet.close();
        return list;
    }

    /**
     * 根据博客发布时间,查询博客的上一篇和下一篇,存在list中
     * @param time
     * @return
     * @throws Exception
     */
    @Override
    public List<Blog> selBlogPrevNext(Date time) throws Exception {
        Blog blog=null;
        List<Blog>  list=new ArrayList<>();

        String sql1="select * from blog where uploadTime = (select uploadTime from blog where uploadTime > ? order by uploadTime asc limit 1);"; //上一条
        Object[] object=new Object[]{time};
        ResultSet resultSet1 = DBUtil.executeQuery(sql1, object);
        while(resultSet1.next()){
            blog=new Blog();
            blog.setId(Integer.parseInt(resultSet1.getString("id")));
            blog.setTitle(resultSet1.getString("title"));
            blog.setPhoto(resultSet1.getString("photo"));
            blog.setView(Integer.parseInt(resultSet1.getString("view")));
            blog.setTags(resultSet1.getString("tags"));
            blog.setCatalog(resultSet1.getString("catalog"));
            blog.setUpdateTime(DateTime.of(resultSet1.getString("updateTime"),"yyyy-MM-dd HH:mm:ss"));
            blog.setUploadTime(DateTime.of(resultSet1.getString("uploadTime"),"yyyy-MM-dd HH:mm:ss"));
            blog.setContent(resultSet1.getString("content"));
            list.add(blog);
        }
        DBUtil.closeAll();
        resultSet1.close();

        String sql2="select * from blog where uploadTime<? order by uploadTime desc limit 0,1;";//下一条
        ResultSet resultSet2 = DBUtil.executeQuery(sql2, object);
        while(resultSet2.next()){
            blog=new Blog();
            blog.setId(Integer.parseInt(resultSet2.getString("id")));
            blog.setTitle(resultSet2.getString("title"));
            blog.setPhoto(resultSet2.getString("photo"));
            blog.setView(Integer.parseInt(resultSet2.getString("view")));
            blog.setTags(resultSet2.getString("tags"));
            blog.setCatalog(resultSet2.getString("catalog"));
            blog.setUpdateTime(DateTime.of(resultSet2.getString("updateTime"),"yyyy-MM-dd HH:mm:ss"));
            blog.setUploadTime(DateTime.of(resultSet2.getString("uploadTime"),"yyyy-MM-dd HH:mm:ss"));
            blog.setContent(resultSet2.getString("content"));
            list.add(blog);
        }
        DBUtil.closeAll();
        resultSet2.close();

        return list;
    }

    /**
     * 查询博客根据标签名称
     * @param tagName 查询博客根据标签名称
     * @return
     * @throws Exception
     */
    @Override
    public List<Blog> selBlogByTagName(String tagName) throws Exception {
        Blog blog=null;
        List<Blog>  list=new ArrayList<>();
        String sql1="select * from blog where tags like ? ORDER BY uploadTime desc;";

        Object[] object=new Object[]{"%"+tagName+"%"};
        ResultSet resultSet1 = DBUtil.executeQuery(sql1, object);
        while(resultSet1.next()){
            blog=new Blog();
            blog.setId(Integer.parseInt(resultSet1.getString("id")));
            blog.setTitle(resultSet1.getString("title"));
            blog.setPhoto(resultSet1.getString("photo"));
            blog.setView(Integer.parseInt(resultSet1.getString("view")));
            blog.setTags(resultSet1.getString("tags"));
            blog.setCatalog(resultSet1.getString("catalog"));
            blog.setUpdateTime(DateTime.of(resultSet1.getString("updateTime"),"yyyy-MM-dd HH:mm:ss"));
            blog.setUploadTime(DateTime.of(resultSet1.getString("uploadTime"),"yyyy-MM-dd HH:mm:ss"));
            blog.setContent(resultSet1.getString("content"));
            list.add(blog);
        }
        DBUtil.closeAll();
        resultSet1.close();
        return list;
    }

    /**
     * 查询博客进行分页
     * @param currentPage 当前页
     * @param pageCount 每页的数量
     * @return
     * @throws Exception
     */
    @Override
    public List<Blog> selBlogByPage(int currentPage, int pageCount) throws Exception {
        Blog blog=null;
        List<Blog>  list=new ArrayList<>();
        String sql="SELECT * FROM blog ORDER BY uploadTime desc LIMIT ?, ?";
        Object[] object=new Object[]{currentPage,pageCount};
        ResultSet resultSet = DBUtil.executeQuery(sql, object);
        while(resultSet.next()){
            blog=new Blog();
            blog.setId(Integer.parseInt(resultSet.getString("id")));
            blog.setTitle(resultSet.getString("title"));
            blog.setPhoto(resultSet.getString("photo"));
            blog.setView(Integer.parseInt(resultSet.getString("view")));
            blog.setTags(resultSet.getString("tags"));
            blog.setCatalog(resultSet.getString("catalog"));
            blog.setUpdateTime(DateTime.of(resultSet.getString("updateTime"),"yyyy-MM-dd HH:mm:ss"));
            blog.setUploadTime(DateTime.of(resultSet.getString("uploadTime"),"yyyy-MM-dd HH:mm:ss"));
            blog.setContent(resultSet.getString("content"));
            list.add(blog);
        }
        DBUtil.closeAll();
        resultSet.close();
        return list;
    }
}
