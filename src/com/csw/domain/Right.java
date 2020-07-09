package com.csw.domain;

import cn.hutool.extra.mail.Mail;
import cn.hutool.extra.mail.MailUtil;
import com.csw.entity.Blog;
import com.csw.entity.Category;
import com.csw.entity.Tag;

import java.util.List;

/**
 * @Auther: 行路
 * @Date: Created on 2020/6/11 15:22 星期四
 * @Description: com.csw.domain
 * @version: 1.0
 */
public class Right {


    public String avatar;
    public String name;
    public String sentence;

    public int blogCount;
    public int tagCount;
    public int categoryCount;

    public String github;
    public String email;


    public String notice;

    public List<Blog> blogs;
    public List<CategoryBlogCount> categories;
    public List<Tag> tags;


    public Right() {
    }

    public Right(String avatar, String name, String sentence, int blogCount, int tagCount, int categoryCount, String github, String email, String notice, List<Blog> blogs, List<CategoryBlogCount> categories, List<Tag> tags) {
        this.avatar = avatar;
        this.name = name;
        this.sentence = sentence;
        this.blogCount = blogCount;
        this.tagCount = tagCount;
        this.categoryCount = categoryCount;
        this.github = github;
        this.email = email;
        this.notice = notice;
        this.blogs = blogs;
        this.categories = categories;
        this.tags = tags;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSentence() {
        return sentence;
    }

    public void setSentence(String sentence) {
        this.sentence = sentence;
    }

    public int getBlogCount() {
        return blogCount;
    }

    public void setBlogCount(int blogCount) {
        this.blogCount = blogCount;
    }

    public int getTagCount() {
        return tagCount;
    }

    public void setTagCount(int tagCount) {
        this.tagCount = tagCount;
    }

    public int getCategoryCount() {
        return categoryCount;
    }

    public void setCategoryCount(int categoryCount) {
        this.categoryCount = categoryCount;
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

    public String getNotice() {
        return notice;
    }

    public void setNotice(String notice) {
        this.notice = notice;
    }

    public List<Blog> getBlogs() {
        return blogs;
    }

    public void setBlogs(List<Blog> blogs) {
        this.blogs = blogs;
    }

    public List<CategoryBlogCount> getCategories() {
        return categories;
    }

    public void setCategories(List<CategoryBlogCount> categories) {
        this.categories = categories;
    }

    public List<Tag> getTags() {
        return tags;
    }

    public void setTags(List<Tag> tags) {
        this.tags = tags;
    }

    @Override
    public String toString() {
        return "Right{" +
                "avatar='" + avatar + '\'' +
                ", name='" + name + '\'' +
                ", sentence='" + sentence + '\'' +
                ", blogCount=" + blogCount +
                ", tagCount=" + tagCount +
                ", categoryCount=" + categoryCount +
                ", github='" + github + '\'' +
                ", email='" + email + '\'' +
                ", notice='" + notice + '\'' +
                ", blogs=" + blogs +
                ", categories=" + categories +
                ", tags=" + tags +
                '}';
    }
}
