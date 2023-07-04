const optionMenu = document.querySelector(".select-menu"),
  selectBtn = optionMenu.querySelector(".select-btn"),
  options = optionMenu.querySelectorAll(".option"),
  sBtn_text = optionMenu.querySelector(".sBtn-text");

selectBtn.addEventListener("click", () =>
  optionMenu.classList.toggle("active")
);

options.forEach((option) => {
  option.addEventListener("click", () => {
    let selectedOption = option.querySelector(".option-text").innerText;
    sBtn_text.innerText = selectedOption;

    optionMenu.classList.remove("active");
  });
});

const addBtn = document.getElementsByClassName("select-btn")[0]

addBtn.addEventListener("click", () =>
{
  document.getElementsByClassName("modal")[0].style.display = "flex";
});


document.getElementsByClassName("modal")[0].addEventListener("click", (e) =>
{
  if(e.target.getAttribute("class") == "modal") e.target.style.display = "none";
});

document.getElementsByClassName("search-icon")[0].addEventListener("click", () =>
{
  const col = document.getElementsByClassName("sBtn-text")[0].textContent;
  const val = document.getElementById("search-bar").value;
  
  if(col === "Make By")
  {
    window.location.href = `/cars/makeby?val=${val}`;

  } else if(col === "Registration Date")
  {
    window.location.href = `/cars/registration?val=${val}`;

  } else if(col === "Price")
  {
    window.location.href = `/cars/price?val=${val}`;
    
  } else if(col === "Model")
  {
    window.location.href = `/cars/model?val=${val}`;
  }

});
