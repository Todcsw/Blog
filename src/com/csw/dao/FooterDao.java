package com.csw.dao;

import com.csw.entity.Footer;
import com.csw.entity.Information;

/**
 * @Auther: 行路
 * @Date: Created on 2020/6/8 15:24 星期一
 * @Description: com.csw.dao
 * @version: 1.0
 */
public interface  FooterDao {

    public Footer selFooter() throws  Exception;

    public int updFooter(Footer footer)throws  Exception;

    public int insFooter(Footer footer)throws Exception;
}
