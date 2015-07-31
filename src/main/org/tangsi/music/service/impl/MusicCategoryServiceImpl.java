package org.tangsi.music.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.tangsi.music.dao.mapper.MusicCategoryMapper;
import org.tangsi.music.dao.mapper.MusicMapper;
import org.tangsi.music.entity.Music;
import org.tangsi.music.entity.MusicCategory;
import org.tangsi.music.entity.MusicTreeNode;
import org.tangsi.music.service.MusicCategoryService;

import java.util.ArrayList;
import java.util.List;

/**
 * created by tangsi 2015/7/30
 */
@Repository("musicCategoryServiceImpl")
public class MusicCategoryServiceImpl implements MusicCategoryService {

    @Autowired
    private MusicCategoryMapper musicCategoryMapper;

    @Autowired
    private MusicMapper musicMapper;

    @Override
    public List<MusicCategory> getAllCategory() {
        return this.musicCategoryMapper.getAll();
    }

    @Override
    public List<MusicTreeNode> buildMusicTree() {
        List<MusicTreeNode> data = new ArrayList<>();
        MusicCategory rootCategory = this.buildCategoryInTree();
        List<Music> allVideo = this.musicMapper.getAllMusic();
        MusicTreeNode rootCategoryTreeNode = new MusicTreeNode(rootCategory.getId(), MusicTreeNode.VIDEO_FLAG_NOT, rootCategory.getName(), "open", rootCategory.getIconCls());
        this.buildMusicTreeRecursive(rootCategoryTreeNode, rootCategory.getChildren(), allVideo);

        data.add(rootCategoryTreeNode);
        return data;
    }

    @Override
    public void add(MusicCategory category) {
        this.musicCategoryMapper.save(category);
    }

    private void buildMusicTreeRecursive(MusicTreeNode rootCategoryTreeNode, List<MusicCategory> children, List<Music> musics) {
        List<MusicTreeNode> treeNodes = new ArrayList<>();
        //构建视频分类下的视频
        for(Music music : musics) {
            if(music.getMusicCategoryId() == rootCategoryTreeNode.getId()) {
                MusicTreeNode node = new MusicTreeNode(music.getId(), MusicTreeNode.MUSIC_FLAG_YES, music.getName() , "open" , music.getIconCls());
                treeNodes.add(node);
            }
        }
        //构建视频分类下的子分类
        for(MusicCategory category : children) {
            MusicTreeNode node = new MusicTreeNode(category.getId(), MusicTreeNode.MUSIC_FLAG_YES, category.getName(), "open", category.getIconCls());
            treeNodes.add(node);
            this.buildMusicTreeRecursive(node, category.getChildren(), musics);
        }

        rootCategoryTreeNode.setChildren(treeNodes);
    }

    /**
     * 返回视频分类的根节点，并填充好每个节点的子节点children属性
     * @return
     */
    public MusicCategory buildCategoryInTree() {
        List<MusicCategory> categories = this.getAllCategory();
        MusicCategory root = null;
        //首先找到根节点
        for(MusicCategory category : categories) {
            if(1 == category.getId()) {
                root = category;
                break;
            }
        }

        this.buildCategoryRecursive(root, categories);
        return root;
    }

    /**
     * 递归填充每个VideoCategory 的子节点
     * @param parent
     * @param data
     */
    public void buildCategoryRecursive(MusicCategory parent, List<MusicCategory> data) {

        List<MusicCategory> children = new ArrayList<>();

        for(MusicCategory category : data) {
            if(category.getPid() == parent.getId()) {
                children.add(category);
            }
        }
        parent.setChildren(children);
        if(!parent.getChildren().isEmpty()) {
            for(MusicCategory child : parent.getChildren()) {
                this.buildCategoryRecursive(child, data);
            }
        }
    }
}
