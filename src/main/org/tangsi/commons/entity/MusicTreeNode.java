package org.tangsi.commons.entity;

import java.util.ArrayList;
import java.util.List;

/**
 * created by tangsi 2015/7/28
 */
public class MusicTreeNode {
    private long id;

    /**
     * 是否是音乐
     */
    private boolean musicFlag;

    /**
     * 树节点名称
     */
    private String text;

    /**
     * 节点状态：open  or closed
     */
    private String state = "open";

    /**
     * 节点样式
     */
    private String iconCls;

    public MusicTreeNode(long id, boolean musicFlag, String text, String state, String iconCls, List<MusicTreeNode> children) {
        this.id = id;
        this.musicFlag = musicFlag;
        this.text = text;
        this.state = state;
        this.iconCls = iconCls;
        this.children = children;
    }

    private List<MusicTreeNode> children = new ArrayList<>();

    public boolean isMusicFlag() {
        return musicFlag;
    }

    public void setMusicFlag(boolean musicFlag) {
        this.musicFlag = musicFlag;
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

    public List<MusicTreeNode> getChildren() {
        return children;
    }

    public void setChildren(List<MusicTreeNode> children) {
        this.children = children;
    }
}
