package org.tangsi.country.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.tangsi.country.dao.mapper.CountryMapper;
import org.tangsi.country.entity.Country;
import org.tangsi.country.service.CountryService;

/**
 * created by tangsi 2015/7/27
 */
@Repository("countryServiceImpl")
public class CountryServiceImpl implements CountryService{

    @Autowired
    private CountryMapper countryMapper;

    /**
     * 关联查询
     * 查询国籍及其绑定的用户信息，一对一关系
     *
     * @param countryId
     * @return
     */
    @Override
    public Country getCountryWithUser(long countryId) {
        return this.countryMapper.getCountryWithUser(countryId);
    }

    @Override
    public Country getCountryById(long id) {
        return this.countryMapper.selectCountry(id);
    }


}
