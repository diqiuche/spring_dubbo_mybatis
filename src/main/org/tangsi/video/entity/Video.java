package org.tangsi.video.entity;

/**
 * created by tangsi 2015/7/29
 */
public class Video {

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
     * 视频树节点样式
     */
    private String iconCls;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getMusicCategoryId() {
        return musicCategoryId;
    }

    public void setMusicCategoryId(long musicCategoryId) {
        this.musicCategoryId = musicCategoryId;
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