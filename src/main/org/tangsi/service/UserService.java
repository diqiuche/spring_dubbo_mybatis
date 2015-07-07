package org.tangsi.service;

import org.tangsi.entity.User;

/**
 * Created by Administrator on 2015/7/6.
 */
public interface UserService {

    public User findById(long id);

    User getUserWithOrdersById(long id);
}
