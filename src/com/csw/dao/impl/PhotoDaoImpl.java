package com.csw.dao.impl;

import cn.hutool.db.Db;
import com.csw.dao.PhotoDao;
import com.csw.entity.Photo;
import com.csw.util.DBUtil;

import java.sql.ResultSet;

/**
 * @Auther: 行路
 * @Date: Created on 2020/6/9 9:56 星期二
 * @Description: com.csw.dao.impl
 * @version: 1.0
 * Copyright(c)2020-2025 陈圣文 All rights reserved.
 */
public class PhotoDaoImpl implements PhotoDao {

    /**
     *新增图片的配置信息
     * @param photo
     * @return 成功返回1，失败返回0
     * @throws Exception
     */
    @Override
    public int insPhoto(Photo photo) throws Exception {
        int i=0;
        String sql="insert into photo values(default,?,?,?,?,?)";
        Object[] object=new Object[]{photo.getLinkPhoto(),photo.getAboutPhoto(),photo.getTagPhoto(),photo.getIndexPhoto(),photo.getCatalogPhoto()};
        i = DBUtil.executeUpdate(sql, object);
        DBUtil.closeAll();
        return i;
    }

    /**
     * 更新图片的配置信息
     * @param photo
     * @return 成功返回1，失败返回0
     * @throws Exception
     */
    @Override
    public int updPhoto(Photo photo) throws Exception {
        int i=0;
        String sql="update photo set linkPhoto=?,aboutPhoto=?,tagPhoto=?,indexPhoto=?,categoryPhoto=? where id=?";
        Object[] object=new Object[]{photo.getLinkPhoto(),photo.getAboutPhoto(),photo.getTagPhoto(),photo.getIndexPhoto(),photo.getCatalogPhoto(),photo.getId()};
        i=DBUtil.executeUpdate(sql,object);
        DBUtil.closeAll();
        return i;
    }

    /**
     * 查询图片配置信息,根据id
     * @param id
     * @return
     * @throws Exception
     */
    @Override
    public Photo selPhoto(int id) throws Exception {
        Photo photo=null;
        String sql="select * from photo where id=?";
        ResultSet resultSet = DBUtil.executeQuery(sql, new Object[]{id});
        while (resultSet.next()){
            photo=new Photo();
            photo.setAboutPhoto(resultSet.getString("aboutPhoto"));
            photo.setLinkPhoto(resultSet.getString("linkPhoto"));
            photo.setTagPhoto(resultSet.getString("tagPhoto"));
            photo.setCatalogPhoto(resultSet.getString("categoryPhoto"));
            photo.setIndexPhoto(resultSet.getString("indexPhoto"));
        }
        DBUtil.closeAll();
        resultSet.close();
        return photo;
    }
}
