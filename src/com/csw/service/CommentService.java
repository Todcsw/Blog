package com.csw.service;

import com.csw.entity.Comment;

/**
 * @Auther: 行路
 * @Date: Created on 2020/6/9 12:29 星期二
 * @Description: com.csw.service
 * @version: 1.0
 */
public interface CommentService {
    public Comment selComment() throws  Exception;

    public int updComment(Comment comment)throws  Exception;

    public int insComment(Comment comment)throws Exception;
}
