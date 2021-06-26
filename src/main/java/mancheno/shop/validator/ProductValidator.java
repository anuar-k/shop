package mancheno.shop.validator;

import mancheno.shop.entity.Option;
import mancheno.shop.entity.Product;
import mancheno.shop.repository.OptionRepository;
import mancheno.shop.repository.ProductRepository;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import javax.persistence.EntityManager;

@Component
public class ProductValidator implements Validator {
    private final EntityManager entityManager;
    private final ProductRepository productRepository;

    public ProductValidator(EntityManager entityManager, ProductRepository productRepository) {
        this.entityManager = entityManager;
        this.productRepository = productRepository;
    }


    @Override
    public boolean supports(Class<?> clazz) {
        return Product.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        Product product = (Product) target;
        //category not exist

        if (!productRepository.existsById(product.getCategory().getId())) {
            errors.rejectValue("category","", "Категория не существует в таблице");
        }
    }
}
