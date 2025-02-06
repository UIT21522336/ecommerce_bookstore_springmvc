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
                                    <a href="/cart">Shopping cart</a>
                                    <span>Checkout</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Breadcrumb End -->

                <!-- Checkout Section Begin -->
                <section class="checkout spad">
                    <div class="container">
                        <form:form action="/place-order" method="POST" modelAttribute="order" class="checkout__form">
                            <div class="row">
                                <div class="col-lg-8">
                                    <h5>Billing detail</h5>
                                    <div class="row">
                                        <div class="col-lg-12">

                                            <div class="checkout__form__input">
                                                <p>Full Name <span>*</span></p>
                                                <form:errors path="receiverName" cssClass="text-danger" />
                                                <form:input type="text" path="receiverName" />
                                            </div>
                                            <div class="checkout__form__input">
                                                <p>Address <span>*</span></p>
                                                <form:errors path="receiverAddress" cssClass="text-danger" />
                                                <form:input type="text" placeholder="Street Address"
                                                    path="receiverAddress" />
                                            </div>
                                            <div class="checkout__form__input">
                                                <p>Phone number <span>*</span></p>
                                                <form:errors path="receiverPhone" cssClass="text-danger" />
                                                <form:input type="tel" path="receiverPhone" />
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="checkout__order">
                                        <h5>Your order</h5>
                                        <div class="checkout__order__product">
                                            <ul>
                                                <li>
                                                    <span class="top__text">Product</span>
                                                    <span class="top__text__right">Total</span>
                                                </li>
                                                <c:forEach var="cartDetails" items="${listCartDetails}"
                                                    varStatus="status">
                                                    <li>${status.index+1}.
                                                        ${cartDetails.product.name} (x
                                                        ${cartDetails.quantity})<span>${cartDetails.price} $</span>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                        <div class="checkout__order__total">
                                            <ul>
                                                <li>Subtotal <span>${cart.totalPrice} $</span></li>
                                                <li>Shipping <span>0 $</span></li>
                                                <li>Total <span>${cart.totalPrice} $</span></li>
                                            </ul>
                                        </div>
                                        <div class="checkout__order__widget">
                                            <label for="cod">
                                                Cash on delivery
                                                <form:checkbox path="paymentMethod" id="cod" value="COD" />
                                                <span class="checkmark"></span>
                                            </label>
                                            <label for="banking">
                                                VNPay Banking
                                                <form:checkbox path="paymentMethod" id="banking" value="BANKING" />
                                                <span class="checkmark"></span>
                                            </label>
                                        </div>
                                        <button type="submit" class="site-btn">Place oder</button>
                                    </div>
                                </div>
                            </div>
                        </form:form>
                    </div>
                </section>
                <!-- Checkout Section End -->

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

                <script>
                    $(document).ready(function () {
                        $("#cod").prop("checked", true);
                        $("#cod").change(function () {
                            if ($(this).is(":checked")) {
                                $("#banking").prop("checked", false);
                            }
                        });

                        $("#banking").change(function () {
                            if ($(this).is(":checked")) {
                                $("#cod").prop("checked", false);
                            }
                        });
                    });
                </script>
            </body>

            </html>