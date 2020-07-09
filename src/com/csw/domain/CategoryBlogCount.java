package com.csw.domain;

/**
 * @Auther: 行路
 * @Date: Created on 2020/6/11 20:54 星期四
 * @Description: com.csw.domain
 * @version: 1.0
 */
public class CategoryBlogCount {
    public String name;
    public int count;

    public CategoryBlogCount() {
    }

    public CategoryBlogCount(String name, int count) {
        this.name = name;
        this.count = count;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    @Override
    public String toString() {
        return "CategoryBlogCount{" +
                "name='" + name + '\'' +
                ", count=" + count +
                '}';
    }
}
