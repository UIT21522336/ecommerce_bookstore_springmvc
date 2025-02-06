<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


            <!DOCTYPE html>
            <html lang="zxx">

            <head>
                <meta charset="UTF-8">
                <meta name="description" content="Ashion Template">
                <meta name="keywords" content="Ashion, unica, creative, html">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <meta http-equiv="X-UA-Compatible" content="ie=edge">
                <title>Ashion | Template</title>

                <!-- Google Font -->
                <link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet">
                <link
                    href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
                    rel="stylesheet">

                <!-- Css Styles -->
                <link rel="stylesheet" href="/resources/client/css/bootstrap.min.css" type="text/css">
                <link rel="stylesheet" href="/resources/client/css/font-awesome.min.css" type="text/css">
                <link rel="stylesheet" href="/resources/client/css/elegant-icons.css" type="text/css">
                <link rel="stylesheet" href="/resources/client/css/jquery-ui.min.css" type="text/css">
                <link rel="stylesheet" href="/resources/client/css/magnific-popup.css" type="text/css">
                <link rel="stylesheet" href="/resources/client/css/owl.carousel.min.css" type="text/css">
                <link rel="stylesheet" href="/resources/client/css/slicknav.min.css" type="text/css">
                <link rel="stylesheet" href="/resources/client/css/style.css" type="text/css">
            </head>

            <body>
                <!-- Page Preloder -->
                <div id="preloder">
                    <div class="loader"></div>
                </div>

                <jsp:include page="../layout/header.jsp" />

                <!-- Breadcrumb Begin -->
                <div class="breadcrumb-option">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="breadcrumb__links">
                                    <a href="/"><i class="fa fa-home"></i> Home</a>
                                    <span>Shopping cart</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Breadcrumb End -->

                <!-- Shop Cart Section Begin -->
                <section class="shop-cart spad">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <c:choose>
                                    <c:when test="${sessionScope.cartSum != 0}">
                                        <c:if test="${sessionScope.currentStockNotification == 1}">
                                            <div class="alert alert-danger" role="alert">
                                                The current stock of the product <b>${product.name}</b> is
                                                <b>${product.quantity}</b>
                                            </div>
                                        </c:if>
                                        <c:if
                                            test="${sessionScope.alertUpdateCart !=null && sessionScope.alertUpdateCart !=0}">
                                            <div class="alert alert-danger" role="alert">
                                                Please update your cart before proceeding to checkout!
                                            </div>
                                        </c:if>
                                        <div class="shop__cart__table">
                                            <table>
                                                <thead>
                                                    <tr>
                                                        <th>Product</th>
                                                        <th>Price</th>
                                                        <th>Quantity</th>
                                                        <th>Total</th>
                                                        <th></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="cartDetails" items="${listCartDetails}"
                                                        varStatus="status">
                                                        <tr>
                                                            <td class="cart__product__item">
                                                                <img src="/resources/admin/images/product/${cartDetails.product.image}"
                                                                    alt="" width="90" height="90">
                                                                <div class="cart__product__item__title">
                                                                    <a
                                                                        href="/products/${cartDetails.product.categoryDetail.category.name}/${cartDetails.product.categoryDetail.name}/details/${cartDetails.product.id}">
                                                                        <h6>${cartDetails.product.name}</h6>

                                                                    </a>
                                                                    <h7 style="color:red">Available:
                                                                        ${cartDetails.product.quantity}</h7>
                                                                </div>
                                                            </td>
                                                            <td class="cart__price">${cartDetails.product.price} $
                                                            </td>
                                                            <td class="cart__quantity">
                                                                <div class="pro-qty">
                                                                    <input type="text" value="${cartDetails.quantity}"
                                                                        min="1" max="${cartDetails.product.quantity}"
                                                                        cart-details-data-index="${status.index}">
                                                                </div>
                                                            </td>
                                                            <td class="cart__total">
                                                                <fmt:formatNumber value="${cartDetails.price}"
                                                                    type="number" minFractionDigits="2"
                                                                    maxFractionDigits="2" />$
                                                            </td>
                                                            <form:form
                                                                action="/delete-from-cart/${cartDetails.product.id}"
                                                                method="POST">
                                                                <td class="cart__close"><button type="submit"
                                                                        style="all: unset; cursor: pointer;"><span
                                                                            class="icon_close"></span></button></td>
                                                            </form:form>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>

                                    </c:when>
                                    <c:otherwise>
                                        <div class="alert alert-warning" role="alert">
                                            No products in your cart.
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="cart__btn">
                                    <a href="/">Continue Shopping</a>
                                </div>
                            </div>
                            <c:if test="${sessionScope.cartSum != 0}">
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <form:form action="/update-cart" method="POST" modelAttribute="cartModel">
                                        <c:forEach var="cartDetails" items="${listCartDetails}" varStatus="status">
                                            <div style="display: none;">
                                                <form:input path="cartDetails[${status.index}].id"
                                                    value="${cartDetails.id}" />
                                                <form:input path="cartDetails[${status.index}].quantity"
                                                    class="cartDetails${status.index}Quantity"
                                                    value="${cartDetails.quantity}" />
                                            </div>
                                        </c:forEach>
                                        <div class="cart__btn update__btn">
                                            <button type="submit" style="all:unset;cursor:pointer"><a></span> Update
                                                    cart</a></button>
                                        </div>
                                    </form:form>

                                </div>
                            </c:if>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="discount__content">

                                </div>
                            </div>
                            <c:if test="${sessionScope.cartSum != 0}">
                                <div class="col-lg-4 offset-lg-2">
                                    <div class="cart__total__procced">
                                        <h6>Cart total</h6>
                                        <ul>
                                            <li>Subtotal <span>
                                                    <fmt:formatNumber value="${cart.totalPrice}" type="number"
                                                        minFractionDigits="2" maxFractionDigits="2" />$
                                                </span></li>
                                            <li>Total <span>
                                                    <fmt:formatNumber value="${cart.totalPrice}" type="number"
                                                        minFractionDigits="2" maxFractionDigits="2" />$
                                                </span></li>
                                        </ul>
                                        <form:form action="/proceed-to-checkout" method="POST"
                                            modelAttribute="cartModel">
                                            <c:forEach var="cartDetails" items="${listCartDetails}" varStatus="status">
                                                <div style="display: none;">
                                                    <form:input path="cartDetails[${status.index}].id"
                                                        value="${cartDetails.id}" />
                                                    <form:input path="cartDetails[${status.index}].product.price"
                                                        value="${cartDetails.product.price}" />
                                                    <form:input path="cartDetails[${status.index}].quantity"
                                                        class="cartDetails${status.index}Quantity"
                                                        value="${cartDetails.quantity}" />
                                                    <form:input path="cartDetails[${status.index}].price"
                                                        value="${cartDetails.price}" />
                                                </div>
                                            </c:forEach>
                                            <div class="cart__btn update__btn">
                                                <button type="submit" style="all:unset;cursor:pointer"><a
                                                        class="primary-btn">Proceed to checkout</a></button>
                                            </div>
                                        </form:form>

                                    </div>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </section>
                <!-- Shop Cart Section End -->

                <jsp:include page="../layout/footer.jsp" />

                <!-- Search Begin -->
                <div class="search-model">
                    <div class="h-100 d-flex align-items-center justify-content-center">
                        <div class="search-close-switch">+</div>
                        <form class="search-model-form">
                            <input type="text" id="search-input" placeholder="Search here.....">
                        </form>
                    </div>
                </div>
                <!-- Search End -->

                <!-- Js Plugins -->
                <script src="/resources/client/js/jquery-3.3.1.min.js"></script>
                <script src="/resources/client/js/bootstrap.min.js"></script>
                <script src="/resources/client/js/jquery.magnific-popup.min.js"></script>
                <script src="/resources/client/js/jquery-ui.min.js"></script>
                <script src="/resources/client/js/mixitup.min.js"></script>
                <script src="/resources/client/js/jquery.countdown.min.js"></script>
                <script src="/resources/client/js/jquery.slicknav.js"></script>
                <script src="/resources/client/js/owl.carousel.min.js"></script>
                <script src="/resources/client/js/jquery.nicescroll.min.js"></script>
                <script src="/resources/client/js/main.js"></script>
            </body>

            </html>