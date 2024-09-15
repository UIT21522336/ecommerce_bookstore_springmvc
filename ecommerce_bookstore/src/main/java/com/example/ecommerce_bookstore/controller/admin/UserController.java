package com.example.ecommerce_bookstore.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.ecommerce_bookstore.domain.dto.UserDTO;

@Controller
public class UserController {
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

        return "redirect:/admin/users";
    }

    @GetMapping("/admin/users/update/{id}")
    public String getUpdateUserPage(@PathVariable("id") long id) {
        return "admin/users/update";
    }
}
