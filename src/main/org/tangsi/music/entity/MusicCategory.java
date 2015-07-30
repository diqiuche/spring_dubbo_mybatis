package org.tangsi.music.entity;

import java.util.ArrayList;
import java.util.List;

/**
 * 音乐分类
 * created by tangsi 2015/7/30
 */
public class MusicCategory {

    private long id;

    private long pid;

    /**
     * 音乐分类名称
     */
    private String name;

    /**
     * 渲染树的样式
     */
    private String iconCls;

    /**
     * 子节点
     */
    private List<MusicCategory> children = new ArrayList<>();

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getPid() {
        return pid;
    }

    public void setPid(long pid) {
        this.pid = pid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIconCls() {
        return iconCls;
    }

    public void setIconCls(String iconCls) {
        this.iconCls = iconCls;
    }

    public List<MusicCategory> getChildren() {
        return children;
    }

    public void setChildren(List<MusicCategory> children) {
        this.children = children;
    }
}
