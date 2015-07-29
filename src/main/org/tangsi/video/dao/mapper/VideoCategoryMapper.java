package org.tangsi.video.dao.mapper;

import org.tangsi.video.entity.VideoCategory;

import java.util.List;

/**
 * created by tangsi 2015/7/29
 */
public interface VideoCategoryMapper {

    public List<VideoCategory> getAll();

    public void save(VideoCategory category);
}
