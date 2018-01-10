/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import Daos.Entidad_Cliente;
import Interfaces.IGestion;
import Modelos.Modelo_Cliente;
import java.util.ArrayList;

/**
 *
 * @author gaboo
 */
public class Controlador_Cliente implements IGestion<Entidad_Cliente> {

    @Override
    public String nuevo(Entidad_Cliente cli) {
        Modelo_Cliente modelo_cliente = new Modelo_Cliente();
        return modelo_cliente.nuevo(cli);
    }

    @Override
    public String modificar(Entidad_Cliente cli) {
        Modelo_Cliente modeloCliente = new Modelo_Cliente();
        return modeloCliente.modificar(cli);
    }

    @Override
    public String borrar(Entidad_Cliente cli) {
        Modelo_Cliente modeloCliente = new Modelo_Cliente();
        return modeloCliente.borrar(cli);
    }

    @Override
    public ArrayList<Entidad_Cliente> buscar() {
        Modelo_Cliente modeloCliente = new Modelo_Cliente();
        return modeloCliente.buscar();
    }

    @Override
    public Entidad_Cliente buscarId(int id) {
        Modelo_Cliente modeloCliente = new Modelo_Cliente();
        return modeloCliente.buscarId(id);
    }

}
