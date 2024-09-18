package com.example.ecommerce_bookstore.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import java.util.List;

import com.example.ecommerce_bookstore.domain.User;
import com.example.ecommerce_bookstore.service.UserService;

@Controller
public class DashboardController {
    public UserService userService;

    public DashboardController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/admin")
    public String getDashboardPage() {
        return "admin/dashboard/dashboard";
    }

    @GetMapping("/admin/users")
    public String getUsersPage(Model model) {
        List<User> users = this.userService.getAllUser();
        model.addAttribute("users", users);
        return "admin/users/table";
    }

}
