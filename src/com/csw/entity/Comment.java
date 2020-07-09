package com.csw.entity;



/**
 * Description: 评论配置信息表
 * 
 * @author Todcsw
 * @date  
 */
public class Comment {

  private int id;
  private boolean flag;
  private String appId;
  private String appKey;
  private String placeholder;
  private String placePhoto;

  public Comment() {
  }

  public Comment(int id, boolean flag, String appId, String appKey, String placeholder, String placePhoto) {
    this.id = id;
    this.flag = flag;
    this.appId = appId;
    this.appKey = appKey;
    this.placeholder = placeholder;
    this.placePhoto = placePhoto;
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public boolean isFlag() {
    return flag;
  }

  public void setFlag(boolean flag) {
    this.flag = flag;
  }

  public String getAppId() {
    return appId;
  }

  public void setAppId(String appId) {
    this.appId = appId;
  }

  public String getAppKey() {
    return appKey;
  }

  public void setAppKey(String appKey) {
    this.appKey = appKey;
  }

  public String getPlaceholder() {
    return placeholder;
  }

  public void setPlaceholder(String placeholder) {
    this.placeholder = placeholder;
  }

  public String getPlacePhoto() {
    return placePhoto;
  }

  public void setPlacePhoto(String placePhoto) {
    this.placePhoto = placePhoto;
  }

  @Override
  public String toString() {
    return "Comment{" +
            "id=" + id +
            ", flag=" + flag +
            ", appId='" + appId + '\'' +
            ", appKey='" + appKey + '\'' +
            ", placeholder='" + placeholder + '\'' +
            ", placePhoto='" + placePhoto + '\'' +
            '}';
  }
}
