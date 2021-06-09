function comprobar()
{
    let subregion = document.getElementById("subregion").value;
    
    if (subregion != "")
    {
        return true;
    }
    else
    {
        alert("Por favor seleccione una subregion");
        return false;
    }
}