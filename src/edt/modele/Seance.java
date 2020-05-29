/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edt.modele;
import java.util.Date;
/**
 *
 * @author julie
 */
public class Seance {
    protected int semaine;
    protected Date date;
    protected String heure_debut;
    protected String heure_fin;
    protected int etat;
    protected Cours cours;
    protected Type_cours type;
    
    public Seance(int semaine_p, Date date_p, String hd, String hf)
    {
        semaine = semaine_p;
        date = date_p;
        heure_debut = hd;
        heure_fin = hf;
    }
}
