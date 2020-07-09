package com.csw.service.impl;

import com.csw.dao.TagDao;
import com.csw.dao.impl.TagDaoImpl;
import com.csw.entity.Blog;
import com.csw.entity.Tag;
import com.csw.service.TagService;

import java.sql.SQLException;
import java.util.List;

/**
 * @Auther: 行路
 * @Date: Created on 2020/6/8 12:58 星期一
 * @Description: com.csw.service.impl
 * @version: 1.0
 */
public class TagServiceImpl implements TagService {

    TagDao tagDao=new TagDaoImpl();

    @Override
    public int selAllTagCount() throws SQLException {
        return tagDao.selAllTagCount();
    }

    @Override
    public int insTag(Tag tag) throws Exception {
        return tagDao.insTag(tag);
    }

    @Override
    public int delTag(int id) throws Exception {
        return tagDao.delTag(id);
    }

    @Override
    public List<Tag> selAllTag() throws Exception {
        return tagDao.selAllTag();
    }

    @Override
    public List<Tag> selTagByPage(int currentPage, int pageCount) throws Exception {
        return tagDao.selTagByPage(currentPage,pageCount);
    }
}
