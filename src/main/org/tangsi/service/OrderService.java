package org.tangsi.service;

import org.tangsi.order.entity.Order;

import java.util.List;

/**
 * created by tangsi 2015/7/7
 */
public interface OrderService {

    public Order getOrderById(long id);

    public Order saveOrder(Order order);

    public List<Order> getListByUserId(long userId);

}
