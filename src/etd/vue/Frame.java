package etd.vue;
import edt.modele.Seance;
import etd.controleur.EdtListeners;
import java.awt.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.*;

public class Frame extends JFrame{
    Color co;
    EdtListeners edtListeners = new EdtListeners();
    int action = 1;
    public Frame()
    {
        setExtendedState(JFrame.MAXIMIZED_BOTH);
        setResizable(false);
        setLayout(null);
        
        JMenu jMenu1 = new JMenu();
        jMenu1.setText("    Emploie du temps    ");
        jMenu1.addMouseListener(edtListeners.addChoice1Listener(this));
        JMenu jMenu2 = new JMenu();
        jMenu2.setText("    Récapitulatif des cours     ");
        jMenu2.addMouseListener(edtListeners.addChoice2Listener(this));

        JMenuBar jMenuBar1 = new JMenuBar();
        jMenuBar1.add(jMenu1);
        jMenuBar1.add(jMenu2);
        
        JTextField text = new JTextField();
        text.setBounds(20,10,150,20);  
        add(text);
        JTextField text2 = new JTextField();
        text2.setBounds(220,10,150,20);  
        add(text2);
        this.setJMenuBar(jMenuBar1);
        this.setVisible(true);
    }
    
    public void paint(Graphics g) {
        super.paint(g);
        g.setColor(Color.gray);
        g.fillRect(0,100,2000,1000);
        
        switch(action)
        {
            case 1:
                paintCours(g);
                break;
            case 2:
                break;
        }

            
        
    }
    public void setColor(Color color)
    {
        co=color;
    }
    public static void main(String[] args) {
        Frame edt = new Frame();
    }
    
    public void paintCours(Graphics g)
    {
        Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
        
        g.setColor(Color.white);
        g.fillRect(145, 145, (int)screenSize.getWidth()-145*2, (int)screenSize.getHeight()-145*2);
        g.setColor(Color.blue);
        g.fillRect(200, 200, 300, 100);
    }
    
    public void setAction(int nb)
    {
        action = nb;
    }
}
