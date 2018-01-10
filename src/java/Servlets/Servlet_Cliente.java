/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Controladores.Controlador_Cliente;
import Daos.Entidad_Cliente;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author gaboo
 */
public class Servlet_Cliente extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String tipo = request.getParameter("gestion");

        Controlador_Cliente ccl = new Controlador_Cliente();
        Entidad_Cliente ecl = new Entidad_Cliente();

        int id = Integer.parseInt(request.getParameter("txt_idCliente"));
        String nombre = request.getParameter("txt_nombreCliente");
        String cedula = request.getParameter("txt_cedulaCliente");

        ecl.setIdCliente(id);
        ecl.setNom_cliente(nombre);
        ecl.setNom_cedula(cedula);
        System.out.println(tipo);
        switch (tipo) {
            case "guardar":
                if (ccl.nuevo(ecl).equals("cliente creado")) {
                    response.getWriter().println("Cliente registrado");
                } else {
                    response.sendError(1, "Error al registrar Cliente");
                }
                break;
            case "modificar":
                if (ccl.modificar(ecl).equals("modificacion correcta")) {
                    response.getWriter().println("Cliente Modificado");
                } else {
                    response.sendError(1, "Error al Modificar Cliente");
                }
                break;
            case "eliminar":
                if (ccl.borrar(ecl).equals("eliminacion correcta")) {
                    response.getWriter().println("Cliente Eliminado");
                } else {
                    response.sendError(1, "Error al Eliminar Cliente");
                }
                break;
            default:
                break;
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
