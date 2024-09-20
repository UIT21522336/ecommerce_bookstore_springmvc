<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Create product</title>
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
                                        <h4 class="card-title">Create user</h4>
                                        <form class="form-sample" action="/admin/users/create"
                                            enctype="multipart/form-data" method="post">
                                            <div class="row mb-5" style="text-align:center;">
                                                <div id="previewImage" style="margin:auto;">
                                                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVZYs7v0iOwkwBwbKRWeWpfzY6Sm7hQL26pg&s"
                                                        style="height: 200px;width: 200px;">
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group row">
                                                        <label class="col-sm-3 col-form-label">Name</label>
                                                        <div class="col-sm-9">
                                                            <input type="text" class="form-control" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group row">
                                                        <label class="col-sm-3 col-form-label">Author</label>
                                                        <div class="col-sm-9">
                                                            <input type="text" class="form-control" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group row">
                                                        <label class="col-sm-3 col-form-label">Publisher</label>
                                                        <div class="col-sm-9">
                                                            <input type="text" class="form-control" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group row">
                                                        <label class="col-sm-3 col-form-label">Format</label>
                                                        <div class="col-sm-9">
                                                            <input type="text" class="form-control" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group row">
                                                        <label class="col-sm-3 col-form-label">Category</label>
                                                        <div class="col-sm-9">
                                                            <input type="text" class="form-control" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group row">
                                                        <label class="col-sm-6 col-form-label">Quantity</label>
                                                        <div class="col-sm-6">
                                                            <input type="text" class="form-control" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group row">
                                                        <label class="col-sm-3 col-form-label">Avatar</label>
                                                        <div class="col-sm-9">
                                                            <input class="form-control" accept=".jpg, .png, .jpeg"
                                                                type="file" id="formFile" name="fileImage">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group row">
                                                        <label class="col-sm-6 col-form-label">Description</label>
                                                        <div class="col-sm-12">
                                                            <textarea class="form-control" rows="3"></textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6" style="text-align:center;">
                                                    <div class="form-group row">
                                                        <div style="margin-left: 13px;">
                                                            <a href="/admin/users"
                                                                class="btn btn-outline-secondary btn-fw">Back</a>
                                                            <button type="submit" style="margin-left: 20px;"
                                                                class="btn btn-outline-success btn-fw">Create</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
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
        <script src="https://code.jquery.com/jquery-3.7.1.js"
            integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
        <script type="text/javascript" src="/resources/admin/js/vietnamlocalselector.js"></script>
        <script>
            var localpicker = new LocalPicker({
                province: "ls_province",
                district: "ls_district",
                ward: "ls_ward"
            });
            var options = {
                /*
                HTML Selector. You can pass value of name, id or class. 
                It will automatically detect exist elements for you.
                Example: 'myIdOrClass','#myId', '.myClass', 'myName'
                */
                province: 'ls_province',
                district: 'ls_district',
                ward: 'ls_ward',

                /*
                Define value for option tag. Valid option: id|name           
                */
                getValueBy: 'id',

                //Placeholder text
                provinceText: 'Chọn tỉnh / thành phố',
                districtText: 'Chọn quận / huyện',
                districtNoText: 'Địa phương này không có quận / huyện',
                wardText: 'Chọn phường / xã',
                wardNoText: 'Địa phương này không có phường / xã',

                // Default value if no location exist
                emptyValue: " ",

                // Hide option where no local exist
                hideEmptyValueOption: true,

                // Hide place-holder option (first option)
                hidePlaceHolderOption: true,

                /*
                Include local level on option text as prefix
                Example: true = Quận Bình Thạnh | false = Bình Thạnh
                */
                provincePrefix: false,
                districtPrefix: true,
                wardPrefix: true,

                /*
                Include local level in option tag's attribute
                */
                levelAsAttribute: true,
                levelAttributeName: "data-level",
            };
        </script>
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