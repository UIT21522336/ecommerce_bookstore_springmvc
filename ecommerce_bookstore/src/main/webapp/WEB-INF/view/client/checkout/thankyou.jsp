<html lang="en">

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
    <div style="text-align: center;">
        <div class="alert alert-success" role="alert">
            Thank you for your order! We appreciate your support and look forward to serving you again.
        </div>
        <a href="/" class="site-btn" style="margin-top: 10px;">Go to homepage</a>
        <a href="/order-history" class="site-btn" style="margin-top: 10px;">Go to order history</a>
    </div>
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