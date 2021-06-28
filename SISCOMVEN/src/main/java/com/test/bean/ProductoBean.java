
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
 * @author Miriam Lopez ft Misael
 */
public class ProductoBean {

    //atributos
    private VariablesConexion variable;
    private Connection connection;

    //constructores
    public ProductoBean() throws SQLException {
        variable = new VariablesConexion();
        variable.inicioConexion();
        connection = variable.getConnection();
        System.out.println("Iniciando la conexion");
    }

    @PreDestroy
    public void cerrarConexion() {
        variable.cerrarConexion();
    }

    //metodos
    public String listarProducto() {
        StringBuilder salidaTabla = new StringBuilder();
        StringBuilder query = new StringBuilder();
        query.append(" SELECT  p.nom_pro, p.des_pro, p.costo_uc, p.costo_uv, p.stock , prov.razon_social, c.nom_cat ");
        query.append(" FROM producto  p ");
        query.append(" INNER JOIN proveedor prov ON p.cod_prov = prov.cod_prov ");
        query.append(" INNER JOIN categoria c ON c.cod_cat=p.cod_cat ");
        try {
            PreparedStatement pst = connection.prepareStatement(query.toString());
            ResultSet resultado = pst.executeQuery();
            while (resultado.next()) {
                salidaTabla.append("<tr>");
                salidaTabla.append("<td>");
                salidaTabla.append(resultado.getString(1));
                salidaTabla.append("</td>");
                salidaTabla.append("<td>");
                salidaTabla.append(resultado.getString(2));
                salidaTabla.append("</td>");
                salidaTabla.append("<td>");
                salidaTabla.append(resultado.getDouble(3));
                salidaTabla.append("</td>");
                salidaTabla.append("<td>");
                salidaTabla.append(resultado.getDouble(4));
                salidaTabla.append("</td>");
                salidaTabla.append("<td>");
                salidaTabla.append(resultado.getInt(5));
                salidaTabla.append("</td>");
                salidaTabla.append("<td>");
                salidaTabla.append(resultado.getString(6));
                salidaTabla.append("</td>");
                salidaTabla.append("<td>");
                salidaTabla.append(resultado.getString(7));
                salidaTabla.append("</td>");
                salidaTabla.append("</tr>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error de conexion");
        }
        return salidaTabla.toString();
    }
    public String productoBajoStock(HttpServletRequest request) {
        StringBuilder salidaTabla = new StringBuilder();
        StringBuilder query = new StringBuilder();
        int cantidad = 10000; 
        if (request != null) {
            cantidad = Integer.valueOf(request.getParameter("cantidad"));
        }
        query.append(" SELECT  p.nom_pro, p.des_pro, p.costo_uc, p.costo_uv, p.stock , prov.razon_social, c.nom_cat ");
        query.append(" FROM producto  p ");
        query.append(" INNER JOIN proveedor prov ON p.cod_prov = prov.cod_prov ");
        query.append(" INNER JOIN categoria c ON c.cod_cat=p.cod_cat ");
        query.append(" WHERE p.stock <= '" + cantidad + "' ");
        try {
            PreparedStatement pst = connection.prepareStatement(query.toString());
            ResultSet resultado = pst.executeQuery();
            while (resultado.next()) {
                salidaTabla.append("<tr>");
                salidaTabla.append("<td>");
                salidaTabla.append(resultado.getString(1));
                salidaTabla.append("</td>");
                salidaTabla.append("<td>");
                salidaTabla.append(resultado.getString(2));
                salidaTabla.append("</td>");
                salidaTabla.append("<td>");
                salidaTabla.append(resultado.getDouble(3));
                salidaTabla.append("</td>");
                salidaTabla.append("<td>");
                salidaTabla.append(resultado.getDouble(4));
                salidaTabla.append("</td>");
                salidaTabla.append("<td>");
                salidaTabla.append(resultado.getInt(5));
                salidaTabla.append("</td>");
                salidaTabla.append("<td>");
                salidaTabla.append(resultado.getString(6));
                salidaTabla.append("</td>");
                salidaTabla.append("<td>");
                salidaTabla.append(resultado.getString(7));
                salidaTabla.append("</td>");
                salidaTabla.append("</tr>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error de conexion");
        }
        String table = salidaTabla.toString();
        
        if (table.equals("")) {
            table = "<tr><td colspan='7' align='center'>Los Productos Tienen Mayor Stock!</td></tr>";
        }
        
        return table;
    }
    //getter y setter

}
