package org.tangsi.blog.entity;

import org.tangsi.comment.entity.Comment;

import java.util.List;

/**
 * created by tangsi 2015/7/8
 */
public class Blog {

    private long id;

    private String name;

    private long userid;

    /**
     * 博客关联的评论
     */
    private List<Comment> comments;

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public long getUserid() {
        return userid;
    }

    public void setUserid(long userid) {
        this.userid = userid;
    }
}
