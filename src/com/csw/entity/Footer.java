package com.csw.entity;


/**
 * 页脚底部信息表
 */
public class Footer {

  private int id;
  private String about;
  private String number;
  private String copyright;
  private String powerby;
  private String byurl;

  public Footer() {
  }

  public Footer(int id, String about, String number, String copyright, String powerby, String byurl) {
    this.id = id;
    this.about = about;
    this.number = number;
    this.copyright = copyright;
    this.powerby = powerby;
    this.byurl = byurl;
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getAbout() {
    return about;
  }

  public void setAbout(String about) {
    this.about = about;
  }

  public String getNumber() {
    return number;
  }

  public void setNumber(String number) {
    this.number = number;
  }

  public String getCopyright() {
    return copyright;
  }

  public void setCopyright(String copyright) {
    this.copyright = copyright;
  }

  public String getPowerby() {
    return powerby;
  }

  public void setPowerby(String powerby) {
    this.powerby = powerby;
  }

  public String getByurl() {
    return byurl;
  }

  public void setByurl(String byurl) {
    this.byurl = byurl;
  }


}
