package org.tangsi.music.service;

import org.tangsi.music.entity.Music;

import java.util.List;

/**
 * created by tangsi 2015/7/30
 */
public interface MusicService {

    public List<Music> getAllMusic();

    public Music fetch(long musicid);

}
