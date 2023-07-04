async function load()
{
    const promise = await fetch("/restmyappointment");

    if(promise.ok)
    {
        const result = await promise.json();
        let html = "";

        if(result.length <= 0)
        {
            document.getElementById("n").style.display = "flex";

        } else 
        {
            result.forEach(e =>
            {
                html += `<a href="/car/${e.carId}" style="width: 100%; display: flex; align-items: center; justify-content: center;">
                        <div class="cars-block">
                            <div class="car-image-block">
                            <img src="/image/${e.cars[0].image}" />
                            </div>
                            <div class="cars-block-info">
                            <div>${e.cars[0].make_by}, ${e.cars[0].model}, ${e.cars[0].registration_date}</div>

                            <div>
                              
                                <div style="font-weight: 600; font-size: 20px; display: flex; justify-content: right;">
                                    ${e.cars[0].price} MYR
                                </div>
                                <div style="font-weight: 600; font-size: 20px; display: flex; justify-content: right;">
                                    ${e.result}
                                </div>
                            </div>
                            </div>
                        </div>
                    </a>`;
            });

            document.getElementById("a-list").innerHTML = html;
        }

    }
}

load();