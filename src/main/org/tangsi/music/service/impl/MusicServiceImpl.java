package org.tangsi.music.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.tangsi.music.dao.mapper.MusicMapper;
import org.tangsi.music.entity.Music;
import org.tangsi.music.service.MusicService;

import java.util.List;

/**
 * created by tangsi 2015/7/30
 */
@Repository("musicServiceImpl")
public class MusicServiceImpl implements MusicService{


    @Autowired
    private MusicMapper musicMapper;

    @Override
    public List<Music> getAllMusic() {
        return this.musicMapper.getAllMusic();
    }

    @Override
    public Music fetch(long musicid) {
        return this.musicMapper.getByPrimaryId(musicid);
    }

}
