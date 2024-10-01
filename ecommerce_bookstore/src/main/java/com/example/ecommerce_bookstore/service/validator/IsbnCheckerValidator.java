package com.example.ecommerce_bookstore.service.validator;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

public class IsbnCheckerValidator implements ConstraintValidator<IsbnChecker, String> {
    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {
        return value.matches("^(\\d{10}|\\d{13})$");
    }
}
