package com.example.ecommerce_bookstore.service.validator;

import org.springframework.stereotype.Service;

import com.example.ecommerce_bookstore.domain.dto.RegisterUserDTO;
import com.example.ecommerce_bookstore.service.UserService;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

@Service
public class RegisterUserValidator implements ConstraintValidator<ValidRegisterUser, RegisterUserDTO> {

    private final UserService userService;

    public RegisterUserValidator(UserService userService) {
        this.userService = userService;
    }

    @Override
    public boolean isValid(RegisterUserDTO registerUserDTO, ConstraintValidatorContext context) {
        // Check password matching
        if (!registerUserDTO.getPassword().equals(registerUserDTO.getConfirmPassword())) {
            context.disableDefaultConstraintViolation();
            context
                    .buildConstraintViolationWithTemplate("Password must match")
                    .addPropertyNode("confirmPassword").addConstraintViolation();
            return false;
        }
        // Check user existence
        if (this.userService.checkExistUserByEmail(registerUserDTO.getEmail()) == true) {
            context.disableDefaultConstraintViolation();
            context
                    .buildConstraintViolationWithTemplate("This email is already used")
                    .addPropertyNode("email").addConstraintViolation();
            return false;
        }
        return true;
    }

}
