package com.csw.service.impl;

import com.csw.dao.InformationDao;
import com.csw.dao.impl.InformationDaoImpl;
import com.csw.entity.Information;
import com.csw.service.InformationService;

/**
 * @Auther: 行路
 * @Date: Created on 2020/6/8 15:44 星期一
 * @Description: com.csw.service.impl
 * @version: 1.0
 */
public class InformationServiceImpl implements InformationService {
    InformationDao informationDao=new InformationDaoImpl();
    @Override
    public Information selInformation() throws Exception {
        return informationDao.selInformation();
    }

    @Override
    public int updSite(Information information) throws Exception {
        return informationDao.updInformation(information);
    }

    @Override
    public int insInformation(Information information) throws Exception {
        return informationDao.insInformation(information);
    }
}
