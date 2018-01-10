/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Controladores.Controlador_Cliente;
import Daos.Entidad_Cliente;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author gaboo
 */
public class Servlet_ClienteBuscar extends HttpServlet {

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

        Controlador_Cliente controladorCliente = new Controlador_Cliente();

                String JSONCliente = "{"
                + "  \"data\": [";
        PrintWriter out = response.getWriter();

        for (Entidad_Cliente cliente : controladorCliente.buscar()) {

            JSONCliente
                    += "["
                    + "\"" + cliente.getIdCliente() + "\","
                    + "\"" + cliente.getNom_cliente()+ "\","
                    + "\"" + cliente.getNom_cedula()+ "\","
                    + "\"EDITAR\","
                    + "\"ELIMINAR\""
                    + "],";

        }

        if (JSONCliente.length() > 12) {
            out.println(JSONCliente.substring(0, (JSONCliente.length() - 1)) + "]}");
        } else {
            out.println(" {  \"data\": [[\"0\",\"SIN REGISTROS\",\"SIN REGISTROS\",\"EDITAR\",\"ELIMINAR\"]]}");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
