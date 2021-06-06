function comprobar()
{
    let cuenta = document.getElementById("cuenta").value;
    let clave = document.getElementById("clave").value;

    
    if (cuenta != "" && clave != "")
    {
        return true;
    }
    else
    {
        alert("Por favor rellene todos los campos");
        return false;
    }
}