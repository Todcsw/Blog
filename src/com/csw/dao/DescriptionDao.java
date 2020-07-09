package com.csw.dao;

import com.csw.entity.Description;

/**
 * @Auther: 行路
 * @Date: Created on 2020/6/9 12:29 星期二
 * @Description: com.csw.dao
 * @version: 1.0
 */
public interface DescriptionDao {

    public Description selDescription() throws  Exception;

    public int updDescription(Description description)throws  Exception;

    public int insDescription(Description description)throws Exception;
}
