package org.tangsi.util.mvc;

import org.tangsi.user.entity.User;

import java.util.List;
import java.util.Map;

/**
 * 与webix查件交互的分页器
 * created by tangsi 2015/8/4
 */
public class WebIXPager {

    private Map<String, String> sort;

    private List<User> data;

    private long pos;

    private long total_count;

    public List<User> getData() {
        return data;
    }

    public void setData(List<User> data) {
        this.data = data;
    }

    public long getPos() {
        return pos;
    }

    public void setPos(long pos) {
        this.pos = pos;
    }

    public long getTotal_count() {
        return total_count;
    }

    public void setTotal_count(long total_count) {
        this.total_count = total_count;
    }

    public Map<String, String> getSort() {
        return sort;
    }

    public void setSort(Map<String, String> sort) {
        this.sort = sort;
    }
}
