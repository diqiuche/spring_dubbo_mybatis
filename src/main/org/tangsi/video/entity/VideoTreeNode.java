package org.tangsi.video.entity;

import org.tangsi.util.CloneUtil;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * created by tangsi 2015/7/29
 */
public class VideoTreeNode implements Serializable{

    public static final boolean VIDEO_FLAG_YES = true;

    public static final boolean VIDEO_FLAG_NOT = false;

    public  static  final boolean IS_EASYUI_TREE = true;

    private long id;

    /**
     * 是否是视频
     */
    private boolean videoFlag;

    /**
     * 树节点名称,对应于easyui的树节点名称
     */
    private String text;

    /**
     * 树节点名称,对应于webix的树控件的树节点名称
     */
    private String value;

    /**
     * 节点状态,对应于easyui的树节点控制：open  or closed
     */
    private String state = "open";

    /**
     * 节点状态,对应于webix的树控件节点控制：true or false
     */
    private boolean open = true;

    /**
     * 节点样式
     */
    private String iconCls;

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public boolean isOpen() {
        return open;
    }

    public void setOpen(boolean open) {
        this.open = open;
    }

    public VideoTreeNode() {
    }

    public VideoTreeNode(long id, boolean videoFlag, String text, String state, String iconCls) {
        this.id = id;
        this.videoFlag = videoFlag;
        this.text = text;
        this.value = text;  //同步设置webix的树控件的树节点名称
        this.state = state;
        this.open = "open".equals(state) ? true : false;  //同步设置webix的树节点状态控制
        this.iconCls = iconCls;
    }

    public VideoTreeNode(long id, boolean videoFlag, String text, String state, String iconCls, List<VideoTreeNode> children) {
        this(id, videoFlag, text, state, iconCls);
        this.children = children;
    }

    /**
     * 对应于easyui的树控件的子节点数据
     */
    private List<VideoTreeNode> children;

    /**
     * 对应于webix的树控件的子节点数据
     */
    private List<VideoTreeNode> data;

    public List<VideoTreeNode> getData() {
        return data;
    }

    public void setData(List<VideoTreeNode> data) {
        this.data = data;
    }

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

    public void setChildren(List<VideoTreeNode> children,boolean isEasyUITree) {
        if(isEasyUITree)
            this.children = children;
        else
        /**
         * 同步设置webix的树控件的子节点数据与easyui的树控件的子节点数据一致，实际上这两个控件只是解析树节点数据的字段名称不一致而已
         * 因此不用重复构造两份相同的数据，只要指向同一个子节点列表就ok了
         */
        this.data = children;
    }
}
