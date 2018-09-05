package model;

import java.io.Serializable;

public class Page implements Serializable {

    private int page;
    private int limit;

    public int getIndex() {
        return (page - 1) * limit;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }
}
