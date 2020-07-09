package com.csw.service.impl;

import com.csw.dao.LinkDao;
import com.csw.dao.impl.LinkDaoImpl;
import com.csw.entity.Link;
import com.csw.service.LinkService;

import java.sql.SQLException;
import java.util.List;

/**
 * @Auther: 行路
 * @Date: Created on 2020/6/8 12:58 星期一
 * @Description: com.csw.service.impl
 * @version: 1.0
 */
public class LinkServiceImpl implements LinkService  {
    LinkDao linkDao=new LinkDaoImpl();

    @Override
    public int selAllLinkCount() throws SQLException {
        return linkDao.selAllLinkCount();
    }

    @Override
    public List<Link> selAllLink() throws Exception {
        return linkDao.selAllLink();
    }

    @Override
    public int insLink(Link link) throws Exception {
        return linkDao.insLink(link);
    }

    @Override
    public int updLink(Link link) throws Exception {
        return linkDao.updLink(link);
    }

    @Override
    public int delLink(int id) throws Exception {
        return linkDao.delLink(id);
    }

    @Override
    public Link selLinkById(int id) throws Exception {
        return linkDao.selLinkById(id);
    }

    @Override
    public List<Link> selLinkByPage(int currentPage, int pageCount) throws Exception {
        return linkDao.selLinkByPage(currentPage,pageCount);
    }
}
