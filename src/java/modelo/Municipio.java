/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Date;

/**
 *
 * @author Andres
 */
public class Municipio 
{
    private String idmunicipio, nombre, descripcion, telefono, subregion;
    int km_distancia;
    private Date fecha;
    private Usuario usuario;

    public Municipio() {
    }

    public Municipio(String idmunicipio, String nombre, String descripcion, int km_distancia, String telefono, String subregion, Date fecha, Usuario usuario) {
        this.idmunicipio = idmunicipio;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.km_distancia = km_distancia;
        this.telefono = telefono;
        this.subregion = subregion;
        this.fecha = fecha;
        this.usuario = usuario;
    }

    public String getIdmunicipio() {
        return idmunicipio;
    }

    public void setIdmunicipio(String idmunicipio) {
        this.idmunicipio = idmunicipio;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getKm_distancia() {
        return km_distancia;
    }

    public void setKm_distancia(int km_distancia) {
        this.km_distancia = km_distancia;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getSubregion() {
        return subregion;
    }

    public void setSubregion(String subregion) {
        this.subregion = subregion;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
    
    
}
