package mancheno.shop.repository.specs;

import mancheno.shop.entity.Product;
import mancheno.shop.entity.Value;
import org.springframework.data.jpa.domain.Specification;

import javax.persistence.criteria.Join;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Predicate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ProductSpecs {
    public static Specification<Product> priceBetween(Double from, Double to) {
        return (root, criteria, builder) -> builder.between(root.get("price"), from, to);
    }

    public static Specification<Product> byAll(Long categoryId, String name, Double from,
                                               Double to, Map<Long, String> optionIdToValue) {
        return (root, criteria, builder) -> {
            List<Predicate> predicates = new ArrayList<>();
            if (categoryId != null) {
                predicates.add(builder.equal(root.get("category").get("id"), categoryId));
            }
            if (name != null) {
                predicates.add(builder.like(root.get("name"), "%" + name + "%"));
            }

            if (from != null) {
                predicates.add(builder.greaterThanOrEqualTo(root.get("price"), from));
            }

            if (to != null) {
                predicates.add(builder.lessThanOrEqualTo(root.get("price"), to));
            }
            if (!optionIdToValue.isEmpty()) {
                for (Map.Entry<Long, String> entry: optionIdToValue.entrySet()) {
                    Join<Product, Value> join = root.join("values", JoinType.INNER);
                    join.on(
                            builder.equal(join.get("option").get("id"), entry.getKey()),
                            builder.equal(join.get("value"), entry.getValue())
                    );
//                    predicates.add(builder.equal(root.get("category").get("id"), entry.getKey()));
                }
            }
            return builder.and(predicates.toArray(new Predicate[0]));
        };
    }

}
