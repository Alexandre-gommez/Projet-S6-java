package etd.vue;
import etd.controleur.LoginListeners;
import java.awt.*;
import java.awt.Event.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import javax.swing.*;

public class Login extends JFrame{
    
    JTextField username = new JTextField();
    JPasswordField password = new JPasswordField(15);
    JButton validate = new JButton("Connexion");
    
    public Login()
    {
        addComponents();
        setSize(250,300);
        setLayout(null);  
        setVisible(true);
        setLocationRelativeTo(null);
        setResizable(false);
    }
    
    public void addComponents()
    {
        LoginListeners loginListeners = new LoginListeners();
        
        username.setBounds(50,50,150,20);
        add(username);
        username.addKeyListener(loginListeners.addUsernameListener());
        
        password.setBounds(50,100,150,20);
        add(password);
        validate.addKeyListener(loginListeners.addPasswordListener());
        
        validate.setBounds(50,150,150,20);
        add(validate);
        validate.addMouseListener(loginListeners.addValidateListener(username.getText(),password.getText()));
        
    }
    public static void main(String[] args) {
        Login login = new Login();
    }
}
