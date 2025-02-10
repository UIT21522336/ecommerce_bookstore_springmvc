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
                                <h4>Just Announced</h4>
                            </div>
                        </div>
                        <a href="/home/just-announced">See all</a>
                    </div>
                    <div class="row property__gallery">
                        <c:forEach var="product" items="${justAnnounced_products}">
                            <div class="col-lg-3 col-md-4 col-sm-6 mix">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg"
                                        data-setbg="/resources/admin/images/product/${product.image}">
                                        <form:form action="/add-to-cart/${product.id}" method="POST">
                                            <ul class="product__hover">
                                                <li><a href="/resources/admin/images/product/${product.image}"
                                                        class="image-popup"><span class="arrow_expand"></span></a></li>
                                                <c:if test="${product.quantity != 0}">
                                                    <li><button type="submit"
                                                            style="all: unset; cursor: pointer;"><a><span
                                                                    class="icon_bag_alt"></a></span></button></li>
                                                </c:if>
                                            </ul>
                                        </form:form>
                                    </div>
                                    <div class="product__item__text">
                                        <h6
                                            style="max-width:100%;height:40px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">
                                            <a
                                                href="/products/${product.categoryDetail.category.name}/${product.categoryDetail.name}/details/${product.id}">${product.name}</a>
                                            <c:choose>
                                                <c:when test="${product.quantity == 0}">
                                                    <div style="color: red;">Out of stock</div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="product__price">$ ${product.price}</div>
                                                </c:otherwise>
                                            </c:choose>
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
                        <a href="/home/best-fiction">See all</a>
                    </div>
                    <div class="row property__gallery">
                        <c:forEach var="product" items="${bestFiction_products}">
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
                        <a href="/home/best-nonfiction">See all</a>
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