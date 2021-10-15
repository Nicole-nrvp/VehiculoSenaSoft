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
public class DatosPersonalesVO {
    private String  datId, usuId, datNombre, datApellido, datTipo, datNumero, datTelefono, datCorreo;

   
    
     public DatosPersonalesVO(String datId, String usuId, String datNombre, String datApellido, String datTipo, String datNumero, String datTelefono, String datCorreo) {
        this.datId = datId;
        this.usuId = usuId;
        this.datNombre = datNombre;
        this.datApellido = datApellido;
        this.datTipo = datTipo;
        this.datNumero = datNumero;
        this.datTelefono = datTelefono;
        this.datCorreo = datCorreo;
    }

    public DatosPersonalesVO() {
    }
            

    public String getDatId() {
        return datId;
    }

    public void setDatId(String datId) {
        this.datId = datId;
    }

    public String getUsuId() {
        return usuId;
    }

    public void setUsuId(String usuId) {
        this.usuId = usuId;
    }

    public String getDatNombre() {
        return datNombre;
    }

    public void setDatNombre(String datNombre) {
        this.datNombre = datNombre;
    }

    public String getDatApellido() {
        return datApellido;
    }

    public void setDatApellido(String datApellido) {
        this.datApellido = datApellido;
    }

    public String getDatTipo() {
        return datTipo;
    }

    public void setDatTipo(String datTipo) {
        this.datTipo = datTipo;
    }

    public String getDatNumero() {
        return datNumero;
    }

    public void setDatNumero(String datNumero) {
        this.datNumero = datNumero;
    }

    public String getDatTelefono() {
        return datTelefono;
    }

    public void setDatTelefono(String datTelefono) {
        this.datTelefono = datTelefono;
    }

    public String getDatCorreo() {
        return datCorreo;
    }

    public void setDatCorreo(String datCorreo) {
        this.datCorreo = datCorreo;
    }
}
