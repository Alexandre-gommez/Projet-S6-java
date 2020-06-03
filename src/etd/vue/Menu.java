/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package etd.vue;

import BDD.Connexion;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.swing.*;

/**
 *
 * @author USER
 */
public class Menu {

    Menu() {
    }

    public ArrayList<String> Menuderoulant(String s) throws SQLException {
        ArrayList<String> liste = new ArrayList();
        String temp;
        temp = "";
        Connexion c;
        c = new Connexion();
        ResultSet myRs = c.Requete(s);
        if (myRs != null) {
            while (myRs.next()) {
                System.out.println(myRs.getString(1));
                temp = myRs.getString(1);
                liste.add(temp);
            }
        } else {
            liste.add(temp);
        }
        return liste;
    }
}
