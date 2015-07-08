package org.tangsi.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.tangsi.entity.User;
import org.tangsi.dao.mapper.UserMapper;
import org.tangsi.service.UserService;

import java.util.List;
import java.util.Map;

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

    @Override
    public User getUserWithOrdersById(long id) {
        return this.userMapper.getUserWithOrdersByPrimaryKey(id);
    }

    @Override
    public int insert(User user) {
        return this.userMapper.insert(user);
    }

    @Override
    public int saveBatch(List<User> users) {
        return  this.userMapper.insertBatch(users);
    }

    @Override
    public Page<User> listPage(Page<User> page) {
        page = PageHelper.startPage(page.getPageNum(), page.getPageSize(), true);
        List<User> users = this.userMapper.selectAll();
        return page;
    }

    @Override
    public User selectWithParamMap(Map<String, Object> paramMap) {
        return this.userMapper.selectWithParamMap(paramMap);
    }

}
