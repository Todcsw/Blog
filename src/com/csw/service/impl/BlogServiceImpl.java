package com.csw.service.impl;

import com.csw.dao.BlogDao;
import com.csw.dao.impl.BlogDaoImpl;
import com.csw.entity.Blog;
import com.csw.service.BlogService;

import java.util.Date;
import java.util.List;

/**
 * @Auther: 行路
 * @Date: Created on 2020/6/8 12:55 星期一
 * @Description: com.csw.service.impl
 * @version: 1.0
 */
public class BlogServiceImpl implements BlogService  {

    BlogDao blogDao=new BlogDaoImpl();

    @Override
    public int selAllBlogCount() throws Exception{
        return blogDao.selAllBlogCount();
    }

    @Override
    public List<Blog> selAllBlog() throws Exception {
        return blogDao.selAllBlog();
    }

    @Override
    public int insBlog(Blog blog) throws Exception {
        return blogDao.insBlog(blog);
    }

    @Override
    public int delBlog(int id) throws Exception {
        return blogDao.delBlog(id);
    }

    @Override
    public int updBlog(Blog blog) throws Exception {
        return blogDao.updBlog(blog);
    }

    @Override
    public Blog selBlogById(int id) throws Exception {
        return blogDao.selBlogById(id);
    }

    @Override
    public List<Blog> selRightBlog() throws Exception {
        return blogDao.selRightBlog();
    }

    @Override
    public List<Blog> selBlogPrevNext(Date time) throws Exception {
        return blogDao.selBlogPrevNext(time);
    }

    @Override
    public List<Blog> selBlogByTagName(String tagName) throws Exception {
        return blogDao.selBlogByTagName(tagName);
    }

    @Override
    public List<Blog> selBlogByCategoryName(String Category) throws Exception {
        return blogDao.selBlogByCategoryName(Category);
    }

    @Override
    public List<Blog> selBlogByPage(int currentPage, int pageCount) throws Exception {
        return blogDao.selBlogByPage(currentPage,pageCount);
    }
}
