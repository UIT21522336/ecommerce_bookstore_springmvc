package com.example.ecommerce_bookstore.service;

import java.io.IOException;
import java.util.List;
import java.util.Optional;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.ecommerce_bookstore.domain.Cart;
import com.example.ecommerce_bookstore.domain.CartDetail;
import com.example.ecommerce_bookstore.domain.CategoryDetail;
import com.example.ecommerce_bookstore.domain.Product;
import com.example.ecommerce_bookstore.domain.User;
import com.example.ecommerce_bookstore.repository.ProductRepository;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Service
public class ProductService {
    private final ProductRepository productRepository;
    private final ImageService imageService;
    private final CategoryDetailService categoryDetailService;
    private final UserService userService;
    private final CartService cartService;
    private final CartDetailService cartDetailService;

    public ProductService(ProductRepository productRepository, ImageService imageService,
            CategoryDetailService categoryDetailService, UserService userService, CartService cartService,
            CartDetailService cartDetailService) {
        this.productRepository = productRepository;
        this.imageService = imageService;
        this.categoryDetailService = categoryDetailService;
        this.userService = userService;
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

    public List<Product> getByCategoryDetail(CategoryDetail categoryDetail) {
        return this.productRepository.findByCategoryDetail(categoryDetail);
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

    public void delete(Product modelProduct) throws IOException {
        Product product = this.productRepository.findById(modelProduct.getId()).get();
        // delete image from local
        this.imageService.deleteImage("src/main/webapp/resources/admin/images/product", product.getImage());
        this.productRepository.delete(product);
    }

    public void addToCartFromPLP(HttpServletRequest request, Product product) {
        HttpSession session = request.getSession(false);
        User user = this.userService.getById((long) session.getAttribute("user_id")).get();
        Cart cart = this.cartService.getByUser(user);
        if (cart == null) {
            Cart newCart = new Cart();
            newCart.setUser(user);
            newCart.setSum(0);
            newCart.setTotalPrice((double) 0);
            this.cartService.create(newCart);
            cart = newCart;
        }
        CartDetail cartDetail = this.cartDetailService.getByCartAndProduct(cart, product);
        if (cartDetail == null) {
            CartDetail newCartDetail = new CartDetail();
            newCartDetail.setCart(cart);
            newCartDetail.setProduct(product);
            newCartDetail.setQuantity(1);
            newCartDetail.setPrice(newCartDetail.getQuantity() * product.getPrice());
            this.cartDetailService.create(newCartDetail);
            cartDetail = newCartDetail;
        } else {
            if (cartDetail.getQuantity() >= product.getQuantity()) {
                cartDetail.setQuantity(product.getQuantity());
                cartDetail.setPrice(cartDetail.getQuantity() * product.getPrice());
                // redirect cart display error
            } else {
                cartDetail.setQuantity(cartDetail.getQuantity() + 1);
                cartDetail.setPrice(cartDetail.getQuantity() * product.getPrice());
            }
            this.cartDetailService.update(cartDetail);
        }
        // update cart
        int sum = 0;
        double totalPrice = 0;
        List<CartDetail> listCartDetails = this.cartDetailService.getByCart(cart);
        for (CartDetail cartDetails : listCartDetails) {
            sum = sum + cartDetails.getQuantity();
            totalPrice = totalPrice + cartDetails.getPrice();
        }
        cart.setSum(sum);
        cart.setTotalPrice(totalPrice);
        this.cartService.update(cart);

        session.setAttribute("cartSum", cart.getSum());
    }

    public void deleteFromCart(HttpServletRequest request, Product product) {
        HttpSession session = request.getSession(false);
        User user = this.userService.getById((long) session.getAttribute("user_id")).get();
        Cart cart = this.cartService.getByUser(user);
        CartDetail cartDetail = this.cartDetailService.getByCartAndProduct(cart, product);
        int sum = cart.getSum() - cartDetail.getQuantity();
        if (sum == 0) {
            // delete cart detail
            this.cartDetailService.delete(cartDetail);
            // delete cart
            this.cartService.delete(cart);
            session.setAttribute("cartSum", 0);
        } else if (sum > 0) {
            cart.setSum(sum);
            cart.setTotalPrice(cart.getTotalPrice() - cartDetail.getPrice());
            this.cartService.update(cart);
            this.cartDetailService.delete(cartDetail);
            session.setAttribute("cartSum", cart.getSum());
        }

    }
}
