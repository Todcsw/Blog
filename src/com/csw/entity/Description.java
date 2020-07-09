package com.csw.entity;


/**
 * 关于个人描述页面表
 */
public class Description {

  private int id;
  private String name;
  private String constellation;
  private String experience;
  private String sentence;
  private String idol;
  private String character;
  private String contact;
  private String information;
  private String language;

  public Description() {
  }

  public Description(int id, String name, String constellation, String experience, String sentence, String idol, String character, String contact, String information, String language) {
    this.id = id;
    this.name = name;
    this.constellation = constellation;
    this.experience = experience;
    this.sentence = sentence;
    this.idol = idol;
    this.character = character;
    this.contact = contact;
    this.information = information;
    this.language = language;
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getConstellation() {
    return constellation;
  }

  public void setConstellation(String constellation) {
    this.constellation = constellation;
  }

  public String getExperience() {
    return experience;
  }

  public void setExperience(String experience) {
    this.experience = experience;
  }

  public String getSentence() {
    return sentence;
  }

  public void setSentence(String sentence) {
    this.sentence = sentence;
  }

  public String getIdol() {
    return idol;
  }

  public void setIdol(String idol) {
    this.idol = idol;
  }

  public String getCharacter() {
    return character;
  }

  public void setCharacter(String character) {
    this.character = character;
  }

  public String getContact() {
    return contact;
  }

  public void setContact(String contact) {
    this.contact = contact;
  }

  public String getInformation() {
    return information;
  }

  public void setInformation(String information) {
    this.information = information;
  }



  public String getLanguage() {
    return language;
  }

  public void setLanguage(String language) {
    this.language = language;
  }

  @Override
  public String toString() {
    return "Description{" +
            "id=" + id +
            ", name='" + name + '\'' +
            ", constellation='" + constellation + '\'' +
            ", experience='" + experience + '\'' +
            ", sentence='" + sentence + '\'' +
            ", idol='" + idol + '\'' +
            ", character='" + character + '\'' +
            ", contact='" + contact + '\'' +
            ", information='" + information + '\'' +
            ", language='" + language + '\'' +
            '}';
  }
}
