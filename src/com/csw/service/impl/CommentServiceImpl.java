package com.csw.service.impl;

import com.csw.dao.CommentDao;
import com.csw.dao.impl.CommentDaoImpl;
import com.csw.entity.Comment;
import com.csw.service.CommentService;

/**
 * @Auther: 行路
 * @Date: Created on 2020/6/9 12:30 星期二
 * @Description: com.csw.service.impl
 * @version: 1.0
 */
public class CommentServiceImpl implements CommentService {

    CommentDao commentDao=new CommentDaoImpl();

    @Override
    public Comment selComment() throws Exception {
        return commentDao.selComment();
    }

    @Override
    public int updComment(Comment comment) throws Exception {
        return commentDao.updComment(comment);
    }

    @Override
    public int insComment(Comment comment) throws Exception {
        return commentDao.insComment(comment);
    }
}
