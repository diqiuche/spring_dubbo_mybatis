package org.tangsi.country.service;

import org.tangsi.country.entity.Country;

/**
 * created by tangsi 2015/7/27
 */
public interface CountryService {

    /**
     * 关联查询
     * 查询国籍及其绑定的用户信息，一对一关系
     * @param countryId
     * @return
     */
    public Country getCountryWithUser(long countryId);

    public Country getCountryById(long id);

}
