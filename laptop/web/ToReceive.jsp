<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="DAO.*" %>
<%@page import="Model.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Nhận hàng</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">  

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
    </head>

    <body>
        <%@include file="component/topbar.jsp" %>
        <%@include file="component/navbar.jsp" %>


       <!-- Breadcrumb Start -->
        <div class="container-fluid">
            <div class="row px-xl-5">
                <div class="col-12">
                    <nav class="breadcrumb bg-light mb-30">
                        <a class="breadcrumb-item text-dark" href="home">Trang chủ</a>
                        <a class="breadcrumb-item text-dark" href="shop">Shop</a>
                        <span class="breadcrumb-item active">Giao dịch mua hàng của tôi</span>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Breadcrumb End -->


        <div class="container-fluid navigation">
            <div class="row">
                <div class="col-12">
                    <div class="row">
                        <div class="col-2 text-center">
                            <a   class="text-dark nav-link" href="mypurchase">Tất cả</a>
                        </div>
                        <div class="col-2 text-center active">
                            <a class="text-dark nav-link" href="topay">Thanh toán</a>
                        </div>
                        <div class="col-2 text-center">
                            <a class="text-dark nav-link" href="toship">Giao hàng</a>
                        </div>
                        <div class="col-2 text-center">
                            <a class="text-dark nav-link" href="toreceive">Nhận hàng</a>
                        </div>
                        <div class="col-2 text-center">
                            <a class="text-dark nav-link" href="completed">Đã hoàn thành</a>
                        </div>
                        <div class="col-2 text-center">
                            <a id="special-link"  class="text-dark nav-link" href="cancelled">Đã hủy</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <style>
            #special-link {
                border-bottom: 2px solid red;
            }

            .navigation {
                background-color: #FFFFFF;
                border-bottom: 1px solid #e0e0e0;
                padding: 20px;
                width: 92%;
                margin-bottom: 20px
            }

            .navigation .row .col-2.text-center {
                padding: 0 15px;
            }

            .navigation .row .col-2.text-center a.nav-link {
                color: #333;
                text-decoration: none;
                font-weight: 500;
                display: block;
                transition: color 0.3s ease;
            }

            .navigation .row .col-2.text-center.active a.nav-link {
                color: #ff4500;
            }

            .navigation .row .col-2.text-center a.nav-link:hover {
                color: #ff4500;
            }

        </style>


        <!-- Cart Start -->
        <div class="container-fluid">
            <c:set var="tt" value="0"/>
            <c:forEach items="${purchase}" var="p">
                <c:set var="tt" value="${tt+1}"/>
                <div class="row px-xl-5 ">
                    <div class="col-12">
                        <div class="thead-dark">
                            <span>${p.orderDate}</span>
                            <c:if test="${p.status == 0}">
                                <span>|</span>
                                <span style="font-weight: bold;color: #7A9D54">Đang chờ xử lý</span>
                                <span>|</span>
                                <span><a href="ordertracking?orderid=${p.orderID}&acountid=${account.getAccountID()}" style="color: #BF9742">Theo dõi đơn hàng</a></span>
                                <span>|</span>
                                <span><a href="#" onclick="showMess(${p.orderID})" style="color: #BDCDD6">Hủy</a></span>
                            </c:if>
                            <c:if test="${p.status == 1}">
                                <span>|</span>
                                <span style="font-weight: bold;color: #7A9D54">Xác nhận và đóng gói</span>
                                <span>|</span>
                                <span><a href="ordertracking?orderid=${p.orderID}&acountid=${account.getAccountID()}" style="color: #BF9742">Theo dõi đơn hàng</a></span>                       
                            </c:if>
                            <c:if test="${p.status == 2}">
                                <span>|</span>
                                <span style="font-weight: bold;color: #7A9D54">Đang giao hàng</span>
                                <span>|</span>
                                <span><a href="ordertracking?orderid=${p.orderID}&acountid=${account.getAccountID()}" style="color: #BF9742">Theo dõi đơn hàng</a></span>

                            </c:if>
                            <c:if test="${p.status == 3}">
                                <span>|</span>
                                <span style="font-weight: bold;color: #4FC0D0">Đã hoàn thành</span>
                                <span>|</span>
                                <span><a href="ordertracking?orderid=${p.orderID}&acountid=${account.getAccountID()}" style="color: #BF9742">Theo dõi đơn hàng</a></span>

                            </c:if>
                            <c:if test="${p.status == 4}">
                                <span>|</span>
                                <span style="font-weight: bold;color: red">Đã hủy</span>
                                <span>|</span>
                                <span><a href="ordertracking?orderid=${p.orderID}&acountid=${account.getAccountID()}" style="color: #BF9742">Theo dõi đơn hàng</a></span>                      
                            </c:if>

                        </div>
                        <hr><!-- comment -->
                        <table class="table table-light table-borderless table-hover text-center mb-0">
                            <tbody class="align-middle">
                                <c:forEach var="k" items="${odDAO.getOrderDetailByID(p.getOrderID())}">

                                    <tr>
                                        <td class="align-middle"><img style="width: 80px" class="img-fluid" src="images/Product/${pDAO.getProductByID(k.getProduct_id()).getImage()}" alt="Image"></td> 
                                        <td class="align-middle">${pDAO.getProductByID(k.getProduct_id()).getName()}</td>
                                        <td class="align-middle">x ${k.getQuantity()}</td>
                                        <td class="align-middle">${(pDAO.getProductByID(k.getProduct_id()).getPrice()*k.getQuantity())}$</td> 
                                    </tr>
                                </c:forEach>


                            </tbody>
                        </table>
                        <div class="right-side" style="margin-right: 5.5rem;
                             margin-top: 1rem; text-align: right;">
 
                                <span style="font-weight: bold">Total: ${p.totalPrice}</span>
                        </div>
                    </div>

                </div>
            </c:forEach>
        </div>



        <c:set var="i" value="0"/>
        <c:forEach items="${purchase}" var="p">
            <c:set var="i" value="${i+1}"/>
            <div class="modal fade" id="orderModal${i}" tabindex="-1" role="dialog" aria-labelledby="orderModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="orderModalLabel">Chi tiết đặt hàng</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <table class="table table-light table-borderless table-hover text-center mb-0">
                                <tr>
                                    <th>Tên sản phẩm</th>
                                    <th>Số lượng</th>
                                    <th >Giá</th>
                                    <th >Feedback</th>
                                </tr>
                                <c:forEach var="k" items="${odDAO.getOrderDetailByID(p.getOrderID())}">
                                    <tr>

                                        <td>${pDAO.getProductByID(k.getProduct_id()).getName()}</td>
                                        <td>${k.getQuantity()}</td>
                                        <td>${(pDAO.getProductByID(k.getProduct_id()).getPrice()*k.getQuantity())}$</td>
                                        <c:if test="${p.status == 3 && fdao.checkfeedback(p.getOrderID(),k.getProduct_id()).isEmpty()}">
                                            <td><a href="feedback?productid=${k.getProduct_id()}&orderid=${p.getOrderID()}"> Feedback</a></td>
                                        </c:if>

                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach> 
        <!-- Cart End -->
        <%@include file="component/footer.jsp" %>
        <!-- Back to Top -->
        <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Contact Javascript File -->
        <script src="mail/jqBootstrapValidation.min.js"></script>
        <script src="mail/contact.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
        <script>
                                    // Xử lý sự kiện khi nhấp vào nút "Detail"
                                    var btnDetails = document.getElementsByClassName("btn-detail");
                                    var modalBody = document.querySelector("#orderModal .modal-body");

                                    for (var i = 0; i < btnDetails.length; i++) {
                                        btnDetails[i].addEventListener("click", function () {
                                            // Lấy thông tin chi tiết đơn hàng
                                            var orderDetail = /* Lấy thông tin chi tiết đơn hàng tương ứng với nút nhấp */;
                                                    // Hiển thị thông tin chi tiết đơn hàng trong modal
                                                    modalBody.innerHTML = orderDetail;
                                        });
                                    }
        </script>
        <script>
            function showMess(id) {
                var option = confirm('Are you sure to cancel order?');
                if (option === true) {
                    window.location.href = 'cancelO?oid=' + id;
                }
            }
        </script>
    </body>

</html>