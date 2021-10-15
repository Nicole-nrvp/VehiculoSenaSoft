package ModeloDAO;

import ModeloVO.UsuarioVO;
import Util.Conexion;
import Util.Crud;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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

    //variables de tipo boolean mejor por defecto 
    private boolean operaciones = false;
    //operaciones de la BASE DE DATOS EN VARIABLE SQL
    private String sql;
    //inicializo las variables y las dejo vacias ESTAS SON VARIABLES DEL VO
    private String usuId = "", usuLogin = "", usuPassword = "";

    public UsuarioDAO() {
    }

    //2. EL METODO PRINCIPAL PARA RECIBIR LOS DATOS DEL VO (CONSTRUCTOR) ///////////////CUANDO SE EJECUTA LA CLASE Y SE LLAMA IGUAL A LA CLASE/////////////
    //usuVO ES LO QUE TRAEMOS DEL VO
    public UsuarioDAO(UsuarioVO usuVO) {
        //EL VO ES UNA SUPER CLASE
        super();

        //3. ME CONECTO A LA BASE DE DATOS    
        try {
            conexion = this.obtenerConexion();

            //4. TRAER AL DAO LOS DATOS DEL VO PARA HACER LAS OPERACIONES
            usuId = usuVO.getUsuId();
            usuLogin = usuVO.getUsuLogin();
            usuPassword = usuVO.getUsuPassword();

        } catch (Exception e) {
            //5. CREAR EL LOGGER EXCEPCIÓN
            //excepcion optima se crearon 2 import COPIAR Y PEGAR EN TODOS
            //LOGG ES LA SECUENCIA COMPLETA DE TODO LO QUE PASA NS IMPRIME EL ERROR 
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);

        }

    }

    //6. AGREGAMOS EN LA CLASE IMPLEMENT LO QUE ESTA EN LA CRUD (INTERFACE)Y AGREGAR UN IMPORT 
    //NOS GENERA LOS METODOS QUE TENIA LA CRUD (INTERFACE)
    //METODOS GENERICOOOOS
    @Override
    public boolean agregarRegistro() {
        //todo emtodo con try cacht 
        try {
            sql = "insert into usuario(USULOGIN,USUPASSWORD) value(?,?)";
            //crear un puente para la conexion y envia la setencia sql 
            puente = conexion.prepareStatement(sql);
            ///envia atributos por set 
            puente.setString(1, usuLogin);
            puente.setString(2, usuPassword);
            //YA EJECUTO ESTO
            puente.executeUpdate();
            operaciones = true;

        } catch (SQLException e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();

            } catch (SQLException e) {
                Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return operaciones;
    }

    @Override
    public boolean actualizarRegistro() {
//todo emtodo con try cacht 
        try {
            sql = "udpate usuario set USULOGIN=?,USUPASSWORD=? where USUID=?";
            //crear un puente para la conexion y envia la setencia sql 
            puente = conexion.prepareStatement(sql);
            ///envia atributos por set 
            puente.setString(1, usuLogin);
            puente.setString(2, usuPassword);
            puente.setString(3, usuId);
            //YA EJECUTO ESTO
            puente.executeUpdate();
            operaciones = true;

        } catch (SQLException e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();

            } catch (SQLException e) {
                Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return operaciones;
    }

    @Override
    public boolean eliminarRegistro() {
//todo emtodo con try cacht 
        try {
            //sql="udpate usuario set USUAESTADO=?, where USUID=?";
            sql = "";
            //crear un puente para la conexion y envia la setencia sql 
            puente = conexion.prepareStatement(sql);
            ///envia atributos por set 
            //  puente.setString(1, usuLogin);
            puente.setString(1, usuLogin);
            puente.setString(3, usuId);
            //YA EJECUTO ESTO
            puente.executeUpdate();
            operaciones = true;

        } catch (SQLException e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();

            } catch (SQLException e) {
                Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return operaciones;
    }

    //MERODOS PROPIOS DE USUARIO 
    public boolean iniciarSesion(String usuario, String clave) {
        //conexion a la BD
        try {
            conexion = this.obtenerConexion();
            sql = "select * from usuario where USULOGIN=? and USUPASSWORD=?";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, usuario);
            puente.setString(2, clave);
            mensajero = puente.executeQuery();
            if (mensajero.next()) {
                operaciones = true;
            }

        } catch (SQLException e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                //this.cerrarConexión();
            } catch (Exception e) {
                Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return operaciones;
    }

    public ArrayList<UsuarioVO> rol(String usuario) {
        ArrayList<UsuarioVO> listaRol = new ArrayList<>();
        try {
            conexion = this.obtenerConexion();
            sql = "SELECT usuario.USUID, rol.ROLTIPO\n"
                    + "FROM rol INNER JOIN\n"
                    + "usuario_rol ON rol.ROLID = usuario_rol.ROLID INNER JOIN\n"
                    + "usuario ON usuario_rol.USUID = usuario.USUID\n"
                    + "WHERE usuario.USULOGIN = ?";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, usuario);
            mensajero = puente.executeQuery();
            while (mensajero.next()) {
                UsuarioVO usuVO = new UsuarioVO(mensajero.getString(1), mensajero.getString(2));
                listaRol.add(usuVO);

            }
        } catch (SQLException e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
            System.err.println(e.toString());
        }
        return listaRol;

    }

    public UsuarioVO ConsultarUsuario(String Usuario) {
        UsuarioVO usuVO = null;

        try {

            conexion = this.obtenerConexion();
            sql = "select USUID,USULOGIN from usuario where USUID =?";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, Usuario);
            mensajero = puente.executeQuery();
            while (mensajero.next()) {

                usuVO = new UsuarioVO(
                        mensajero.getString(1),
                        mensajero.getString(2)
                );

            }

        } catch (SQLException e) {

            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return usuVO;

    }
}
