package org.tangsi.video.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.tangsi.video.dao.mapper.VideoMapper;
import org.tangsi.video.entity.Video;
import org.tangsi.video.service.VideoService;

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
}
