package etd.controleur;

import etd.vue.Frame;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import javax.swing.*;
import etd.vue.Login;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class LoginListeners {
    
    public KeyListener addUsernameListener() {
        KeyListener myListener = new KeyListener() {
            @Override
            public void keyTyped(KeyEvent e) {
                
            }

            @Override
            public void keyPressed(KeyEvent e) {
                   
            }

            @Override
            public void keyReleased(KeyEvent e) {

            }
        };
        return myListener;
    }

    public KeyListener addPasswordListener() {
        KeyListener myListener = new KeyListener() {
            @Override
            public void keyTyped(KeyEvent e) {
                throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
            }

            @Override
            public void keyPressed(KeyEvent e) {
                throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
            }

            @Override
            public void keyReleased(KeyEvent e) {
                throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
            }
        };
        return myListener;
    }

    public MouseListener addValidateListener(Login l) {
        MouseListener myListener = new MouseListener() {
            @Override
            public void mouseClicked(MouseEvent e) {
                LoginSQL loginSql = new LoginSQL();
                int result = 0;
                try {
                    result = loginSql.ConnexionCheck((l.getuser()).getText(),(l.getpass()).getText());
                } catch (SQLException ex) {
                    Logger.getLogger(LoginListeners.class.getName()).log(Level.SEVERE, null, ex);
                }
                if (result == 1) {
                    try {
                        Frame edt = new Frame();
                    } catch (SQLException ex) {
                        Logger.getLogger(LoginListeners.class.getName()).log(Level.SEVERE, null, ex);
                    }
                } else {
                    JFrame fram = new JFrame();
                    JDialog dialog = new JDialog(fram, "Erreur");
                    JLabel label = new JLabel("Utilisateur non trouvé, vérifiez les informations saisies");
                    dialog.add(label);
                    dialog.setSize(350, 100);
                    dialog.setVisible(true);
                }
            }

            @Override
            public void mousePressed(MouseEvent e) {
            }

            @Override
            public void mouseReleased(MouseEvent e) {
            }

            @Override
            public void mouseEntered(MouseEvent e) {
            }

            @Override
            public void mouseExited(MouseEvent e) {
            }
        };
        return myListener;
    }
}
