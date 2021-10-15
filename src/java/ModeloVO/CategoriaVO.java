package ModeloVO;

/**
 *
 * @author Valentina
 */
public class CategoriaVO {
    private String catId, catTipo;
    

    public CategoriaVO(String catId, String catTipo) {
        this.catId = catId;
        this.catTipo = catTipo;
    }

    public CategoriaVO() {
    }

    public String getCatId() {
        return catId;
    }

    public void setCatId(String catId) {
        this.catId = catId;
    }

    public String getCatTipo() {
        return catTipo;
    }

    public void setCatTipo(String catTipo) {
        this.catTipo = catTipo;
    }
    
}