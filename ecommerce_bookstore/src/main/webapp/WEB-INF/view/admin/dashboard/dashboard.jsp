<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Dashboard</title>
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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
        <style>
            .table td,
            .table th {
                text-align: center;
                vertical-align: middle;
            }

            .table td:nth-child(2) {
                text-align: left;
            }
        </style>
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
                                        <h4 class="card-title">Orders List</h4>
                                        <div class="table-responsive">
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th> Order Number </th>
                                                        <th> Client </th>
                                                        <th> Total Charge </th>
                                                        <th> Payment Method </th>
                                                        <th> Payment Status </th>
                                                        <th> Order Status </th>
                                                        <th> View/Update Details </th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="order" items="${orders}">
                                                        <tr>
                                                            <td> #${order.id} </td>
                                                            <td>
                                                                <img src="/resources/admin/images/avatar/${order.user.avatar}"
                                                                    alt="image" />
                                                                <span class="pl-2">${order.user.fullName}</span>
                                                            </td>
                                                            <td> ${order.totalPrice} $ </td>
                                                            <td> ${order.paymentMethod} </td>
                                                            <c:choose>
                                                                <c:when
                                                                    test="${order.paymentStatus.equals('PAYMENT_UNPAID')}">
                                                                    <td>
                                                                        <div class="badge badge-outline-warning">UNPAID
                                                                        </div>
                                                                    </td>
                                                                </c:when>
                                                                <c:when
                                                                    test="${order.paymentStatus.equals('PAYMENT_SUCCESS')}">
                                                                    <td>
                                                                        <div class="badge badge-outline-success">PAID
                                                                        </div>
                                                                    </td>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <td>
                                                                        <div class="badge badge-outline-danger">FAILED
                                                                        </div>
                                                                    </td>
                                                                </c:otherwise>
                                                            </c:choose>
                                                            <c:choose>
                                                                <c:when test="${order.status.equals('PENDING')}">
                                                                    <td>
                                                                        <div class="badge badge-warning">PENDING
                                                                        </div>
                                                                    </td>
                                                                </c:when>
                                                                <c:when test="${order.status.equals('SHIPPING')}">
                                                                    <td>
                                                                        <div class="badge badge-info">
                                                                            SHIPPING
                                                                        </div>
                                                                    </td>
                                                                </c:when>
                                                                <c:when test="${order.status.equals('COMPLETED')}">
                                                                    <td>
                                                                        <div class="badge badge-success">
                                                                            COMPLETED
                                                                        </div>
                                                                    </td>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <td>
                                                                        <div class="badge badge-danger">
                                                                            CANCELLED
                                                                        </div>
                                                                    </td>
                                                                </c:otherwise>
                                                            </c:choose>
                                                            <td>
                                                                <div><a href="/admin/orders/${order.id}"><i
                                                                            class="bi bi-receipt-cutoff"></i></a>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
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