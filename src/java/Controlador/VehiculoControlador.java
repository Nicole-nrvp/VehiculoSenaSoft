/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import ModeloDAO.VehiculoDAO;
import ModeloVO.VehiculoVO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Valentina
 */
@WebServlet(name = "VehiculoControlador", urlPatterns = {"/VehiculoControlador"})
public class VehiculoControlador extends HttpServlet {

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
        
        //Recoger elementos scanner (RECIBIR DATOS DE LAS VISTAS)
        
        
        int opcion = Integer.parseInt(request.getParameter("opcion"));
        String vehPlaca = request.getParameter("textPlaca");
        String datosId = request.getParameter("textDatId");
        String categoriaId = request.getParameter("textCatId");
        String vehModelo = request.getParameter("textModelo");
        String vehMarca = request.getParameter("textMarca");
        String vehEstado = request.getParameter("textEstado");
        String vehPrecio = request.getParameter("textPrecio");

        //PASO 2
        //QUIEN TIENE LOS DATOS DE FORMA SEGURA? EL VO 
        //Instacncio el VO
        VehiculoVO vehVO = new VehiculoVO(vehPlaca, datosId, categoriaId, vehModelo, vehMarca, vehEstado, vehPrecio);

        //PASO 3 
        //QUIEN HACE LAS OPERACIONES? EL DAO 
        //Instacncio el DAO y hace las operaciones que estan en el VO
        VehiculoDAO vehDAO = new VehiculoDAO(vehVO);

//        DatosPVO datpVO = new DatosPVO();
//        DatosPDAO datpDAO = new DatosPDAO();
  
        
        //PASO 4
        //ADMINISTRAR OPERACIONES CON CASOS (SWITCH)
        switch (opcion) {

            //METODOS GENERICOS
            case 1: //vista uno (metodo agregar registro)
                //Si el registro SE LOGRO EL LA VISTA MUESTRA CORRECTO 
                
                //datpVO = datpDAO.consultarDatos(usuID);
                vehVO = vehDAO.consultarPlaca(vehPlaca);
                if (vehVO == null) {
                    if (vehDAO.agregarRegistro()) {
                        request.setAttribute("mensajeExito", "El vehiculo se registro correctamente");
                        //Si el registro SE LOGRO EL LA VISTA MUESTRA ERROR 
                    } else {
                        request.setAttribute("mensajeError", "El vehiculo NO se registro correctamente");
                    }
                } else {
                    request.setAttribute("mensajeError", "El vehiculo con esa placa ya esta registrado");
                }
                //REDIRECCIONA A LA MISMA PAGINA PARA QUE MUESTRE LOS MENSAJES 
                //.forwar me permite mandar peticiones http (un get)
                request.getRequestDispatcher("consultarVehiculo.jsp").forward(request, response);
                //acaba el caso
                break;

            case 2: //vvista dos actualizar registro
                //Si actualizar SE LOGRO EL LA VISTA MUESTRA CORRECTO 
                if (vehDAO.actualizarRegistro()) {
                    request.setAttribute("mensajeExito", "El Vehiculo se actualizo correctamente");
                    //Si actualizar SE LOGRO EL LA VISTA MUESTRA ERROR 
                } else {
                    request.setAttribute("mensajeError", "El Vehiculo no se actualizo correctamente");
                }
                //REDIRECCIONA A LA MISMA PAGINA PARA QUE MUESTRE LOS MENSAJES 
                //.forwar me permite mandar peticiones http (un get)
                request.getRequestDispatcher("consultarVehiculo.jsp").forward(request, response);
                //acaba el caso
                break;

            //METODOS PROPIOS 
            case 3:

                vehVO = vehDAO.consultarPlaca(vehPlaca);
                if (vehVO != null) {

                    request.setAttribute("vehiculoConsultado", vehVO);
                    request.getRequestDispatcher("actualizarVehiculo.jsp").forward(request, response);

                } else {
                    request.setAttribute("mensajeError", "El Vehículo NO Existe");
                    request.getRequestDispatcher("consultarVehiculo.jsp").forward(request, response);

                }
                break;

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
