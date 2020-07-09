package com.csw.service;

import com.csw.entity.Category;
import com.csw.entity.Link;

import java.sql.SQLException;
import java.util.List;

/**
 * @Auther: 行路
 * @Date: Created on 2020/6/8 12:57 星期一
 * @Description: com.csw.service
 * @version: 1.0
 */
public interface LinkService {
    public int selAllLinkCount() throws SQLException;

    public List<Link> selAllLink() throws Exception;

    public int insLink(Link link) throws Exception;

    public int updLink(Link link) throws Exception;

    public int delLink(int id) throws Exception;

    public Link selLinkById(int id) throws Exception;

    //分页查询
    public List<Link> selLinkByPage(int currentPage, int pageCount) throws Exception;
}
