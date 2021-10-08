/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import Util.Conexion;
import Util.Crud;
import ModeloVO.DatosPersonalesVO;
import com.mysql.jdbc.PreparedStatement;
import java.sql.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Valentina
 */
public class DatosPersonalesDAO extends Conexion implements Crud {

    private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;

    private boolean operacion = false;

    private String sql;
    private String datId = "", usuId = "", datNombre = "", datApellido = "", datTipoId = "", datNumeroId = "", datTelefono = "", datCorreo = "";
    DatosPersonalesVO datVO = new DatosPersonalesVO();

    public DatosPersonalesDAO(DatosPersonalesVO datVO) {
        try {
            conexion = this.obtenerConexion();
            datId = datVO.getDatId();
            usuId = datVO.getUsuId();
            datNombre = datVO.getDatNombre();
            datApellido = datVO.getDatApellido();
            datTipoId = datVO.getDatTipoId();
            datNumeroId = datVO.getDatNumeroId();
            datTelefono = datVO.getDatTelefono();
            datCorreo = datVO.getDatCorreo();
        } catch (Exception e) {
            Logger.getLogger(DatosPersonalesDAO.class.getName()).log(Level.SEVERE, null,e);
        }

    }

    @Override
    public boolean agregarRegistro() {
        try {

            sql = "INSERT INTO `datospersonales` (`DATID`,`USUID`, `DATNOMBRE`, `DATAPELLIDO`, `DATIPOID`, `DATNUMEROID`, `DATELEFONO`, `DATCORREO`) VALUES (NULL,?,?,?,?,?,?,?);";
            puente = (PreparedStatement) conexion.prepareStatement(sql);
            puente.setString(1, usuId);
            puente.setString(2, datNombre);
            puente.setString(3, datApellido);
            puente.setString(4, datTipoId);
            puente.setString(5, datNumeroId);
            puente.setString(6, datTelefono);
            puente.setString(7, datCorreo);
            puente.executeUpdate();
            operacion = true;

        } catch (SQLException e) {
            Logger.getLogger(DatosPersonalesDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (SQLException e) {
                Logger.getLogger(DatosPersonalesDAO.class.getName()).log(Level.SEVERE, null, e);

            }
        }
        return operacion;
    }
    
     public DatosPersonalesVO ConsultarRegistros(String usuId) {
        DatosPersonalesVO datVO = null;
        try {

            conexion = this.obtenerConexion();
            sql = "SELECT * FROM datospersonales WHERE USUID = ?";
            puente = (PreparedStatement) conexion.prepareStatement(sql);
            puente.setString(1, usuId);
            mensajero = puente.executeQuery();
            while (mensajero.next()) {

                datVO = new DatosPersonalesVO(
                        usuId,
                        mensajero.getString(2),
                        mensajero.getString(3),
                        mensajero.getString(4),
                        mensajero.getString(5),
                        mensajero.getString(6),
                        mensajero.getString(7),
                         mensajero.getString(8));

            }

        } catch (SQLException e) {

            Logger.getLogger(VehiculoDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return datVO;

    }
    @Override
    public boolean actualizarRegistro() {
       try {
            sql = "update datospersonales set DATNOMBRE=?,DATAPELLIDO=?,DATIPOID=?,DATNUMEROID=?,DATELEFONO=?,DATCORREO=? WHERE USUID=?";
            puente = (PreparedStatement) conexion.prepareStatement(sql);
            puente.setString(1, datNombre);
            puente.setString(2, datApellido);
            puente.setString(3, datTipoId);
            puente.setString(4, datNumeroId);
            puente.setString(5, datTelefono);
            puente.setString(6, datCorreo);
            puente.setString(7, usuId);

            puente.executeUpdate();
            operacion = true;

        } catch (SQLException e) {
            Logger.getLogger(DatosPersonalesDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                
                this.cerrarConexion();
            } catch (SQLException e) {
                Logger.getLogger(DatosPersonalesDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return operacion;
    }

    @Override
    public boolean eliminarRegistro() {
        try {
            sql = "";
            puente = (PreparedStatement) conexion.prepareStatement(sql);
            puente.setString(1, datNombre);
            puente.executeUpdate();
            operacion = true;

        } catch (SQLException e) {
            Logger.getLogger(DatosPersonalesDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                
                this.cerrarConexion();
            } catch (SQLException e) {
                Logger.getLogger(DatosPersonalesDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return operacion;}

}
