package mancheno.shop.validator;

import mancheno.shop.entity.Category;
import mancheno.shop.entity.Option;
import mancheno.shop.repository.CategoryRepository;
import mancheno.shop.repository.OptionRepository;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import javax.persistence.EntityManager;
import java.util.List;

@Component
public class CategoryValidator implements Validator {
    private final EntityManager entityManager;
    private final CategoryRepository categoryRepository;
    private final OptionRepository optionRepository;

    public CategoryValidator(EntityManager entityManager, CategoryRepository categoryRepository, OptionRepository optionRepository) {
        this.entityManager = entityManager;
        this.categoryRepository = categoryRepository;
        this.optionRepository = optionRepository;
    }

    @Override
    public boolean supports(Class<?> clazz) {
        return Category.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        Category category = (Category) target;
        if (category.getName().length() < 5) {
            errors.rejectValue("name", "", "Название не может быть меньше 5 символов");
        }
        if (category.getName().startsWith("A")) {
            errors.rejectValue("name", "", "Название не должна начинаться на `A`");
        }
        //
        if (categoryRepository.countByName(category.getName()) > 0) {
            errors.rejectValue("name", "", "Категория существует в таблице");
        }
        List<Option> options = category.getOptions();
        boolean isContain = false;
        for (int i = 0; !isContain && i < options.size(); i++) {
            Option first = options.get(i);
            for (int j = i + 1; j < options.size(); j++) {
                Option second = options.get(j);
                if (first.getName().equals(second.getName())) {
                    errors.reject("", "Одинаковые значения option");
                    isContain = true;
                    break;
                }
            }
        }
    }
}