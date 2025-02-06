package com.example.ecommerce_bookstore.controller.client;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.ecommerce_bookstore.domain.Cart;
import com.example.ecommerce_bookstore.domain.CartDetail;
import com.example.ecommerce_bookstore.domain.Product;
import com.example.ecommerce_bookstore.domain.User;
import com.example.ecommerce_bookstore.service.CartDetailService;
import com.example.ecommerce_bookstore.service.CartService;
import com.example.ecommerce_bookstore.service.ProductService;
import com.example.ecommerce_bookstore.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CartController {
    private final UserService userService;
    private final CartService cartService;
    private final CartDetailService cartDetailService;
    private final ProductService productService;

    public CartController(UserService userService, CartService cartService, CartDetailService cartDetailService,
            ProductService productService) {
        this.userService = userService;
        this.cartDetailService = cartDetailService;
        this.cartService = cartService;
        this.productService = productService;
    }

    // Get cart page
    @GetMapping("/cart")
    public String getCartPage(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession(false);
        User user = this.userService.getById((long) session.getAttribute("user_id")).get();
        Cart cart = this.cartService.getByUser(user);
        List<CartDetail> listCartDetails = this.cartDetailService.getByCart(cart);
        model.addAttribute("cart", cart);
        model.addAttribute("listCartDetails", listCartDetails);
        model.addAttribute("cartModel", new Cart());
        session.setAttribute("currentStockNotification", 0);
        return "client/cart/cart";
    }

    @PostMapping("/add-to-cart/{id}")
    public String addProductToCartFromPLP(@PathVariable("id") long id, HttpServletRequest request, Model model) {
        HttpSession session = request.getSession(false);
        Product product = this.productService.getById(id).get();
        int var = this.cartService.addToCartFromPLP(request, product);
        if (var == 1) {
            User user = this.userService.getById((long) session.getAttribute("user_id")).get();
            Cart cart = this.cartService.getByUser(user);
            List<CartDetail> listCartDetails = this.cartDetailService.getByCart(cart);
            model.addAttribute("cart", cart);
            model.addAttribute("listCartDetails", listCartDetails);
            model.addAttribute("product", product);
            session.setAttribute("currentStockNotification", 1);
            return "client/cart/cart";
        } else {
            return "redirect:/cart";
        }
    }

    @PostMapping("/add-to-cart-from-product-details/{id}")
    public String addProductToCartFromPDP(@PathVariable("id") long id) {

        return "client/homepage/homepage";
    }

    @PostMapping("/delete-from-cart/{id}")
    public String deleteProductFromCart(@PathVariable("id") long id, HttpServletRequest request) {
        Product product = this.productService.getById(id).get();
        this.cartService.deleteFromCart(request, product);
        return "redirect:/cart";
    }

    @PostMapping("/update-cart")
    public String updateCart(@ModelAttribute("cartModel") Cart cartModel, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        this.cartService.updateCart(request, cartModel);
        session.setAttribute("alertUpdateCart", 0);
        return "redirect:/cart";
    }

    @PostMapping("/confirm-checkout")
    public String getConfirmCheckoutPage(@ModelAttribute("cartModel") Cart cartModel, HttpServletRequest request) {
        boolean bool = this.cartService.checkHasAlreadyUpdateCart(cartModel);
        HttpSession session = request.getSession(false);
        if (bool == false) {
            session.setAttribute("alertUpdateCart", 1);
        }
        return "redirect:/cart";
    }

}
