package org.tangsi.service;

import com.github.pagehelper.Page;
import org.tangsi.entity.User;

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

    public Page<User> listPage(Page<User> page);

    /**
     * 指定表名变量与字段变量的查询
     * @param paramMap
     * @return
     */
    public User selectWithParamMap(Map<String, Object> paramMap);
}
