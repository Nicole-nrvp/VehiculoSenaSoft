/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import ModeloDAO.DatosPersonalesDAO;
import ModeloVO.DatosPersonalesVO;
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
@WebServlet(name = "Datos", urlPatterns = {"/Datos"})
public class DatosPersonalesControlador extends HttpServlet {

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
        int opcion = Integer.parseInt(request.getParameter("opcion"));
        String txtDatId = request.getParameter("txtDatId");
        String txtUsuId = request.getParameter("txtUsuId");
        String txtDatNombre = request.getParameter("txtDatNombre");
        String txtDatApellido = request.getParameter("txtDatApellido");
        String txtDatTipoId = request.getParameter("txtDatTipoId");
        String txtDatNumeroId = request.getParameter("txtDatNumeroId");
        String txtDatTelefono = request.getParameter("txtDatTelefono");
        String txtDatCorreo = request.getParameter("txtDatCorreo");
        
        DatosPersonalesVO datVO = new DatosPersonalesVO
        (       
                txtDatId,
                txtUsuId,
                txtDatNombre,
                txtDatApellido,
                txtDatTipoId,
                txtDatNumeroId,
                txtDatTelefono,
                txtDatCorreo
        );
        DatosPersonalesDAO datDAO = new DatosPersonalesDAO(datVO);
        
        switch(opcion){
            case 1:
                datVO = datDAO.ConsultarRegistros(txtUsuId);
                if (datVO != null) {
                        request.setAttribute("DatosUsuario", datVO);
                        request.getRequestDispatcher("editarDatos.jsp").forward(request, response);
                    } else {
                        request.setAttribute("mensajeError", "El usuario no se encontro");
                        request.getRequestDispatcher("menu.jsp").forward(request, response);
                    }
                break;
            case 2:
                if (datDAO.actualizarRegistro()) {
                    request.setAttribute("mensajeError","El usuario se actualizo");
                    request.getRequestDispatcher("menu.jsp").forward(request, response);
                } else {
                    request.setAttribute("mensajeError","Hubo un error :(");
                    request.getRequestDispatcher("menu.jsp").forward(request, response);
                }
                break;
            case 3:
                if (datDAO.agregarRegistro()) {
                    request.setAttribute("mensajeError","El usuario se registro");
                    request.getRequestDispatcher("menu.jsp").forward(request, response);
                } else {
                    request.setAttribute("mensajeError","El usuario no se registro");
                    request.getRequestDispatcher("menu.jsp").forward(request, response);
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
