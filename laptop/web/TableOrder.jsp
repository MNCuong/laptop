<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <%@page contentType="text/html" pageEncoding="UTF-8" %>

    <head>
        <meta charset="utf-8">
        <title>Danh sách đặt hàng</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Roboto:wght@500;700&display=swap" rel="stylesheet"> 

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="admin/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="admin/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="admin/css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="admin/css/style.css" rel="stylesheet">
    </head>

    <body>
        <div class="container-fluid position-relative d-flex p-0">
            <!-- Spinner Start -->
            <div id="spinner" class="show bg-dark position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
                <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                    <span class="sr-only">Đang tải...</span>
                </div>
            </div>
            <!-- Spinner End -->

            <%@include file="component/SideBarAdmin.jsp" %>

            <!-- Content Start -->
            <div class="content">
                <%@include file="component/navbarAdmin.jsp" %>
                <!-- Blank Start -->

                <div class="container-fluid pt-4 px-4">
                    <div class="container-fluid pt-4 px-4">
                        <div class="row g-4">
                            <div class="bg-secondary text-center rounded p-4">
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <h6 class="mb-0">Tất cả đơn đặt hàng</h6>

                                </div>
                                <form action="searchOr" method="post">
                                    <div class="input-group">
                                        <input type="text"  placeholder="Search for order" name="txt">
                                        <div class="input-group-append">
                                            <button type="submit" class="btn btn-primary">
                                                <i class="fa fa-search"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                                <div class="table-responsive">
                                    <table id="categoryTable" class="table text-start align-middle table-bordered table-hover mb-0">
                                        <thead>
                                            <tr class="text-white">
                                                <th scope="col">STT</th>
                                                <th scope="col">Mã đơn hàng</th>
                                                <th scope="col">Ngày đăt hàng</th>
                                                <th scope="col">Khách hàng</th>
                                                <th scope="col">Tình trạng</th>
                                                <th scope="col"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:set var="tt" value="0"/>
                                            <c:forEach var="la" items="${ListOrder}">
                                                <c:set var="tt" value="${tt+1}"/>
                                                <tr>
                                                    <td>${tt}</td>
                                                    <td>${la.getOrderID()}</td>
                                                    <td>${la.getOrderDate()}</td>
                                                    <td>${la.getFullname()}</td>
                                                    <td class="col-md-3">
                                                        <c:if test="${la.getStatus() != 4 && la.getStatus() != 3}">
                                                            <select class="form-select form-select-sm col-md-3" aria-label=".form-select-sm example" onchange="handleOptionChange(this)">
                                                                <c:if test="${la.getStatus() == 0}">
                                                                    <option>Đang chờ tiến hành</option>
                                                                    <option value="1" name="${la.getOrderID()}">Xác nhận và đóng gói</option>
                                                                    <option value="2" name="${la.getOrderID()}">Đang giao hàng</option>
                                                                    <option value="3" name="${la.getOrderID()}">Đã giao hàng</option>
                                                                    <option value="4" name="${la.getOrderID()}">Hủy đơn</option>
                                                                </c:if>
                                                                <c:if test="${la.getStatus() == 1}">
                                                                    <option>Xác nhận và đóng gói</option>
                                                                    <option value="0" name="${la.getOrderID()}">Đang chờ tiến hành</option>
                                                                    <option value="2" name="${la.getOrderID()}">Đang giao hàng</option>
                                                                    <option value="3" name="${la.getOrderID()}">Đã giao hàng</option>
                                                                    <option value="4" name="${la.getOrderID()}">Hủy đơn</option>
                                                                </c:if>
                                                                <c:if test="${la.getStatus() == 2}">
                                                                    <option>Đang giao hàng</option>
                                                                    <option value="0" name="${la.getOrderID()}">Đang chờ tiến hành</option>
                                                                    <option value="1" name="${la.getOrderID()}">Xác nhận và đóng gói</option>
                                                                    <option value="3" name="${la.getOrderID()}">Đã giao hàng</option>
                                                                    <option value="4" name="${la.getOrderID()}">Hủy đơn</option>
                                                                </c:if>
                                                            </select>
                                                        </c:if>
                                                        <c:if test="${la.getStatus() == 3}">
                                                            <p style="color: green">Đã giao hàng</p>
                                                        </c:if>
                                                        <c:if test="${la.getStatus() == 4}">
                                                            <p>Đơn hàng này đã bị hủy</p>
                                                        </c:if>
                                                    </td>
                                                    <td><a class="btn btn-sm btn-primary" href="detailOrder?id=${la.getOrderID()}">Chi tiết</a></td>       
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <div id="pagination"></div>
                            </div>
                        </div>
                    </div>
                    <!-- Blank End -->
                    <!--Modal-->
                    <!-- Footer Start -->
                    <div class="container-fluid pt-4 px-4">
                        <div class="bg-secondary rounded-top p-4">
                            <div class="row">
                                <div class="col-12 col-sm-6 text-center text-sm-start">
                                    &copy; <a href="#">MNC</a>, Toàn quyền. 
                                </div>
                                
                            </div>
                        </div>
                    </div>
                    <!-- Footer End -->
                </div>
                <!-- Content End -->


                <!-- Back to Top -->
                <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
            </div>

            <!-- JavaScript Libraries -->
            <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
            <script src="admin/lib/chart/chart.min.js"></script>
            <script src="admin/lib/easing/easing.min.js"></script>
            <script src="admin/lib/waypoints/waypoints.min.js"></script>
            <script src="admin/lib/owlcarousel/owl.carousel.min.js"></script>
            <script src="admin/lib/tempusdominus/js/moment.min.js"></script>
            <script src="admin/lib/tempusdominus/js/moment-timezone.min.js"></script>
            <script src="admin/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

            <!-- Template Javascript -->
            <script src="admin/js/main.js"></script>
            <script>
                                                                function handleOptionChange(selectElement) {
                                                                    var selectedOption = selectElement.value;
                                                                    var name = selectElement.options[selectElement.selectedIndex].getAttribute('name');
                                                                    if (selectedOption === "0") {
                                                                        window.location.href = "change?id=" + name + "&status=0";
                                                                    } else if (selectedOption === "1") {
                                                                        window.location.href = "change?id=" + name + "&status=1";
                                                                    } else if (selectedOption === "2") {
                                                                        window.location.href = "change?id=" + name + "&status=2";
                                                                    } else if (selectedOption === "3") {
                                                                        window.location.href = "change?id=" + name + "&status=3";
                                                                    } else if (selectedOption === "4") {
                                                                        window.location.href = "change?id=" + name + "&status=4";
                                                                    }
                                                                }
            </script>
    </body>

</html>