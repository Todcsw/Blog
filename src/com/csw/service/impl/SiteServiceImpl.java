package com.csw.service.impl;

import com.csw.dao.SiteDao;
import com.csw.dao.impl.SiteDaoImpl;
import com.csw.entity.Site;
import com.csw.service.SiteService;

/**
 * @Auther: 行路
 * @Date: Created on 2020/6/8 14:29 星期一
 * @Description: com.csw.service.impl
 * @version: 1.0
 */
public class SiteServiceImpl implements SiteService {

    SiteDao siteDao=new SiteDaoImpl();

    @Override
    public Site selSite() throws Exception {
        return siteDao.selSite();
    }

    @Override
    public int updSite(Site site) throws Exception {
        return siteDao.updSite(site);
    }

    @Override
    public int insSite(Site site) throws Exception {
        return siteDao.insSite(site);
    }
}
