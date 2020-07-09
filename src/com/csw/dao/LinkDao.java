package com.csw.dao;

import com.csw.entity.Link;
import com.csw.entity.Tag;

import java.sql.SQLException;
import java.util.List;

/**
 * @Auther: 行路
 * @Date: Created on 2020/6/8 10:57 星期一
 * @Description: com.csw.dao
 * @version: 1.0
 */
public interface LinkDao {
    /**
     * 查询友情链接总数
     * @return
     */
    public int selAllLinkCount() throws SQLException;

    public List<Link> selAllLink() throws Exception;

    public int insLink(Link link) throws Exception;

    public int updLink(Link link) throws Exception;

    public int delLink(int id) throws Exception;

    public Link selLinkById(int id) throws Exception;


    //分页查询
    public List<Link> selLinkByPage(int currentPage, int pageCount) throws Exception;
}
