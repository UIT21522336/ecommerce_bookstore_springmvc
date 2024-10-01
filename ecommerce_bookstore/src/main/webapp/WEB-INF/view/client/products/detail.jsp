<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ashion Template">
    <meta name="keywords" content="Ashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>${product.name}</title>

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

    <!-- Offcanvas Menu Begin -->
    <div class="offcanvas-menu-overlay"></div>
    <div class="offcanvas-menu-wrapper">
        <div class="offcanvas__close">+</div>
        <ul class="offcanvas__widget">
            <li><span class="icon_search search-switch"></span></li>
            <li><a href="#"><span class="icon_heart_alt"></span>
                    <div class="tip">2</div>
                </a></li>
            <li><a href="#"><span class="icon_bag_alt"></span>
                    <div class="tip">2</div>
                </a></li>
        </ul>
        <div class="offcanvas__logo">
            <a href="./index.html"><img src="/resources/client/images/logo.png" alt=""></a>
        </div>
        <div id="mobile-menu-wrap"></div>
        <div class="offcanvas__auth">
            <a href="#">Login</a>
            <a href="#">Register</a>
        </div>
    </div>
    <!-- Offcanvas Menu End -->

    <jsp:include page="../layout/header.jsp" />

    <!-- Breadcrumb Begin -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="/"><i class="fa fa-home"></i> Home</a>
                        <a href="#" style="text-transform: capitalize;">${product.categoryDetail.category.displayName}
                        </a>
                        <a href="#" style="text-transform: capitalize;">${product.categoryDetail.displayName} </a>
                        <span>${product.name}</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Product Details Section Begin -->
    <section class="product-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <div class="product__details__pic">
                        <div class="product__details__slider__content">
                            <img data-hash="product-1" class="product__big__img"
                                src="/resources/admin/images/product/${product.image}" alt="">
                        </div>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="product__details__text">
                        <h3>${product.name}
                            <div class="container">
                                <div class="row">
                                    <div class="col" style="padding-left: 0px;">
                                        <span>Author: <b>${product.author}</b></span>
                                        <span>Pulisher: <b>${product.publisher}</b></span>
                                    </div>
                                    <div class="col" style="padding-left: 0px;">
                                        <span>Published year: <b>${product.publishedYear}</b></span>
                                        <span>Format: <b>${product.format}</b></span>
                                    </div>
                                </div>
                            </div>
                        </h3>
                        <div class="product__details__price">$ ${product.price}</div>
                        <div class="product__details__button">
                            <div class="quantity">
                                <span>Quantity:</span>
                                <div class="pro-qty">
                                    <input type="text" value="1">
                                </div>
                            </div>
                            <a href="#" class="cart-btn"><span class="icon_bag_alt"></span> Add to cart</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="product__details__tab">
                        <ul class="nav nav-tabs" role="tablist" style="margin-bottom: 15px;">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">Description</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab">Specification</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <h6>Description</h6>
                                <p>${product.description}</p>
                            </div>
                            <div class="tab-pane" id="tabs-2" role="tabpanel">
                                <h6>Specification</h6>
                                <table class="table table-striped">
                                    <tbody>
                                        <tr>
                                            <th>ISBN</th>
                                            <td>${product.ISBN}</td>
                                        </tr>
                                        <tr>
                                            <th>Author</th>
                                            <td>${product.author}</td>
                                        </tr>
                                        <tr>
                                            <th>Publisher</th>
                                            <td>${product.publisher}</td>
                                        </tr>
                                        <tr>
                                            <th>Published year</th>
                                            <td>${product.publishedYear}</td>
                                        </tr>
                                        <tr>
                                            <th>Weight</th>
                                            <td>${product.weight}</td>
                                        </tr>
                                        <tr>
                                            <th>Product dimensions</th>
                                            <td>${product.length} x ${product.width} x ${product.height}</td>
                                        </tr>
                                        <tr>
                                            <th>Number of pages</th>
                                            <td>${product.numberOfPages}</td>
                                        </tr>
                                        <tr>
                                            <th>Format</th>
                                            <td>${product.format}</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Details Section End -->

    <!-- Instagram Begin -->
    <div class="instagram">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                    <div class="instagram__item set-bg" data-setbg="/resources/client/images/instagram/insta-1.jpg">
                        <div class="instagram__text">
                            <i class="fa fa-instagram"></i>
                            <a href="#">@ ashion_shop</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                    <div class="instagram__item set-bg" data-setbg="/resources/client/images/instagram/insta-2.jpg">
                        <div class="instagram__text">
                            <i class="fa fa-instagram"></i>
                            <a href="#">@ ashion_shop</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                    <div class="instagram__item set-bg" data-setbg="/resources/client/images/instagram/insta-3.jpg">
                        <div class="instagram__text">
                            <i class="fa fa-instagram"></i>
                            <a href="#">@ ashion_shop</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                    <div class="instagram__item set-bg" data-setbg="/resources/client/images/instagram/insta-4.jpg">
                        <div class="instagram__text">
                            <i class="fa fa-instagram"></i>
                            <a href="#">@ ashion_shop</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                    <div class="instagram__item set-bg" data-setbg="/resources/client/images/instagram/insta-5.jpg">
                        <div class="instagram__text">
                            <i class="fa fa-instagram"></i>
                            <a href="#">@ ashion_shop</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                    <div class="instagram__item set-bg" data-setbg="/resources/client/images/instagram/insta-6.jpg">
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