package com.example.ecommerce_bookstore.controller.client;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

import com.example.ecommerce_bookstore.domain.Order;
import com.example.ecommerce_bookstore.domain.OrderDetail;
import com.example.ecommerce_bookstore.domain.Order_;
import com.example.ecommerce_bookstore.domain.Product;
import com.example.ecommerce_bookstore.domain.User;
import com.example.ecommerce_bookstore.domain.dto.RegisterUserDTO;
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
        Pageable pageable_justAnnounced = PageRequest.of(0, 4);
        Page<Product> pageJustAnnounced_products = this.productService.getJustAnnounced(pageable_justAnnounced);
        List<Product> listJustAnnounced_products = pageJustAnnounced_products.getContent();
        List<Product> products = this.productService.getTop4ByOrderByIdAsc();
        model.addAttribute("products", products);
        model.addAttribute("justAnnounced_products", listJustAnnounced_products);
        model.addAttribute("bestFiction_products", products);
        model.addAttribute("bestNonFiction_products", products);
        return "client/homepage/homepage";
    }

    @GetMapping("/home/{title}")
    public String getJustAnnouncedPage(@PathVariable("title") String title,
            @RequestParam("page") Optional<String> currentPage,
            Model model) {

        Pageable pageable = null;
        if (currentPage.isPresent()) {
            pageable = PageRequest.of(Integer.parseInt(currentPage.get()) - 1, 4);
            model.addAttribute("currentPage", currentPage);
        } else {
            pageable = PageRequest.of(0, 4);
            model.addAttribute("currentPage", 1);
        }

        Page<Product> pageProducts = new PageImpl<>(Collections.emptyList());
        if (title.equals("just-announced")) {
            pageProducts = this.productService.getJustAnnounced(pageable);
        }
        // else if(title.equals("best-fiction")){

        // }
        // else if(title.equals("best-non-fiction")){

        // }
        else {
            return "redirect:/";
        }
        List<Product> listProducts = pageProducts.getContent();
        model.addAttribute("products", listProducts);
        model.addAttribute("totalPages", pageProducts.getTotalPages());
        model.addAttribute("title", title);
        return "client/products/highlighted";
    }

    @GetMapping("/login")
    public String getLoginPage() {
        return "client/auth/login";
    }

    @GetMapping("/register")
    public String getRegisterPage(Model model) {
        model.addAttribute("registerUserDTO", new RegisterUserDTO());
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
        Pageable pageable = PageRequest.of(0, 3, Sort.by(Order_.ID).descending());
        if (currentPage.isPresent()) {
            pageable = PageRequest.of(Integer.valueOf(currentPage.get()) - 1, 3, Sort.by(Order_.ID).descending());
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
