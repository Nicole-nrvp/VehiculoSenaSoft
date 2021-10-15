/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import Util.Conexion;
import Util.Crud;
import ModeloVO.DatosPersonalesVO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.ArrayList;

/**
 *
 * @author Valentina
 */
public class DatosPersonalesDAO extends Conexion implements Crud{
    private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;

    private boolean operaciones = false;
    private String sql;
    private String datId = "", usuId = "", datNombre = "", datApellido = "", datTipo = "", datNumero = "", datTelefono = "", datCorreo = "";

    public DatosPersonalesDAO() {
    }

    public DatosPersonalesDAO(DatosPersonalesVO datpVO) {
        super();

        try {
            conexion = this.obtenerConexion();
            datId = datpVO.getDatId();
            usuId = datpVO.getUsuId();
            datNombre = datpVO.getDatNombre();
            datApellido = datpVO.getDatApellido();
            datTipo = datpVO.getDatTipo();
            datNumero = datpVO.getDatNumero();
            datTelefono = datpVO.getDatTelefono();
            datCorreo = datpVO.getDatCorreo();

        } catch (Exception e) {
            Logger.getLogger(DatosPersonalesDAO.class.getName()).log(Level.SEVERE, null, e);
        }

    }

    @Override
    public boolean agregarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean actualizarRegistro() {
        try {
            //UPDATE datospersonales SET DATNOMBRE='MARY', DATAPELLIDO='POLO', DATNUMEROID='3142562243', DATCORREO='mary@gmai.com' WHERE DATID='2'
            sql = "UPDATE datospersonales SET DATNOMBRE=?, DATAPELLIDO=?, DATELEFONO=?, DATCORREO=? WHERE DATID=?";
            //crear un puente para la conexion y envia la setencia sql 
            puente = conexion.prepareStatement(sql);
            ///envia atributos por set 
            puente.setString(1, datNombre);
            puente.setString(2, datApellido);
            puente.setString(3, datTelefono);
            puente.setString(4, datCorreo);
            puente.setString(5, datId);

            //YA EJECUTO ESTO
            puente.executeUpdate();
            operaciones = true;

        } catch (SQLException e) {
            Logger.getLogger(DatosPersonalesDAO.class.getName()).log(Level.SEVERE, null, e);
            System.out.println(e.toString());

        } finally {
            try {
                this.cerrarConexion();

            } catch (SQLException e) {
                Logger.getLogger(DatosPersonalesDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return operaciones;

    }

    @Override
    public boolean eliminarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public DatosPersonalesVO consultarNombre(String nombre) {

        DatosPersonalesVO datpVO = null;
        try {
            conexion = this.obtenerConexion();
            sql = "select * from datospersonales where DATNOMBRE= ?";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, nombre);
            mensajero = puente.executeQuery();
            while (mensajero.next()) {

                datpVO = new DatosPersonalesVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3),
                        mensajero.getString(4), mensajero.getString(5), mensajero.getString(6),
                        mensajero.getString(7), mensajero.getString(8));
            }

        } catch (Exception e) {
            Logger.getLogger(DatosPersonalesDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();

            } catch (SQLException e) {
                Logger.getLogger(DatosPersonalesDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return datpVO;
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

    public ArrayList<DatosPersonalesVO> listar(String id) {

        ArrayList<DatosPersonalesVO> listaDatos = new ArrayList<>();
        try {
            conexion = this.obtenerConexion();
            sql = "select * from datospersonales where usuid=? ";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, id);
            mensajero = puente.executeQuery();

            while (mensajero.next()) {

                DatosPersonalesVO datpVO = new DatosPersonalesVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3),
                        mensajero.getString(4), mensajero.getString(5), mensajero.getString(6), mensajero.getString(7),
                        mensajero.getString(8));

                listaDatos.add(datpVO);

            }
        } catch (Exception e) {
            Logger.getLogger(DatosPersonalesDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();

            } catch (SQLException e) {
                Logger.getLogger(DatosPersonalesDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return listaDatos;
    }
    
     public ArrayList<DatosPersonalesVO> obtener() {

        ArrayList<DatosPersonalesVO> listaDatos = new ArrayList<>();
        try {
            conexion = this.obtenerConexion();
            sql = "select * from datospersonales";
            puente = conexion.prepareStatement(sql);
            mensajero = puente.executeQuery();

            while (mensajero.next()) {

                DatosPersonalesVO datpVO = new DatosPersonalesVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3),
                        mensajero.getString(4), mensajero.getString(5), mensajero.getString(6), mensajero.getString(7),
                        mensajero.getString(8));

                listaDatos.add(datpVO);

            }
        } catch (Exception e) {
            Logger.getLogger(DatosPersonalesDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();

            } catch (SQLException e) {
                Logger.getLogger(DatosPersonalesDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return listaDatos;
    }

    public DatosPersonalesVO consultarDatos(String usuID) {

        DatosPersonalesVO datpVO = null;

        try {

            conexion = this.obtenerConexion();
            sql = "SELECT * FROM `datospersonales` WHERE usuid =?";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, usuID);
            mensajero = puente.executeQuery();
            while (mensajero.next()) {

                datpVO = new DatosPersonalesVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3),
                        mensajero.getString(4), mensajero.getString(5), mensajero.getString(6),
                        mensajero.getString(7), mensajero.getString(8));
            }

        } catch (SQLException e) {

            Logger.getLogger(DatosPersonalesDAO.class.getName()).log(Level.SEVERE, null, e);

        } finally {
            try {
                //this.cerrarConexión();
            } catch (Exception e) {

                Logger.getLogger(DatosPersonalesDAO.class.getName()).log(Level.SEVERE, null, e);
            }

        }
        return datpVO;
    }
    
    public DatosPersonalesVO consultarId(String datosId) {

        DatosPersonalesVO datpVO = null;

        try {

            conexion = this.obtenerConexion();
            sql = "SELECT * FROM `datospersonales` WHERE datid =?";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, datosId);
            mensajero = puente.executeQuery();
            while (mensajero.next()) {

                datpVO = new DatosPersonalesVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3),
                        mensajero.getString(4), mensajero.getString(5), mensajero.getString(6),
                        mensajero.getString(7), mensajero.getString(8));
            }

        } catch (SQLException e) {

            Logger.getLogger(DatosPersonalesDAO.class.getName()).log(Level.SEVERE, null, e);

        } catch (Exception e) {

                Logger.getLogger(DatosPersonalesDAO.class.getName()).log(Level.SEVERE, null, e);
            }

        
        return datpVO;
    }
}
