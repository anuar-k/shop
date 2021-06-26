package mancheno.shop.validator;

import mancheno.shop.entity.Option;
import mancheno.shop.repository.OptionRepository;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import javax.persistence.EntityManager;
import java.util.List;

@Component
public class OptionValidator implements Validator {
    private final EntityManager entityManager;
    private final OptionRepository optionRepository;

    public OptionValidator(EntityManager entityManager, OptionRepository optionRepository) {
        this.entityManager = entityManager;
        this.optionRepository = optionRepository;
    }


    @Override
    public boolean supports(Class<?> clazz) {
        return Option.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        Option option = (Option) target;

    }
}
