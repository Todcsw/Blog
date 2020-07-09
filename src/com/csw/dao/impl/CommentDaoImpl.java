package com.csw.dao.impl;

import com.csw.dao.CommentDao;
import com.csw.entity.Comment;
import com.csw.util.DBUtil;

import java.sql.ResultSet;

/**
 * @Auther: 行路
 * @Date: Created on 2020/6/9 10:56 星期二
 * @Description: com.csw.dao.impl
 * @version: 1.0
 * Copyright(c)2020-2025 陈圣文 All rights reserved.
 */
public class CommentDaoImpl implements CommentDao {

    /**
     * 查询所有的评论配置内容
     * @return
     * @throws Exception
     */
    @Override
    public Comment selComment() throws Exception {
        Comment comment=null;
        String sql="select * from comment";
        ResultSet resultSet = DBUtil.executeQuery(sql);
        while (resultSet.next()){
            comment=new Comment();
            comment.setId(Integer.parseInt(resultSet.getString("id")));
            comment.setFlag(resultSet.getString("flag").equals("1")?true:false);
            comment.setAppId(resultSet.getString("appId"));
            comment.setAppKey(resultSet.getString("appKey"));
            comment.setPlaceholder(resultSet.getString("placeholder"));
            comment.setPlacePhoto(resultSet.getString("placePhoto"));
        }
        DBUtil.closeAll();
        resultSet.close();
        return comment;
    }

    /**
     * 更新评论的配置内容
     * @param comment
     * @return
     * @throws Exception
     */
    @Override
    public int updComment(Comment comment) throws Exception {
        int i=0;
        String sql="update comment set flag=?,appId=?,appKey=?,placeholder=?,placePhoto=? where id=1";
        Object[] object=new Object[]{comment.isFlag(),comment.getAppId(),comment.getAppKey(),comment.getPlaceholder(),comment.getPlacePhoto()};
        i = DBUtil.executeUpdate(sql, object);
        DBUtil.closeAll();
        return i;
    }

    /**
     * 新增评论的配置内容
     * @param comment
     * @return
     * @throws Exception
     */
    @Override
    public int insComment(Comment comment) throws Exception {
        int i=0;
        String sql="insert into comment values(default,?,?,?,?,?)";
        Object[] object=new Object[]{comment.isFlag()==true?1:0,comment.getAppId(),comment.getAppKey(),comment.getPlaceholder(),comment.getPlacePhoto()};
        i = DBUtil.executeUpdate(sql, object);
        DBUtil.closeAll();
        return 0;
    }
}
