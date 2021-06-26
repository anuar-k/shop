package mancheno.shop.controllers;

import mancheno.shop.controllers.response.PageDataResponse;
import mancheno.shop.controllers.response.ValidationErrorResponse;
import mancheno.shop.entity.Product;
import mancheno.shop.repository.ProductRepository;
import mancheno.shop.repository.specs.ProductSpecs;
import mancheno.shop.service.ProductService;
import mancheno.shop.validator.ProductValidator;
import org.springframework.data.domain.*;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.*;

@RestController
@RequestMapping(path = "/products")
public class ProductController {
    private final ProductValidator productValidator;
    private final ProductService productService;
    private final ProductRepository productRepository;

    public ProductController(ProductValidator productValidator, ProductService productService, ProductRepository productRepository) {
        this.productService = productService;
        this.productValidator = productValidator;
        this.productRepository = productRepository;
    }

//    @GetMapping
//    public List<Product> list(@RequestParam(name = "category_id", required = false) Long id,
//                              @RequestParam(required = false) String name,
//                              @RequestParam(name = "max_price", required = false) Double maxPrice,
//                              @RequestParam(name = "min_price", required = false) Double minPrice) {
//        if (id != null && name != null && minPrice != null && maxPrice != null) {
//            return productRepository.findAllByCategoryIdAndNameContainsAndPriceAfterAndPriceBefore(id, name, minPrice, maxPrice);
//        } else if (name != null && minPrice != null && maxPrice != null) {
//            return productRepository.findAllByNameContainsAndPriceAfterAndPriceBefore(name, minPrice, maxPrice);
//        } else if (id != null && minPrice != null && maxPrice != null) {
//            return productRepository.findAllByCategoryIdAndPriceAfterAndPriceBefore(id, minPrice, maxPrice);
//        } else if (minPrice != null && maxPrice != null) {
//            return productRepository.findAllByPriceAfterAndPriceBefore(minPrice, maxPrice);
//        } else if (id != null) {
//            return productRepository.findProductByCategoryId(id);
//        } else if (name != null) {
//            return productRepository.findProductByNameContains(name);
//        } else if (minPrice != null) {
//            return productRepository.findProductByPriceAfter(minPrice);
//        } else if (maxPrice != null) {
//            return productRepository.findProductByPriceBefore(maxPrice);
//        }
//        return productRepository.findAll();
//    }

//    @GetMapping
//    public List<Product> list(
//            @RequestParam(name = "category_id", required = false) Long id,
//            @RequestParam(required = false) String name,
//            @RequestParam(name = "max_price", required = false) Double maxPrice,
//            @RequestParam(name = "min_price", required = false) Double minPrice,
//            @RequestParam(name = "option", required = false) List<Long> options,
//            @RequestParam(name = "value", required = false) List<String> values
//    ) {
//
//        CriteriaBuilder builder = entityManager.getCriteriaBuilder();
//        CriteriaQuery<Product> query = builder.createQuery(Product.class);
//        Root<Product> root = query.from(Product.class);
//        List<Predicate> predicates = new ArrayList<>();
//
//        if (id != null) {
//            predicates.add(builder.equal(root.get("id"), id));
//        }
//        if (name != null) {
//            predicates.add(builder.like(root.get("name"), "%" + name + "%"));
//        }
//        if (maxPrice != null) {
//            predicates.add(builder.lessThan(root.get("price"), maxPrice));
//        }
//        if (minPrice != null) {
//            predicates.add(builder.greaterThanOrEqualTo(root.get("price"), minPrice));
//        }
//
//        if (values != null && options != null && !values.isEmpty() && !options.isEmpty()) {
//            for (int i = 0; i < values.size(); i++) {
//                Join<Product, Value> join = root.join("values", JoinType.INNER);
//                join.on(
//                        builder.equal(join.get("option").get("id"), options.get(i)),
//                        builder.equal(join.get("value"), values.get(i))
//                );
//            }
//        }
//        query.where(predicates.toArray(new Predicate[0]));
//        return entityManager.createQuery(query).getResultList();
//    }

