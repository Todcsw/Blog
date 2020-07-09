package com.csw.dao;

import com.csw.entity.Photo;

/**
 * @Auther: 行路
 * @Date: Created on 2020/6/9 9:21 星期二
 * @Description: com.csw.dao
 * @version: 1.0
 */
public interface PhotoDao {
    public int insPhoto(Photo photo) throws Exception;

    public int updPhoto(Photo photo) throws Exception;

    public Photo selPhoto(int id) throws Exception;
}
