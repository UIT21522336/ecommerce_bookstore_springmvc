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

            <!-- Breadcrumb Begin -->
            <div class="breadcrumb-option">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="breadcrumb__links">
                                <a href="/"><i class="fa fa-home"></i> Home</a>
                                <span style="text-transform: capitalize;">${category.toLowerCase()}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Breadcrumb End -->

            <!-- Shop Section Begin -->
            <section class="shop spad">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-3 col-md-3">
                            <jsp:include page="../layout/sidebar.jsp" />
                        </div>
                        <div class="col-lg-9 col-md-9">
                            <div class="row">
                                <c:forEach var="product" items="${products}">
                                    <div class="col-lg-4 col-md-6">
                                        <div class="product__item">
                                            <div class="product__item__pic set-bg"
                                                data-setbg="/resources/admin/images/product/${product.image}">
                                                <form:form action="/add-to-cart/${product.id}" method="POST">
                                                    <ul class="product__hover">
                                                        <li><a href="/resources/admin/images/product/${product.image}"
                                                                class="image-popup"><span
                                                                    class="arrow_expand"></span></a></li>
                                                        <c:if test="${product.quantity != 0}">
                                                            <li><button type="submit"
                                                                    style="all: unset; cursor: pointer;"><a><span
                                                                            class="icon_bag_alt"></a></span></button>
                                                            </li>
                                                        </c:if>
                                                    </ul>
                                                </form:form>
                                            </div>
                                            <div class="product__item__text">
                                                <h6><a
                                                        href="/products/${product.categoryDetail.category.name}/${product.categoryDetail.name}/details/${product.id}">${product.name}</a>
                                                </h6>
                                                <c:choose>
                                                    <c:when test="${product.quantity == 0}">
                                                        <div style="color: red;">Out of stock</div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="product__price">$ ${product.price}</div>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                                <div class="col-lg-12 text-center">
                                    <div class="pagination__option">
                                        <a href="#">1</a>
                                        <a href="#">2</a>
                                        <a href="#">3</a>
                                        <a href="#"><i class="fa fa-angle-right"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Shop Section End -->

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