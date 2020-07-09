package com.csw.dao.impl;

import cn.hutool.core.date.DateTime;
import cn.hutool.db.DbUtil;
import com.csw.dao.LinkDao;
import com.csw.entity.Blog;
import com.csw.entity.Link;
import com.csw.util.DBUtil;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @Auther: 行路
 * @Date: Created on 2020/6/8 11:19 星期一
 * @Description: com.csw.dao.impl
 * @version: 1.0
 * Copyright(c)2020-2025 陈圣文 All rights reserved.
 */
public class LinkDaoImpl implements LinkDao {


    /**
     * 查询总的友情链接数量
     * @return
     * @throws SQLException
     */
    @Override
    public int selAllLinkCount() throws SQLException {
        ResultSet rs=null;
        int count=0;
        try {
            String sql="select count(id) from link;";
             rs= DBUtil.executeQuery(sql);
            while (rs.next()){
               count=rs.getInt(1);
            }
        }catch (Exception e){
            throw e;
        }finally {
            try {
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {
                throw e;
            }
            DBUtil.closeAll();
        }
        return count;
    }

    /**
     * 查询所有友链内容
     * @return
     * @throws Exception
     */
    @Override
    public List<Link> selAllLink() throws Exception {
        List<Link> list=new ArrayList<>();
        Link link=null;
        String sql="select * from link";
        ResultSet resultSet = DBUtil.executeQuery(sql);
        while (resultSet.next()){
            link=new Link(Integer.parseInt(resultSet.getString("id")),
                    resultSet.getString("hphoto"),
                    resultSet.getString("url"),
                    resultSet.getString("name"),
                    resultSet.getString("introduce"),
                    DateTime.of(resultSet.getString("create_time"),"yyyy-MM-dd HH:mm:ss"));
            list.add(link);
        }
        DBUtil.closeAll();
        resultSet.close();
        return list;
    }

    /**
     * 新增友链
     * @param link
     * @return 成功返回1，失败返回0
     * @throws Exception
     */
    @Override
    public int insLink(Link link) throws Exception {

        int i=0;
        String sql="insert into link values(default,?,?,?,?,?)";
        i = DBUtil.executeUpdate(sql, new Object[]{link.getHphoto(), link.getUrl(), link.getName(), link.getIntroduce(), link.getCreateTime()});
        DBUtil.closeAll();
        return i;
    }

    /**
     * 更新友链内容
     * @param link
     * @return 成功返回1，失败返回0
     * @throws Exception
     */
    @Override
    public int updLink(Link link) throws Exception {
        int i=0;
        String sql="update link set hphoto=?,url=?,name=?,introduce=?,create_time=? where id=?";
        i=DBUtil.executeUpdate(sql,new Object[]{link.getHphoto(), link.getUrl(), link.getName(), link.getIntroduce(), link.getCreateTime(),link.getId()});
        DBUtil.closeAll();
        return i;
    }

    /**
     * 删除友链
     * @param id
     * @return 成功返回1，失败返回0
     * @throws Exception
     */
    @Override
    public int delLink(int id) throws Exception {
        int i=0;
        String sql="delete from link where id=?";
        i = DBUtil.executeUpdate(sql, new Object[]{id});
        DBUtil.closeAll();
        return i;
    }

    /**
     * 查询友链根据id
     * @param id
     * @return
     * @throws Exception
     */
    @Override
    public Link selLinkById(int id) throws Exception {
        Link link=null;
        String sql="select * from link where id=?";
        Object[] object=new Object[]{id};
        ResultSet resultSet = DBUtil.executeQuery(sql, object);
        while (resultSet.next()){
            link=new Link(id,resultSet.getString("hphoto"),resultSet.getString("url"),
                    resultSet.getString("name"),resultSet.getString("introduce"),
                    DateTime.of(resultSet.getString("create_time"),"yyyy-MM-dd HH:mm:ss"));
        }
        DBUtil.closeAll();
        resultSet.close();
        return link;
    }

    /**
     * 查询友链进行分页
     * @param currentPage 当前页
     * @param pageCount 每页的数量
     * @return
     * @throws Exception
     */
    @Override
    public List<Link> selLinkByPage(int currentPage, int pageCount) throws Exception {
        Link link=null;
        List<Link>  list=new ArrayList<>();
        String sql="SELECT * FROM link ORDER BY create_time desc LIMIT ?, ?";
        Object[] object=new Object[]{currentPage,pageCount};
        ResultSet resultSet = DBUtil.executeQuery(sql, object);
        while (resultSet.next()){
            link=new Link(Integer.parseInt(resultSet.getString("id")),
                    resultSet.getString("hphoto"),
                    resultSet.getString("url"),
                    resultSet.getString("name"),
                    resultSet.getString("introduce"),
                    DateTime.of(resultSet.getString("create_time"),"yyyy-MM-dd HH:mm:ss"));
            list.add(link);
        }
        DBUtil.closeAll();
        resultSet.close();

        return list;
    }


}
