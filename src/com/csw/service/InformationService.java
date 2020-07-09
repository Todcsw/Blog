package com.csw.service;

import com.csw.entity.Information;
import com.csw.entity.Site;

/**
 * @Auther: 行路
 * @Date: Created on 2020/6/8 15:43 星期一
 * @Description: com.csw.service
 * @version: 1.0
 */
public interface InformationService {
    public Information selInformation() throws  Exception;

    public int updSite(Information information)throws  Exception;

    public int insInformation(Information information) throws Exception;
}
