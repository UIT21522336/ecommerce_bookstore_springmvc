package com.example.ecommerce_bookstore.service.validator;

import com.example.ecommerce_bookstore.domain.dto.UpdateUserDTO;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

public class UpdateUserValidator implements ConstraintValidator<ValidUpdateUser, UpdateUserDTO> {

    @Override
    public boolean isValid(UpdateUserDTO updateUserDTO, ConstraintValidatorContext context) {
        // Check password matching
        if (!updateUserDTO.getConfirmPassword().equals("") && !updateUserDTO.getConfirmPassword().equals(null)) {
            if (!updateUserDTO.getPassword().equals(updateUserDTO.getConfirmPassword())) {
                context.disableDefaultConstraintViolation();
                context
                        .buildConstraintViolationWithTemplate("Password must match")
                        .addPropertyNode("confirmPassword").addConstraintViolation();
                return false;
            }
        }
        return true;

    }

}
