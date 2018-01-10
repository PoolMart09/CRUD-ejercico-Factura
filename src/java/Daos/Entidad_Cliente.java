
package Daos;

public class Entidad_Cliente {
    
    private int idCliente;
    private String nom_cliente;
    private String nom_cedula;

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }


    public String getNom_cliente() {
        return nom_cliente;
    }

    public void setNom_cliente(String nom_cliente) {
        this.nom_cliente = nom_cliente;
    }

    public String getNom_cedula() {
        return nom_cedula;
    }

    public void setNom_cedula(String nom_cedula) {
        this.nom_cedula = nom_cedula;
    }
    
}
