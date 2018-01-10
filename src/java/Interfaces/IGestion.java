/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interfaces;

import java.util.ArrayList;

public interface IGestion<T> {
    
   String nuevo(T cli); 
   
   String modificar(T cli);
   
   String borrar(T cli);
   
   ArrayList<T>buscar();
   
   T buscarId (int id);
}
