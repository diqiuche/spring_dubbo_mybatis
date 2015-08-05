import org.junit.Test;
import org.tangsi.video.entity.VideoTreeNode;

import java.util.ArrayList;
import java.util.List;

/**
 * created by tangsi 2015/8/5
 */
public class RefferTest {

    @Test
    public void test1() {
        VideoTreeNode node = new VideoTreeNode(1, VideoTreeNode.VIDEO_FLAG_NOT, "视频", "open", "videoCls");
        List<VideoTreeNode> children = new ArrayList<>();
        children.add(new VideoTreeNode());


    }

}
