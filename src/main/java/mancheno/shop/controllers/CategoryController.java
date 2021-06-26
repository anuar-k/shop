package mancheno.shop.controllers;

import mancheno.shop.controllers.response.PageDataResponse;
import mancheno.shop.controllers.response.ValidationErrorResponse;
import mancheno.shop.entity.Category;
import mancheno.shop.repository.OptionRepository;
import mancheno.shop.service.CategoryService;
import mancheno.shop.validator.CategoryValidator;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.*;

@RestController
@RequestMapping(path = "/categories")
public class CategoryController {
    private final CategoryService categoryService;
    private final OptionRepository optionRepository;
    private final CategoryValidator categoryValidator;

    public CategoryController(CategoryService categoryService, OptionRepository optionRepository, CategoryValidator categoryValidator) {
        this.categoryService = categoryService;
        this.optionRepository = optionRepository;
        this.categoryValidator = categoryValidator;
    }

    @GetMapping
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public PageDataResponse<Category> list(@RequestParam(name = "page", required = false) Integer pageId) {
        if (pageId == null) {
            return new PageDataResponse(categoryService.getAll(Pageable.unpaged()));
        } else {
            Integer currentPage = 0;
            if (pageId != null || pageId > 0) {
                currentPage = pageId - 1;
            }
            PageRequest pagable = PageRequest.of(currentPage, 3);
            Page<Category> categories = categoryService.getAll(pagable);
            return new PageDataResponse(categories);
        }
    }

    @InitBinder
    public void initBinder(WebDataBinder webDataBinder) {
        webDataBinder.addValidators(categoryValidator);
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
    public void create(@Valid @RequestBody Category category) {
        categoryService.save(category);
    }
//        List<Option> options = category.getOptions();
//        for (int i = 0; i < options.size(); i++) {
//            if (options.contains(options.get(i).getName())) {
//                System.out.println("OPtion exists");
//                return;
//            }
//        }

//        return category;

//        ------------------------------------------------------------------------------
//        DataBinder binder = new DataBinder(category);
//        binder.addValidators(categoryValidator);
//        binder.validate();
//        BindingResult bindingResult = binder.getBindingResult();
//        List<FieldError> fieldErrors = bindingResult.getFieldErrors();
//        for (FieldError fieldError : fieldErrors) {
//            System.out.println(
//                    fieldError.getField() + " ERROR " + fieldError.getDefaultMessage());
//        }
//    }

    @GetMapping(path = "/{id}")
    public Category getOne(@PathVariable Long id) {
        return categoryService.findById(id);
    }

    @PutMapping(path = "/{id}")
    public void update(@PathVariable Long id, @RequestBody Category category) {
        categoryService.update(id, category);
    }

    @DeleteMapping(path = "/{id}")
    public void remove(@PathVariable Long id) {
        categoryService.delete(id);
    }
}