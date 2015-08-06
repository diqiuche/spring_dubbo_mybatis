package org.tangsi.video.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.tangsi.video.dao.mapper.VideoCategoryMapper;
import org.tangsi.video.dao.mapper.VideoMapper;
import org.tangsi.video.entity.Video;
import org.tangsi.video.entity.VideoCategory;
import org.tangsi.video.entity.VideoTreeNode;
import org.tangsi.video.service.VideoCategoryService;

import java.util.ArrayList;
import java.util.List;

/**
 * created by tangsi 2015/7/29
 */
@Repository("videoCategoryServiceImpl")
public class VideoCategoryServiceImpl implements VideoCategoryService {

    @Autowired
    private VideoCategoryMapper videoCategoryMapper;

    @Autowired
    private VideoMapper videoMapper;

    @Override
    public List<VideoCategory> getAllCategory() {
        return this.videoCategoryMapper.getAll();
    }

    @Override
    public List<VideoTreeNode> buildVideoTree(boolean isEasyUITree) {
        List<VideoTreeNode> data = new ArrayList<>();
        VideoCategory rootCategory = this.buildCategoryInTree();
        List<Video> allVideo = this.videoMapper.getAllVideo();
        VideoTreeNode rootCategoryTreeNode = new VideoTreeNode(rootCategory.getId(), VideoTreeNode.VIDEO_FLAG_NOT, rootCategory.getName(), "open", rootCategory.getIconCls());
        this.buildVideoTreeRecursive(rootCategoryTreeNode, rootCategory.getChildren(), allVideo, isEasyUITree);

        data.add(rootCategoryTreeNode);
        return data;
    }

    @Override
    public void add(VideoCategory category) {
        this.videoCategoryMapper.save(category);
    }

    private void buildVideoTreeRecursive(VideoTreeNode rootCategoryTreeNode, List<VideoCategory> children, List<Video> videos, boolean isEasyUITree) {
        List<VideoTreeNode> treeNodes = new ArrayList<>();
        //构建视频分类下的视频
        for(Video video : videos) {
            if(video.getVideoCategoryId() == rootCategoryTreeNode.getId()) {
                VideoTreeNode node = new VideoTreeNode(video.getId(), VideoTreeNode.VIDEO_FLAG_YES, video.getName() , "open" , video.getIconCls());
                treeNodes.add(node);
            }
        }
        //构建视频分类下的子分类
        for(VideoCategory category : children) {
            VideoTreeNode node = new VideoTreeNode(category.getId(), VideoTreeNode.VIDEO_FLAG_NOT, category.getName(), "open", category.getIconCls());
            treeNodes.add(node);
            this.buildVideoTreeRecursive(node, category.getChildren(), videos, isEasyUITree);
        }

        if(!treeNodes.isEmpty())  //有子节点时才设置子节点
            rootCategoryTreeNode.setChildren(treeNodes, isEasyUITree);
    }

    /**
     * 返回视频分类的根节点，并填充好每个节点的子节点children属性
     * @return
     */
    public VideoCategory buildCategoryInTree() {
        List<VideoCategory> categories = this.getAllCategory();
        VideoCategory root = null;
        //首先找到根节点
        for(VideoCategory category : categories) {
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
    public void buildCategoryRecursive(VideoCategory parent, List<VideoCategory> data) {

        List<VideoCategory> children = new ArrayList<>();

        for(VideoCategory category : data) {
            if(category.getPid() == parent.getId()) {
                children.add(category);
            }
        }
        parent.setChildren(children);
        if(!parent.getChildren().isEmpty()) {
            for(VideoCategory child : parent.getChildren()) {
                this.buildCategoryRecursive(child, data);
            }
        }
    }

}
