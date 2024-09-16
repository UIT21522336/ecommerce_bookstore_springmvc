package com.example.ecommerce_bookstore.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.ecommerce_bookstore.domain.User;
import com.example.ecommerce_bookstore.domain.dto.UserDTO;
import com.example.ecommerce_bookstore.service.UserService;

@Controller
public class UserController {
    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    // View user detail
    @GetMapping("/admin/users/detail/{id}")
    public String getDetailUserPage(@PathVariable("id") long id) {
        return "admin/users/detail";
    }

    // View create user page
    @GetMapping("/admin/users/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("userDTO", new UserDTO());
        return "admin/users/create";
    }

    // Create user
    @PostMapping("/admin/users/create")
    public String postCreateUser(@ModelAttribute("userDTO") UserDTO userDTO) {
        User user = new User();
        user = this.userService.userDtoToUser(userDTO);
        user = this.userService.createUser(user);
        return "redirect:/admin/users";
    }

    // View update user page
    @GetMapping("/admin/users/update/{id}")
    public String getUpdateUserPage(@PathVariable("id") long id) {
        return "admin/users/update";
    }
}
