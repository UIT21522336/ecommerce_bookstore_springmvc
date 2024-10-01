package com.example.ecommerce_bookstore.service.validator;

import java.time.LocalDate;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

public class PublishedYearCheckerValidator implements ConstraintValidator<PublishedYearChecker, Integer> {
    @Override
    public boolean isValid(Integer value, ConstraintValidatorContext context) {
        int currentYear = LocalDate.now().getYear();
        if (value == null) {
            return false;
        }
        if (value >= 1900 && value <= currentYear) {
            return true;
        }
        return false;
    }
}
