package com.csw.entity;

/**
 * @Auther: 行路
 * @Date: Created on 2020/6/10 11:16 星期三
 * @Description: com.blog.entity 关于5个页面的展示图像
 * @version: 1.0
 */
public class Photo {
    private int id;
    private String linkPhoto;
    private String aboutPhoto;
    private String tagPhoto;
    private String indexPhoto;
    private String catalogPhoto;

    public Photo() {
    }

    public Photo(int id, String linkPhoto, String aboutPhoto, String tagPhoto, String indexPhoto, String catalogPhoto) {
        this.id = id;
        this.linkPhoto = linkPhoto;
        this.aboutPhoto = aboutPhoto;
        this.tagPhoto = tagPhoto;
        this.indexPhoto = indexPhoto;
        this.catalogPhoto = catalogPhoto;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLinkPhoto() {
        return linkPhoto;
    }

    public void setLinkPhoto(String linkPhoto) {
        this.linkPhoto = linkPhoto;
    }

    public String getAboutPhoto() {
        return aboutPhoto;
    }

    public void setAboutPhoto(String aboutPhoto) {
        this.aboutPhoto = aboutPhoto;
    }

    public String getTagPhoto() {
        return tagPhoto;
    }

    public void setTagPhoto(String tagPhoto) {
        this.tagPhoto = tagPhoto;
    }

    public String getIndexPhoto() {
        return indexPhoto;
    }

    public void setIndexPhoto(String indexPhoto) {
        this.indexPhoto = indexPhoto;
    }

    public String getCatalogPhoto() {
        return catalogPhoto;
    }

    public void setCatalogPhoto(String catalogPhoto) {
        this.catalogPhoto = catalogPhoto;
    }

    @Override
    public String toString() {
        return "Photo{" +
                "id=" + id +
                ", linkPhoto='" + linkPhoto + '\'' +
                ", aboutPhoto='" + aboutPhoto + '\'' +
                ", tagPhoto='" + tagPhoto + '\'' +
                ", indexPhoto='" + indexPhoto + '\'' +
                ", catalogPhoto='" + catalogPhoto + '\'' +
                '}';
    }
}
