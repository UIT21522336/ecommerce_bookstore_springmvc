package com.example.ecommerce_bookstore.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.ecommerce_bookstore.domain.dto.UserDTO;

@Controller
public class DashboardController {
    @GetMapping("/admin")
    public String getDashboardPage() {
        return "admin/dashboard/dashboard";
    }

    @GetMapping("/admin/users")
    public String getUsersPage() {
        return "admin/users/table";
    }

    
}
