package mancheno.shop.repository;

import mancheno.shop.entity.Option;
import mancheno.shop.entity.Order;
import mancheno.shop.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OrderRepository extends JpaRepository<Order, Long> {

//    List<Product> findAllProductsByOrder(Order order);
}
