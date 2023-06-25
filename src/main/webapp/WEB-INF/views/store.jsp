<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>

<head>
    <title>${store.name}</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/store.css">
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
                <div class="link-block">Login</div>
            </div>
        </div>

        <div class="store-header">
            <h1>Store</h1>
        </div>

        <div style="width: 100%; display:flex; justify-content: center;">
            <div class="store-body">
                <div class="store-container">
                    <div class="store-title">${store.name}</div>
                </div>
                <div class="store-content">
                    <div class="store-content-title">Phone Number</div>
                    <div class="store-content-block">
                        ${store.phone_number}
                    </div>
                </div>
                <div class="store-content">
                    <div class="store-content-title">Localities</div>
                    <c:forEach var="j" begin="0" end="${locations.size() - 1}">
                        <div class="store-content-block">
                            <div>${j + 1}.</div>
                            <div style="padding: 10px; font-weight: 800;">${locations[j]}</div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>

    </div>
    
</body>

</html>