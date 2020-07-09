package com.csw.service.impl;

import com.csw.dao.PhotoDao;
import com.csw.dao.impl.PhotoDaoImpl;
import com.csw.entity.Photo;
import com.csw.service.PhotoService;

/**
 * @Auther: 行路
 * @Date: Created on 2020/6/9 13:02 星期二
 * @Description: com.csw.service.impl
 * @version: 1.0
 */
public class PhotoServiceImpl implements PhotoService {

    PhotoDao photoDao=new PhotoDaoImpl();

    @Override
    public int insPhoto(Photo photo) throws Exception {
        return photoDao.insPhoto(photo);
    }

    @Override
    public int updPhoto(Photo photo) throws Exception {
        return photoDao.updPhoto(photo);
    }

    @Override
    public Photo selPhoto(int id) throws Exception {
        return photoDao.selPhoto(id);
    }
}
