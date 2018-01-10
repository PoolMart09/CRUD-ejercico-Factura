/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;

import Daos.Entidad_Cliente;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import Interfaces.IGestion;
import java.sql.ResultSet;

public class Modelo_Cliente extends Conexion implements IGestion<Entidad_Cliente> {

    @Override
    public String nuevo(Entidad_Cliente cli) {
        String crea;
        try {
            this.Conectar();
            PreparedStatement st = this.getCn().prepareStatement("INSERT INTO cliente "
                    + "(nom_cliente, nom_cedula) "
                    + "VALUES (?, ?)");
            st.setString(1, cli.getNom_cliente());
            st.setString(2, cli.getNom_cedula());
            st.execute();
            crea = "cliente creado";
        } catch (SQLException e) {
            crea = "error al crear cliente";
            Logger.getLogger(Modelo_Cliente.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            this.Cerrar();
        }
        return crea;
    }

    @Override
    public String modificar(Entidad_Cliente cli) {
        String mod;
        try {
            this.Conectar();
            PreparedStatement st = this.getCn().prepareStatement("UPDATE cliente SET "
                    + "nom_cliente = ?, "
                    + "nom_cedula = ? "
                    + "WHERE (idCliente = ?);");
            
            st.setString(1, cli.getNom_cliente());
            st.setString(2, cli.getNom_cedula());
            st.setInt(3, cli.getIdCliente());
            st.execute();
            mod = "modificacion correcta";
            
        } catch (SQLException e) {
            mod = "modificacion fallida";
            Logger.getLogger(Modelo_Cliente.class.getName()).log(Level.SEVERE, null, e);
        }finally{
            this.Cerrar();
        }
        return mod;
    }

    @Override
    public String borrar(Entidad_Cliente cli) {
        String mod;
        try {
            this.Conectar();
            PreparedStatement st = this.getCn().prepareStatement("DELETE FROM cliente WHERE (idCliente = ?)");
            st.setInt(1, cli.getIdCliente());
            st.execute();
            mod = "eliminacion correcta";
        } catch (SQLException e) {
            mod = "eliminacion fallida";
            Logger.getLogger(Modelo_Cliente.class.getName()).log(Level.SEVERE, null, e);     
        }finally{
            this.Cerrar();
        }
        return mod;
    }

    @Override
    public ArrayList<Entidad_Cliente> buscar() {
        ArrayList<Entidad_Cliente> ListaCliente = new ArrayList<>();
        Entidad_Cliente cliente;
        
        try {
            this.Conectar();
            PreparedStatement pst = this.getCn().prepareCall("SELECT * FROM cliente");
            ResultSet rs = pst.executeQuery();
            
            while (rs.next()){
                cliente = new Entidad_Cliente();
                
                cliente.setIdCliente(rs.getInt(1));
                cliente.setNom_cliente(rs.getString(2));
                cliente.setNom_cedula(rs.getString(3));
                
                ListaCliente.add(cliente);
                
            }

        } catch (SQLException e) {
            Logger.getLogger(Modelo_Cliente.class.getName()).log(Level.SEVERE, null, e);
        }finally{
            this.Cerrar();
        }
        return ListaCliente;
    }

    @Override
    public Entidad_Cliente buscarId(int idCliente) {
        
        Entidad_Cliente cliente = null;
        
        try {
            this.Conectar();
            PreparedStatement pst = this.getCn().prepareCall("SELECT * FROM cliente WHERE idCliente = "+ idCliente + "");
            ResultSet rs = pst.executeQuery();
            
            while (rs.next()){
                
                cliente = new Entidad_Cliente();
                
                cliente.setIdCliente(rs.getInt(1));
                cliente.setNom_cliente(rs.getString(2));
                cliente.setNom_cedula(rs.getString(3));
                
                
                
            }

        } catch (SQLException e) {
            Logger.getLogger(Modelo_Cliente.class.getName()).log(Level.SEVERE, null, e);
        }finally{
            this.Cerrar();
        }
        return cliente;
    }

}
