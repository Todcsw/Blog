package com.csw.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

/**
 * Description:个人用户表
 *
 * @author Todcsw
 * @date
 */
public class User {

  private int id;
  private String account;
  private String password;
  private String problem;
  private String answer;

  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
  private Date createTime;

  private String identify;

  public User(int id, String account, String password, String problem, String answer, Date createTime, String identify) {
    this.id = id;
    this.account = account;
    this.password = password;
    this.problem = problem;
    this.answer = answer;
    this.createTime = createTime;
    this.identify = identify;
  }

  public User() {
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getAccount() {
    return account;
  }

  public void setAccount(String account) {
    this.account = account;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public String getProblem() {
    return problem;
  }

  public void setProblem(String problem) {
    this.problem = problem;
  }

  public String getAnswer() {
    return answer;
  }

  public void setAnswer(String answer) {
    this.answer = answer;
  }

  public Date getCreateTime() {
    return createTime;
  }

  public void setCreateTime(Date createTime) {
    this.createTime = createTime;
  }

  public String getIdentify() {
    return identify;
  }

  public void setIdentify(String identify) {
    this.identify = identify;
  }

  @Override
  public String toString() {
    return "User{" +
            "id=" + id +
            ", account='" + account + '\'' +
            ", password='" + password + '\'' +
            ", problem='" + problem + '\'' +
            ", answer='" + answer + '\'' +
            ", createTime=" + createTime +
            ", identify='" + identify + '\'' +
            '}';
  }
}
