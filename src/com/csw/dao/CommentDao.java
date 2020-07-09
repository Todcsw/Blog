package com.csw.dao;

import com.csw.entity.Comment;
import com.csw.entity.Footer;

/**
 * @Auther: 行路
 * @Date: Created on 2020/6/9 10:55 星期二
 * @Description: com.csw.dao
 * @version: 1.0
 */
public interface CommentDao {

    public Comment selComment() throws  Exception;

    public int updComment(Comment comment)throws  Exception;

    public int insComment(Comment comment)throws Exception;
}
