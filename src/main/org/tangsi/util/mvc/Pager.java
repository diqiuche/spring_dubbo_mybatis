package org.tangsi.util.mvc;

import java.util.List;

/**
 * 这个分页对象被序列化成json后可以与jquery easyui的分页联动
 * created by tangsi 2015/7/23
 */
public class Pager<T> {

    /**
     * 分页的数据
     */
    private List<T> rows;

    /**
     * 总记录数
     */
    private long total;

    /**
     * 第几页, index starts with 1
     */
    private int page;

    /**
     * 页面记录大小
     */
    private int pageSize;

    /**
     * 排序字段
     */
    private String sort;

    /**
     * 排序方向：asc or desc
     */
    private String order;


    public String getOrder() {
        return order;
    }

    public void setOrder(String order) {
        this.order = order;
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public List<T> getRows() {
        return rows;
    }

    public void setRows(List<T> rows) {
        this.rows = rows;
    }

    public long getTotal() {
        return total;
    }

    public void setTotal(long total) {
        this.total = total;
    }
}
