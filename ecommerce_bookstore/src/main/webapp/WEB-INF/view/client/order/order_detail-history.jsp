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

                <style>
                    table {
                        width: 100%;
                        border-collapse: collapse;
                        text-align: center;
                    }

                    th,
                    td {
                        padding: 10px;
                        border: 1px solid #ddd;
                        vertical-align: middle;
                    }

                    .cart__product__item {
                        text-align: left !important;
                        display: flex;
                        align-items: center;
                        justify-content: flex-start;
                        padding-left: 15px;
                    }

                    .cart__product__item img {
                        margin-left: 15px;
                        /* Đẩy ảnh vào bên trong */
                        margin-right: 10px;
                        /* Tạo khoảng cách giữa ảnh và tên */
                    }


                    .cart__product__item__title {
                        text-align: left;
                    }
                </style>
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
                                    <a href="/order-history">Order History</a>
                                    <span>Order #${order.id}</span>
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
                                                <th>Details ID</th>
                                                <th>Product</th>
                                                <th>Price</th>
                                                <th>Quantity</th>
                                                <th>Total</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="orderDetails" items="${listOrderDetails}">
                                                <tr>
                                                    <td class="cart__quantity">
                                                        #${orderDetails.id}
                                                    </td>
                                                    <td class="cart__product__item">
                                                        <img src="/resources/admin/images/product/${orderDetails.product.image}"
                                                            alt="" width="90" height="90">
                                                        <div class="cart__product__item__title">
                                                            <a
                                                                href="/products/${orderDetails.product.categoryDetail.category.name}/${orderDetails.product.categoryDetail.name}/details/${orderDetails.product.id}">
                                                                <h6>${orderDetails.product.name}</h6>
                                                            </a>
                                                        </div>
                                                    </td>
                                                    <td class="cart__price">
                                                        ${orderDetails.product.price} $
                                                    </td>
                                                    <td class="cart__quantity">
                                                        ${orderDetails.quantity}
                                                    </td>
                                                    <td class="cart__total">
                                                        <fmt:formatNumber value="${orderDetails.price}" type="number"
                                                            minFractionDigits="2" maxFractionDigits="2" /> $
                                                    </td>

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
                                    <a href="/order-history">Back To Order History</a>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="cart__total__procced">
                                    <h6>Order total</h6>
                                    <ul>
                                        <li>Total <span>
                                                <fmt:formatNumber value="${order.totalPrice}" type="number"
                                                    minFractionDigits="2" maxFractionDigits="2" />$
                                            </span></li>
                                    </ul>
                                </div>
                            </div>
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