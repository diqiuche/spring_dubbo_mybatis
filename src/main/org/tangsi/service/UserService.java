package org.tangsi.service;

import com.github.pagehelper.Page;
import org.tangsi.user.entity.User;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2015/7/6.
 */
public interface UserService {

    public User findById(long id);

    User getUserWithOrdersById(long id);

    public int insert(User user);

    public int saveBatch(List<User> users);

    public Page<User> listPage(Page<User> page, Map<String, String> conditionMap);

    /**
     * 指定表名变量与字段变量的查询
     * @param paramMap
     * @return
     */
    public User selectWithParamMap(Map<String, Object> paramMap);

    public void saveRelatedTwoTabls(boolean flag);

    /**
     * 查询用户，及用户关联的博客，及博客关联的评论
     * @return
     */
    public List<User> getUserWithBlogAndComment();

    public User findByUsernameAndPwd(Map<String, String> param);

    /**
     * 更新用户信息
     * @param user
     * @return
     */
    public int update(User user);
}
