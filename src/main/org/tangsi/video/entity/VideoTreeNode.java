package org.tangsi.video.entity;

import java.util.ArrayList;
import java.util.List;

/**
 * created by tangsi 2015/7/29
 */
public class VideoTreeNode {

    public static final boolean VIDEO_FLAG_YES = true;

    public static final boolean VIDEO_FLAG_NOT = false;

    private long id;

    /**
     * 是否是视频
     */
    private boolean videoFlag;

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

    public VideoTreeNode(long id, boolean videoFlag, String text, String state, String iconCls) {
        this.id = id;
        this.videoFlag = videoFlag;
        this.text = text;
        this.state = state;
        this.iconCls = iconCls;
    }

    public VideoTreeNode(long id, boolean videoFlag, String text, String state, String iconCls, List<VideoTreeNode> children) {
        this(id, videoFlag, text, state, iconCls);
        this.children = children;
    }

    private List<VideoTreeNode> children = new ArrayList<>();

    public boolean isVideoFlag() {
        return videoFlag;
    }

    public void setVideoFlag(boolean videoFlag) {
        this.videoFlag = videoFlag;
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

    public List<VideoTreeNode> getChildren() {
        return children;
    }

    public void setChildren(List<VideoTreeNode> children) {
        this.children = children;
    }
}
