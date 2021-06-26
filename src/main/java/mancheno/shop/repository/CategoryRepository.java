package mancheno.shop.repository;

import mancheno.shop.entity.Category;
import mancheno.shop.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CategoryRepository  extends JpaRepository<Category, Long> {
        List<Category> findCategoryByName(String name);
        int countByName(String name);
        boolean existsByName(String name);
}