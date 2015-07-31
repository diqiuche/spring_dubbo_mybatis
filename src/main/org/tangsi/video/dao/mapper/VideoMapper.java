package org.tangsi.video.dao.mapper;

import org.tangsi.video.entity.Video;

import java.util.List;

/**
 * created by tangsi 2015/7/29
 */
public interface VideoMapper {

    public List<Video> getAllVideo();

    public Video getByPrimaryId(long videoid);

    public void save(Video video);

    public void deleteByPrimaryId(long videoId);
}
