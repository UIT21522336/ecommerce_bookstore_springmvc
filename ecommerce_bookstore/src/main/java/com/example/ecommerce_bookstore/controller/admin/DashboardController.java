package com.example.ecommerce_bookstore.controller.admin;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class DashboardController {
    private final UserService userService;
    private final ProductService productService;
    private final OrderService orderService;
    private final OrderDetailService orderDetailService;

    public DashboardController(UserService userService, ProductService productService, OrderService orderService,
            OrderDetailService orderDetailService) {
        this.userService = userService;
        this.productService = productService;
        this.orderService = orderService;
        this.orderDetailService = orderDetailService;
    }

    @GetMapping("/admin")
    public String getDashboardPage(Model model) {
        List<Order> orders = this.orderService.getAll();
        model.addAttribute("orders", orders);
        return "admin/dashboard/dashboard";
    }

    @GetMapping("/admin/orders/{id}")
    public String getOrderDetailPage(@PathVariable("id") long id, Model model) {
        Order order = this.orderService.getById(id);
        List<OrderDetail> listOrderDetails = this.orderDetailService.getByOrder(order);
        model.addAttribute("order", order);
        model.addAttribute("listOrderDetails", listOrderDetails);
        return "admin/orders/update-detail";
    }

    @PostMapping("/admin/orders/update")
    public String updateOrder(@RequestParam("orderId") long orderId, @RequestParam("orderStatus") String orderStatus,
            @RequestParam("paymentStatus") Optional<String> paymentStatus) {
        Order order = this.orderService.getById(orderId);
        order.setStatus(orderStatus);
        if (paymentStatus.isPresent()) {
            order.setPaymentStatus(paymentStatus.get());
        }
        this.orderService.update(order);
        return "redirect:/admin";
    }

    @GetMapping("/admin/users")
    public String getUsersPage(Model model) {
        List<User> users = this.userService.getAll();
        model.addAttribute("users", users);
        return "admin/users/table";
    }

    @GetMapping("/admin/products")
    public String getProductsPage(Model model) {
        List<Product> products = this.productService.getAll();
        model.addAttribute("products", products);
        return "admin/products/table";
    }

}
