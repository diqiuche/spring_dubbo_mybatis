package org.tangsi.user.entity;

import java.util.List;

/**
 * created by tangsi 2015/7/29
 */
public class UserTreeNode {

    private long id;

    /**
     * 用户树节点名称
     */
    private String text;

    /**
     * 树节点状态：open or closed(展开或者关闭)
     */
    private String state = "open";

    /**
     * 树节点渲染样式
     */
    private String iconCls;

    private List<UserTreeNode> children;

    public UserTreeNode(long id, String text, String state, String iconCls, List<UserTreeNode> children) {
        this.id = id;
        this.text = text;
        this.state = state;
        this.iconCls = iconCls;
        this.children = children;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getIconCls() {
        return iconCls;
    }

    public void setIconCls(String iconCls) {
        this.iconCls = iconCls;
    }

    public List<UserTreeNode> getChildren() {
        return children;
    }

    public void setChildren(List<UserTreeNode> children) {
        this.children = children;
    }
}
