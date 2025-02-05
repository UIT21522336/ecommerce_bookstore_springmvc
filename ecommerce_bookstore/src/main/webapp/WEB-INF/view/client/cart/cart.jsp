<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
            <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
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
                                        <c:forEach var="cartDetails" items="${listCartDetails}">

                                            <tr>
                                                <td class="cart__product__item">
                                                    <img src="resources/admin/images/product/${cartDetails.product.image}"
                                                        alt="" width="90" height="90">
                                                    <div class="cart__product__item__title">
                                                        <a
                                                            href="/products/${cartDetails.product.categoryDetail.category.name}/${cartDetails.product.categoryDetail.name}/details/${cartDetails.product.id}">
                                                            <h6>${cartDetails.product.name}</h6>
                                                        </a>
                                                    </div>
                                                </td>
                                                <td class="cart__price">${cartDetails.product.price} $
                                                </td>
                                                <td class="cart__quantity">
                                                    <div class="pro-qty">
                                                        <input type="text" value="${cartDetails.quantity}">
                                                    </div>
                                                </td>
                                                <td class="cart__total">${cartDetails.price} $</td>
                                                <td class="cart__close"><span class="icon_close"></span></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="cart__btn">
                                <a href="/">Continue Shopping</a>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="cart__btn update__btn">
                                <a href="#"></span> Update cart</a>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="discount__content">

                            </div>
                        </div>
                        <div class="col-lg-4 offset-lg-2">
                            <div class="cart__total__procced">
                                <h6>Cart total</h6>
                                <ul>
                                    <li>Subtotal <span>$ 750.0</span></li>
                                    <li>Total <span>$ 750.0</span></li>
                                </ul>
                                <a href="#" class="primary-btn">Proceed to checkout</a>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Shop Cart Section End -->

            <!-- Instagram Begin -->
            <div class="instagram">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                            <div class="instagram__item set-bg" data-setbg="img/instagram/insta-1.jpg">
                                <div class="instagram__text">
                                    <i class="fa fa-instagram"></i>
                                    <a href="#">@ ashion_shop</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                            <div class="instagram__item set-bg" data-setbg="img/instagram/insta-2.jpg">
                                <div class="instagram__text">
                                    <i class="fa fa-instagram"></i>
                                    <a href="#">@ ashion_shop</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                            <div class="instagram__item set-bg" data-setbg="img/instagram/insta-3.jpg">
                                <div class="instagram__text">
                                    <i class="fa fa-instagram"></i>
                                    <a href="#">@ ashion_shop</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                            <div class="instagram__item set-bg" data-setbg="img/instagram/insta-4.jpg">
                                <div class="instagram__text">
                                    <i class="fa fa-instagram"></i>
                                    <a href="#">@ ashion_shop</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                            <div class="instagram__item set-bg" data-setbg="img/instagram/insta-5.jpg">
                                <div class="instagram__text">
                                    <i class="fa fa-instagram"></i>
                                    <a href="#">@ ashion_shop</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                            <div class="instagram__item set-bg" data-setbg="img/instagram/insta-6.jpg">
                                <div class="instagram__text">
                                    <i class="fa fa-instagram"></i>
                                    <a href="#">@ ashion_shop</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Instagram End -->

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