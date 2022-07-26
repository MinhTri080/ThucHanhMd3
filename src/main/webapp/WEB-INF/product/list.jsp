<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">

<
<head>

    <meta charset="utf-8">
    <title>Editable Table | Skote - Responsive Bootstrap 4 Admin Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="Premium Multipurpose Admin & Dashboard Template" name="description">
    <meta content="Themesbrand" name="author">
    <!-- App favicon -->
    <link rel="shortcut icon" href="assets\images\favicon.ico">
    <!-- DataTables -->
    <link href="assets\libs\datatables.net-bs4\css\dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css">
    <link href="assets/libs/datatables.net-autoFill-bs4/css/autoFill.bootstrap4.min.css" rel="stylesheet"
          type="text/css">
    <link href="assets\libs\datatables.net-keytable-bs4\css\keyTable.bootstrap4.min.css" rel="stylesheet"
          type="text/css">

    <!-- Responsive datatable examples -->
    <link href="assets\libs\datatables.net-responsive-bs4\css\responsive.bootstrap4.min.css" rel="stylesheet"
          type="text/css">

    <!-- Bootstrap Css -->
    <link href="assets\css\bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css">
    <!-- Icons Css -->
    <link href="assets\css\icons.min.css" rel="stylesheet" type="text/css">
    <!-- App Css-->
    <link href="assets\css\app.min.css" id="app-style" rel="stylesheet" type="text/css">

</head>
>
<body data-sidebar="dark">

<!-- Begin page -->
<div id="layout-wrapper">

    <jsp:include page="/WEB-INF/layout/header.jsp"></jsp:include>

    <!-- ========== Left Sidebar Start ========== -->
    <jsp:include page="/WEB-INF/layout/lefttable.jsp"></jsp:include>    <!-- Left Sidebar End -->

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
                            <h4 class="mb-0 font-size-18">Editable Tables</h4>

                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                    <li class="breadcrumb-item"><a href="javascript: void(0);">Tables</a></li>
                                    <li class="breadcrumb-item active">Editable Tables</li>
                                </ol>
                            </div>

                        </div>
                    </div>
                </div>
                <!-- end page title -->

                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">

                                <h4 class="card-title">Product List</h4>

                                <div class="table-responsive">
                                    <table class="table table-editable table-nowrap">
                                        <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Price</th>
                                            <th>Quantity</th>
                                            <th>Color</th>
                                            <th>Des</th>
                                            <th>Category</th>
                                            <th>Action</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${requestScope.listProduct}" var="product">
                                            <tr>
                                                <th>${product.getIdproduct()}</th>
                                                <th><c:out value="${product.getName()}"/></th>
                                                <th><c:out value="${product.getPrice()}"/></th>
                                                <th><c:out value="${product.getQuantity()}"/></th>
                                                <th><c:out value="${product.getColor()}"/></th>
                                                    <%--                                                <th><c:out value="${product.getImage()}"/></th>--%>
<%--                                                <td class="align-middle"><img src="${product.Color()}"></td>--%>
                                                <th><c:out value="${product.getDes()}"/></th>
                                                <th><c:out value="${product.getCategory()}"/></th>
                                                <th>
                                                    <a href="/product?action=update&id=${product.getIdproduct()}">Update</a>
                                                    <a href="/product?action=delete&id=${product.getIdproduct()}">Delete</a>
                                                </th>
                                            </tr>
                                        </c:forEach>
                                        </tbody>


                                    </table>
                                    <nav aria-label="Page navigation example">
                                        <ul class="pagination">

                                            <c:if test="${requestScope.currentPage != 1}">
                                                <li class="page-item"><a class="page-link"
                                                                         href="/product?page=${requestScope.currentPage - 1}">Previous</a>
                                                </li>
                                            </c:if>
                                            <c:forEach begin="1" end="${noOfPages}" var="i">
                                                <c:choose>
                                                    <c:when test="${requestScope.currentPage eq i}">
                                                        <li class="page-item"><a class="page-link"
                                                                                 href="/product?page=${i}">${i}</a></li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li class="page-item"><a class="page-link"
                                                                                 href="/product?page=${i}">${i}</a></li>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                            <c:if test="${requestScope.currentPage lt requestScope.noOfPages}">
                                                <li class="page-item"><a class="page-link"
                                                                         href="/product?page=${requestScope.currentPage + 1}">Next</a>
                                                </li>
                                            </c:if>
                                        </ul>
                                    </nav>
                                </div>

                            </div>
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
                        <script>document.write(new Date().getFullYear())</script>
                        © Skote.
                    </div>
                    <div class="col-sm-6">
                        <div class="text-sm-right d-none d-sm-block">
                            Design & Develop by Themesbrand
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </div>
    <!-- end main content-->

</div>


<!-- Right bar overlay-->
<div class="rightbar-overlay"></div>

<!-- JAVASCRIPT -->
<script src="assets\libs\jquery\jquery.min.js"></script>
<script src="assets\libs\bootstrap\js\bootstrap.bundle.min.js"></script>
<script src="assets\libs\metismenu\metisMenu.min.js"></script>
<script src="assets\libs\simplebar\simplebar.min.js"></script>
<script src="assets\libs\node-waves\waves.min.js"></script>

<!-- Required datatable js -->
<script src="assets\libs\datatables.net\js\jquery.dataTables.min.js"></script>
<script src="assets\libs\datatables.net-bs4\js\dataTables.bootstrap4.min.js"></script>

<script src="assets/libs/datatables.net-autoFill/js/dataTables.autoFill.min.js"></script>
<script src="assets/libs/datatables.net-autoFill-bs4/js/autoFill.bootstrap4.min.js"></script>

<script src="assets\libs\datatables.net-keytable\js\dataTables.keyTable.min.js"></script>

<!-- Responsive examples -->
<script src="assets\libs\datatables.net-responsive\js\dataTables.responsive.min.js"></script>

<script src="assets\libs\bootstrap-editable\js\index.js"></script>

<script src="assets\js\pages\table-editable.int.js"></script>

<script src="assets\js\app.js"></script>

</body>
</html>
