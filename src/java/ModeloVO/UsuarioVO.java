/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloVO;

/**
 *
 * @author Valentina
 */
public class UsuarioVO {
    
   //declarar los atributos del modulo
    private String usuId, usuLogin, usuPassword, rol;

    public UsuarioVO(String usuId) {
        this.usuId = usuId;
    }

    public UsuarioVO(String usuId, String rol) {
        this.usuId = usuId;
        this.rol = rol;
    }

    //CONSTRUCTOR SIEMPRE DE PRIMERAS
    //constructor lleno 1 PARA RECIBIR DATOS
    public UsuarioVO(String usuId, String usuLogin, String usuPassword) {

        this.usuId = usuId;
        this.usuLogin = usuLogin;
        this.usuPassword = usuPassword;
    }

    //inserto un constructor 2 VACIO PARA MANDAR DATOS CON UN QUERY
    public UsuarioVO() {
    }

    //realizo el gett and sett (insertar codigo y allí)
    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public String getUsuId() {
        return usuId;
    }

    public void setUsuId(String usuId) {
        this.usuId = usuId;
    }

    public String getUsuLogin() {
        return usuLogin;
    }

    public void setUsuLogin(String usuLogin) {
        this.usuLogin = usuLogin;
    }

    public String getUsuPassword() {
        return usuPassword;
    }

    public void setUsuPassword(String usuPassword) {
        this.usuPassword = usuPassword;
    }
}
