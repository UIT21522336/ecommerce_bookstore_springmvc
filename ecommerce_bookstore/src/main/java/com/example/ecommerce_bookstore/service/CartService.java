package com.example.ecommerce_bookstore.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.ecommerce_bookstore.domain.Cart;
import com.example.ecommerce_bookstore.domain.CartDetail;
import com.example.ecommerce_bookstore.domain.Product;
import com.example.ecommerce_bookstore.domain.User;
import com.example.ecommerce_bookstore.repository.CartRepository;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Service
public class CartService {
    private final CartRepository cartRepository;
    private final UserService userService;
    private final CartDetailService cartDetailService;

    public CartService(CartRepository cartRepository, UserService userService, CartDetailService cartDetailService) {
        this.cartRepository = cartRepository;
        this.userService = userService;
        this.cartDetailService = cartDetailService;
    }

    public Cart getByUser(User user) {
        return this.cartRepository.findByUser(user);
    }

    public void create(Cart cart) {
        this.cartRepository.save(cart);
    }

    public void update(Cart cart) {
        this.cartRepository.save(cart);
    }

    public int addToCartFromPLP(HttpServletRequest request, Product product) {
        int var = 0;
        HttpSession session = request.getSession(false);
        User user = this.userService.getById((long) session.getAttribute("user_id")).get();
        Cart cart = getByUser(user);
        if (cart == null) {
            Cart newCart = new Cart();
            newCart.setUser(user);
            newCart.setSum(0);
            newCart.setTotalPrice((double) 0);
            create(newCart);
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
                var = 1;
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
        update(cart);

        session.setAttribute("cartSum", cart.getSum());
        return var;
    }

    public void deleteFromCart(HttpServletRequest request, Product product) {
        HttpSession session = request.getSession(false);
        User user = this.userService.getById((long) session.getAttribute("user_id")).get();
        Cart cart = getByUser(user);
        CartDetail cartDetail = this.cartDetailService.getByCartAndProduct(cart, product);
        int sum = cart.getSum() - cartDetail.getQuantity();
        if (sum == 0) {
            // delete cart detail
            this.cartDetailService.delete(cartDetail);
            // delete cart
            delete(cart);
            session.setAttribute("cartSum", 0);
        } else if (sum > 0) {
            cart.setSum(sum);
            cart.setTotalPrice(cart.getTotalPrice() - cartDetail.getPrice());
            update(cart);
            this.cartDetailService.delete(cartDetail);
            session.setAttribute("cartSum", cart.getSum());
        }

    }

    public void updateCart(HttpServletRequest request, Cart cartModel) {
        HttpSession session = request.getSession(false);
        User user = this.userService.getById((long) session.getAttribute("user_id")).get();
        Cart cart = this.cartRepository.findByUser(user);
        for (CartDetail cartDetailFromModel : cartModel.getCartDetails()) {
            CartDetail cartDetail = this.cartDetailService.getById(cartDetailFromModel.getId());
            if (cartDetailFromModel.getQuantity() > cartDetail.getProduct().getQuantity()) {
                cartDetail.setQuantity(cartDetail.getProduct().getQuantity());
                cartDetail.setPrice(cartDetail.getQuantity() *
                        cartDetail.getProduct().getPrice());
            } else {
                cartDetail.setQuantity(cartDetailFromModel.getQuantity());
                cartDetail.setPrice(cartDetail.getQuantity() *
                        cartDetail.getProduct().getPrice());
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
        update(cart);

        session.setAttribute("cartSum", cart.getSum());
    }

    public boolean checkHasAlreadyUpdateCart(Cart cartModel) {
        List<CartDetail> listCartDetails = cartModel.getCartDetails();
        double price = 0;
        for (CartDetail cartDetails : listCartDetails) {
            price = cartDetails.getProduct().getPrice() * cartDetails.getQuantity();
            if (price != cartDetails.getPrice()) {
                CartDetail cartDetail_db = this.cartDetailService.getById(cartDetails.getId());
                cartDetail_db.setQuantity(cartDetails.getQuantity());
                this.cartDetailService.update(cartDetail_db);
                return false;
            }
        }
        return true;
    }

    public void delete(Cart cart) {
        this.cartRepository.delete(cart);
    }
}
