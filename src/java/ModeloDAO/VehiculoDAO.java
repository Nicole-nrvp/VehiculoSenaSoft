/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import ModeloVO.VehiculoVO;
import java.sql.*;
import Util.Conexion;
import Util.Crud;
import java.util.logging.Level;
import org.jboss.logging.Logger;

/**
 *
 * @author Valentina
 */
public class VehiculoDAO extends Conexion implements Crud{
    
    private Connection conexion;
    private ResultSet mensajero;
    private PreparedStatement puente;
    
    private String sql;
    private boolean opreaciones=false;
    private String vehPlaca="", datId="", catId="", vehModelo="", vehMarca="", vehEstado="",vehPrecio="";
    
    public VehiculoDAO(){}
    
    public VehiculoDAO(VehiculoVO vehVO){
        super();
        
        try {
            conexion = this.obtenerConexion();
            vehPlaca = vehVO.getVehPlaca();
            datId = vehVO.getDatId();
            catId = vehVO.getCatId();
            vehModelo = vehVO.getVehModelo();
            vehMarca = vehVO.getVehMarca();
            vehEstado = vehVO.getVehEstado();
            vehPrecio = vehVO.getVehPrecio();            
               
        } catch (Exception e) {
            java.util.logging.Logger.getLogger(VehiculoDAO.class.getName()).log(Level.SEVERE, null,e); 
        }
    }

    @Override
    public boolean agregarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean actualizarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
