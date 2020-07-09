package com.csw.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

/**
 * Description: 个人博客表
 *
 * @author Todcsw
 * @date
 */
public class Blog {

  private int id;
  private String title;
  private String photo;
  private int view;
  private String tags;
  private String catalog;

  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
  private Date uploadTime;

  private String content;

  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
  private Date updateTime;

  public Blog() {
  }

  public Blog(int id, String title, String photo, int view, String tags, String catalog, Date uploadTime, String content, Date updateTime) {
    this.id = id;
    this.title = title;
    this.photo = photo;
    this.view = view;
    this.tags = tags;
    this.catalog = catalog;
    this.uploadTime = uploadTime;
    this.content = content;
    this.updateTime = updateTime;
  }

  public Date getUpdateTime() {
    return updateTime;
  }

  public void setUpdateTime(Date updateTime) {
    this.updateTime = updateTime;
  }


  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getPhoto() {
    return photo;
  }

  public void setPhoto(String photo) {
    this.photo = photo;
  }

  public int getView() {
    return view;
  }

  public void setView(int view) {
    this.view = view;
  }

  public String getTags() {
    return tags;
  }

  public void setTags(String tags) {
    this.tags = tags;
  }

  public String getCatalog() {
    return catalog;
  }

  public void setCatalog(String catalog) {
    this.catalog = catalog;
  }



  public Date getUploadTime() {
    return uploadTime;
  }

  public void setUploadTime(Date uploadTime) {
    this.uploadTime = uploadTime;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  @Override
  public String toString() {
    return "Blog{" +
            "id=" + id +
            ", title='" + title + '\'' +
            ", photo='" + photo + '\'' +
            ", view=" + view +
            ", tags='" + tags + '\'' +
            ", catalog='" + catalog + '\'' +
            ", uploadTime=" + uploadTime +
            ", content='" + content + '\'' +
            ", updateTime=" + updateTime +
            '}';
  }
}
