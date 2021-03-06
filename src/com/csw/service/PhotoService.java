package com.csw.service;

import com.csw.entity.Photo;

/**
 * @Auther: 行路
 * @Date: Created on 2020/6/9 13:02 星期二
 * @Description: com.csw.service
 * @version: 1.0
 */
public interface PhotoService {

    public int insPhoto(Photo photo) throws Exception;

    public int updPhoto(Photo photo) throws Exception;

    public Photo selPhoto(int id) throws Exception;

}
