const deleteStore = (id, name) =>
{
    const modal = document.getElementsByClassName("modal-container")[0];

    const htmlText = 
    `<div class="modal-block">
        <div class="delete-block-title">
            Delete the store?
        </div>
        <div class="delete-store-block">
            ${name}
        </div>
        <form class="delete-form-container" action="/delete-store" method="POST">
            <input type="submit" value="Delete"/>
            <input type="text" name="id" value=${id} readonly style="display: none;" />
            <div onclick="closeModal()">Cancel</div>
        </form>
    </div>`;

    modal.innerHTML = htmlText;
    modal.style.display = "flex";

}

const closeModal = () => 
{
    const modal = document.getElementsByClassName("modal-container")[0];

    modal.innerHTML = "";
    modal.style.display = "none";
}

const storeLink = (e, id) =>
{
    if(e.target.getAttribute("role") === null) window.location.href = `/store/${id}`;
}