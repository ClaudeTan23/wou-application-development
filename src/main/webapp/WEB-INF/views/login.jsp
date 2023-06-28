<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>

<head>
    <title>Login/Register</title>
    <link rel="stylesheet" type="text/css" href="/css/login.css">
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/header.css">
</head>

<body style="display: flex; flex-direction: column;">
    <div class="header-nav-bar" style="position: fixed; top: 0;">
        <div class="logo-block">
            <div>One SG</div>
            ${asd}
        </div>
        <div class="nav-link-block">
            <div class="link-block">
                <a href="/">
                    Home
                    <div></div>
                </a>
            </div>
            <div class="link-block">
                <a href="/get-store">
                    Stores
                    <div></div>
                </a>
            </div>
            <div class="link-block">
                <a href="/about">
                    About
                    <div></div>
                </a>
            </div>
            <div class="link-block">
                <a href="/login">
                    Login
                    <div></div>
                </a>
            </div>
        </div>
    </div>
  
    <c:choose>
        <c:when test="${not empty param}">
            <div style="white-space: pre-line; text-align: center; font-size: 24px; color: #e3e3ee; padding: 10px 0;">
                Invalid username or password
                Please try again
            </div>
        </c:when>
        <c:when test="${not empty register_error}">
            <div style="white-space: pre-line; text-align: center; font-size: 24px; color: #e3e3ee; padding: 10px 0;">
                ${register_error}
            </div>
        </c:when>
    </c:choose>
    <div class="main">
        <input type="checkbox" id="chk" aria-hidden="true">

        <div class="signup">
            <form action="/register" method="POST">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <label for="chk" aria-hidden="true">Sign up</label>
                <input type="text" name="username" placeholder="User name" required autocomplete="off">
                <input type="email" name="email" placeholder="Email" required autocomplete="off">
                <input type="password" name="password" placeholder="Password" required autocomplete="off">
                <button>Sign up</button>
            </form>
        </div>

        <div class="login">
            <form action="/perform_login" method="POST">
                <label for="chk" aria-hidden="true">Login</label>
                <input type="text" name="username" placeholder="Email" required autocomplete="off">
                <input type="password" name="password" placeholder="Password" required autocomplete="off">
                <button>Login</button>
            </form>
        </div>
    </div>
</body>

</html>