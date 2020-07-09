package com.csw.dao;

import com.csw.entity.Blog;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

/**
 * @Auther: 行路
 * @Date: Created on 2020/6/8 11:04 星期一
 * @Description: com.csw.dao
 * @version: 1.0
 */
public interface BlogDao {
    /**
     * 查询博客总数
     * @return
     */
    public int selAllBlogCount() throws SQLException;


    public List<Blog> selAllBlog() throws Exception;


    public int insBlog(Blog blog) throws Exception;

    public int delBlog(int id) throws Exception;

    public int updBlog(Blog blog) throws Exception;

    public Blog selBlogById(int id)throws Exception;

    public List<Blog> selRightBlog() throws Exception;

    public List<Blog> selBlogPrevNext(Date time) throws Exception;

    public List<Blog> selBlogByTagName(String tagName) throws Exception;

    public List<Blog> selBlogByCategoryName(String Category) throws Exception;

    public List<Blog> selBlogByPage(int currentPage,int pageCount) throws Exception;


}
