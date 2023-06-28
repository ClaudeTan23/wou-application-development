<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE HTML>
<html>

<head>
    <title>Stores</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="/css/get-store.css">
    <link rel="stylesheet" href="/css/header.css">
</head>

<body>

<div class="modal-container">
    <!-- <div class="modal-block">
        <div class="delete-block-title">
            Delete the store?
        </div>
        <div class="delete-store-block">
            asd
        </div>
        <form class="delete-form-container">
            <input type="submit" value="Delete">
            <div>Cancel</div>
        </form>
    </div> -->
</div>
    
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
                <c:when test="${roles.size() > 0 }">
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

    <div class="store-header">
        <h1>Stores</h1>
        <c:choose>
            <c:when test="${roles.size() == 2}">
                <div>
                    <a href="/add-store">
                        <div>Add Store</div>
                    </a>
                </div>
            </c:when>
        </c:choose>
    </div>

    <c:choose>
        <c:when test="${store.size() > 0}">
            <div class="store-body">
                <c:forEach var="i" begin="0" end="${store.size() -1}">
                    <div class="store-container" onclick="storeLink(event, '${store[i].id}')">
                        <div class="store-block">
                            <div class="store-image">
                                <img src="/images/g1.jpg" />
                            </div>
                            <div class="store-name-block">
                                <c:out value="${store[i].getName()}" />
                            </div>
                            <c:choose>
                                <c:when test="${roles.size() == 2}">
                                    <div class="store-control-block">
                                        <a href="/edit-store/${store[i].id}" role="action">
                                            <div role="action">Edit</div>
                                        </a>
                                        <div onclick='deleteStore("${store[i].id}", "${store[i].getName()}")' role="action">Delete</div>
                                    </div>
                                </c:when>
                            </c:choose>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:when>
        <c:otherwise>
            <div class="empty-store-container">
                <div>Empty Store</div>
            </div>
        </c:otherwise>
    </c:choose>

    <!-- <div class="table-container">
        <c:set var="income" scope="session" value="${4000*4}" />
        <c:choose>
            <c:when test="${store.size() > 0}">
                <table>
                    <tr>
                        <th>Name</th>
                        <th>Phone Number</th>
                        <th>Localities</th>
                    </tr>
                    <c:forEach var="i" begin="0" end="${store.size() - 1}">
                        <tr>
                            <td>${store[i].name}</td>
                            <td>${store[i].phone_number}</td>
                            <td>
                                <%--<%! String d="asd" ; %>
                                    <c:forEach var="j" begin="0" end="${fn:length(store[i].localities) - 1}">
                                        ${store[i].localities[j]}
                                    </c:forEach>
    
                                    ${fn:join(store[i].localities, ', ')} --%>
    
                                    ${store[i].localities}
    
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </c:when>
            <c:otherwise>
                <div class="empty-data-container">
                    Empty data
                </div>
            </c:otherwise>
        </c:choose>
    </div> -->
</div>
<script src="/js/get-store.js"></script>
</body>

</html>