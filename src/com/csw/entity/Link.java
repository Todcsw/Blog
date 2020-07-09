package com.csw.entity;


import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

/**
 * Description: 友情链接表
 * 
 * @author Todcsw
 * @date  
 */
public class Link {

  private int id;
  private String hphoto;
  private String url;
  private String name;
  private String introduce;

  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
  private Date createTime;

  public Link() {
  }

  public Link(int id, String hphoto, String url, String name, String introduce, Date createTime) {
    this.id = id;
    this.hphoto = hphoto;
    this.url = url;
    this.name = name;
    this.introduce = introduce;
    this.createTime = createTime;
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getHphoto() {
    return hphoto;
  }

  public void setHphoto(String hphoto) {
    this.hphoto = hphoto;
  }

  public String getUrl() {
    return url;
  }

  public void setUrl(String url) {
    this.url = url;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getIntroduce() {
    return introduce;
  }

  public void setIntroduce(String introduce) {
    this.introduce = introduce;
  }



  public Date getCreateTime() {
    return createTime;
  }

  public void setCreateTime(Date createTime) {
    this.createTime = createTime;
  }

  @Override
  public String toString() {
    return "Link{" +
            "id=" + id +
            ", hphoto='" + hphoto + '\'' +
            ", url='" + url + '\'' +
            ", name='" + name + '\'' +
            ", introduce='" + introduce + '\'' +
            ", createTime=" + createTime +
            '}';
  }
}
