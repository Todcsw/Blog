package com.csw.service;

import com.csw.entity.Blog;
import com.csw.entity.Tag;

import java.sql.SQLException;
import java.util.List;

/**
 * @Auther: 行路
 * @Date: Created on 2020/6/8 12:57 星期一
 * @Description: com.csw.service
 * @version: 1.0
 */
public interface TagService {
    public int selAllTagCount() throws SQLException;

    public int insTag(Tag tag) throws Exception;

    public int delTag(int id) throws Exception;

    public List<Tag> selAllTag() throws Exception;

    //分页查询
    public List<Tag> selTagByPage(int currentPage, int pageCount) throws Exception;


}
