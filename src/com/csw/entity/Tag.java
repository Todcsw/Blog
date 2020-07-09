package com.csw.entity;


import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

/**
 * Description: 标签表
 * 
 * @author Todcsw
 * @date  
 */
public class Tag {

  private int id;

  private String name;

  private int deleted;

  public Tag() {
  }

  public Tag(int id, String name, int deleted, Date createTime) {
    this.id = id;
    this.name = name;
    this.deleted = deleted;
    this.createTime = createTime;
  }

  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
  private Date createTime;

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public int getDeleted() {
    return deleted;
  }

  public void setDeleted(int deleted) {
    this.deleted = deleted;
  }

  public Date getCreateTime() {
    return createTime;
  }

  public void setCreateTime(Date createTime) {
    this.createTime = createTime;
  }

  @Override
  public String toString() {
    return "Tag{" +
            "id=" + id +
            ", name='" + name + '\'' +
            ", deleted=" + deleted +
            ", createTime=" + createTime +
            '}';
  }
}
