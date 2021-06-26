package mancheno.shop.controllers.response;

import lombok.Data;
import mancheno.shop.entity.Product;
import mancheno.shop.entity.User;

import java.util.List;

@Data
public class OrderResponse {
    private List<Product> products;
    private Integer totalCount;
    private Double totalPrice;
    private User user;

    public OrderResponse(List<Product> products, Double totalPrice, User user,Integer totalCount) {
        this.products = products;
        this.totalPrice = totalPrice;
        this.user = user;
        this.totalCount = totalCount;
    }
}