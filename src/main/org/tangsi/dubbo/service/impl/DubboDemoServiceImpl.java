package org.tangsi.dubbo.service.impl;

import org.tangsi.dubbo.service.DubboDemoService;

/**
 * created by tangsi 2015/7/17
 */
public class DubboDemoServiceImpl implements DubboDemoService {
    @Override
    public String getResponse(String name) {
        System.out.println("name = " + name);
        return "hello, " + name;
    }
}
