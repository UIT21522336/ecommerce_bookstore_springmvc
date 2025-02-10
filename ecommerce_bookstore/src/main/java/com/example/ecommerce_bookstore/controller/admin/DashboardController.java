package com.example.ecommerce_bookstore.controller.admin;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;
import java.util.Optional;

import com.example.ecommerce_bookstore.domain.Order;
import com.example.ecommerce_bookstore.domain.OrderDetail;
import com.example.ecommerce_bookstore.domain.Order_;
import com.example.ecommerce_bookstore.domain.Product;
import com.example.ecommerce_bookstore.domain.Product_;
import com.example.ecommerce_bookstore.domain.User;
import com.example.ecommerce_bookstore.domain.User_;
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
    public String getDashboardPage(Model model, @RequestParam("page") Optional<String> currentPage) {
        Pageable pageable = null;
        if (currentPage.isEmpty()) {
            pageable = PageRequest.of(0, 10, Sort.by(Order_.ID).descending());
            model.addAttribute("currentPage", 1);
        } else {
            pageable = PageRequest.of(Integer.parseInt(currentPage.get()) - 1, 10, Sort.by(Order_.ID).descending());
            model.addAttribute("currentPage", Integer.parseInt(currentPage.get()));
        }
        Page<Order> pageOrders = this.orderService.getAll(pageable);
        List<Order> orders = pageOrders.getContent();
        model.addAttribute("orders", orders);
        model.addAttribute("totalPages", pageOrders.getTotalPages());
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
    public String getUsersPage(Model model, @RequestParam("page") Optional<String> currentPage) {
        Pageable pageable = null;
        if (currentPage.isEmpty()) {
            pageable = PageRequest.of(0, 10, Sort.by(User_.ID).descending());
            model.addAttribute("currentPage", 1);
        } else {
            pageable = PageRequest.of(Integer.parseInt(currentPage.get()) - 1, 10, Sort.by(User_.ID).descending());
            model.addAttribute("currentPage", Integer.parseInt(currentPage.get()));
        }
        Page<User> pageUsers = this.userService.getAll(pageable);
        List<User> users = pageUsers.getContent();
        model.addAttribute("users", users);
        model.addAttribute("totalPages", pageUsers.getTotalPages());
        return "admin/users/table";
    }

    @GetMapping("/admin/products")
    public String getProductsPage(Model model, @RequestParam("page") Optional<String> currentPage) {
        Pageable pageable = null;
        if (currentPage.isEmpty()) {
            pageable = PageRequest.of(0, 10, Sort.by(Product_.ID).descending());
            model.addAttribute("currentPage", 1);
        } else {
            pageable = PageRequest.of(Integer.parseInt(currentPage.get()) - 1, 10, Sort.by(Product_.ID).descending());
            model.addAttribute("currentPage", Integer.parseInt(currentPage.get()));
        }
        Page<Product> pageProducts = this.productService.getAll(pageable);
        List<Product> products = pageProducts.getContent();
        model.addAttribute("products", products);
        model.addAttribute("totalPages", pageProducts.getTotalPages());
        return "admin/products/table";
    }

}
