package com.test.bean;

import com.test.conexion.VariablesConexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.annotation.PreDestroy;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Misael
 */
public class UsuarioBean {
    private Connection connection;
    private PreparedStatement insertCategoria;
    private VariablesConexion variable;
    //constructores
    public UsuarioBean()throws SQLException{
        //instanciando
        variable=new VariablesConexion();
        variable.inicioConexion();
        //obteniendo la conexion
        connection=variable.getConnection();
        System.out.println("Iniciando la conexion");
    }
   
    //metodos
     @PreDestroy
    public void cerrarConexion(){
        variable.cerrarConexion();
    }
    public String registrarCategoria(HttpServletRequest request){
        String mensaje="";
        if(request==null){
            return"";
        }
        if(connection!=null){
            try {
                //definiendo la consulta
                StringBuilder query = new StringBuilder();
                query.append(" insert into categoria ");
                query.append(" values (nextval('sec_cat'),?,?)");
                //enviando la consulta
                if(insertCategoria==null){
                    insertCategoria=connection.prepareStatement(query.toString());
                }
                //rescatando los parametros del formulario jsp registrarCategoria
                String nombre = request.getParameter("nomCat");
                String descripcion = request.getParameter("desCat");
                //pasando los datos a los parametros de la consulta
                insertCategoria.setString(1,nombre);
                insertCategoria.setString(2, descripcion);
                //ejecutando la consulta
                int registro=insertCategoria.executeUpdate();
                if(registro==1){
                    mensaje="Registro realizado con exito";
                }else{
                    mensaje="Error al insertar el registro";
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return mensaje;
    }
    //Realizando el listado de todas las categorias que se tienen registrados
    public String busquedaUsuario(HttpServletRequest request){
        StringBuilder salidaTabla = new StringBuilder();
        StringBuilder query = new StringBuilder();
        
        //para la busqueda
        String busqueda = "";
        if (request != null) {
            busqueda = request.getParameter("busqueda").toLowerCase();  
        }
        query.append(" SELECT r.nombre_rol, u.nombres, u.ap_pat, u.ap_mat, u.cedula, u.codigo");
        query.append(" FROM usuario u ");
        query.append(" INNER JOIN rol r ON r.cod_rol = u.cod_rol");
        query.append(" WHERE LOWER(ap_pat) LIKE '" + busqueda + "%'");
        
        
        
        try {
            PreparedStatement pst=connection.prepareStatement(query.toString());
            ResultSet resultado=pst.executeQuery();
            while(resultado.next()){
                String nom = resultado.getString(2);
                String pat = resultado.getString(3);
                if (!busqueda.equals("")) {
                   pat = "<span style='background-color: rgba(18, 193, 247, 0.76);'>"+resultado.getString(3) +"</span>";
                }
                String mat = resultado.getString(4);
                
                String nombreC = nom + " " + pat + " " +mat;
                
                salidaTabla.append("<tr>");
                salidaTabla.append("<td>");
                salidaTabla.append(resultado.getString(1));
                salidaTabla.append("</td>");
                salidaTabla.append("<td>");
                salidaTabla.append(nombreC);
                salidaTabla.append("</td>");
                salidaTabla.append("<td>");
                salidaTabla.append(resultado.getInt(5));
                salidaTabla.append("</td>");
                salidaTabla.append("<td>");
                salidaTabla.append(resultado.getString(6));
                salidaTabla.append("</td>");
                salidaTabla.append("</tr>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error de conexion");
        }
        return salidaTabla.toString();
    }
}
