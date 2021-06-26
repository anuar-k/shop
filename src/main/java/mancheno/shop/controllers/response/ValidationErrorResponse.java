package mancheno.shop.controllers.response;

import lombok.Data;
import org.springframework.validation.ObjectError;

import java.util.List;
import java.util.Map;

public @Data
class ValidationErrorResponse {

    private final List<String> globalErrors;

    private final Map<String, List<String>> fieldError;

    public ValidationErrorResponse(List<String> globalErrors, Map<String, List<String>> fieldError) {
        this.globalErrors = globalErrors;
        this.fieldError = fieldError;
    }
}