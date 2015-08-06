package org.tangsi.video.service;

import org.tangsi.video.entity.Video;
import org.tangsi.video.entity.VideoTreeNode;

import java.util.List;

/**
 * created by tangsi 2015/7/29
 */
public interface VideoService {

    public List<Video> getAllVideo();

    public Video fetch(long videoid);

    /**
     * 保存一条video记录
     * @param video
     */
    public void save(Video video);

    /**
     * 根据主键删除一条记录
     * @param videoId
     */
    public void deleteByPrimaryId(long videoId);

    /**
     * 获取所有的视频，并将视频构建成一个层级的树菜单
     * @return
     */
    public List<VideoTreeNode> buildAllVideoInTree();
}
