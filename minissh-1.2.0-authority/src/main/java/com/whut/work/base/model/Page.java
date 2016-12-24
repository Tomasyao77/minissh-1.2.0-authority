package com.whut.work.base.model;

import java.util.List;

/**
 * @author luojinwei
 *         2013-12-2 10:31:23
 */
public class Page<T> {

    private int current = 1;
    private int total = 0;
    private long records = 0;
    private int size = 10;
    private String orderBy = "";
    private String order = "";

    public String getOrderBy() {
        return orderBy;
    }

    public void setOrderBy(String orderBy) {
        this.orderBy = orderBy;
    }

    public String getOrder() {
        return order;
    }

    public void setOrder(String order) {
        this.order = order;
    }

    private List<T> list = null;

    public Page() {

    }

    public Page(int currentPage, int pageSize){
    	current=currentPage;
    	size=pageSize;
	}

    public Page(List<T> list, int current, int size) {
        this.current = current;
        this.size = size;
        this.list = list;
    }
    
    public Page(List<T> list, long records, int current, int size, String orderBy, String order) {
        this.list = list;
        this.current = current;
        this.records = records;
        this.size = size;
        this.orderBy = orderBy;
        this.order = order;
        this.total = records == 0 ? 1 : (int) ((records - 1) / size + 1);//分几页的计算方法

        if (this.current > this.total) {
            this.current = this.total;
        }
        if (current < 1) {
            this.current = 1;
        }
    }

    public Page(List<T> list, long records, int current, int size) {
        this(list, records, current, size, null, null);
    }

    public int getCurrent() {
        return current;
    }

    public void setCurrent(int current) {
        this.current = current;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int l) {
        this.total = l;
    }

    public long getRecords() {
        return records;
    }

    public void setRecords(long records) {
        this.records = records;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    @Override
    public String toString() {
        return "Page{" +
                "current=" + current +
                ", size=" + size +
                ", list=" + list +
                '}';
    }
}
