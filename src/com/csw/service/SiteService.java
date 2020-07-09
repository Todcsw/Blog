package com.csw.service;

import com.csw.entity.Site;

/**
 * @Auther: 行路
 * @Date: Created on 2020/6/8 14:28 星期一
 * @Description: com.csw.service
 * @version: 1.0
 */
public interface SiteService {

    public Site selSite() throws  Exception;

    public int updSite(Site site)throws  Exception;

    public int insSite(Site site) throws Exception;
}
