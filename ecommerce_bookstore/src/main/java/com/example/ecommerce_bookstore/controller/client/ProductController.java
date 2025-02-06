package com.example.ecommerce_bookstore.controller.client;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.access.method.P;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.ecommerce_bookstore.domain.Cart;
import com.example.ecommerce_bookstore.domain.CartDetail;
import com.example.ecommerce_bookstore.domain.Category;
import com.example.ecommerce_bookstore.domain.CategoryDetail;
import com.example.ecommerce_bookstore.domain.Order;
import com.example.ecommerce_bookstore.domain.Product;
import com.example.ecommerce_bookstore.domain.User;
import com.example.ecommerce_bookstore.service.CartDetailService;
import com.example.ecommerce_bookstore.service.CartService;
import com.example.ecommerce_bookstore.service.CategoryDetailService;
import com.example.ecommerce_bookstore.service.CategoryService;
import com.example.ecommerce_bookstore.service.ProductService;
import com.example.ecommerce_bookstore.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class ProductController {
    private final ProductService productService;
    private final CategoryDetailService categoryDetailService;
    private final CategoryService categoryService;
    private final CartService cartService;
    private final UserService userService;
    private final CartDetailService cartDetailService;

    public ProductController(ProductService productService, CategoryDetailService categoryDetailService,
            CategoryService categoryService, UserService userService, CartService cartService,
            CartDetailService cartDetailService) {
        this.productService = productService;
        this.categoryDetailService = categoryDetailService;
        this.categoryService = categoryService;
        this.cartService = cartService;
        this.userService = userService;
        this.cartDetailService = cartDetailService;
    }

    @GetMapping("/products/{category}/{category-detail}/details/{id}")
    public String getProductDetails(@PathVariable("id") long id, Model model) {
        Product product = this.productService.getById(id).get();
        model.addAttribute("product", product);
        model.addAttribute("cartDetailsModel", new CartDetail());
        return "client/products/details";
    }

    // Get product listing page by category
    @GetMapping("/products/{category}")
    public String getProductListingPageByCategory(@PathVariable("category") String categoryName, Model model) {
        Category category = this.categoryService.getByName(categoryName);
        List<CategoryDetail> categoriesDetails = this.categoryDetailService.getByCategory(category);
        List<Product> products = new ArrayList<>();
        for (CategoryDetail categoryDetails : categoriesDetails) {
            List<Product> productsByCategoryDetails = this.productService.getByCategoryDetail(categoryDetails);
            for (Product product : productsByCategoryDetails) {
                products.add(product);
            }
        }
        model.addAttribute("products", products);

        // breadcrumb
        model.addAttribute("categoryDisplayName", category.getDisplayName());

        // sidebar
        List<Category> listCategories = this.categoryService.getAll();
        List<CategoryDetail> listCategoriesDetails = this.categoryDetailService.getAll();
        model.addAttribute("listCategories", listCategories);
        model.addAttribute("listCategoriesDetails", listCategoriesDetails);
        return "client/products/listing-category";
    }

    // Get product listing page by category details
    @GetMapping("/products/{category}/{category_details}")
    public String getProductListingPageByCategoryDetails(@PathVariable("category") String categoryName,
            @PathVariable("category_details") String categoryDetailsName, Model model) {
        Category category = this.categoryService.getByName(categoryName);
        CategoryDetail categoryDetail = this.categoryDetailService.getByName(categoryDetailsName);
        List<Product> products = this.productService.getByCategoryDetail(categoryDetail);

        model.addAttribute("products", products);
        // breadcrumb
        model.addAttribute("categoryDisplayName", category.getDisplayName());
        model.addAttribute("categoryDetailsDisplayName", categoryDetail.getDisplayName());

        // sidebar
        List<Category> listCategories = this.categoryService.getAll();
        List<CategoryDetail> listCategoriesDetails = this.categoryDetailService.getAll();
        model.addAttribute("listCategories", listCategories);
        model.addAttribute("listCategoriesDetails", listCategoriesDetails);
        return "client/products/listing-category-details";
    }

    @PostMapping("/proceed-to-checkout")
    public String getConfirmCheckoutPage(@ModelAttribute("cartModel") Cart cartModel, HttpServletRequest request,
            Model model) {
        boolean bool = this.cartService.checkHasAlreadyUpdateCart(cartModel);
        HttpSession session = request.getSession(false);
        if (bool == false) {
            session.setAttribute("alertUpdateCart", 1);
            return "redirect:/cart";
        }
        User user = this.userService.getById((long) session.getAttribute("user_id")).get();
        Cart cart = this.cartService.getByUser(user);
        List<CartDetail> listCartDetails = this.cartDetailService.getByCart(cart);
        model.addAttribute("listCartDetails", listCartDetails);
        model.addAttribute("cart", cart);
        model.addAttribute("order", new Order());
        return "client/checkout/checkout";
    }

    @PostMapping("/place-order")
    public String placeOrder(@ModelAttribute("order") @Valid Order orderModel, BindingResult result,
            HttpServletRequest request, Model model) {
        if (result.hasErrors()) {
            HttpSession session = request.getSession(false);
            User user = this.userService.getById((long) session.getAttribute("user_id")).get();
            Cart cart = this.cartService.getByUser(user);
            List<CartDetail> listCartDetails = this.cartDetailService.getByCart(cart);
            model.addAttribute("listCartDetails", listCartDetails);
            model.addAttribute("cart", cart);
            return "client/checkout/checkout";
        }
        return "client/checkout/thankyou";
    }

}
