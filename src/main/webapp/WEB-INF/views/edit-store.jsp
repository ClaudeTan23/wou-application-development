<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Store</title>
    <link rel="stylesheet" href="/css/edit-store.css">
    <link rel="stylesheet" href="/css/header.css">
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
                <div class="link-block">
                
                    <form action="logout" method="POST">
                        <input type="submit" value="Logout">
                    </form>
                    <div></div>
                
                </div>
            </div>
        </div>

        <div class="store-header">
            <h1>Edit Stores</h1>
        </div>

        <c:choose>
            <c:when test="${store.size() > 0}">
                <div class="form-container">
                    <form action="/edit-store/${store[0].getId()}" method="POST" class="form-block">
                        <div class="input-block">
                            <label for="name">Name</label>
                            <input type="text" name="name" autocomplete="off" required value="${store[0].getName()}" />
                        </div>
                        <div class="input-block">
                            <label for="number">Number</label>
                            <input type="number" name="phone_number" autocomplete="off" required
                                value="${store[0].getPhone_number()}">
                        </div>
                        <div class="input-block">
                            <label for="localities">Localities</label>
                            <input type="text" name="localities" autocomplete="off" required
                                value="${store[0].getLocalities()}">
                        </div>
                        <div class="add-block">
                            <div id="add-localities">
                                Add Localities
                            </div>
                        </div>
        
                        <div class="submit-block">
                            <input type="submit" value="Edit" />
                        </div>
                    </form>
                </div>
            </c:when>
            <c:otherwise>
                empty
            </c:otherwise>
        </c:choose>
    </div>
    
    <script>
        const addBtn = document.getElementById("add-localities");
        const container = document.getElementsByClassName("input-block")[2];

        addBtn.addEventListener("click", () => {
            const localitiesDiv = document.createElement("input");

            localitiesDiv.setAttribute("name", "localities");
            localitiesDiv.setAttribute("autocomplete", "off");
            localitiesDiv.setAttribute("type", "text");
            localitiesDiv.setAttribute("required", "true");

            container.appendChild(localitiesDiv);
        });

    </script>
</body>
</html>