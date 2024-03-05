<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <title>Login</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="css/singin.css">

    </head>

    <body class="img js-fullheight" style="background-image: url(img/acc.jpg);
          ">
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center mb-5">
                        <h2 class="heading-section">Đăng nhập</h2>

                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-6 col-lg-4">
                        <div class="login-wrap p-0">
                            <form action="login" class="signin-form" method="POST" onsubmit="return validateForm()">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Tài khoản"  name="username" id="username-input" value="${cookieValue.username}" onkeyup="checkSpecialCharacters(this)">
                                </div>
                                <div class="form-group">
                                    <input id="password-field" type="password" class="form-control" placeholder="Mật khẩu" value="${cookieValue.password}" name="password">
                                    <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="form-control btn btn-primary submit px-3">Đăng nhập</button>
                                </div>
                                <div id="error-container">

                                    <div id="error-message" style="display: none; color: red">Please complete full infomation!</div>
                                    <div id="error-message2" style="display: none; color: red">Username have contain spacial character!</div>

                                </div>




                            </form>
                            <input type="checkbox" name="rememberme"> Nhớ mật khẩu
                            <div id='lower-side'>
                                <p class="text-danger">${mess}</p>
                                <div style="display: flex; justify-content: space-between;">
                                    <p id="message" style="text-align: left">
                                        <a href="forgotpass">Quên mật khẩu</a>
                                    </p>
                                    <p id="message" style="text-align: right">
                                        <a href="signup">Đăng ký ngay</a>
                                    </p>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script>
        const form = document.querySelector('.signin-form');
        const usernameInput = document.getElementById('username-input');
        const passwordInput = document.getElementById('password-field');
        const errorMessage = document.getElementById('error-message');
        const errorMessage2 = document.getElementById('error-message2');

        form.addEventListener('submit', function (event) {
            if (usernameInput.value.trim() === '' || passwordInput.value.trim() === '') {
                event.preventDefault();
                errorMessage.style.display = 'block';
            } else {
                return validateForm();
            }
        });
    </script> 
    <script>
        function validateForm() {

            var username = document.forms["signin-form"]["username"].value;
            var password = document.forms["signin-form"]["password"].value;


            if (validateUsername(username) && validatePassword(password)) {
                return true;
            } else {
                alert("Thông tin tài khoản không chính xác!");
                return false;
            }
        }

        function validateUsername(username) {
            // Đảm bảo username chỉ chứa chữ cái không dấu và số
            var regex = /^[A-Za-z0-9]+$/;
            if (!regex.test(username)) {
                alert("Username có chứa kí tự đặc biệt!");
                return false;
            }
        }

        function validatePassword(password) {

            return (password.length >= 6 && !/[^\w\s]/.test(password));
        }

        function checkSpecialCharacters(input) {
            var specialChars = /[^\w\s]/;
            if (specialChars.test(input.value)) {
                errorMessage2.style.display = 'block';
            } else {
                errorMessage2.style.display = 'none';
            }
        }

    </script>
    <script>
        // Lấy phần tử icon và trường input password
        const togglePassword = document.querySelector('.toggle-password');
        const password_Input = document.getElementById('password-field');

        // Xử lý sự kiện click vào icon
        togglePassword.addEventListener('click', function () {
            const type = password_Input.getAttribute('type') === 'password' ? 'text' : 'password';
            password_Input.setAttribute('type', type);
        });
        password_Input.setAttribute('type', 'password');
    </script>
    <!--    <script src="js/jquery.min.js"></script>
        <script src="js/popper.js"></script>
        <script src="js/bootstrap.min.js"></script>-->
    <!--    //<script src="js/main.js"></script>-->

</body>
</html>

