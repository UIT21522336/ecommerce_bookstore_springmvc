<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <!-- Required meta tags -->
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
            <title>Order Information</title>
            <!-- plugins:css -->
            <link rel="stylesheet" href="/resources/admin/assets/vendors/mdi/css/materialdesignicons.min.css">
            <link rel="stylesheet" href="/resources/admin/assets/vendors/css/vendor.bundle.base.css">
            <!-- endinject -->
            <!-- Plugin css for this page -->
            <link rel="stylesheet" href="/resources/admin/assets/vendors/jvectormap/jquery-jvectormap.css">
            <link rel="stylesheet" href="/resources/admin/assets/vendors/flag-icon-css/css/flag-icon.min.css">
            <link rel="stylesheet" href="/resources/admin/assets/vendors/owl-carousel-2/owl.carousel.min.css">
            <link rel="stylesheet" href="/resources/admin/assets/vendors/owl-carousel-2/owl.theme.default.min.css">
            <!-- End plugin css for this page -->
            <!-- inject:css -->
            <!-- endinject -->
            <!-- Layout styles -->
            <link rel="stylesheet" href="/resources/admin/assets/css/style.css">
            <!-- End layout styles -->
            <link rel="shortcut icon" href="/resources/admin/assets/images/favicon.png" />
        </head>

        <body>
            <div class="container-scroller">
                <!-- partial:partials/_sidebar.html -->

                <jsp:include page="../layout/sidebar.jsp" />


                <!-- partial -->
                <div class="container-fluid page-body-wrapper">
                    <!-- partial:partials/_navbar.html -->
                    <nav class="navbar p-0 fixed-top d-flex flex-row">
                        <div class="navbar-brand-wrapper d-flex d-lg-none align-items-center justify-content-center">
                            <a class="navbar-brand brand-logo-mini" href="index.html"><img
                                    src="/resources/admin/assets/images/logo-mini.svg" alt="logo" /></a>
                        </div>

                        <jsp:include page="../layout/header.jsp" />

                    </nav>
                    <!-- partial -->
                    <div class="main-panel">
                        <div class="content-wrapper">
                            <div class="row ">
                                <div class="col-12 grid-margin">
                                    <div class="card">
                                        <div class="card-body">
                                            <form:form action="/admin/orders/update" method="POST">
                                                <h4 class="card-title">Order #${order.id}</h4>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <label class="col-sm-3 col-form-label">Receiver Name</label>
                                                            <div class="col-sm-9">
                                                                <input type="text" class="form-control"
                                                                    style="background-color: #2A3038;"
                                                                    value="${order.receiverName}" disabled />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <label class="col-sm-3 col-form-label">Payment
                                                                Method</label>
                                                            <div class="col-sm-9">
                                                                <input type="text" class="form-control"
                                                                    style="background-color: #2A3038;"
                                                                    value="${order.paymentMethod}" disabled />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <label class="col-sm-3 col-form-label">Receiver
                                                                Phone</label>
                                                            <div class="col-sm-9">
                                                                <input type="tel" class="form-control"
                                                                    style="background-color: #2A3038;"
                                                                    value="${order.receiverPhone}" disabled />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <label class="col-sm-3 col-form-label">Payment
                                                                Status</label>
                                                            <div class="col-sm-9">
                                                                <select name="paymentStatus" class="form-control"
                                                                    ${order.paymentMethod.equals('BANKING')
                                                                    ? 'disabled style="background-color: #2A3038;"' : ''
                                                                    }>
                                                                    <option value="PAYMENT_UNPAID"
                                                                        ${order.paymentStatus.equals('PAYMENT_UNPAID')
                                                                        ? 'selected' : '' }>
                                                                        UNPAID</option>
                                                                    <option value="PAYMENT_SUCCESS"
                                                                        ${order.paymentStatus.equals('PAYMENT_SUCCESS')
                                                                        ? 'selected' : '' }>
                                                                        SUCCESS
                                                                    </option>
                                                                    <option value="PAYMENT_FAILED"
                                                                        ${order.paymentStatus.equals('PAYMENT_FAILED')
                                                                        ? 'selected' : '' }>
                                                                        FAILED
                                                                    </option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <label class="col-sm-3 col-form-label">Receiver Address
                                                            </label>
                                                            <div class="col-sm-9">
                                                                <input type="tel" class="form-control"
                                                                    style="background-color: #2A3038;"
                                                                    value="${order.receiverAddress}" disabled />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <label class="col-sm-3 col-form-label">
                                                                Order Status</label>
                                                            <div class="col-sm-9">
                                                                <select name="orderStatus" class="form-control">
                                                                    <option value="PENDING"
                                                                        ${order.status.equals('PENDING') ? 'selected'
                                                                        : '' }>
                                                                        PENDING</option>
                                                                    <option value="SHIPPING"
                                                                        ${order.status.equals('SHIPPING') ? 'selected'
                                                                        : '' }>
                                                                        SHIPPING
                                                                    </option>
                                                                    <option value="COMPLETED"
                                                                        ${order.status.equals('COMPLETED') ? 'selected'
                                                                        : '' }>
                                                                        COMPLETED
                                                                    </option>
                                                                    <option value="CANCELLED"
                                                                        ${order.status.equals('CANCELLED') ? 'selected'
                                                                        : '' }>
                                                                        CANCELLED
                                                                    </option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <th class="text-center"> Details ID </th>
                                                            <th class="text-center"> Product </th>
                                                            <th class="text-center"> Price </th>
                                                            <th class="text-center"> Quantity </th>
                                                            <th class="text-center"> Total </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="orderDetails" items="${listOrderDetails}">
                                                            <tr class="text-center">
                                                                <td> ${orderDetails.id}</td>
                                                                <td style="width: 50px;">
                                                                    <div
                                                                        style="float:left;padding-left:5%;max-width:100%;overflow:hidden;text-overflow:ellipsis;">
                                                                        <img src="/resources/admin/images/product/${orderDetails.product.image}"
                                                                            alt="image" />
                                                                        <span
                                                                            class="pl-2">${orderDetails.product.name}</span>
                                                                    </div>
                                                                </td>
                                                                <td> ${orderDetails.product.price} $</td>
                                                                <td> ${orderDetails.quantity}</td>
                                                                <td>${orderDetails.price} $</td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                                <div class="row">
                                                    <div class="col-md-6" style="text-align:center;">
                                                        <div class="form-group row">
                                                            <div style="margin-left: 13px;">
                                                                <input type="text" class="form-control"
                                                                    style="display: none;" />
                                                                <a href="/admin"
                                                                    class="btn btn-outline-secondary btn-fw">Back</a>
                                                                <div style="display:none;">
                                                                    <input type="text" name="orderId"
                                                                        value="${order.id}" />
                                                                </div>
                                                                <button type="submit" style="margin-left: 20px;"
                                                                    class="btn btn-warning btn-fw">Update</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form:form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- main-panel ends -->
                </div>
                <!-- page-body-wrapper ends -->
            </div>
            <script src="https://code.jquery.com/jquery-3.7.1.js"
                integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
            <script src="/resources/admin/js/handlefileselect.js"> </script>
            <!-- container-scroller -->
            <!-- plugins:js -->
            <script src="/resources/admin/assets/vendors/js/vendor.bundle.base.js"></script>
            <!-- endinject -->
            <!-- Plugin js for this page -->
            <script src="/resources/admin/assets/vendors/chart.js/Chart.min.js"></script>
            <script src="/resources/admin/assets/vendors/progressbar.js/progressbar.min.js"></script>
            <script src="/resources/admin/assets/vendors/jvectormap/jquery-jvectormap.min.js"></script>
            <script src="/resources/admin/assets/vendors/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
            <script src="/resources/admin/assets/vendors/owl-carousel-2/owl.carousel.min.js"></script>
            <!-- End plugin js for this page -->
            <!-- inject:js -->
            <script src="/resources/admin/assets/js/off-canvas.js"></script>
            <script src="/resources/admin/assets/js/hoverable-collapse.js"></script>
            <script src="/resources/admin/assets/js/misc.js"></script>
            <script src="/resources/admin/assets/js/settings.js"></script>
            <script src="/resources/admin/assets/js/todolist.js"></script>
            <!-- endinject -->
            <!-- Custom js for this page -->
            <script src="/resources/admin/assets/js/dashboard.js"></script>
            <!-- End custom js for this page -->
        </body>

        </html>