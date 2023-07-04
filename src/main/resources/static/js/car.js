document.getElementsByClassName("book-btn")[0].addEventListener("click", () =>
{
    document.getElementsByClassName("modal-container")[1].style.display = "flex";
});

document.getElementsByClassName("book-btn")[1].addEventListener("click", () =>
{
    document.getElementsByClassName("modal-container")[0].style.display = "flex";
});

document.getElementsByClassName("close-btn")[0].addEventListener("click", () =>
{
    document.getElementsByClassName("modal-container")[0].style.display = "none";
});

document.getElementsByClassName("close-btn")[1].addEventListener("click", () =>
{
    document.getElementsByClassName("modal-container")[1].style.display = "none";
});

document.getElementById("bidBtn").addEventListener("click", async() =>
{
    const csrf = document.getElementById("csrf");
    const carId = document.getElementById("carId");
    const ownerId = document.getElementById("ownerId");
    const bidPrice = document.getElementById("bidPrice");
    const bidDate = document.getElementById("bookDate");

    if(bidPrice.value < Number(bidPrice.getAttribute("minlength")))
    {
        alert("please bid the price higher than other user")

    } else 
    {
        if(bidDate.value === "") return alert("please choose a date");
        
        const form = new FormData();

        form.append(csrf.getAttribute("name"), csrf.getAttribute("value"));
        form.append("carId", carId.value);
        form.append("ownerId", ownerId.value);
        form.append("bidPrice", bidPrice.value);
        form.append("bookDate", bidDate.value);

        const promise = await fetch("/post-bid", 
        {
            method: "POST",
            body: form
        });

        if(promise.ok)
        {
            const result = await promise.json();
            const r = document.getElementsByClassName("modal-body-right")[0];

            const div = document.createElement("div");
            div.setAttribute("class", "user-bid-block");

            div.innerHTML = `<div>${result.user[0].username} has bid ${result.bidPrice} MYR</div>`;

            r.insertBefore(div, r.firstElementChild);
        }
    }

});

const r = document.getElementsByClassName("modal-body-right")[0];


function loadBid()
{
    let pathname = window.location.pathname.split("/");
    
    fetch(`/restcar/${pathname[pathname.length - 1]}`)
    .then(response => response.json())
    .then(result =>
    {
        if(result.length <= 0)
        {
            const r = document.getElementsByClassName("modal-body-right")[0];
            r.innerHTML = "<div style='display: flex; justify-content: center; font-size: 24px; font-weight: 600; padding: 20px 0;'>No one bid yet</div>";

        } else 
        {
            const userId = document.getElementById("userId").value;
            const r = document.getElementsByClassName("modal-body-right")[0];
            let txt = "";

            result.forEach(e =>
            {
                txt += `<div class="user-bid-block" style="flex-wrap: wrap; gap: 8px;">
                        <div>${e.user[0].username} has bid ${e.bidPrice} MYR</div>
                        ${userId.toString() === e.ownerId.toString()
                            ? e.result == "approve"
                              ? `<div style="color: lime;">Approved</div>`
                              : e.result == "reject"
                              ? `<div style="color: tomato;">Rejected</div>`
                              : `<div class="b-btn" onclick="approve(${e.id}, 'approve')">Approve</div>
                                <div class="b-btn" onclick="approve(${e.id}, 'reject')">Reject</div>`
                            : ""
                        }
                        </div>`;
            });

            r.innerHTML = txt;
            document.getElementById("bidPrice").value = Number(result[0].bidPrice) + 1;
            document.getElementById("bidPrice").minLength = Number(result[0].bidPrice) + 1;

        }

        const dateNow = `${new Date().getFullYear()}-${
          new Date().getMonth() - 1 < 10
            ? `0${new Date().getMonth() + 1}`
            : new Date().getMonth() + 1
        }-${
          new Date().getDate() < 10
            ? `0${new Date().getDate()}`
            : new Date().getDate()
        }`;

        document.getElementById("bookDate").min = dateNow;
        document.getElementById("bk").min = dateNow;

        const userId = document.getElementById("userId").value; 
        const ownerId = document.getElementById("ownerId").value;

        if(userId === ownerId)
        {
            document.getElementsByClassName("modal-body-left")[0].style.display = "none";
            document.getElementsByClassName("modal-body-right")[0].style.width = "100%";
            document.getElementsByClassName("book-btn")[0].style.display = "none";
        }

    });
}

loadBid();

async function approve(bidId, result)
{
    const csrf = document.getElementById("csrf");

    const form = new FormData();

    form.append(csrf.getAttribute("name"), csrf.getAttribute("value"));
    form.append("id", bidId);
    form.append("result", result);

    const promise = await fetch("/approve-bid",
    {
        method: "POST",
        body: form
    });

    if(promise.ok)
    {
        const result = await promise.text();

        if(result === "ok") loadBid();

    }
}
