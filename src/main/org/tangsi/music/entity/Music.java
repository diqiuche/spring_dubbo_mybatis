package org.tangsi.music.entity;

/**
 * created by tangsi 2015/7/30
 */
public class Music {

    private long id;

    /**
     * 外键，音乐类别id
     */
    private long musicCategoryId;

    /**
     * 音乐名称
     */
    private String name;

    /**
     * 音乐树节点样式
     */
    private String iconCls;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getVideoCategoryId() {
        return musicCategoryId;
    }

    public void setVideoCategoryId(long videoCategoryId) {
        this.musicCategoryId = videoCategoryId;
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
