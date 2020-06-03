package etd.controleur;

import java.sql.ResultSet;
import java.sql.SQLException;
import BDD.Connexion;

public class LoginSQL {

    public int ConnexionCheck(String username, String passw) throws SQLException {
        
        Connexion c;
        c = new Connexion();
        ResultSet myRs=c.Requete("Select * FROM personne;");
        while (myRs.next()) {
            String mail = myRs.getString("mail");
            String password = myRs.getString("mdp");
            System.out.println(mail);
            System.out.println(password);
            System.out.println(username);
            System.out.println(passw);
            if (mail.equals(username) && password.equals(passw)) {
                return 1;
            }
        }
        return 0;
    }
}
