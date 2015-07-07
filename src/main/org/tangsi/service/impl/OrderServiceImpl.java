package org.tangsi.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.tangsi.dao.mapper.OrderMapper;
import org.tangsi.entity.Order;
import org.tangsi.service.OrderService;

import java.util.List;

/**
 * created by tangsi 2015/7/7
 */
@Repository("orderServiceImpl")
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderMapper orderMapper;

    @Override
    public Order getOrderById(long id) {
        return this.orderMapper.selectByPrimaryKey(id);
    }

    @Override
    public Order saveOrder(Order order) {
       // return this.orderMapper.insert(order);
        return null;
    }

    @Override
    public List<Order> getListByUserId(long userId) {
        return this.orderMapper.getListByUserId(userId);
    }
}
