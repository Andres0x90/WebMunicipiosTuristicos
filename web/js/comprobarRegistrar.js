function comprobar()
{
    let cuenta = document.getElementById("cuenta").value;
    let clave = document.getElementById("clave").value;
    let nombre = document.getElementById("nombre").value;
    let apellido = document.getElementById("apellido").value;

    
    if (cuenta != "" && clave != "" && nombre != "" && apellido != "")
    {
        return true;
    }
    else
    {
        alert("Por favor rellene todos los campos");
        return false;
    }
}