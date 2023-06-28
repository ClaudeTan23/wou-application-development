<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>

<head>
    <title>Home</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="/css/index.css">
</head>

<body>
    <div class="main-container">
        <div class="header-nav-bar">
            <div class="logo-block">
                <div>One SG</div>
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
                <c:choose>
                    <c:when test="${roles != null }">
                        <div class="link-block">
                
                            <form action="logout" method="POST">
                                <input type="submit" value="Logout">
                            </form>
                            <div></div>
                
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="link-block">
                            <a href="/login">
                                Login
                                <div></div>
                            </a>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        <div class="body">
            <img src="/images/g1.jpg" />
            <div class="body-title">One Store Groceries</div>
        </div>
    </div>
</body>

</html>