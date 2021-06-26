package mancheno.shop.service;

import mancheno.shop.entity.Category;
import mancheno.shop.entity.Option;
import mancheno.shop.repository.CategoryRepository;
import mancheno.shop.repository.OptionRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryService {
    private final CategoryRepository categoryRepository;
    private final OptionRepository optionRepository;

    public CategoryService(CategoryRepository categoryRepository, OptionRepository optionRepository) {
        this.categoryRepository = categoryRepository;
        this.optionRepository = optionRepository;
    }

    public Page<Category> getAll(Pageable pageable) {
        return categoryRepository.findAll(pageable);
    }

    public void save(Category category) {
        categoryRepository.save(category);
        for (Option option : category.getOptions()) {
            option.setCategory(category);
            optionRepository.save(option);
        }
    }

    public Category findById(Long id) {
        return categoryRepository.findById(id).get();
    }

    public void update(Long id, Category category) {
        Category category1 = categoryRepository.findById(id).get();
        if (category.getName() != null) {
            category1.setName(category.getName());
        }
        categoryRepository.save(category1);
    }

    public void delete(Long id) {
        categoryRepository.deleteById(id);
    }
}
