package fastjson;

import com.alibaba.fastjson.JSON;
import org.junit.Test;
import org.tangsi.user.entity.User;

/**
 * created by tangsi 2015/7/24
 */
public class FastJsonTest {

    @Test
    public void test1() {
        User user = new User();
        user.setEmail("163");
        user.setName("徐小平");
        String json = JSON.toJSONString(user);
        System.out.println(json);
    }

}
