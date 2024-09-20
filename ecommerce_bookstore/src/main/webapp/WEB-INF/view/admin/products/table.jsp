<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Manage products</title>
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
                                        <div class="d-flex justify-content-between">
                                            <h4 class="card-title">Users list</h4>
                                            <button type="button" class="btn btn-primary btn-fw"><a
                                                    style="color: white; text-decoration: none;"
                                                    href="/admin/users/create">Create user</a></button>
                                        </div>
                                        <div class="table-responsive">
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th class="text-center"> User Id </th>
                                                        <th class="text-center"> Full Name </th>
                                                        <th class="text-center"> Role </th>
                                                        <th class="text-center"> Email </th>
                                                        <th class="text-center"> Phone number </th>
                                                        <th class="text-center"> Action </th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="user" items="${users}">
                                                        <tr class="text-center">
                                                            <td> ${user.getId()} </td>
                                                            <td>
                                                                <div style="float:left;padding-left:30%;">
                                                                    <img src="/resources/admin/images/avatar/${user.getAvatar()}"
                                                                        alt="image" />
                                                                    <span class="pl-2">${user.getFullName()}</span>
                                                                </div>
                                                            </td>
                                                            <td> ${user.getRole().getName()} </td>
                                                            <td> ${user.getEmail()} </td>
                                                            <td> ${user.getPhone()} </td>
                                                            <td>
                                                                <a class="badge badge-outline-success"
                                                                    href="/admin/users/detail/${user.getId()}">Detail</a>
                                                                <a class="badge badge-warning"
                                                                    href="/admin/users/update/${user.getId()}"
                                                                    style="margin-left: 20px;margin-right: 20px;">Update</a>
                                                                <a class="badge badge-danger"
                                                                    href="/admin/users/delete/${user.getId()}">Delete</a>
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
                    <!-- content-wrapper ends -->
                    <!-- partial:partials/_footer.html -->
                    <jsp:include page="../layout/footer.jsp" />
                    <!-- partial -->
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