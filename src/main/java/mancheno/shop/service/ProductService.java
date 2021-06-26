package mancheno.shop.service;

import mancheno.shop.controllers.response.PageDataResponse;
import mancheno.shop.entity.Product;
import mancheno.shop.repository.ProductRepository;
import org.springframework.data.domain.*;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ProductService {
    private final EntityManager entityManager;
    private final ProductRepository productRepository;

    public ProductService(EntityManager entityManager, ProductRepository productRepository) {
        this.entityManager = entityManager;
        this.productRepository = productRepository;
    }

    public Page<Product> getAll(Pageable pageable) {
        return productRepository.findAll(pageable);
    }

    public Page<Product> getAll(Map<String, String> params, Pageable pageable) {
        CriteriaBuilder builder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Product> query = builder.createQuery(Product.class);
        Root<Product> root = query.from(Product.class);
        List<Predicate> predicates = new ArrayList<>();

        if (params.containsKey("catregory_id")) {
            predicates.add(builder.equal(root.get("id"), params.get("id")));
            params.remove("catregory_id");
        }
        if (params.containsKey("name")) {
            predicates.add(builder.like(root.get("name"), "%" + params.get("name") + "%"));
            params.remove("name");
        }
        if (params.containsKey("maxPrice")) {
            predicates.add(builder.lessThan(root.get("price"), params.get("maxPrice")));
            params.remove("maxPrice");
        }
        if (params.containsKey("minPrice")) {
            predicates.add(builder.greaterThanOrEqualTo(root.get("price"), params.get("maxPrice")));
            params.remove("minPrice");
        }
//        for (String key : params.keySet()) {
//            Join<Product, Value> join = root.join("values");
//            long optionId = Long.parseLong(key.substring(key.lastIndexOf("_")));
//            join.on(
//                    builder.equal(join.get("option").get("id"), optionId),
//                    builder.equal(join.get("value"), optionId)
//            );
//        }

        query.where(predicates.toArray(new Predicate[0]));
        //Сортировка по price
        System.out.println("getSort: " + pageable.getSort());

        for (Sort.Order order : pageable.getSort()) {
            if (order.getDirection().isAscending()) {
                query.orderBy(builder.asc(root.get(order.getProperty())));
            }
            if (order.getDirection().isDescending()) {
                query.orderBy(builder.desc(root.get(order.getProperty())));
            }
        }

        List<Product> products = entityManager.createQuery(query).getResultList();
        int page = pageable.getPageNumber() + 1;
        int size = pageable.getPageSize();
        int startPageItem = (page - 1) * size;
        int itemsInOnePage = products.size() / size;



        if (itemsInOnePage < page) {
            return new PageImpl<>(
                    products.subList(startPageItem, products.size()),
                    PageRequest.of(page, size),
                    products.size()
            );
        }

        return new PageImpl(products.subList(startPageItem, page * size), PageRequest.of(page, size), products.size());
    }
}