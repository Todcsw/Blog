package com.csw.service.impl;

import com.csw.dao.CategoryDao;
import com.csw.dao.impl.CategoryDaoImpl;
import com.csw.domain.CategoryBlogCount;
import com.csw.entity.Category;
import com.csw.service.CategoryService;

import java.sql.SQLException;
import java.util.List;

/**
 * @Auther: 行路
 * @Date: Created on 2020/6/8 12:58 星期一
 * @Description: com.csw.service.impl
 * @version: 1.0
 */
public class CategoryServiceImpl  implements CategoryService {
    CategoryDao categoryDao=new CategoryDaoImpl();

    @Override
    public int selAllCategoryCount() throws SQLException {
        return categoryDao.selAllCategoryCount();
    }

    @Override
    public List<Category> selAllCategory() throws Exception {
        return categoryDao.selAllCategory();
    }

    @Override
    public int insCategory(Category category) throws Exception {
        return categoryDao.insCategory(category);
    }

    @Override
    public int delCategory(int id) throws Exception {
        return categoryDao.delCategory(id);
    }

    @Override
    public int updCategory(Category category) throws Exception {
        return categoryDao.updCategory(category);
    }

    @Override
    public Category selCategoryById(int id) throws Exception {
        return categoryDao.selCategoryById(id);
    }

    @Override
    public List<CategoryBlogCount> selCategoryBlogCount() throws Exception {
        return categoryDao.selCategoryBlogCount();
    }

    @Override
    public List<Category> selCategoryByPage(int currentPage, int pageCount) throws Exception {
        return categoryDao.selCategoryByPage(currentPage,pageCount);
    }
}
