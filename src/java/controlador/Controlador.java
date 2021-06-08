/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.MunicipioDAO;
import modelo.MunicipioDAOSQL;
import modelo.Usuario;
import modelo.UsuarioDAO;
import modelo.UsuarioDAOSQL;
import java.sql.Date;
import modelo.Municipio;

/**
 *
 * @author Andres
 */
public class Controlador 
{
    private static UsuarioDAO usuariodaosql = new UsuarioDAOSQL();
    private static MunicipioDAO municipiodaosql = new MunicipioDAOSQL();
    
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
    
    public static boolean crearMunicipio(String nombre, String subregion, String descripcion, String km_distancia, 
            String telefono, String autor)
    {
        Date fecha = new Date(System.currentTimeMillis());
        try {
            Municipio municipio = new Municipio("",nombre, descripcion, Integer.parseInt(km_distancia),
                    telefono, subregion, fecha, obtenerUsuario(autor));
            
            municipiodaosql.agregar(municipio);
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(Controlador.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
}
