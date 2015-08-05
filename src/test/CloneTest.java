import org.junit.Test;
import org.tangsi.util.CloneUtil;
import org.tangsi.video.entity.VideoTreeNode;

/**
 * created by tangsi 2015/8/5
 */
public class CloneTest {

    @Test
    public void test1() {
        VideoTreeNode node = new VideoTreeNode();
        node.setId(1);
        VideoTreeNode copy  = CloneUtil.clone(node);
        System.out.println(copy.getId());
    }

}
