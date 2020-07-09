package com.csw.dao.impl;

import com.csw.dao.SiteDao;
import com.csw.entity.Description;
import com.csw.entity.Site;
import com.csw.util.DBUtil;

import java.sql.ResultSet;

/**
 * @Auther: 行路
 * @Date: Created on 2020/6/8 14:06 星期一
 * @Description: com.csw.dao.impl
 * @version: 1.0
 * Copyright(c)2020-2025 陈圣文 All rights reserved.
 */
public class SiteDaoImpl implements SiteDao {

    /**
     * 查询网站的配置信息
     * @return
     * @throws Exception
     */
    @Override
    public Site selSite() throws Exception {
        Site site = null;
        ResultSet rs=null;
        try {
            String sql="select * from site";
            rs = DBUtil.executeQuery(sql);
            while (rs.next()){
                site=new Site();
                site.setId(Integer.parseInt(rs.getString("id")));
                site.setName(rs.getString("name"));
                site.setDescription(rs.getString("description"));
                site.setFavicon(rs.getString("favicon"));
                site.setLogo(rs.getString("logo"));
                site.setNotice(rs.getString("notice"));
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            rs.close();
            DBUtil.closeAll();
        }
        return site;
    }

    /**
     * 更新网站的信息
     * @param site
     * @return 成功返回1，失败返回0
     * @throws Exception
     */
    @Override
    public int updSite(Site site) throws Exception {
        String sql="update site set name=? ,description=?,logo=?,favicon=?,notice=? where id=?";
        Object obj[]={site.getName(),site.getDescription(),site.getLogo(),site.getFavicon(),site.getNotice(),site.getId()};
        int i = DBUtil.executeUpdate(sql, obj);
        DBUtil.closeAll();
        return i;
    }

    /**
     * 新增网站的信息
     * @param site
     * @return 成功返回1，失败返回0
     * @throws Exception
     */
    @Override
    public int insSite(Site site) throws Exception {
        int i=0;
        String sql="insert into site values(?,default,?,?,?,?)";
        Object[] object=new Object[]{site.getName(),site.getDescription(),site.getLogo(),site.getFavicon(),site.getNotice()};
        i = DBUtil.executeUpdate(sql, object);
        DBUtil.closeAll();
        return i;
    }
}
