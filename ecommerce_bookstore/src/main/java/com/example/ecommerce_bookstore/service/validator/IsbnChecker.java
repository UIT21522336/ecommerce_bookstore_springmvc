package com.example.ecommerce_bookstore.service.validator;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import jakarta.validation.Constraint;
import jakarta.validation.Payload;

@Constraint(validatedBy = IsbnCheckerValidator.class)
@Target({ ElementType.METHOD, ElementType.FIELD })
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface IsbnChecker {
    String message() default "ISBN must have 10 or 13 characters";

  Class<?>[] groups() default {};

  Class<? extends Payload>[] payload() default {};
}
