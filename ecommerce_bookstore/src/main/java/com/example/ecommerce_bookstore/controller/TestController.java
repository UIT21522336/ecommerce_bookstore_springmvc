package com.example.ecommerce_bookstore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {
    @GetMapping("/")
    public String getDashboardPage() {
        return "admin/dashboard/dashboard";
    }

}
