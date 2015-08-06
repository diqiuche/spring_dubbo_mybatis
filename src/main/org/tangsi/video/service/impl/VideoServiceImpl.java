package org.tangsi.video.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.tangsi.video.dao.mapper.VideoMapper;
import org.tangsi.video.entity.Video;
import org.tangsi.video.entity.VideoTreeNode;
import org.tangsi.video.service.VideoService;

import java.util.ArrayList;
import java.util.List;

/**
 * created by tangsi 2015/7/29
 */
@Repository("videoServiceImpl")
public class VideoServiceImpl implements VideoService {

    @Autowired
    private VideoMapper videoMapper;

    @Override
    public List<Video> getAllVideo() {
        return this.videoMapper.getAllVideo();
    }

    @Override
    public Video fetch(long videoid) {
        return this.videoMapper.getByPrimaryId(videoid);
    }

    /**
     * 保存一条video记录
     *
     * @param video
     */
    @Override
    public void save(Video video) {
        this.videoMapper.save(video);
    }

    /**
     * 根据主键删除一条记录
     *
     * @param videoId
     */
    @Override
    public void deleteByPrimaryId(long videoId) {
        this.videoMapper.deleteByPrimaryId(videoId);
    }

    /**
     * 获取所有的视频，并将视频构建成一个层级的树菜单
     *
     * @return
     */
    @Override
    public List<VideoTreeNode> buildAllVideoInTree() {
        List<Video> allVideo = this.getAllVideo();
        List<VideoTreeNode> children = new ArrayList<>();
        if(allVideo != null && !allVideo.isEmpty()) {
            for(Video video : allVideo) {
                VideoTreeNode child = new VideoTreeNode();
                children.add(child);
                child.setId(video.getId());
                child.setValue(video.getName());
                child.setOpen(true);
            }
        }
        VideoTreeNode root = new VideoTreeNode();
        root.setId(0);
        root.setValue("视频");
        root.setOpen(true);
        if(!children.isEmpty())
            root.setData(children);
        List<VideoTreeNode> topRoots = new ArrayList<>();
        topRoots.add(root);
        return topRoots;
    }
}
