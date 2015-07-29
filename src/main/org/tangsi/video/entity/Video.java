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

}
