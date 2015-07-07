package org.tangsi.dao.mapper;

import org.tangsi.entity.User;

public interface UserMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_user
     *
     * @mbggenerated Tue Jul 07 15:02:42 CST 2015
     */
    int deleteByPrimaryKey(Long id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_user
     *
     * @mbggenerated Tue Jul 07 15:02:42 CST 2015
     */
    int insert(User record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_user
     *
     * @mbggenerated Tue Jul 07 15:02:42 CST 2015
     */
    int insertSelective(User record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_user
     *
     * @mbggenerated Tue Jul 07 15:02:42 CST 2015
     */
    User selectByPrimaryKey(Long id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_user
     *
     * @mbggenerated Tue Jul 07 15:02:42 CST 2015
     */
    int updateByPrimaryKeySelective(User record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_user
     *
     * @mbggenerated Tue Jul 07 15:02:42 CST 2015
     */
    int updateByPrimaryKey(User record);

    /**
     * 查询用户及其关联的订单
     * @param id
     * @return
     */
    public User getUserWithOrdersByPrimaryKey(long id);
}