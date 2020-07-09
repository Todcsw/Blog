package com.csw.service;

import com.csw.entity.Footer;
import com.csw.entity.Site;

/**
 * @Auther: 行路
 * @Date: Created on 2020/6/8 15:42 星期一
 * @Description: com.csw.service
 * @version: 1.0
 */
public interface FooterService {

    public Footer selFooter() throws  Exception;

    public int updFooter(Footer footer)throws  Exception;

    public int insFooter(Footer footer)throws Exception;
}
