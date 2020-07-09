package com.csw.dao.impl;

import cn.hutool.core.date.DateTime;
import cn.hutool.db.Db;
import com.csw.dao.CategoryDao;
import com.csw.domain.CategoryBlogCount;
import com.csw.entity.Blog;
import com.csw.entity.Category;
import com.csw.util.DBUtil;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @Auther: 行路
 * @Date: Created on 2020/6/8 12:52 星期一
 * @Description: com.csw.dao.impl
 * @version: 1.0
 * Copyright(c)2020-2025 陈圣文 All rights reserved.
 */
public class CategoryDaoImpl implements CategoryDao  {

    /**
     * 查询所有目录的数量
     * @return
     * @throws SQLException
     */
    @Override
    public int selAllCategoryCount() throws SQLException {
        ResultSet rs=null;
        int count=0;
        try {
            String sql="select count(id) from category;";
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
     * 查询所有的目录内容
     * @return
     * @throws Exception
     */
    @Override
    public List<Category> selAllCategory() throws Exception {
        List<Category> list=new ArrayList<>();
        Category category=null;
        String sql="select * from category ORDER BY createTime desc;";
        ResultSet resultSet = DBUtil.executeQuery(sql);
        while (resultSet.next()){
            category=new Category();
            category.setId(Integer.parseInt(resultSet.getString("id")));
            category.setName(resultSet.getString("name"));
            category.setCreateTime(DateTime.of(resultSet.getString("createTime"),"yyyy-MM-dd HH:mm:ss"));
            list.add(category);
        }
        DBUtil.closeAll();
        resultSet.close();
        return list;
    }

    /**
     * 新增目录
     * @param category
     * @return
     * @throws Exception
     */
    @Override
    public int insCategory(Category category) throws Exception {
        int i=0;
        String sql="insert into category values(default,?,?)";
        i = DBUtil.executeUpdate(sql, new Object[]{category.getName(), category.getCreateTime()});
        DBUtil.closeAll();
        return i;
    }

    /**
     * 删除目录根据id号
     * @param id
     * @return 成功返回1,失败返回0
     * @throws Exception
     */
    @Override
    public int delCategory(int id) throws Exception {
        int i=0;
        String sql="delete from category where id=?";
        i = DBUtil.executeUpdate(sql, new Object[]{id});
        DBUtil.closeAll();
        return i;
    }

    /**
     * 更新目录
     * @param category
     * @return 更新成功返回1，失败返回0
     * @throws Exception
     */
    @Override
    public int updCategory(Category category) throws Exception {
        int i=0;
        String sql="update category set name=? ,createTime=? where id=?";
        i = DBUtil.executeUpdate(sql, new Object[]{category.getName(), category.getCreateTime(),category.getId()});
        DBUtil.closeAll();
        return i;
    }

    /**
     * 查询目录根据目录的id
     * @param id
     * @return 返回目录
     * @throws Exception
     */
    @Override
    public Category selCategoryById(int id) throws Exception {
        Category category=null;
        String sql="select * from category where id=?";
        Object[] object=new Object[]{id};
        ResultSet resultSet = DBUtil.executeQuery(sql, object);
        while (resultSet.next()){
            category=new Category(id,resultSet.getString("name"),
                    DateTime.of(resultSet.getString("createTime"),"yyyy-MM-dd HH:mm:ss"));
        }
        DBUtil.closeAll();
        resultSet.close();
        return category;
    }

    /**
     * 查询目录的在博客中的数量
     * @return
     * @throws Exception
     */
    @Override
    public List<CategoryBlogCount> selCategoryBlogCount() throws Exception {
        List<CategoryBlogCount> list=new ArrayList<>();
        CategoryBlogCount categoryBlogCount=null;
        String sql="select catalog, count(blog.catalog) as count from blog GROUP BY blog.catalog;";
        ResultSet resultSet = DBUtil.executeQuery(sql);
        while (resultSet.next()){
            categoryBlogCount=new CategoryBlogCount();
            categoryBlogCount.setName(resultSet.getString("catalog"));
            categoryBlogCount.setCount(Integer.parseInt(resultSet.getString("count")));
            list.add(categoryBlogCount);
        }
        DBUtil.closeAll();
        resultSet.close();
        return list;
    }

    /**
     * 查询目录进行分页
     * @param currentPage 当前页
     * @param pageCount 每页数量
     * @return
     * @throws Exception
     */
    @Override
    public List<Category> selCategoryByPage(int currentPage, int pageCount) throws Exception {
        Category category=null;
        List<Category>  list=new ArrayList<>();
        String sql="SELECT * FROM category ORDER BY createTime desc LIMIT ?, ?";
        Object[] object=new Object[]{currentPage,pageCount};
        ResultSet resultSet = DBUtil.executeQuery(sql, object);
        while (resultSet.next()){
            category=new Category();
            category.setId(Integer.parseInt(resultSet.getString("id")));
            category.setName(resultSet.getString("name"));
            category.setCreateTime(DateTime.of(resultSet.getString("createTime"),"yyyy-MM-dd HH:mm:ss"));
            list.add(category);
        }
        DBUtil.closeAll();
        resultSet.close();
        return list;
    }
}
