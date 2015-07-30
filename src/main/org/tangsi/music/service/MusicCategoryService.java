package org.tangsi.music.service;

import org.tangsi.music.entity.MusicCategory;
import org.tangsi.music.entity.MusicTreeNode;

import java.util.List;

/**
 * created by tangsi 2015/7/30
 */
public interface MusicCategoryService {

    public List<MusicCategory> getAllCategory();

    /**
     * 构建视频树的父子结构数据
     * @return
     */
    public List<MusicTreeNode> buildMusicTree();


    public void add(MusicCategory category);
}
