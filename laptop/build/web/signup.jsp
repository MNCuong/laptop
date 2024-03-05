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
    <body class="img js-fullheight" style="background-image: url(img/acc.jpg);">
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center mb-5">
                        <h2 class="heading-section">Register</h2>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-6 col-lg-4">
                        <div class="login-wrap p-0">
                            <form action="signup" class="signin-form" method="POST">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Full name"  name="fullname"  value="${requestScope.fullname}">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Username"  name="username"  value="${requestScope.user}">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Email"  name="mail"value="${requestScope.gmail}" >
                                </div>
                                <div class="form-group">
                                    <input id="password-field" type="Phone" class="form-control" placeholder="Phone"  name="phone" value="${requestScope.phone}">

                                </div>
                                <div class="form-group">
                                    <input id="password-field" type="password" class="form-control" placeholder="Password"  name="password" value="${requestScope.pass}">
                                    <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                                </div>
                                <h5 style="color: #fbceb5">${requestScope.err}</h5>
                                <div class="form-group">
                                    <button type="submit" class="form-control btn btn-primary submit px-3">Sign Up</button>
                                </div>
                            </form>
                            <div id='lower-side'>
                               
                                <div style="display: flex; justify-content: space-between;">
                                    <p id="message" style="text-align: left">
                                        Have an account?
                                    </p>
                                    <p id="message" style="text-align: right">
                                        <a href="signin.jsp">Login Now</a></p>
                                    </p>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script src="js/jquery.min.js"></script>
    <script src="js/popper.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>

</body>
</html>

