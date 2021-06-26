package mancheno.shop.controllers;

import mancheno.shop.controllers.response.OrderResponse;
import mancheno.shop.entity.*;
import mancheno.shop.repository.OrderProductRepository;
import mancheno.shop.repository.OrderRepository;
import mancheno.shop.repository.ProductRepository;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping(path = "/orders")
public class OrderController {
    private final OrderProductRepository orderProductRepository;
    private final OrderRepository orderRepository;
    private final ProductRepository productRepository;

    public OrderController(OrderProductRepository orderProductRepository, OrderRepository orderRepository, ProductRepository productRepository) {
        this.orderProductRepository = orderProductRepository;
        this.orderRepository = orderRepository;
        this.productRepository = productRepository;
    }

    @GetMapping
    public List<Category> list() {
        return Collections.emptyList();
    }

    // userId: ..
    // comment:
    //
    @PostMapping
    public void create(@RequestBody Order order) {
        for (OrderProduct orderProduct : order.getOrderProducts()) {
            orderProductRepository.save(orderProduct);
        }
    }

    // {
    //   "products": [{}, {}, {}...]
    //   "totalPrice": ???,
    //   "totalAmount": ???,
    //   "user": {}
    // }

    @GetMapping(path = "/{id}")
    public OrderResponse getOne(@PathVariable Long id) {
        Order order = orderRepository.getOne(id);
        List<OrderProduct> orderProducts = order.getOrderProducts();
//        List<Product> products = new ArrayList<>();
//        for (OrderProduct orderProduct : order.getOrderProducts()) {
//            products.add(orderProduct.getProduct());
//        }
        List<Product> products = order.getOrderProducts().stream().map(op -> op.getProduct()).collect(Collectors.toList());
        Double totalPrice = countProductPrice(orderProducts);
        User user = order.getUser();
        Integer totalCount = orderProducts.size();
        return new OrderResponse(products, totalPrice, user, totalCount);
    }

    private Double countProductPrice(List<OrderProduct> orderProducts) {
        double price = 0;
        for (OrderProduct orderProduct : orderProducts) {
            price += orderProduct.getCount() * orderProduct.getProduct().getPrice();
        }
        return price;
    }
//
//    {
//        "id": 1,
//        "order":{
//
//    }
//    }
    @PostMapping(path = "/{id}")
    public void update(@PathVariable int id, @RequestBody Order order) {

    }

//    "id"
    @DeleteMapping(path = "/{id}")
    public void remove(@PathVariable int id) {

    }
}