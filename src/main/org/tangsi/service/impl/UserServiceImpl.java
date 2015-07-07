package org.tangsi.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.tangsi.entity.User;
import org.tangsi.dao.mapper.UserMapper;
import org.tangsi.service.UserService;

/**
 * created by tangsi 2015/7/6
 */
@Repository("userServiceImpl")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public User findById(long id) {
        return this.userMapper.selectByPrimaryKey(id);
    }

}
