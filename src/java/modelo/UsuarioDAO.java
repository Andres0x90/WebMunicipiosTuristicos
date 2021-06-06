/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.SQLException;

/**
 *
 * @author Andres
 */
public interface UsuarioDAO 
{
    void agregar(Usuario usuario) throws SQLException;
    Usuario obtenerPorID(String id) throws SQLException;
    boolean autenticar(Usuario usuario) throws SQLException;
}
