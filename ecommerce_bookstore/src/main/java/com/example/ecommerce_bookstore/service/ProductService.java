package com.example.ecommerce_bookstore.service;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.ecommerce_bookstore.domain.Cart;
import com.example.ecommerce_bookstore.domain.CartDetail;
import com.example.ecommerce_bookstore.domain.CategoryDetail;
import com.example.ecommerce_bookstore.domain.Product;
import com.example.ecommerce_bookstore.domain.User;
import com.example.ecommerce_bookstore.repository.ProductRepository;
import com.example.ecommerce_bookstore.service.specification.ProductSpecs;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Service
public class ProductService {
    private final ProductRepository productRepository;
    private final ImageService imageService;
    private final CategoryDetailService categoryDetailService;

    public ProductService(ProductRepository productRepository, ImageService imageService,
            CategoryDetailService categoryDetailService, UserService userService, CartService cartService,
            CartDetailService cartDetailService) {
        this.productRepository = productRepository;
        this.imageService = imageService;
        this.categoryDetailService = categoryDetailService;
    }

    public void createProduct(Product product, MultipartFile fileImage) throws IOException {
        // upload image to local
        String uploadDirectory = "src/main/webapp/resources/admin/images/product";
        String imageString = imageService.saveImageToStorage(uploadDirectory, fileImage);
        product.setImage(imageString);
        // find categoryDetail by name
        CategoryDetail categoryDetail = this.categoryDetailService
                .getByName(product.getCategoryDetail().getName());
        product.setCategoryDetail(categoryDetail);
        product = this.productRepository.save(product);
    }

    public List<Product> getAll() {
        return this.productRepository.findAll();
    }

    public Page<Product> getAll(Pageable pageable, Optional<String> priceCriteria,
            Optional<String> formatCriteria) {
        Specification combinedSpecs = Specification.where(null);
        if (priceCriteria.isPresent()) {
            List<String> priceList = Arrays.asList(priceCriteria.get().split(","));
            combinedSpecs = combinedSpecs.and(ProductSpecs.matchPriceRange(Double.parseDouble(priceList.get(0)),
                    Double.parseDouble(priceList.get(1))));
        }
        if (formatCriteria.isPresent()) {
            List<String> formatList = Arrays.asList(formatCriteria.get().split(","));
            combinedSpecs = combinedSpecs.and(ProductSpecs.matchFormat(formatList));

        }

        if (combinedSpecs.equals(null)) {
            return this.productRepository.findAll(pageable);
        } else {
            return this.productRepository.findAll(combinedSpecs, pageable);
        }

    }

    public Page<Product> getByCategoryDetail(CategoryDetail categoryDetail,
            Pageable pageable) {
        return this.productRepository.findByCategoryDetail(categoryDetail, pageable);
    }

    public Page<Product> getByCategoryDisplayName(String name, Pageable pageable) {
        return this.productRepository.findByCategoryDetail_Category_DisplayName(name, pageable);
    }

    public List<Product> getTop4ByOrderByIdAsc() {
        return this.productRepository.findTop4ByOrderByIdAsc();
    }

    public Optional<Product> getById(long id) {
        return this.productRepository.findById(id);
    }

    public void update(Product modelProduct, MultipartFile fileImage) throws IOException {
        Product product = this.productRepository.findById(modelProduct.getId()).get();
        if (!fileImage.isEmpty()) {
            // delete old image in local
            this.imageService.deleteImage("src/main/webapp/resources/admin/images/product",
                    product.getImage());

            // add new image to local
            String uploadDirectory = "src/main/webapp/resources/admin/images/product";
            String imageString = imageService.saveImageToStorage(uploadDirectory,
                    fileImage);

            product.setImage(imageString);
        }

        product.setName(modelProduct.getName());
        product.setAuthor(modelProduct.getAuthor());
        product.setPublisher(modelProduct.getPublisher());
        product.setFormat(modelProduct.getFormat());
        product.setISBN(modelProduct.getISBN());
        product.setPublishedYear(modelProduct.getPublishedYear());
        product.setCategoryDetail(
                this.categoryDetailService.getByName(modelProduct.getCategoryDetail().getName()));
        product.setQuantity(modelProduct.getQuantity());
        product.setNumberOfPages(modelProduct.getNumberOfPages());
        product.setWeight(modelProduct.getWeight());
        product.setPrice(modelProduct.getPrice());
        product.setLength(modelProduct.getLength());
        product.setWidth(modelProduct.getWidth());
        product.setHeight(modelProduct.getHeight());
        product.setDescription(modelProduct.getDescription());
        product = this.productRepository.save(product);
    }

    public void updateQuantity(Product product) {
        this.productRepository.save(product);
    }

    public void delete(Product modelProduct) throws IOException {
        Product product = this.productRepository.findById(modelProduct.getId()).get();
        // delete image from local
        this.imageService.deleteImage("src/main/webapp/resources/admin/images/product", product.getImage());
        this.productRepository.delete(product);
    }

    public Optional<Product> getProductWithHigestPrice() {
        return this.productRepository.findTopByOrderByPriceDesc();
    }
}
