<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

            <!-- Categories Section Begin -->
            <img src="/resources/client/images/categories/31877_GlobalNav_50OffVSM_02_01_25.jpg" style="width: 100%;"
                alt="Online Only! 50% Off Hundreds of Hardcover Books.  Shop Now ">
            <!-- Categories Section End -->

            <!-- Product Section Begin -->
            <section class="product spad">
                <div class="container">
                    <div class="row d-flex justify-content-between">
                        <div>
                            <div class="section-title">
                                <h4>Just Annouced</h4>
                            </div>
                        </div>
                        <a href="#">See all</a>
                    </div>
                    <div class="row property__gallery">
                        <c:forEach var="product" items="${products}">
                            <div class="col-lg-3 col-md-4 col-sm-6 mix">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg"
                                        data-setbg="/resources/admin/images/product/${product.image}">
                                        <form:form action="/products/add-to-cart/${product.id}" method="POST">
                                            <ul class="product__hover">
                                                <li><a href="/resources/admin/images/product/${product.image}"
                                                        class="image-popup"><span class="arrow_expand"></span></a></li>
                                                <li><button type="submit" style="all: unset; cursor: pointer;"><a><span
                                                                class="icon_bag_alt"></a></span></button></li>
                                            </ul>
                                        </form:form>
                                    </div>
                                    <div class="product__item__text">
                                        <h6
                                            style="max-width:100%;height:40px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">
                                            <a
                                                href="/products/${product.categoryDetail.category.name}/${product.categoryDetail.name}/details/${product.id}">${product.name}</a>
                                            <div class="product__price">$ ${product.price}</div>
                                        </h6>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </section>

            <img src="/resources/client/images/categories/31638_SkinnyHero_OnyxStorm_01_29_25.jpg"
                style="width: 100%;height: auto;" alt="Online Only! 50% Off Hundreds of Hardcover Books.  Shop Now ">

            <section class="product spad">
                <div class="container">
                    <div class="row d-flex justify-content-between">
                        <div>
                            <div class="section-title">
                                <h4>Our best fiction books</h4>
                            </div>
                        </div>
                        <a href="#">See all</a>
                    </div>
                    <div class="row property__gallery">
                        <c:forEach var="product" items="${products}">
                            <div class="col-lg-3 col-md-4 col-sm-6 mix">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg"
                                        data-setbg="/resources/admin/images/product/${product.image}">
                                        <ul class="product__hover">
                                            <li><a href="/resources/admin/images/product/${product.image}"
                                                    class="image-popup"><span class="arrow_expand"></span></a></li>
                                            <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                                        </ul>
                                    </div>
                                    <div class="product__item__text">
                                        <h6
                                            style="max-width:100%;height:40px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">
                                            <a href="/products/detail/${product.id}">${product.name}</a>
                                            <div class="product__price">$ ${product.price}</div>
                                        </h6>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </section>

            <img src="/resources/client/images/categories/31753_SkinnyHero_BlackHistory_02_01_25.jpg"
                style="width: 100%;height: auto;" alt="Online Only! 50% Off Hundreds of Hardcover Books.  Shop Now ">

            <section class="product spad">
                <div class="container">
                    <div class="row d-flex justify-content-between">
                        <div>
                            <div class="section-title">
                                <h4>Our best non-fiction books</h4>
                            </div>
                        </div>
                        <a href="#">See all</a>
                    </div>
                    <div class="row property__gallery">
                        <c:forEach var="product" items="${products}">
                            <div class="col-lg-3 col-md-4 col-sm-6 mix">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg"
                                        data-setbg="/resources/admin/images/product/${product.image}">
                                        <ul class="product__hover">
                                            <li><a href="/resources/admin/images/product/${product.image}"
                                                    class="image-popup"><span class="arrow_expand"></span></a></li>
                                            <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                                        </ul>
                                    </div>
                                    <div class="product__item__text">
                                        <h6
                                            style="max-width:100%;height:40px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">
                                            <a href="/products/detail/${product.id}">${product.name}</a>
                                            <div class="product__price">$ ${product.price}</div>
                                        </h6>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </section>

            <img src="/resources/client/images/categories/31877_GlobalNav_50OffVSM_02_01_25.jpg"
                alt="Online Only! 50% Off Hundreds of Hardcover Books.  Shop Now ">
            <!-- Product Section End -->

            <!-- Trend Section Begin -->
            <section class="trend spad">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4 col-md-4 col-sm-6">
                            <div class="trend__content">
                                <div class="section-title">
                                    <h4>Hot Trend</h4>
                                </div>
                                <div class="trend__item">
                                    <div class="trend__item__pic">
                                        <img src="/resources/client/images/trend/ht-1.jpg" alt="">
                                    </div>
                                    <div class="trend__item__text">
                                        <h6>Chain bucket bag</h6>
                                        <div class="rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <div class="product__price">$ 59.0</div>
                                    </div>
                                </div>
                                <div class="trend__item">
                                    <div class="trend__item__pic">
                                        <img src="/resources/client/images/trend/ht-2.jpg" alt="">
                                    </div>
                                    <div class="trend__item__text">
                                        <h6>Pendant earrings</h6>
                                        <div class="rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <div class="product__price">$ 59.0</div>
                                    </div>
                                </div>
                                <div class="trend__item">
                                    <div class="trend__item__pic">
                                        <img src="/resources/client/images/trend/ht-3.jpg" alt="">
                                    </div>
                                    <div class="trend__item__text">
                                        <h6>Cotton T-Shirt</h6>
                                        <div class="rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <div class="product__price">$ 59.0</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6">
                            <div class="trend__content">
                                <div class="section-title">
                                    <h4>Best seller</h4>
                                </div>
                                <div class="trend__item">
                                    <div class="trend__item__pic">
                                        <img src="/resources/client/images/trend/bs-1.jpg" alt="">
                                    </div>
                                    <div class="trend__item__text">
                                        <h6>Cotton T-Shirt</h6>
                                        <div class="rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <div class="product__price">$ 59.0</div>
                                    </div>
                                </div>
                                <div class="trend__item">
                                    <div class="trend__item__pic">
                                        <img src="/resources/client/images/trend/bs-2.jpg" alt="">
                                    </div>
                                    <div class="trend__item__text">
                                        <h6>Zip-pockets pebbled tote <br />briefcase</h6>
                                        <div class="rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <div class="product__price">$ 59.0</div>
                                    </div>
                                </div>
                                <div class="trend__item">
                                    <div class="trend__item__pic">
                                        <img src="/resources/client/images/trend/bs-3.jpg" alt="">
                                    </div>
                                    <div class="trend__item__text">
                                        <h6>Round leather bag</h6>
                                        <div class="rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <div class="product__price">$ 59.0</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6">
                            <div class="trend__content">
                                <div class="section-title">
                                    <h4>Feature</h4>
                                </div>
                                <div class="trend__item">
                                    <div class="trend__item__pic">
                                        <img src="/resources/client/images/trend/f-1.jpg" alt="">
                                    </div>
                                    <div class="trend__item__text">
                                        <h6>Bow wrap skirt</h6>
                                        <div class="rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <div class="product__price">$ 59.0</div>
                                    </div>
                                </div>
                                <div class="trend__item">
                                    <div class="trend__item__pic">
                                        <img src="/resources/client/images/trend/f-2.jpg" alt="">
                                    </div>
                                    <div class="trend__item__text">
                                        <h6>Metallic earrings</h6>
                                        <div class="rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <div class="product__price">$ 59.0</div>
                                    </div>
                                </div>
                                <div class="trend__item">
                                    <div class="trend__item__pic">
                                        <img src="/resources/client/images/trend/f-3.jpg" alt="">
                                    </div>
                                    <div class="trend__item__text">
                                        <h6>Flap cross-body bag</h6>
                                        <div class="rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <div class="product__price">$ 59.0</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Trend Section End -->

            <!-- Services Section Begin -->
            <section class="services spad">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="services__item">
                                <i class="fa fa-car"></i>
                                <h6>Free Shipping</h6>
                                <p>For all oder over $99</p>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="services__item">
                                <i class="fa fa-money"></i>
                                <h6>Money Back Guarantee</h6>
                                <p>If good have Problems</p>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="services__item">
                                <i class="fa fa-support"></i>
                                <h6>Online Support 24/7</h6>
                                <p>Dedicated support</p>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="services__item">
                                <i class="fa fa-headphones"></i>
                                <h6>Payment Secure</h6>
                                <p>100% secure payment</p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Services Section End -->

            <!-- Instagram Begin -->
            <div class="instagram">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                            <div class="instagram__item set-bg"
                                data-setbg="/resources/client/images/instagram/insta-1.jpg">
                                <div class="instagram__text">
                                    <i class="fa fa-instagram"></i>
                                    <a href="#">@ ashion_shop</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                            <div class="instagram__item set-bg"
                                data-setbg="/resources/client/images/instagram/insta-2.jpg">
                                <div class="instagram__text">
                                    <i class="fa fa-instagram"></i>
                                    <a href="#">@ ashion_shop</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                            <div class="instagram__item set-bg"
                                data-setbg="/resources/client/images/instagram/insta-3.jpg">
                                <div class="instagram__text">
                                    <i class="fa fa-instagram"></i>
                                    <a href="#">@ ashion_shop</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                            <div class="instagram__item set-bg"
                                data-setbg="/resources/client/images/instagram/insta-4.jpg">
                                <div class="instagram__text">
                                    <i class="fa fa-instagram"></i>
                                    <a href="#">@ ashion_shop</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                            <div class="instagram__item set-bg"
                                data-setbg="/resources/client/images/instagram/insta-5.jpg">
                                <div class="instagram__text">
                                    <i class="fa fa-instagram"></i>
                                    <a href="#">@ ashion_shop</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                            <div class="instagram__item set-bg"
                                data-setbg="/resources/client/images/instagram/insta-6.jpg">
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