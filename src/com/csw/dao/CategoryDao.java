package com.csw.dao;

import com.csw.domain.CategoryBlogCount;
import com.csw.entity.Category;
import com.csw.entity.Tag;

import java.sql.SQLException;
import java.util.List;

/**
 * @Auther: 行路
 * @Date: Created on 2020/6/8 11:04 星期一
 * @Description: com.csw.dao
 * @version: 1.0
 */
public interface CategoryDao {
    /**
     * 查询友情链接总数
     * @return
     */
    public int selAllCategoryCount() throws SQLException;

    public List<Category> selAllCategory() throws  Exception;

    public int insCategory(Category category) throws  Exception;

    public int delCategory(int id) throws Exception;

    public int updCategory(Category category) throws Exception;

    public Category selCategoryById(int id) throws  Exception;

    public List<CategoryBlogCount> selCategoryBlogCount() throws Exception;

    //分页查询
    public List<Category> selCategoryByPage(int currentPage, int pageCount) throws Exception;


}
