<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>

<head>
    <title>Add Store</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="/css/add-store.css">
</head>

<body>
    <div class="nav-bar">
        <a href="/get-store">
            <button>Get Store</button>
        </a>
        <a href="/">
            <button>Home</button>
        </a>
    </div>
    <div class="form-container">
        <form action="/add-store" method="POST" class="form-block">
            <div class="input-block">
                <label for="name">Name</label>
                <input type="text" name="name" autocomplete="off" required/>
            </div>
            <div class="input-block">
                <label for="number">Number</label>
                <input type="number" name="phone_number" autocomplete="off" required>
            </div>
            <div class="input-block">
                <label for="localities">Localities</label>
                <input type="text" name="localities" autocomplete="off" required>
            </div>
            <div class="add-block">
                <div id="add-localities">
                    Add Localities
                </div>
            </div>

            <div class="submit-block">
                <input type="submit" value="Submit" />
            </div>
        </form>
    </div>
    <script>
        const addBtn = document.getElementById("add-localities");
        const container = document.getElementsByClassName("input-block")[2];

        addBtn.addEventListener("click", () =>
        {
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