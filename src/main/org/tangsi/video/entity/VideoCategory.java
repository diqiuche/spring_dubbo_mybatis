package org.tangsi.video.entity;

import java.util.ArrayList;
import java.util.List;

/**
 * 视频分类
 * created by tangsi 2015/7/29
 */
public class VideoCategory {

    private long id;

    private long pid;

    /**
     * 视频分类名称
     */
    private String name;

    /**
     * 渲染树的样式
     */
    private String iconCls;

    /**
     * 子节点
     */
    private List<VideoCategory> children = new ArrayList<>();

    public List<VideoCategory> getChildren() {
        return children;
    }

    public void setChildren(List<VideoCategory> children) {
        this.children = children;
    }

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
}
