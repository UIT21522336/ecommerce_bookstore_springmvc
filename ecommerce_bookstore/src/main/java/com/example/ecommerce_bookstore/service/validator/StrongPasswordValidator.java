package com.example.ecommerce_bookstore.service.validator;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

public class StrongPasswordValidator implements ConstraintValidator<StrongPassword, String> {

    @Override
    public boolean isValid(String value,
            ConstraintValidatorContext context) {
        if (!value.equals("") && !value.equals(null)) {
            return value.matches("^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=!*()]).{8,}$");
        } else
            return true;
    }
}
