<%-- 
    Document   : ProfileUser
    Created on : Jul 20, 2023, 11:01:38 AM
    Author     : MNC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="select.css">
        <link href="css/style.css" rel="stylesheet">
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
        <link rel="stylesheet" href="css/productCard.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

        <title>Document</title>
    </head>

    <body>
        <%@include file="component/topbar.jsp" %>
        <%@include file="component/navbar.jsp" %>
        <div class="container rounded bg-white mt-5 mb-5">
            <form action="UserProfile?aid=${account.getAccountID()}" method="post" id="formUpdate" onsubmit="return ValidateProfileForm()">
                <div class="row">
                    <div class="col-md-3 border-right">
                        <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                            <img class="rounded-circle mt-5" width="180px" src="images/user.jpg">
                            <span class="font-weight-bold">${account.getUsername()}</span>
                            <span class="text-black-50">${account.getEmail()}</span>
                        </div>
                    </div>
                    <div class="col-md-5 border-right">
                        <div class="p-3 py-5">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h4 class="text-right">Cài đặt thông tin</h4>
                            </div>

                            <div class="row mt-3">
                                <div class="col-md-12">
                                    <label class="labels">Tài khoản người dùng</label>
                                    <input type="text" class="form-control"  value="${account.getUsername()}" name="user" id="uname">
                                </div>
                                <div class="col-md-12">
                                    <label class="labels">Họ và tên</label>
                                    <input type="text" class="form-control" value="${account.getFullname()}" name="name" id="ufullname">
                                </div>
                                <div class="col-md-12">
                                    <label class="labels">Số điẹne thoại</label>
                                    <input type="text" class="form-control"  value="${account.getPhone()}" name="mobile" id="uphone">
                                </div>
                                <div class="col-md-12">
                                    <label class="labels">Email</label>
                                    <input type="text" class="form-control"  value="${account.getEmail()}" name="email" id="uemail">
                                </div>
                                <div class="col-md-12">
                                    <label class="labels">Đại chỉ</label>
                                    <input type="text" class="form-control"  value="${account.getAddress()}" name="address" id="uaddress">
                                </div>
                            </div>
                            <div class="mt-5 text-center">
                                <button class="btn btn-primary profile-button" type="submit" onclick="confirmSave()" name="update" value="profile">Save Profile</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="p-3 py-5">
                            <div class="d-flex justify-content-between align-items-center experience">
                                <span>Mật khẩu</span>
                                <button class="border px-3 p-1 add-experience" onclick="openPasswordModal()" type="button">
                                    <i class="fa fa-edit"></i>&nbsp;Thay đổi mật khẩu
                                </button>
                            </div>
                            <br>
                        </div>
                    </div>
                </div>
            </form>
        </div>

        <!-- Nội dung cửa sổ chứa màn hình chèn phủ -->
        <div class="overlay" id="modalWrapper" style="display: none;">
            <div class="col-md-5 border-right" style="background-color: white; max-width: 30%;">
                <div class="p-3 py-5">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h4 class="text-right">Change Password</h4>
                    </div>

                    <form action="UserProfile?aid=${account.getAccountID()}" method="post" id="formUpdate" onsubmit="return savePassword();">
                        <div class="row mt-3">
                            <div class="col-md-12">
                                <label class="labels">Enter old password</label>
                                <input type="password" class="form-control" name="oldpass" >
                            </div>
                            <p id="passwordMismatchOld" style="color: red; display: none;">Password incorrect. Please re-enter!</p>
                            <div class="col-md-12">
                                <label class="labels">Enter new Password</label>
                                <input type="password" class="form-control" name="newpass">
                            </div>
                            <p id="passwordMismatchRegex" style="color: red; display: none;">Password must have at least 6 characters, including uppercase and lowercase letters</p>
                            <div class="col-md-12">
                                <label class="labels">Re-Enter new Password</label>
                                <input type="password" class="form-control" name="repass">
                            </div>
                            <p id="passwordMismatch" style="color: red; display: none;">Password does not match. Please re-enter!</p>
                        </div>
                        <div class="mt-5 text-center">
                            <button class="btn btn-primary profile-button" type="submit" onclick="savePassword()" name="update" value="password">Save Password</button>
                            <button class="btn btn-secondary profile-button" type="button" onclick="closePasswordModal()">Cancel</button>
                        </div>
                        <div class="mt-5 text-center">
                            <a href="forgotpass">Forget Password?</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!--div để chứa thông báo -->
        <div id="successMessage" class="alert alert-success" style="display: none;">
            Update profile successfully!
        </div>

        <%@include file="component/footer.jsp" %>

        <script>
            var passAcc = '<%= request.getAttribute("passAcc") %>';
        </script>

        <script>
            function confirmSave() {
                var result = confirm("Are you sure you want to update profile?");
                if (result) {
                    document.getElementById("formUpdate1").submit();
                    return true;
                } else {
                    return false;
                }
            }
            function openPasswordModal() {
                document.getElementById('modalWrapper').style.display = 'flex';
                document.body.classList.add('modal-open');
            }

            function closePasswordModal() {
                document.getElementById('modalWrapper').style.display = 'none';
                document.body.classList.remove('modal-open');
            }
            function savePassword() {
                var newPassword = document.getElementsByName('newpass')[0].value;
                var oldpass = document.getElementsByName('oldpass')[0].value;
                var reEnteredPassword = document.getElementsByName('repass')[0].value;
                const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z]).{6,}$/;
                if (oldpass === passAcc) {
                    if (passwordRegex.test(newPassword)) {
                        if (newPassword === reEnteredPassword) {
                            var result = confirm("Are you sure you want to update password?");
                            if (result) {
                                document.getElementById("formUpdate").submit();
                                return true;
                            }
                        } else {
                            var passwordMismatchMessage = document.getElementById("passwordMismatch");
                            passwordMismatchMessage.style.display = "block";
                            return false;
                        }
                    } else {
                        var passwordMismatchRegex = document.getElementById("passwordMismatchRegex");
                        passwordMismatchRegex.style.display = "block";
                        return false;
                    }
                } else {
                    var passwordMismatchOld = document.getElementById("passwordMismatchOld");
                    passwordMismatchOld.style.display = "block";
                    return false;
                }
            }
        </script>
        <style>
            /* CSS để cấu trúc giao diện */
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
            }

            .container {
                max-width: 1200px;
                margin: 0 auto;
                padding: 20px;
            }

            .row {
                display: flex;
                flex-wrap: wrap;
            }

            .col-md-3, .col-md-4, .col-md-5 {
                flex-basis: 0;
                flex-grow: 1;
                max-width: 100%;
            }

            .border-right {
                border-right: 1px solid #ccc;
            }

            .d-flex {
                display: flex;
            }

            .align-items-center {
                align-items: center;
            }

            .text-center {
                text-align: center;
            }

            .py-5 {
                padding-top: 3rem;
                padding-bottom: 3rem;
            }

            .mt-5 {
                margin-top: 3rem;
            }

            /* CSS để tạo cửa sổ */
            .overlay {
                display: flex;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                justify-content: center;
                align-items: center;

            }
            body.modal-open {
                overflow: hidden;
            }


            /* CSS để tạo màn hình che phủ */


        </style>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Contact Javascript File -->
        <script src="mail/jqBootstrapValidation.min.js"></script>
        <script src="mail/contact.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
        <script type="text/javascript">
            function buy(id) {
                var m = document.f.num.value;
                document.f.action = "buy?id=" + id + "&num=" + m;
                document.f.submit();
            }
        </script>
        <script>
            function ValidateProfileForm() {
                var userName = document.getElementById("uname").value;
                var userFName = document.getElementById("ufullname").value;
                var mobileNumber = document.getElementById("uphone").value;
                var email = document.getElementById("uemail").value;
                var address = document.getElementById("uaddress").value;
                // Kiểm tra  chứa ký tự đặc biệt
                var specialCharRegex = /[!@#$%^&*(),.?":{}|<>]/;
                if (specialCharRegex.test(userFName)) {
                    alert("FullName cannot contain special characters!");
                    return false;
                }
                if (userName.trim() === "" || userName === "") {
                    alert("Please input username before update !!!");
                    return false;
                }
                if (userFName.trim() === "" || userFName === "") {
                    alert("Please input Fullname before update !!!");
                    return false;
                }
                if ((mobileNumber) === "" || mobileNumber.trim() === "") {
                    alert("Please input numberphone before update !!!");
                    return false;
                }
                if ((email) === "" || email.trim() === "") {
                    alert("Please input email before update !!!");
                    return false;
                }

                // Kiểm tra số điện thoại là số nguyên dương
                // Kiểm tra số điện thoại là số nguyên dương và có đúng 10 chữ số
                var phoneNumberRegex = /^[0-9]\d{9}$/;
                if (!phoneNumberRegex.test(mobileNumber)) {
                    alert("Mobile number must be a positive integer with exactly 10 digits!");
                    return false;
                }
                //check email
                var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                if (!emailRegex.test(email)) {
                    alert("Please enter a valid email address!");
                    return false;
                }



            }

        </script>

    </body>
</html>
