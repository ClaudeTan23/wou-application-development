<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE HTML>
<html>

<head>
    <title>Get Store</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="/css/get-store.css">
</head>

<body>

<div class="nav-bar">
    <a href="/add-store">
        <button>Add Store</button>
    </a>
    <a href="/">
        <button>Home</button>
    </a>
</div>

<div class="table-container">
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
                                </c:forEach> --%>
    
                                ${fn:join(store[i].localities, ', ')}
    
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
</div>

</body>

</html>