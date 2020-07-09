package com.csw.dao;

import com.csw.entity.Blog;
import com.csw.entity.Tag;

import java.sql.SQLException;
import java.util.List;

/**
 * @Auther: 行路
 * @Date: Created on 2020/6/8 11:04 星期一
 * @Description: com.csw.dao
 * @version: 1.0
 */
public interface TagDao {
    /**
     * 查询标签的总数
     * @return
     */
    public int selAllTagCount() throws SQLException;

    /**
     * 新增标签
     * @param tag
     * @return
     * @throws Exception
     */
    public int insTag(Tag tag) throws Exception;

    /**
     * 查询所有标签
     * @return
     * @throws Exception
     */
    public List<Tag> selAllTag() throws Exception;

    /**
     * 删除标签
     * @param id
     * @return
     * @throws Exception
     */
    public int delTag(int id) throws Exception;


    //分页查询
    public List<Tag> selTagByPage(int currentPage, int pageCount) throws Exception;



}
