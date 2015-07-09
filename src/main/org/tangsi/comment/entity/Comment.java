package org.tangsi.comment.entity;

/**
 * created by tangsi 2015/7/8
 */
public class Comment {

    private long id;

    private String name;

    private long blogid;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getBlogid() {
        return blogid;
    }

    public void setBlogid(long blogid) {
        this.blogid = blogid;
    }
}
