package mancheno.shop.controllers.response;

import lombok.Data;
import org.springframework.data.domain.Page;

import java.util.List;

public @Data
class PageDataResponse<T> {
    private final List<T> items;
    private final int totalPageCount;
    private final Long totalItemsCount;
    private final int itemsPerPage;
    private final int currentPage;

    public PageDataResponse(Page<T> page) {
        items = page.getContent();
        totalPageCount = page.getTotalPages();
        totalItemsCount = page.getTotalElements();
        itemsPerPage = page.getSize();
        currentPage = page.getNumber();
    }
}