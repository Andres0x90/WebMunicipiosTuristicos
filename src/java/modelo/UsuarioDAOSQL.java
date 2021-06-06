/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Andres
 */
public class UsuarioDAOSQL implements UsuarioDAO 
{
    
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;
    
    public UsuarioDAOSQL()
    {
    }
    
    @Override
    public void agregar(Usuario usuario) throws SQLException
    {
        conn = Conexion.getConexion();
        ps = conn.prepareStatement("INSERT INTO usuario VALUES(?,?,?,?)");
        ps.setString(1, usuario.getCuenta());
        ps.setString(2, usuario.getClave());
        ps.setString(3, usuario.getNombre());
        ps.setString(4, usuario.getApellido());
        ps.executeUpdate();
        conn.close();
    }
    

    @Override
    public Usuario obtenerPorID(String id) throws SQLException
    {
        conn = Conexion.getConexion();
        ps = conn.prepareStatement("SELECT * FROM usuario WHERE usuario.cuenta = ?");
        ps.setString(1, id);
        rs = ps.executeQuery();
        
        if (rs.next())
        {
            Usuario usuario = new Usuario(rs.getString("cuenta"), rs.getString("clave"), rs.getString("nombre"), rs.getString("apellido"));           
            conn.close();
            return usuario;
        }
        else
            return null;
    }

    @Override
    public boolean autenticar(Usuario usuario) throws SQLException 
    {
       conn = Conexion.getConexion();
       ps = conn.prepareStatement("SELECT * FROM usuario WHERE usuario.cuenta = ? AND usuario.clave = ?");
       ps.setString(1, usuario.getCuenta());
       ps.setString(2, usuario.getClave());
       rs = ps.executeQuery();
       
       return rs.next();
    }


}
