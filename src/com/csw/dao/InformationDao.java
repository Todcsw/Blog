package com.csw.dao;

import com.csw.entity.Information;
import com.csw.entity.Site;

import javax.crypto.interfaces.PBEKey;

/**
 * @Auther: 行路
 * @Date: Created on 2020/6/8 14:59 星期一
 * @Description: com.csw.dao
 * @version: 1.0
 */
public interface InformationDao {
    public Information selInformation() throws  Exception;

    public int updInformation(Information information)throws  Exception;

    public int insInformation(Information information) throws Exception;
}
