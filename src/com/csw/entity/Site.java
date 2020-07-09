package com.csw.entity;


/**
 * Description: 站点信息表
 * 
 * @author Todcsw
 * @date  
 */
public class Site {


  private int id;
  private String name;
  private String description;
  private String logo;
  private String notice;
  private String favicon;

  public Site() {
  }

  public Site(int id, String name, String description, String logo, String notice, String favicon) {
    this.id = id;
    this.name = name;
    this.description = description;
    this.logo = logo;
    this.notice = notice;
    this.favicon = favicon;
  }

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

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public String getLogo() {
    return logo;
  }

  public void setLogo(String logo) {
    this.logo = logo;
  }

  public String getFavicon() {
    return favicon;
  }

  public void setFavicon(String favicon) {
    this.favicon = favicon;
  }

  public String getNotice() {
    return notice;
  }

  public void setNotice(String notice) {
    this.notice = notice;
  }

  @Override
  public String toString() {
    return "Site{" +
            "name='" + name + '\'' +
            ", id=" + id +
            ", description='" + description + '\'' +
            ", logo='" + logo + '\'' +
            ", favicon='" + favicon + '\'' +
            ", notice='" + notice + '\'' +
            '}';
  }
}
