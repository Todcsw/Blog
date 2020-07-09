package com.csw.service.impl;

import com.csw.dao.FooterDao;
import com.csw.dao.impl.FooterDaoImpl;
import com.csw.entity.Footer;
import com.csw.service.FooterService;

/**
 * @Auther: 行路
 * @Date: Created on 2020/6/8 15:44 星期一
 * @Description: com.csw.service.impl
 * @version: 1.0
 */
public class FooterServiceImpl implements FooterService {
    FooterDao footerDao=new FooterDaoImpl();

    @Override
    public Footer selFooter() throws Exception {
        return footerDao.selFooter();
    }

    @Override
    public int updFooter(Footer footer) throws Exception {
        return footerDao.updFooter(footer);
    }

    @Override
    public int insFooter(Footer footer) throws Exception {
        return footerDao.insFooter(footer);
    }
}
