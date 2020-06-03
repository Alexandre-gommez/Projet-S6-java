/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BDD;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author USER
 */
public class Connexion {

    Connection myConn = null;
    Statement myStmt = null;
    ResultSet myRs = null;
    String user = "root";
    String pass = "";
    String url = "jdbc:mysql://localhost:3306/ecey";

    public Connexion(){}
    
    public ResultSet Requete(String req) {
        
        try {
            // 1. Get a connection to database
            myConn = DriverManager.getConnection(url, user, pass);

            // 2. Create a statement
            myStmt = myConn.createStatement();

            // 3. Execute SQL query
            myRs = myStmt.executeQuery(req);
            return myRs;
        } catch (SQLException exc) {
            exc.printStackTrace();
            return null;
        }
        
    }
    
}
