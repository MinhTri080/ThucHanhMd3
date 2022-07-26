<!doctype html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <title>Form Validation | Skote - Responsive Bootstrap 4 Admin Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="Premium Multipurpose Admin & Dashboard Template" name="description">
    <meta content="Themesbrand" name="author">
    <!-- App favicon -->
    <link rel="shortcut icon" href="assets\images\favicon.ico">

    <!-- Bootstrap Css -->
    <link href="assets\css\bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css">
    <!-- Icons Css -->
    <link href="assets\css\icons.min.css" rel="stylesheet" type="text/css">
    <!-- App Css-->
    <link href="assets\css\app.min.css" id="app-style" rel="stylesheet" type="text/css">

</head>

<body data-sidebar="dark">

<!-- Begin page -->
<div id="layout-wrapper">

    <jsp:include page="/WEB-INF/layout/header.jsp"></jsp:include>

    <!-- ========== Left Sidebar Start ========== -->
    <jsp:include page="/WEB-INF/layout/lefttable.jsp"></jsp:include>
    <!-- Left Sidebar End -->

    <!-- ============================================================== -->
    <!-- Start right Content here -->
    <!-- ============================================================== -->
    <div class="main-content">

        <div class="page-content">
            <div class="container-fluid">

                <!-- start page title -->
                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box d-flex align-items-center justify-content-between">
                            <h4 class="mb-0 font-size-18"> create</h4>

                        </div>
                    </div>
                </div>
                <!-- end page title -->

                <div class="row">
                    <div class="col-xl-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">create</h4>
                                <form class="needs-validation"  method="post" enctype="multipart/form-data">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="name"> Name Product</label>
                                                <input type="text" class="form-control" id="name" name="name" placeholder="productname"  required>
                                                <div class="valid-feedback">
                                                </div>
                                            </div>
                                        </div>
                                        <%--                                        <div class="col-md-6">--%>
                                        <%--                                            <div class="form-group">--%>
                                        <%--                                                <label for="price">PassWord</label>--%>
                                        <%--                                                <input type="password" class="form-control" id="password" name="password" placeholder="password"  required>--%>
                                        <%--                                                <div class="valid-feedback">--%>
                                        <%--                                                </div>--%>
                                        <%--                                            </div>--%>
                                        <%--                                        </div>--%>
                                    </div>
                                    <div class="row">
                                        <%--                                        <div class="col-md-4">--%>
                                        <%--                                            <div class="form-group">--%>
                                        <%--                                                <label for="name">Name Product</label>--%>
                                        <%--                                                <input type="text" class="form-control" id="name" name="name" placeholder="Lê Minh Trí"  required>--%>
                                        <%--                                                <div class="invalid-feedback">--%>
                                        <%--                                                    Please provide a valid city.--%>
                                        <%--                                                </div>--%>
                                        <%--                                            </div>--%>
                                        <%--                                        </div>--%>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="price">Price</label>
                                                <input type="number" class="form-control" id="price" name="price" placeholder="Input product price"  required>
                                                <div class="invalid-feedback">
                                                    Please provide a valid Price.
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="quantity">Quantity</label>
                                                <input type="number" class="form-control" id="quantity" name="quantity"   required>
                                                <div class="invalid-feedback">
                                                    Please provide a valid quantity.
                                                </div>
                                            </div>
                                        </div>
<%--                                        <div class="col-md-4">--%>
<%--                                            <div class="form-group">--%>
<%--                                                <label for="image">image</label>--%>
<%--                                                <input type="file" class="form-control" id="image" name="file" accept="image/png, image/jpeg" required>--%>
<%--                                                <div class="invalid-feedback">--%>
<%--                                                    Please provide a valid role.--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label for="quantity">Color</label>
                                                    <input type="text" class="form-control" id="color" name="color"   required>
                                                    <div class="invalid-feedback">
                                                        Please provide a valid color.
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label for="des">Des</label>
                                                    <input type="text" class="form-control" id="des" name="des"   required>
                                                    <div class="invalid-feedback">
                                                        Please provide a valid quantity.
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label for="quantity">Category</label>
                                                    <input type="text" class="form-control" id="category" name="category"   required>
                                                    <div class="invalid-feedback">
                                                        Please provide a valid category.
                                                    </div>
                                                </div>
                                            </div>

                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="form-group">
                                                <div class="custom-control custom-checkbox">
                                                    <%--                                                    <input type="checkbox" class="custom-control-input" id="invalidCheck" >--%>
                                                    <%--                                                    <label class="custom-control-label" for="invalidCheck">Agree to terms and conditions</label>--%>
                                                    <%--                                                    <div class="invalid-feedback">--%>
                                                    <%--                                                        You must agree before submitting.--%>
                                                    <%--                                                    </div>--%>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <button class="btn btn-primary" type="submit" value="save">Submit</button>
                                </form>
                            </div>
                        </div>
                        <!-- end card -->
                    </div> <!-- end col -->

                    <div class="col-xl-6">
                        <div class="card">

                        </div>
                        <!-- end card -->
                    </div> <!-- end col -->
                </div>
                <!-- end row -->
                <div class="row">
                    <div class="col-xl-6">
                        <div class="card">

                        </div>
                    </div> <!-- end col -->

                    <div class="col-xl-6">
                        <div class="card">

                        </div>
                    </div> <!-- end col -->
                </div> <!-- end row -->

            </div> <!-- container-fluid -->
        </div>
        <!-- End Page-content -->


        <footer class="footer">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-6">
                        <script>document.write(new Date().getFullYear())</script> © Skote.
                    </div>
                </div>
            </div>
        </footer>
    </div>
    <!-- end main content-->

</div>

<!-- JAVASCRIPT -->
<script src="assets\libs\jquery\jquery.min.js"></script>
<script src="assets\libs\bootstrap\js\bootstrap.bundle.min.js"></script>
<script src="assets\libs\metismenu\metisMenu.min.js"></script>
<script src="assets\libs\simplebar\simplebar.min.js"></script>
<script src="assets\libs\node-waves\waves.min.js"></script>

<script src="assets\libs\parsleyjs\parsley.min.js"></script>

<script src="assets\js\pages\form-validation.init.js"></script>

<script src="assets\js\app.js"></script>

</body>
</html>
