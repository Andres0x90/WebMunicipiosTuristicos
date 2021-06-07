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
import java.util.ArrayList;

/**
 *
 * @author Andres
 */
public class MunicipioDAOSQL implements MunicipioDAO
{
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;
    private UsuarioDAO usuariodaosql;
    
    public MunicipioDAOSQL()
    {
        usuariodaosql = new UsuarioDAOSQL();
    }
    
    @Override
    public void agregar(Municipio municipio) throws SQLException
    {
        conn = Conexion.getConexion();
        ps = conn.prepareStatement("INSERT INTO municipio VALUES(NULL, ?,?,?,?,?,?,?)");
        ps.setString(1, municipio.getNombre());
        ps.setString(2, municipio.getDescripcion());
        ps.setInt(3, municipio.getKm_distancia());
        ps.setString(4, municipio.getTelefono());
        ps.setDate(5, municipio.getFecha());
        ps.setString(6, municipio.getSubregion());
        ps.setString(7, municipio.getUsuario().getCuenta());
        
        ps.executeUpdate();
        conn.close();
    }

    @Override
    public Municipio obtenerPorID(String id) throws SQLException
    {
        conn = Conexion.getConexion();
        ps = conn.prepareStatement("SELECT * FROM municipio WHERE municipio.idmunicipio = ?");
        ps.setString(1, id);
        rs = ps.executeQuery();

        if (rs.next())
        {
            Municipio municipio = new Municipio(String.valueOf(rs.getInt("idmunicipio")),rs.getString("nombre"), rs.getString("descripcion"), 
                    rs.getInt("km_distancia"), rs.getString("telefono"), rs.getString("subregion"), rs.getDate("fecha"),
                    usuariodaosql.obtenerPorID(rs.getString("autor")));
            
            conn.close();
            return municipio;
        }
        
        conn.close();
        return null;
    }

    @Override
    public ArrayList<Municipio> obtenerPorSubregion(String subregion) throws SQLException
    {
        ArrayList<Municipio> municipiosFiltrados = new ArrayList<Municipio>();
        conn = Conexion.getConexion();
        ps = conn.prepareStatement("SELECT * FROM municipio WHERE municipio.subregion = ?");
        ps.setString(1, subregion);
        rs = ps.executeQuery();
        
        while (rs.next())
        {
            Municipio municipio = new Municipio(String.valueOf(rs.getInt("idmunicipio")),rs.getString("nombre"), rs.getString("descripcion"), 
                    rs.getInt("km_distancia"), rs.getString("telefono"), rs.getString("subregion"), rs.getDate("fecha"),
                    usuariodaosql.obtenerPorID(rs.getString("autor")));
            
            municipiosFiltrados.add(municipio);
        }
        conn.close();
        
        if (municipiosFiltrados.isEmpty())
            return null;
        else
            return municipiosFiltrados;
    }

    @Override
    public ArrayList<Municipio> obtenerPorUsuario(Usuario usuario) throws SQLException
    {
        ArrayList<Municipio> municipiosFiltrados = new ArrayList<Municipio>();
        conn = Conexion.getConexion();
        ps = conn.prepareStatement("SELECT * FROM municipio WHERE municipio.autor = ?");
        ps.setString(1, usuario.getCuenta());
        rs = ps.executeQuery();
        
        while (rs.next())
        {
            Municipio municipio = new Municipio(String.valueOf(rs.getInt("idmunicipio")),rs.getString("nombre"), rs.getString("descripcion"), 
                    rs.getInt("km_distancia"), rs.getString("telefono"), rs.getString("subregion"), rs.getDate("fecha"),
                    usuariodaosql.obtenerPorID(rs.getString("autor")));
            
            municipiosFiltrados.add(municipio);
        }
        conn.close();
        
        if (municipiosFiltrados.isEmpty())
            return null;
        else
            return municipiosFiltrados;
    }

    @Override
    public ArrayList<Municipio> obtenerTodos() throws SQLException
    {
        ArrayList<Municipio> municipios = new ArrayList<Municipio>();
        conn = Conexion.getConexion();
        ps = conn.prepareStatement("SELECT * FROM municipio");
        rs = ps.executeQuery();
        
        while (rs.next())
        {
            Municipio municipio = new Municipio(String.valueOf(rs.getInt("idmunicipio")),rs.getString("nombre"), rs.getString("descripcion"), 
                    rs.getInt("km_distancia"), rs.getString("telefono"), rs.getString("subregion"), rs.getDate("fecha"),
                    usuariodaosql.obtenerPorID(rs.getString("autor")));
            
            municipios.add(municipio);
        }
        conn.close();
        
        if (municipios.isEmpty())
            return null;
        else
            return municipios;
    }
    
}
