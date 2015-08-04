package org.tangsi.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.tangsi.order.dao.mapper.OrderMapper;
import org.tangsi.order.entity.Order;
import org.tangsi.service.UserService;
import org.tangsi.user.dao.mapper.UserMapper;
import org.tangsi.user.entity.User;

import java.util.List;
import java.util.Map;

/**
 * created by tangsi 2015/7/6
 */
@Repository("userServiceImpl")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private OrderMapper orderMapper;

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
    public Page<User> listPage(Page<User> page, Map<String, String> conditionMap) {
        page = PageHelper.startPage(page.getPageNum(), page.getPageSize(), true);
        List<User> users = this.userMapper.selectAll(conditionMap);
        return page;
    }

    @Override
    public User selectWithParamMap(Map<String, Object> paramMap) {
        return this.userMapper.selectWithParamMap(paramMap);
    }

    @Override
    public void saveRelatedTwoTabls(boolean flag) {
        User user = new User();
        user.setName("huangye");
        user.setEmail("email_huangye");
        user.setPhone("13578974587");
        this.userMapper.insert(user);

        Order order = new Order();
        order.setName("huangyedingdan");
        order.setCreatetime(4787888L);
        order.setUserid(user.getId());

        this.orderMapper.insert(order);

        //spring配置了对service方法的拦截，如果有方法中抛出异常，则前面插入的两条记录都不会被写入，因为事务被回滚
        if(flag) {
            throw new RuntimeException("事务出错");
        }
    }

    /**
     * 查询用户，及用户关联的博客，及博客关联的评论
     * @return
     */
    @Override
    public List<User> getUserWithBlogAndComment() {
        return this.userMapper.getUserWithBlogAndComment();
    }

    @Override
    public User findByUsernameAndPwd(Map<String, String> param) {
        return this.userMapper.findByUsernameAndPwd(param);
    }

    /**
     * 更新用户信息
     * @param user
     * @return
     */
    public int update(User user) {
        return  this.userMapper.updateByPrimaryKey(user);
    }

    @Override
    public List<User> getAllUser() {
        return this.userMapper.queryAllUser();
    }

}
