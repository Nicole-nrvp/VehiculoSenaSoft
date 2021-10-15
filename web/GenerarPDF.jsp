<%-- 
    Document   : GenerarPDF
    Created on : 23-jun-2021, 8:37:38
    Author     : Intel
--%>


<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="Util.Conexion"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PDF vehiculo</title>
    </head>
    <body>
        <% 
            //Recoge cada uno de los reportes ----- indicamos el nombre del reporte
                //Que reporte quiere generar
            String nombreReporte= request.getParameter("nombreReporte");
            //Almacenar un objeto de file en aplicacion ----- indicamos un nombre de reporte generico
                //se almacene en un objeto tipo File
            File reporte = new File(application.getRealPath(nombreReporte));
            //tipo de objeto de arreglo lo que encuentre en string lo convierte en objeto
                //estamos haciendo un mapeo
            Map<String,Object> parametros = new HashMap<String, Object>() ;
            //necesitamos conecion (creamosobjeto de la clase conexion)
            Conexion claseconexion = new Conexion();
            //objeto tipo connection (obtenemos la conexion)
            Connection conexion = claseconexion.obtenerConexion();
            
            byte[] reporteBytes = JasperRunManager.runReportToPdf(reporte.getPath(), parametros,conexion);
            //contentType es omo elnavehador interpreta una informacion
            response.setContentType("application/pdf");
            
            //tamaño del reporte y sera igual al tamaño del reporte
            response.setContentLength(reporteBytes.length);
            //propiedad para exportar y guardar 
            response.setHeader("Content-Disposition", "filename=\"reporte_vehiculos.pdf\";");
            //crear objeto servlet
                //
            ServletOutputStream salida = response.getOutputStream();
            salida.write(reporteBytes, 0, reporteBytes.length);
            salida.flush();
            salida.close();
            %>
        
    </body>
</html>
