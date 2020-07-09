package com.csw.service.impl;

import com.csw.dao.DescriptionDao;
import com.csw.dao.impl.DescriptionDaoImpl;
import com.csw.entity.Description;
import com.csw.service.DescriptionService;

/**
 * @Auther: 行路
 * @Date: Created on 2020/6/9 12:55 星期二
 * @Description: com.csw.service.impl
 * @version: 1.0
 */
public class DescriptionServiceImpl implements DescriptionService {

    DescriptionDao descriptionDao=new DescriptionDaoImpl();

    @Override
    public Description selDescription() throws Exception {
        return descriptionDao.selDescription();
    }

    @Override
    public int updDescription(Description description) throws Exception {
        return descriptionDao.updDescription(description);
    }

    @Override
    public int insDescription(Description description) throws Exception {
        return descriptionDao.insDescription(description);
    }
}
