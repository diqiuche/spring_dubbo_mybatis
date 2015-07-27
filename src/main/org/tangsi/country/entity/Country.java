package org.tangsi.country.entity;

import org.tangsi.user.entity.User;

/**
 * 国籍信息
 * created by tangsi 2015/7/27
 */
public class Country {

    private long id;

    /**
     * 外键，参考用户id
     */
    private long userId;

    /**
     * 国籍名称
     */
    private String countryName;

    private User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public String getCountryName() {
        return countryName;
    }

    public void setCountryName(String countryName) {
        this.countryName = countryName;
    }
}
