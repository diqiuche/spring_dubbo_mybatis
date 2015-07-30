package org.tangsi.music.dao.mapper;

import org.tangsi.music.entity.MusicCategory;

import java.util.List;

/**
 * created by tangsi 2015/7/30
 */
public interface MusicCategoryMapper {

    public List<MusicCategory> getAll();

    public void save(MusicCategory category);

}
