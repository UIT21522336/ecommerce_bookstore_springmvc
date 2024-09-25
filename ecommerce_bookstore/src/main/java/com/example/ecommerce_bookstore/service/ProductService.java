package com.example.ecommerce_bookstore.service;

import java.io.IOException;
import java.util.List;
import java.util.Optional;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.ecommerce_bookstore.domain.CategoryDetail;
import com.example.ecommerce_bookstore.domain.Product;
import com.example.ecommerce_bookstore.repository.ProductRepository;

@Service
public class ProductService {
    private final ProductRepository productRepository;
    private final ImageService imageService;
    private final CategoryDetailService categoryDetailService;

    public ProductService(ProductRepository productRepository, ImageService imageService,
            CategoryDetailService categoryDetailService) {
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
                .getCategoryDetailByName(product.getCategoryDetail().getName());
        product.setCategoryDetail(categoryDetail);
        product = this.productRepository.save(product);
    }

    public List<Product> getAllProducts() {
        return this.productRepository.findAll();
    }

    public Optional<Product> getProductById(long id) {
        return this.productRepository.findById(id);
    }

    public void updateProduct(Product modelProduct, MultipartFile fileImage) throws IOException {
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
        product.setCategoryDetail(
                this.categoryDetailService.getCategoryDetailByName(modelProduct.getCategoryDetail().getName()));
        product.setQuantity(modelProduct.getQuantity());
        product.setPrice(modelProduct.getPrice());
        product.setDescription(modelProduct.getDescription());
        product = this.productRepository.save(product);
    }

    public void deleteProduct(Product modelProduct) throws IOException {
        Product product = this.productRepository.findById(modelProduct.getId()).get();
        // delete image from local
        this.imageService.deleteImage("src/main/webapp/resources/admin/images/product", product.getImage());
        this.productRepository.delete(product);
    }
}
