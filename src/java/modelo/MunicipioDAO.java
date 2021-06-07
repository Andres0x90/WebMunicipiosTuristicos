/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Andres
 */
public interface MunicipioDAO 
{
    void agregar(Municipio municipio) throws SQLException;
    Municipio obtenerPorID(String id) throws SQLException;
    ArrayList<Municipio>obtenerPorSubregion(String subregion) throws SQLException;
    ArrayList<Municipio>obtenerPorUsuario(Usuario usuario) throws SQLException;
    ArrayList<Municipio>obtenerTodos() throws SQLException;
}
