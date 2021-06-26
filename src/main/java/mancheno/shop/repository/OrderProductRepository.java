package mancheno.shop.repository;

import mancheno.shop.entity.OrderProduct;
import mancheno.shop.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OrderProductRepository extends JpaRepository<OrderProduct, Long> {

    List<OrderProduct> findOrderProductByProductId(Long categoryId);
//
//    List<OrderProduct> findProductByNameContains(String name);
//
//    List<OrderProduct> findProductByPriceAfter(Double price);
//
//    List<OrderProduct> findProductByPriceBefore(Double price);
//
//    List<OrderProduct> findAllByPriceAfterAndPriceBefore(Double minPrice, Double maxPrice);
//
//    List<OrderProduct> findAllByNameContainsAndPriceAfterAndPriceBefore(String name, Double minPrice, Double maxPrice);
//
//    List<OrderProduct> findAllByCategoryIdAndNameContainsAndPriceAfterAndPriceBefore(Long id, String name, Double minPrice, Double maxPrice);
//
//    List<OrderProduct> findAllByCategoryIdAndPriceAfterAndPriceBefore(Long id, Double minPrice, Double maxPrice);
//
//    boolean existsByName(String name);
}