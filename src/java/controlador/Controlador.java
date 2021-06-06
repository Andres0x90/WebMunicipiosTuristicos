/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.Usuario;
import modelo.UsuarioDAO;
import modelo.UsuarioDAOSQL;

/**
 *
 * @author Andres
 */
public class Controlador 
{
    private static UsuarioDAO usuariodaosql = new UsuarioDAOSQL();
    
    public static boolean crearUsuario(String cuenta, String clave, String nombre, String apellido)
    {
 
        Usuario usuario = new Usuario(cuenta, clave, nombre, apellido);
        try {
            usuariodaosql.agregar(usuario);
            return true;

        } catch (SQLException ex) {
            Logger.getLogger(Controlador.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    public static Usuario obtenerUsuario(String cuenta)
    {
        try {
            return usuariodaosql.obtenerPorID(cuenta);
        } catch (SQLException ex) {
            Logger.getLogger(Controlador.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
    public static boolean acceder(String cuenta, String clave)
    {
        Usuario usuario = new Usuario(cuenta, clave, "", "");
        try {
            return usuariodaosql.autenticar(usuario);

        } catch (SQLException ex) {
            Logger.getLogger(Controlador.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
}
