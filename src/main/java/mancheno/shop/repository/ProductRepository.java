package mancheno.shop.repository;

import mancheno.shop.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Long> , JpaSpecificationExecutor<Product> {
    List<Product> findProductByCategoryId(Long categoryId);

    List<Product> findProductByNameContains(String name);
    List<Product> findUniqueProductByNameContains(String name);

    List<Product> findProductByPriceAfter(Double price);

    List<Product> findProductByPriceBefore(Double price);

    List<Product> findAllByPriceAfterAndPriceBefore(Double minPrice, Double maxPrice);

    List<Product> findAllByNameContainsAndPriceAfterAndPriceBefore(String name, Double minPrice, Double maxPrice);

    List<Product> findAllByCategoryIdAndNameContainsAndPriceAfterAndPriceBefore(Long id, String name, Double minPrice, Double maxPrice);

    List<Product> findAllByCategoryIdAndPriceAfterAndPriceBefore(Long id, Double minPrice, Double maxPrice);

    boolean existsByName(String name);
}