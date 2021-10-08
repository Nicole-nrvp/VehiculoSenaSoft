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
    private String usuId,usuEstado,usuLogin,usuPassword,usuRol;

    
    
    
    public UsuarioVO(String usuId, String usuEstado, String usuLogin, String usuPassword) {
        this.usuId = usuId;
        this.usuEstado = usuEstado;
        this.usuLogin = usuLogin;
        this.usuPassword = usuPassword;
    }
    
    public void setUsuRol(String usuRol) {
        this.usuRol = usuRol;
    }
    public UsuarioVO() {
    }
    
    public String getUsuRol() {
        return usuRol;
    }
      
    public String getUsuId() {
        return usuId;
    }

    public void setUsuId(String usuId) {
        this.usuId = usuId;
    }

    public String getUsuEstado() {
        return usuEstado;
    }

    public void setUsuEstado(String usuEstado) {
        this.usuEstado = usuEstado;
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
