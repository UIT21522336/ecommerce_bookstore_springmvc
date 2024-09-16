package com.example.ecommerce_bookstore.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

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
