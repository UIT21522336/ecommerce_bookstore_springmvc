package com.example.ecommerce_bookstore.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import java.io.IOException;
import java.util.List;

import com.example.ecommerce_bookstore.domain.Category;
import com.example.ecommerce_bookstore.domain.CategoryDetail;
import com.example.ecommerce_bookstore.domain.Product;
import com.example.ecommerce_bookstore.service.CategoryDetailService;
import com.example.ecommerce_bookstore.service.CategoryService;
import com.example.ecommerce_bookstore.service.ProductService;

import jakarta.validation.Valid;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ItemController {
    private final CategoryDetailService categoryDetailService;
    private final CategoryService categoryService;
    private final ProductService productService;

    public ItemController(CategoryDetailService categoryDetailService, CategoryService categoryService,
            ProductService productService) {
        this.categoryDetailService = categoryDetailService;
        this.categoryService = categoryService;
        this.productService = productService;
    }

    @GetMapping("/admin/products/create")
    public String getCreateProductPage(Model model) {
        model.addAttribute("modelProduct", new Product());
        List<Category> categories = this.categoryService.getAllCategories();
        List<CategoryDetail> categoryDetails = this.categoryDetailService.getAllCategoryDetails();
        model.addAttribute("categoryDetails", categoryDetails);
        model.addAttribute("categories", categories);
        return "admin/products/create";
    }

    @PostMapping("/admin/products/create")
    public String postCreateProduct(@ModelAttribute("modelProduct") @Valid Product product, BindingResult result,
            @RequestParam("fileImage") MultipartFile fileImage, Model model) throws IOException {
        if (result.hasErrors()) {
            List<Category> categories = this.categoryService.getAllCategories();
            List<CategoryDetail> categoryDetails = this.categoryDetailService.getAllCategoryDetails();
            model.addAttribute("categoryDetails", categoryDetails);
            model.addAttribute("categories", categories);
            return "admin/products/create";
        }
        this.productService.createProduct(product, fileImage);
        return "redirect:/admin/products";
    }

    @GetMapping("/admin/products/detail/{id}")
    public String getDetailProductPage(@PathVariable("id") long id, Model model) {
        Product product = this.productService.getProductById(id).get();
        model.addAttribute("product", product);
        return "admin/products/detail";
    }

    @GetMapping("/admin/products/update/{id}")
    public String getUpdateProductPage(@PathVariable("id") long id, Model model) {
        List<Category> categories = this.categoryService.getAllCategories();
        List<CategoryDetail> categoryDetails = this.categoryDetailService.getAllCategoryDetails();
        model.addAttribute("categoryDetails", categoryDetails);
        model.addAttribute("categories", categories);
        Product product = this.productService.getProductById(id).get();
        model.addAttribute("modelProduct", product);
        model.addAttribute("productImage", product.getImage());
        return "admin/products/update";
    }

    @PostMapping("/admin/products/update")
    public String postUpdateProduct(@ModelAttribute("modelProduct") @Valid Product modelProduct, BindingResult result,
            @RequestParam("fileImage") MultipartFile fileImage, Model model) throws IOException {
        if (result.hasErrors()) {
            List<Category> categories = this.categoryService.getAllCategories();
            List<CategoryDetail> categoryDetails = this.categoryDetailService.getAllCategoryDetails();
            model.addAttribute("categoryDetails", categoryDetails);
            model.addAttribute("categories", categories);
            Product product = this.productService.getProductById(modelProduct.getId()).get();
            model.addAttribute("productImage", product.getImage());
            return "admin/products/update";
        }
        this.productService.updateProduct(modelProduct, fileImage);
        return "redirect:/admin/products";
    }

    @GetMapping("/admin/products/delete/{id}")
    public String getDeleteProductPage(@PathVariable("id") long id, Model model) {
        Product product = this.productService.getProductById(id).get();
        model.addAttribute("modelProduct", product);
        return "admin/products/delete";
    }

    @PostMapping("/admin/products/delete")
    public String postDeleteProduct(@ModelAttribute("modelProduct") Product modelProduct) throws IOException {
        this.productService.deleteProduct(modelProduct);
        return "redirect:/admin/products";
    }

}
