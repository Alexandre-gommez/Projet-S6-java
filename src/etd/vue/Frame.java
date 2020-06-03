package etd.vue;

import etd.controleur.EdtListeners;
import java.awt.*;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.swing.*;

public class Frame extends JFrame {

    private Color co;
    private final EdtListeners edtListeners = new EdtListeners();
    private int action = 1;
    private final JMenu jMenu1;
    private final JMenu jMenu2 = new JMenu();
    private final JMenuBar jMenuBar1 = new JMenuBar();
    private final JComboBox liste=new JComboBox();
    private ArrayList<String> List=new ArrayList();
    private final Menu m=new Menu();
    private final JTextField text2 = new JTextField("");
    private final JButton val=new JButton("valider");

    public Frame() throws SQLException {
        //setExtendedState(JFrame.MAXIMIZED_BOTH);
        setResizable(false);
        setLayout(null);
        setSize(800, 800);

        jMenu1 = new JMenu();
        jMenu1.setText("    Emploie du temps    ");
        jMenu1.addMouseListener(edtListeners.addChoice1Listener(this));
        jMenu2.setText("    Récapitulatif des cours     ");
        jMenu2.addMouseListener(edtListeners.addChoice2Listener(this));

        jMenuBar1.add(jMenu1);
        jMenuBar1.add(jMenu2);
        
        List=m.Menuderoulant("SELECT Nom FROM personne;");
        List.forEach((temp1) -> {
            liste.addItem(temp1);
        });
        liste.setBounds(20, 10, 150, 20);
        add(liste);
        text2.setBounds(220, 10, 150, 20);
        add(text2);        
        this.add(val);
        val.addMouseListener(edtListeners.addValidateListener(this));
        
        this.setJMenuBar(jMenuBar1);
        this.setVisible(true);

        
        // pour fermer la fenetre
        addWindowListener(new WindowAdapter() {
            @Override
            public void windowClosing(WindowEvent evt) {
                System.exit(0); // tout fermer												System.exit(0); // tout fermer
            }
        });
    }

    public void paint(Graphics g) {
        super.paint(g);
        g.setColor(Color.gray);
        g.fillRect(0, 100, 2000, 1000);

        switch (action) {
            case 1:
                paintCours(g);
                break;
            case 2:
                break;
        }

    }

    public void setColor(Color color) {
        co = color;
    }

    public void paintCours(Graphics g) {
        Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();

        g.setColor(Color.white);
        g.fillRect(145, 145, (int) screenSize.getWidth() - 145 * 2, (int) screenSize.getHeight() - 145 * 2);
        g.setColor(Color.blue);
        g.fillRect(200, 200, 300, 100);
    }

    public void setAction(int nb) {
        action = nb;
    }

    public static void main(String[] args) throws SQLException {
        Frame edt = new Frame();
    }
}
