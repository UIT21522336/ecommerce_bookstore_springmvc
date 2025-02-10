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
import com.example.ecommerce_bookstore.domain.Order;
import com.example.ecommerce_bookstore.domain.OrderDetail;
import com.example.ecommerce_bookstore.domain.Product;
import com.example.ecommerce_bookstore.domain.User;
import com.example.ecommerce_bookstore.repository.ProductRepository;
import com.example.ecommerce_bookstore.service.specification.ProductSpecs;

import jakarta.servlet.http.HttpSession;

@Service
public class ProductService {
    private final ProductRepository productRepository;
    private final ImageService imageService;
    private final CategoryDetailService categoryDetailService;
    private final OrderService orderService;
    private final OrderDetailService orderDetailService;
    private final CartDetailService cartDetailService;
    private final CartService cartService;

    public ProductService(ProductRepository productRepository, ImageService imageService,
            CategoryDetailService categoryDetailService, OrderService orderService,
            OrderDetailService orderDetailService,
            CartService cartService,
            CartDetailService cartDetailService) {
        this.productRepository = productRepository;
        this.imageService = imageService;
        this.categoryDetailService = categoryDetailService;
        this.orderService = orderService;
        this.orderDetailService = orderDetailService;
        this.cartService = cartService;
        this.cartDetailService = cartDetailService;
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

    public Page<Product> getAll(Pageable pageable) {
        return this.productRepository.findAll(pageable);
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

    public Page<Product> getJustAnnounced(Pageable pageable) {
        return this.productRepository.findByOrderByIdDesc(pageable);
    }

    public Page<Product> getBestFiction(Pageable pageable) {
        return this.productRepository.findByCategoryDetail_Category_DisplayNameOrderBySoldDesc("Fiction", pageable);
    }

    public Page<Product> getBestNonFiction(Pageable pageable) {
        return this.productRepository.findByCategoryDetail_Category_DisplayNameOrderBySoldDesc("Non-Fiction", pageable);
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

    public void placeOrder(User user, Order orderModel, List<CartDetail> listCartDetails, Cart cart,
            HttpSession session, String uuid) {
        Order order = new Order();
        order.setUser(user);
        order.setReceiverName(orderModel.getReceiverName());
        order.setReceiverAddress(orderModel.getReceiverAddress());
        order.setReceiverPhone(orderModel.getReceiverPhone());
        order.setPaymentMethod(orderModel.getPaymentMethod());
        if (order.getPaymentMethod().equals("BANKING")) {
            order.setPaymentRef(uuid);
        } else {
            order.setPaymentRef("UNKNOWN");
        }
        order.setStatus("PENDING");
        order.setPaymentStatus("PAYMENT_UNPAID");
        order.setTotalPrice(cart.getTotalPrice());
        this.orderService.create(order);

        for (CartDetail cartDetails : listCartDetails) {
            OrderDetail orderDetail = new OrderDetail();
            Product product = cartDetails.getProduct();

            orderDetail.setOrder(order);
            orderDetail.setProduct(cartDetails.getProduct());
            orderDetail.setPrice(cartDetails.getPrice());
            orderDetail.setQuantity(cartDetails.getQuantity());
            this.orderDetailService.create(orderDetail);

            product.setQuantity(product.getQuantity() - cartDetails.getQuantity());
            product.setSold(cartDetails.getQuantity());
            updateQuantity(product);

            this.cartDetailService.delete(cartDetails);
        }
        this.cartService.delete(cart);
        session.setAttribute("cartSum", 0);
    }

    public Optional<Product> getProductWithHighestPrice() {
        return this.productRepository.findTopByOrderByPriceDesc();
    }
}