    @GetMapping
    public PageDataResponse list(@RequestParam Map<String, String> params) {
        Integer page = null;
        Integer size = null;
        if (params.get("page") != null) {
            page = Integer.parseInt(params.get("page"));
            params.remove("page");
        }
        if (params.get("size") != null) {
            size = Integer.parseInt(params.get("size"));
            params.remove("size");
        }

        PageRequest pagable = null;
        if (page != null && size != null) {
            Integer currentPage = 0;
            if (params.containsKey("page") || page > 0) {
                currentPage = page - 1;
            }
            String sortType = params.get("sortType");
            String sortBy = params.get("sortBy");

            //test
            Map<String, String> sorts = new HashMap<>();
            sorts.put("name", "DESC");
            sorts.put("price", "ASC");

            if (true) {
                List<Sort.Order> orders = new ArrayList<>();
                for (Map.Entry<String, String> entry : sorts.entrySet()) {
                    if (entry.getValue().equals("ASC")) {
                        orders.add(Sort.Order.asc(entry.getKey()));
                    }
                    if (entry.getValue().equals("DESC")) {
                        orders.add(Sort.Order.desc(entry.getKey()));
                    }
                }
                pagable = PageRequest.of(currentPage, size, Sort.by(orders));
            }
//                else {
//                    pagable = PageRequest.of(currentPage, size, Sort.unsorted());
//                }


            //            if (sortType != null) {
//                    if (sortType.equals("ASC")) {
////                        pagable = PageRequest.of(currentPage, size, Sort.by(Sort.Order.asc(sortBy)));
//                        pagable = PageRequest.of(currentPage, size, Sort.by(orders));
//                    }
//                    if (sortType.equals("DESC")) {
////                        pagable = PageRequest.of(currentPage, size, Sort.by(Sort.Order.desc(sortBy)));
//                        pagable = PageRequest.of(currentPage, size, Sort.by(orders));
//                    }
//                pagable = PageRequest.of(currentPage, size, Sort.by(orders));
//            } else {
//                pagable = PageRequest.of(currentPage, size, Sort.unsorted());
//            }
            return new PageDataResponse(productService.getAll(params, pagable));
        } else {
            return new PageDataResponse(productService.getAll(params, Pageable.unpaged()));
        }
    }

    @GetMapping(path = "/spec")
    public List<Product> testSpecList() {
        Map<Long, String> options = new HashMap<>();
        options.put(1L, "Matris");
       return productRepository.findAll(ProductSpecs.byAll(1L, "a", 100.0, 20000.0,options));
    }

    @InitBinder
    public void initBinder(WebDataBinder webDataBinder) {
        webDataBinder.addValidators(productValidator);
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ValidationErrorResponse validationErrorsHandler(MethodArgumentNotValidException e) {
        List<FieldError> fieldErrors = e.getFieldErrors();
        List<ObjectError> globalErrorsEntries = e.getGlobalErrors();
        List<String> globalErrorsList = new ArrayList<>();
        Map<String, List<String>> fieldErrorList = new LinkedHashMap<>();
        //put field Errors
        for (FieldError fieldError : fieldErrors) {
            if (!fieldErrorList.containsKey(fieldError.getField())) {
                fieldErrorList.put(fieldError.getField(), new ArrayList<>());
            }
            fieldErrorList.get(fieldError.getField()).add(fieldError.getDefaultMessage());
        }
        //put global Errors
        for (ObjectError globalError : globalErrorsEntries) {
            globalErrorsList.add(globalError.getDefaultMessage());
        }
        return new ValidationErrorResponse(globalErrorsList, fieldErrorList);
    }

    @PostMapping
    public void create(@Valid @RequestBody Product product) {
//        productRepository.save(product);
    }
//
//        @GetMapping(path = "/{id}")
//        public Product getOne ( @PathVariable int id){
//            return null;
//        }
//
//        @PostMapping(path = "/{id}")
//        public void update ( @PathVariable int id, @RequestBody Product product){
//
//        }
//
//        @DeleteMapping(path = "/{id}")
//        public void remove ( @PathVariable int id){
//
//        }
}