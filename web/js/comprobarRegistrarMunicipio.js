function comprobar()
{
    let nombre = document.getElementById("nombre").value;
    let subregion = document.getElementById("subregion").value;
    let descripcion = document.getElementById("descripcion").value;
    let km_distancia = document.getElementById("km_distancia").value;
    let telefono = document.getElementById("telefono").value;

    
    if (nombre != "" && subregion != "" && descripcion != "" && km_distancia != "" && telefono != "")
    {
        return true;
    }
    else
    {
        alert("Por favor rellene todos los campos");
        return false;
    }
}