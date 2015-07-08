package org.tangsi.service;

import com.github.pagehelper.Page;
import org.tangsi.entity.User;

import java.util.List;

/**
 * Created by Administrator on 2015/7/6.
 */
public interface UserService {

    public User findById(long id);

    User getUserWithOrdersById(long id);

    public int insert(User user);

    public int saveBatch(List<User> users);

    public Page<User> listPage(Page<User> page);
}
