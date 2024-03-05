/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author MNC
 */
public class DBcontext {
    protected Connection connection;

    public DBcontext() {
        try {
            String user="sa";
            String pass="123456";
            String url="jdbc:sqlserver://ADMIN-PC\\SQLEXPRESS:1433;databaseName=laptop;encrypt=true;trustServerCertificate=true;";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection=DriverManager.getConnection(url,user,pass);
            System.out.println("Ket noi thanh cong");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Ket noi that bai");
        }
    }
    public static void main(String[] args) {
        new DBcontext();
    }
    
}
