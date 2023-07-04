function load()
{
  fetch("/restusers")
  .then((response) => response.json())
  .then((result) => {
    const list = document.getElementById("u-list");
    let html = "";

    result.forEach((e) => {
      html += ` <div class="user-block">
         <div style="font-weight: 600;">${e.username}</div>
         ${
           e.roles.length == 2
             ? 
             `<div>
                <div style="padding: 10px; color: lime; font-weight: 600;">Admin</div>
              </div>`
             : 
             `<div>
                <div style="background-color: lime; padding: 10px; font-weight: 600; border-radius: 4px; cursor: pointer;" onclick="setAdmin(${e.id})">Mark as Admin</div>
             </div>`
         }
        </div>`;
    });

    list.innerHTML = html;
  });
}

  async function setAdmin(id)
  {
    const csrf = document.getElementById("csrf");

    const form = new FormData();

    form.append(csrf.getAttribute("name"), csrf.getAttribute("value"));
    form.append("id", id);

    const promise = await fetch("/setadmin", {
        method: "POST",
        body: form
    });

    if(promise.ok)
    {
        const result = await promise.text();

        if(result === "ok")
        {
            load();
        }
    }

  }

  load();


