package com.example.ecommerce_bookstore.controller.client;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;
import java.util.Optional;

import com.example.ecommerce_bookstore.domain.Order;
import com.example.ecommerce_bookstore.domain.OrderDetail;
import com.example.ecommerce_bookstore.domain.Product;
import com.example.ecommerce_bookstore.domain.User;
import com.example.ecommerce_bookstore.service.OrderDetailService;
import com.example.ecommerce_bookstore.service.OrderService;
import com.example.ecommerce_bookstore.service.ProductService;
import com.example.ecommerce_bookstore.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomepageController {
    private final ProductService productService;
    private final UserService userService;
    private final OrderService orderService;
    private final OrderDetailService orderDetailService;

    public HomepageController(ProductService productService, UserService userService, OrderService orderService,
            OrderDetailService orderDetailService) {
        this.productService = productService;
        this.userService = userService;
        this.orderService = orderService;
        this.orderDetailService = orderDetailService;
    }

    @GetMapping("")
    public String getHomepage(Model model) {
        List<Product> products = this.productService.getTop4ByOrderByIdAsc();
        model.addAttribute("products", products);
        return "client/homepage/homepage";
    }

    @GetMapping("/login")
    public String getLoginPage() {
        return "client/auth/login";
    }

    @GetMapping("/register")
    public String getRegisterPage() {
        return "client/auth/register";
    }

    @GetMapping("/access-denied")
    public String getAccessDeniedPage() {
        return "client/auth/accessDenied";
    }

    @GetMapping("/order-history")
    public String getOrderHistoryPage(HttpServletRequest request, Model model,
            @RequestParam("page") Optional<String> currentPage) {
        HttpSession session = request.getSession(false);
        User user = this.userService.getById((long) session.getAttribute("user_id")).get();
        Pageable pageable = PageRequest.of(0, 3);
        if (currentPage.isPresent()) {
            pageable = PageRequest.of(Integer.valueOf(currentPage.get()) - 1, 3);
            model.addAttribute("currentPage", Integer.valueOf(currentPage.get()));
        } else {
            model.addAttribute("currentPage", 1);
        }
        Page<Order> pageOrders = this.orderService.getByUser(user, pageable);
        List<Order> orders = pageOrders.getContent();
        model.addAttribute("orders", orders);
        model.addAttribute("totalPages", pageOrders.getTotalPages());
        return "client/order/order-history";
    }

    @GetMapping("/order-history/{id}")
    public String getOrderDetailPage(@PathVariable("id") long id, Model model) {
        Order order = this.orderService.getById(id);
        List<OrderDetail> listOrderDetails = this.orderDetailService.getByOrder(order);
        model.addAttribute("order", order);
        model.addAttribute("listOrderDetails", listOrderDetails);
        return "client/order/order_detail-history";
    }

}
