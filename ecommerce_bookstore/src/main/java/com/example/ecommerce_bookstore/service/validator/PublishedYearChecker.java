package com.example.ecommerce_bookstore.service.validator;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import jakarta.validation.Constraint;
import jakarta.validation.Payload;

@Constraint(validatedBy = PublishedYearCheckerValidator.class)
@Target({ ElementType.METHOD, ElementType.FIELD })
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface PublishedYearChecker {
    String message() default "Published year must be between 1900 and current year";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}
