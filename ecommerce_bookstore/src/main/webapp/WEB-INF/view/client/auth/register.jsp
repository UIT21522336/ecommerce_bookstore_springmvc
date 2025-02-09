<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Corona Admin</title>
        <!-- plugins:css -->
        <link rel="stylesheet" href="/resources/admin/assets/vendors/mdi/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="/resources/admin/assets/vendors/css/vendor.bundle.base.css">
        <!-- endinject -->
        <!-- Plugin css for this page -->
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
            <div class="container-fluid page-body-wrapper full-page-wrapper">
                <div class="row w-100 m-0">
                    <div class="content-wrapper full-page-wrapper d-flex align-items-center auth login-bg">
                        <div class="card col-lg-8 mx-auto">
                            <div class="card-body px-5 py-5">
                                <h3 class="card-title text-left mb-3">Register</h3>
                                <form:form class="form-sample" action="/register" enctype="multipart/form-data"
                                    method="post" modelAttribute="registerUserDTO">
                                    <div class="row mb-5" style="text-align:center;">
                                        <div id="previewImage" style="margin:auto;">
                                            <img src="https://media.istockphoto.com/id/1142192548/vector/man-avatar-profile-male-face-silhouette-or-icon-isolated-on-white-background-vector.jpg?s=612x612&w=0&k=20&c=DUKuRxK9OINHXt3_4m-GxraeoDDlhNuCbA9hp6FotFE="
                                                style="height: 200px;width: 200px;">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label">First Name</label>
                                                <div class="col-sm-9">
                                                    <form:input type="text" class="form-control" path="firstName" />
                                                    <form:errors path="firstName" cssClass="text-danger" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label">Last Name</label>
                                                <div class="col-sm-9">
                                                    <form:input type="text" class="form-control" path="lastName" />
                                                    <form:errors path="lastName" cssClass="text-danger" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label">Gender</label>
                                                <div class="col-sm-9">
                                                    <form:select class="form-control" path="gender">
                                                        <option>Male</option>
                                                        <option>Female</option>
                                                    </form:select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label">Email</label>
                                                <div class="col-sm-9">
                                                    <form:input type="text" class="form-control" path="email" />
                                                    <form:errors path="email" cssClass="text-danger" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label">Phone number</label>
                                                <div class="col-sm-9">
                                                    <form:input type="tel" class="form-control" path="phone" />
                                                    <form:errors path="phone" cssClass="text-danger" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label">Province</label>
                                                <div class="col-sm-9">
                                                    <form:select class="form-control" id="ls_province"
                                                        name="ls_province" path="province">
                                                    </form:select>
                                                    <form:errors path="province" cssClass="text-danger" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label">District</label>
                                                <div class="col-sm-9">
                                                    <form:select class="form-control" id="ls_district"
                                                        name="ls_district" path="district">
                                                    </form:select>
                                                    <form:errors path="district" cssClass="text-danger" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label">Ward</label>
                                                <div class="col-sm-9">
                                                    <form:select class="form-control" id="ls_ward" name="ls_ward"
                                                        path="ward">
                                                    </form:select>
                                                    <form:errors path="ward" cssClass="text-danger" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label">Address</label>
                                                <div class="col-sm-9">
                                                    <form:input type="text" class="form-control" path="address" />
                                                    <form:errors path="address" cssClass="text-danger" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label">Avatar</label>
                                                <div class="col-sm-9">
                                                    <input class="form-control" accept=".jpg, .png, .jpeg" type="file"
                                                        id="formFile" name="fileImage">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div style="display: none;">
                                        <form:input type="text" class="form-control" path="role" value="CLIENT" />
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label">Password</label>
                                                <div class="col-sm-9">
                                                    <form:input type="password" class="form-control" path="password" />
                                                    <form:errors path="password" cssClass="text-danger" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label">Confirm
                                                    password</label>
                                                <div class="col-sm-9">
                                                    <form:input type="password" class="form-control"
                                                        path="confirmPassword" />
                                                    <form:errors path="confirmPassword" cssClass="text-danger" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="text-center">
                                        <button type="submit"
                                            class="btn btn-primary btn-block enter-btn">Register</button>
                                    </div>
                                    <div class="d-flex">
                                        <button class="btn btn-facebook col mr-2">
                                            <i class="mdi mdi-facebook"></i> Facebook </button>
                                        <button class="btn btn-google col">
                                            <i class="mdi mdi-google-plus"></i> Google plus </button>
                                    </div>
                                </form:form>
                            </div>
                        </div>
                    </div>
                    <!-- content-wrapper ends -->
                </div>
                <!-- row ends -->
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