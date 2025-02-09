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
            <style>
                table {
                    width: 100%;
                    border-collapse: collapse;
                }

                th,
                td {
                    text-align: center;
                    padding: 10px;
                    border: 1px solid #ddd;
                }

                td.cart__product__item__title:nth-child(4) {
                    text-align: left;
                    /* Chỉ căn trái cho cột 'Shipped To' */
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
                                <span>Order history</span>
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
                                <c:choose>
                                    <c:when test="${orders.size()!=0}">
                                        <table>
                                            <thead>
                                                <tr>
                                                    <th>Order Number</th>
                                                    <th>Purchaser</th>
                                                    <th>Phone Number</th>
                                                    <th>Shipped To</th>
                                                    <th>Status</th>
                                                    <th>Payment Method</th>
                                                    <th>Payment Status</th>
                                                    <th>Total Charge</th>
                                                    <th>View Details</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="order" items="${orders}">
                                                    <tr>
                                                        <td class="cart__product__item__title">
                                                            #${order.id}
                                                        </td>
                                                        <td class="cart__product__item__title">
                                                            ${order.receiverName}
                                                        </td>
                                                        <td class="cart__product__item__title">
                                                            ${order.receiverPhone}
                                                        </td>
                                                        <td class="cart__product__item__title"
                                                            style="text-align: left; padding: 10px; padding-left: 20px; border: 1px solid #ddd;">
                                                            ${order.receiverAddress}
                                                        </td>
                                                        <td class="cart__product__item__title">
                                                            ${order.status}
                                                        </td>
                                                        <td class="cart__product__item__title">
                                                            ${order.paymentMethod}
                                                        </td>
                                                        <c:choose>
                                                            <c:when
                                                                test="${order.paymentStatus.equals('PAYMENT_UNPAID')}">
                                                                <td class="cart__product__item__title">
                                                                    UNPAID
                                                                </td>
                                                            </c:when>
                                                            <c:when
                                                                test="${order.paymentStatus.equals('PAYMENT_SUCCESS')}">
                                                                <td class="cart__product__item__title">
                                                                    SUCCESS
                                                                </td>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <td class="cart__product__item__title">
                                                                    FAILED
                                                                </td>
                                                            </c:otherwise>
                                                        </c:choose>
                                                        <td class="cart__product__item__title">
                                                            <fmt:formatNumber value="${order.totalPrice}" type="number"
                                                                minFractionDigits="2" maxFractionDigits="2" />$
                                                        </td>
                                                        <td class="cart__product__item__title">
                                                            <a href="/order-history/${order.id}">View</a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="alert alert-warning" role="alert">
                                            <b>No purchase history</b>. Check back after your next shopping trip!
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 text-center">
                            <div class="pagination__option">
                                <c:if test="${1 < currentPage}">
                                    <a href="/order-history?page=${currentPage-1}"><i class="fa fa-angle-left"></i></a>
                                </c:if>
                                <c:forEach begin="1" end="${totalPages}" varStatus="status">
                                    <a href="/order-history?page=${status.index}"
                                        class="${status.index == currentPage ? 'active' : ''}">${status.index}</a>
                                </c:forEach>
                                <c:if test="${currentPage < totalPages}">
                                    <a href="/order-history?page=${currentPage+1}"><i class="fa fa-angle-right"></i></a>
                                </c:if>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="cart__btn">
                                <a href="/">Back To Homepage</a>
                            </div>
                        </div>
                        <c:if test="${sessionScope.cartSum != 0}">
                            <div class="col-lg-6 col-md-6 col-sm-6">
                            </div>
                        </c:if>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="discount__content">

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