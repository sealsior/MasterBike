package Model;

public class Pdf {
    private int ID_DOCUMENTACION;
    private String TIPODOCUMENTO;
    private String  NOMDOCUMENTO;
    private byte [] DOCUMENTO;
    private int ID_PRODUCTO;

    public Pdf() {
    }

    public int getID_DOCUMENTACION() {
        return ID_DOCUMENTACION;
    }

    public void setID_DOCUMENTACION(int ID_DOCUMENTACION) {
        this.ID_DOCUMENTACION = ID_DOCUMENTACION;
    }

    public String getTIPODOCUMENTO() {
        return TIPODOCUMENTO;
    }

    public void setTIPODOCUMENTO(String TIPODOCUMENTO) {
        this.TIPODOCUMENTO = TIPODOCUMENTO;
    }

    public String getNOMDOCUMENTO() {
        return NOMDOCUMENTO;
    }

    public void setNOMDOCUMENTO(String NOMDOCUMENTO) {
        this.NOMDOCUMENTO = NOMDOCUMENTO;
    }

    public byte [] getDOCUMENTO() {
        return DOCUMENTO;
    }

    public void setDOCUMENTO(byte [] DOCUMENTO) {
        this.DOCUMENTO = DOCUMENTO;
    }

    public int getID_PRODUCTO() {
        return ID_PRODUCTO;
    }

    public void setID_PRODUCTO(int ID_PRODUCTO) {
        this.ID_PRODUCTO = ID_PRODUCTO;
    }

 
   
    
}
