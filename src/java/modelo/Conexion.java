/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Connection;
import com.mysql.cj.jdbc.MysqlDataSource;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Andres
 */
public class Conexion 
{
    private static final String SERVIDOR = Config.SERVIDOR;
    private static final int PUERTO = Config.PUERTO;
    private static final String USUARIO = Config.USUARIO;
    private static final String CONTRASENA = Config.CONTRASENA;
    private static final String DATABASE = Config.DATABASE;
    
    public static Connection getConexion() throws SQLException
    {
        MysqlDataSource ds = new MysqlDataSource();
        ds.setServerName(SERVIDOR);
        ds.setPortNumber(PUERTO);
        ds.setUser(USUARIO);
        ds.setPassword(CONTRASENA);
        ds.setDatabaseName(DATABASE);
        
        return ds.getConnection();
    }
}
