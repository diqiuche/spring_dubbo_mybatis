package org.tangsi.music.dao.mapper;

import org.tangsi.music.entity.Music;
import org.tangsi.video.entity.Video;

import java.util.List;

/**
 * created by tangsi 2015/7/30
 */
public interface MusicMapper {

    public List<Video> getAllVideo();

    public Music getByPrimaryId(long videoid);

    List<Music> getAllMusic();
}
