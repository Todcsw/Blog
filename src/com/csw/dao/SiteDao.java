package com.csw.dao;

import com.csw.entity.Site;

/**
 * @Auther: 行路
 * @Date: Created on 2020/6/8 14:03 星期一
 * @Description: com.csw.dao
 * @version: 1.0
 */
public interface SiteDao {
    public Site selSite() throws  Exception;

    public int updSite(Site site)throws  Exception;

    public int insSite(Site site) throws Exception;
}
