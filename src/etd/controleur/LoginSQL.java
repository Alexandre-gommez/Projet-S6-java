package etd.controleur;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class LoginSQL {
    
        Connection myConn = null;
        Statement myStmt = null;
        ResultSet myRs = null;
        String user = "root";
        String pass = "password";
        String url = "jdbc:mysql://localhost:3307/Mydb";
        
        public int ConnexionCheck(String username, String pass)
        {

        try {
            // 1. Get a connection to database
            myConn = DriverManager.getConnection(url, user, pass);

            // 2. Create a statement
            myStmt = myConn.createStatement();

            // 3. Execute SQL query
            myRs = myStmt.executeQuery("SELECT * FROM Mydb.utilisateur;");
            
            while(myRs.next())
            {
                String mail = myRs.getString("mail");
                String password = myRs.getString("password");
                
                if(mail.equals(username) && password.equals(pass))
                {
                    return 1;
                }
            }

            // 4. Process the result set

        } catch (Exception exc) {
            exc.printStackTrace();
        }
        return 0;
    }
}
