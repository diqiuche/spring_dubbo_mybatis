package org.tangsi.video.service;

import org.tangsi.video.entity.VideoCategory;
import org.tangsi.video.entity.VideoTreeNode;

import java.util.List;

/**
 * created by tangsi 2015/7/29
 */
public interface VideoCategoryService {

    public List<VideoCategory> getAllCategory();

    /**
     * 构建视频树的父子结构数据
     * @return
     */
    public List<VideoTreeNode> buildVideoTree();


    public void add(VideoCategory category);
}
