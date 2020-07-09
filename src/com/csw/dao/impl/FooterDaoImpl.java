package com.csw.dao.impl;

import cn.hutool.db.Db;
import com.csw.dao.FooterDao;
import com.csw.entity.Footer;
import com.csw.entity.Information;
import com.csw.util.DBUtil;

import java.sql.ResultSet;

/**
 * @Auther: 行路
 * @Date: Created on 2020/6/8 15:24 星期一
 * @Description: com.csw.dao.impl
 * @version: 1.0
 * Copyright(c)2020-2025 陈圣文 All rights reserved.
 */
public class FooterDaoImpl implements FooterDao {

    /**
     * 查询页脚信息
     * @return
     * @throws Exception
     */
    @Override
    public Footer selFooter() throws Exception {
        Footer footer = null;
        ResultSet rs = null;
        try {
            String sql = "select * from footer";
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                footer=new Footer();
                footer.setAbout(rs.getString("about"));
                footer.setNumber(rs.getString("number"));
                footer.setByurl(rs.getString("byurl"));
                footer.setCopyright(rs.getString("copyright"));
                footer.setPowerby(rs.getString("powerby"));
                footer.setId(Integer.parseInt(rs.getString("id")));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            rs.close();
            DBUtil.closeAll();
        }
        return footer;
    }

    /**
     * 更新页脚信息
     * @param footer
     * @return
     * @throws Exception
     */
    @Override
    public int updFooter(Footer footer) throws Exception {
        String sql="update footer set about=?,number=?,copyright=?,powerby=?,byurl=? where id=?";
        int i = DBUtil.executeUpdate(sql, new Object[]{footer.getAbout(),footer.getNumber(),footer.getCopyright(),footer.getPowerby(),footer.getByurl(),footer.getId()});
        DBUtil.closeAll();
        return i;
    }

    /**
     * 新增页脚信息
     * @param footer
     * @return
     * @throws Exception
     */
    @Override
    public int insFooter(Footer footer) throws Exception {
        int i=0;
        String sql="insert into footer values(default,?,?,?,?,?)";
        Object[] object=new Object[]{footer.getAbout(),footer.getNumber(),footer.getCopyright(),footer.getPowerby(),footer.getByurl()};
        i = DBUtil.executeUpdate(sql, object);
        DBUtil.closeAll();
         return i;
    }
}
