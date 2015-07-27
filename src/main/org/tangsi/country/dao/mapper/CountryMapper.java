package org.tangsi.country.dao.mapper;

import org.tangsi.country.entity.Country;

/**
 * created by tangsi 2015/7/27
 */
public interface CountryMapper {


    public Country getCountryWithUser(Long countryId);

    public Country selectCountry(Long countryId);


}
