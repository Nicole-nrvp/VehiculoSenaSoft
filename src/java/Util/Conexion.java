/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Util;

import java.sql.*;

/**
 *
 * @author Valentina
 */
public class Conexion {
    
    private String driver, user, password, nombrebd, urlbd;
    private Connection conexion;
    
    
    
    public Conexion(){
        
        driver="com.mysql.jdbc.Driver";
        user="root";
        password="";
        nombrebd="ventavehiculos";
        urlbd="jdbc:mysql://localhost:3306/" + nombrebd;
        
        try {
            Class.forName(driver).newInstance();
            conexion = DriverManager.getConnection(urlbd, user, password);
            System.out.println("Conexion Okey");
            
        } catch (Exception e) {
            System.out.println("Error al conectarse" + e.toString());
        }
    }
    
    public Connection obtenerConexion(){
        return conexion;
    }
    
    public  Connection cerrarConexion() throws SQLException {
        conexion.close();
        conexion = null;
        return conexion;
    }
    
    public static void main(String[] args) {
        new Conexion();
    }
}
