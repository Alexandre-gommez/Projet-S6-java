package etd.vue;

import etd.controleur.LoginListeners;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import javax.swing.*;

public class Login extends JFrame {

    private JTextField username = new JTextField();
    private JPasswordField password = new JPasswordField(15);
    private JButton validate = new JButton("Connexion");

    public Login() {
        addComponents();
        setSize(250, 300);
        setLayout(null);
        setVisible(true);
        setLocationRelativeTo(null);
        setResizable(false);

        // pour fermer la fenetre
        addWindowListener(new WindowAdapter() {
            @Override
            public void windowClosing(WindowEvent evt) {
                System.exit(0); // tout fermer												System.exit(0); // tout fermer
            }
        });
    }

    public void addComponents() {
        LoginListeners loginListeners = new LoginListeners();

        username.setBounds(50, 50, 150, 20);
        add(username);
        username.addKeyListener(loginListeners.addUsernameListener());

        password.setBounds(50, 100, 150, 20);
        add(password);
        validate.addKeyListener(loginListeners.addPasswordListener());

        validate.setBounds(50, 150, 150, 20);
        add(validate);
        validate.addMouseListener(loginListeners.addValidateListener(this));
    }

    /*public static void main(String[] args) {
        Login login = new Login();
    }*/

    public JTextField getuser() {
        return username;
    }

    public JPasswordField getpass() {
        return password;
    }
}
