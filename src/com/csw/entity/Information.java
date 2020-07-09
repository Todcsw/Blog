package com.csw.entity;


/**
 * Description: 侧边栏的个人信息表
 * 
 * @author Todcsw
 * @date  
 */
public class Information {

  private int id;
  private String photo;
  private String name;
  private String sentence;
  private String email;
  private String github;

  public Information() {
  }

  public Information(int id, String photo, String name, String sentence, String email, String github) {
    this.id = id;
    this.photo = photo;
    this.name = name;
    this.sentence = sentence;
    this.email = email;
    this.github = github;
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getPhoto() {
    return photo;
  }

  public void setPhoto(String photo) {
    this.photo = photo;
  }

  public String getSentence() {
    return sentence;
  }

  public void setSentence(String sentence) {
    this.sentence = sentence;
  }

  public String getGithub() {
    return github;
  }

  public void setGithub(String github) {
    this.github = github;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  @Override
  public String toString() {
    return "Information{" +
            "id=" + id +
            ", photo='" + photo + '\'' +
            ", sentence='" + sentence + '\'' +
            ", github='" + github + '\'' +
            ", email='" + email + '\'' +
            '}';
  }
}
