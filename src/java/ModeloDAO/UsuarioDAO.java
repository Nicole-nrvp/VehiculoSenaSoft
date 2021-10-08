/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import ModeloVO.UsuarioVO;
import Util.Conexion;
import Util.Crud;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Valentina
 */
public class UsuarioDAO extends Conexion implements Crud {

    private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;

    private boolean operacion = false;
    private String sql;
    private String usuId = "", UsuLogin = "", UsuPassword = "", UsuEstado = "";
    UsuarioVO usuVO = new UsuarioVO();

    public UsuarioDAO(UsuarioVO usuVO) {

        super();
        try {
            //3.Conectarse a la BD 
            conexion = this.obtenerConexion();
            //4. Traer el DAO los datos del VO para la operacion
            usuId = usuVO.getUsuId();
            UsuLogin = usuVO.getUsuLogin();
            UsuPassword = usuVO.getUsuPassword();
            UsuEstado = usuVO.getUsuEstado();
        } catch (Exception e) {

            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    @Override
    public boolean agregarRegistro() {
        try {
            sql = "insert into usuario(USULOGIN,USUPASSWORD) values (?,?,1)";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, UsuLogin);
            puente.setString(2, UsuPassword);
            puente.executeUpdate();
            operacion = true;

        } catch (SQLException e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (SQLException e) {
                Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);

            }
        }
        return operacion;
    }

    @Override
    public boolean actualizarRegistro() {
        try {
            sql = "update usuario set USULOGIN=?,USUPASSWORD=? where USUID=?";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, UsuLogin);
            puente.setString(2, UsuPassword);
            puente.setString(3, usuId);
            puente.executeUpdate();
            operacion = true;

        } catch (SQLException e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (SQLException e) {
                Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return operacion;
    }

    @Override
    public boolean eliminarRegistro() {
        try {
            sql = "update usuario set USUESTADO=0 where USUID=?";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, usuId);
            puente.executeUpdate();
            operacion = true;

        } catch (SQLException e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (SQLException e) {
                Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return operacion;
    }
}
