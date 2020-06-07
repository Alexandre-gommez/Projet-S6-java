-- Table utilisateur 
CREATE TABLE Utilisateur(Id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, Email varchar(50) NOT NULL, Passwd varchar(50) NOT NULL, Nom varchar(50) NOT NULL, Prenom varchar(50) NOT NULL, Droit int NOT NULL);
--      Remarques : cette relation indique le droit de consultation et de mise à jour aux données de l’emploi du temps. L’attribut DROIT indique le type de droit d’accès ou/et de mise à jour aux données, comme par exemple :
--          1 pour un droit d’administrateur (service chargé de la planification) : il a le droit de consulter et de mettre à jour toutes les données de l’emploi du temps
--          2 pour un droit de référent pédagogique : il peut consulter les emplois du temps de tous les enseignants, promotions, groupes, étudiants, cours et salles MAIS ne rien mettre à jour
--          3 pour un droit d’enseignant : il ne peut consulter que son emploi du temps et le récapitulatif de ses cours sur une période 
--          4 pour un droit d’étudiant : il ne peut consulter que son emploi du temps et le récapitulatif de ses cours sur une période
--
-- Table Promotion
CREATE TABLE Promotion(Id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, Nom varchar(50) NOT NULL);
--
-- Table Groupe (TD)
CREATE TABLE Groupe(Id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, Nom varchar(50) NOT NULL, Promo int NOT NULL, FOREIGN KEY(Promo) REFERENCES Promotion(Id));
--
-- Table étudiant
CREATE TABLE Etudiant(Id INT PRIMARY KEY NOT NULL, FOREIGN KEY(Id) REFERENCES Utilisateur(Id), Numero int NOT NULL, TD int NOT NULL, FOREIGN KEY(TD) REFERENCES Groupe(Id));
--      l’étudiant est un utilisateur (sa clé primaire est aussi une clé étrangère qui référence la clé primaire de la relation UTILISATEUR) et est affecté à un groupe
-- 
-- Table Cours
CREATE TABLE Cours(Id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, Nom varchar(50) NOT NULL);
-- 
-- Type de cours (cours interactif, magistral, TD, TP, projet, soutien etc.)
CREATE TABLE Type_Cours(Id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, Nom varchar(50) NOT NULL);
--
-- Table Enseignant (l’enseignant est un utilisateur et peut donner plusieurs cours)
CREATE TABLE Enseignant(Id INT PRIMARY KEY NOT NULL, FOREIGN KEY(Id) REFERENCES Utilisateur(Id), Cours INT NOT NULL, FOREIGN KEY(Cours) REFERENCES Cours(Id));
--
-- Table Site
CREATE TABLE Sites(Id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, Nom varchar(50) NOT NULL);
--
-- Table Salle
CREATE TABLE Salle(Id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, Nom varchar(50) NOT NULL, Capacite int NOT NULL, Site int NOT NULL, FOREIGN KEY(Site) REFERENCES Sites(Id));
--
-- Table Seance
CREATE TABLE Seance(Id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, Semaine int NOT NULL, Date date NOT NULL, Debut varchar(50) NOT NULL, Fin varchar(50) NOT NULL, Etat int NOT NULL, Cours INT NOT NULL, FOREIGN KEY(Cours) REFERENCES Cours(Id),  Type INT NOT NULL, FOREIGN KEY(Type) REFERENCES Type_Cours(Id));
--      Remarques : 
--          l’attribut SEMAINE indique le numéro de semaine dans une année civile.
--          L’attribut ETAT indique si la séance est en cours de validation, validée ou annulée : cet attribut pourra être représenté par un numéro identifiant l’état de la séance.
--
-- Table Seance_Groupes
CREATE TABLE Seance_Groupes(Seance INT PRIMARY KEY NOT NULL, FOREIGN KEY(Seance) REFERENCES Seance(Id), Groupe INT  NULL, FOREIGN KEY(Groupe) REFERENCES Groupe(Id));
--
-- Table Seance_Enseignants
CREATE TABLE Seance_Enseignants(Seance INT PRIMARY KEY NOT NULL, FOREIGN KEY(Seance) REFERENCES Seance(Id), Enseignant INT NOT NULL, FOREIGN KEY(Enseignant) REFERENCES Enseignant(Id));
--
-- Table Seance_Salles
CREATE TABLE Seance_Salles(Seance INT PRIMARY KEY NOT NULL, FOREIGN KEY(Seance) REFERENCES Seance(Id), Salle INT NOT NULL, FOREIGN KEY(Salle) REFERENCES Salle(Id));
--
-- Remplisage
-- Utilisateurs
-- Admin
INSERT INTO	Utilisateur(Email, Passwd, Nom, Prenom, Droit) VALUES ("edt@ece.fr","Changement","Planification","Service","1");
-- Référent pédagogique
INSERT INTO	Utilisateur(Email, Passwd, Nom, Prenom, Droit) VALUES ("big.brother@ece.fr","Voir","Lambert","Gertrude","2");
-- Enseignants
INSERT INTO	Utilisateur(Email, Passwd, Nom, Prenom, Droit) VALUES ("edouard.moqueur@ece.fr","1P","Moqueur","Edouard","3");
INSERT INTO	Utilisateur(Email, Passwd, Nom, Prenom, Droit) VALUES ("paul.vaillant@ece.fr","2P","Vaillant","Paul","3");
INSERT INTO	Utilisateur(Email, Passwd, Nom, Prenom, Droit) VALUES ("amine.souali@ece.fr","3P","Souali","Amine","3");
INSERT INTO	Utilisateur(Email, Passwd, Nom, Prenom, Droit) VALUES ("slimane.benarfa@ece.fr","4P","Benarfa","Slimane","3");
-- Etudiants
INSERT INTO	Utilisateur(Email, Passwd, Nom, Prenom, Droit) VALUES ("victor.thevin@edu.ece.fr","1E","Thevin","Victor","4");
INSERT INTO	Utilisateur(Email, Passwd, Nom, Prenom, Droit) VALUES ("alexandre.gommez@edu.ece.fr","2E","Gommez","Alexandre","4");
INSERT INTO	Utilisateur(Email, Passwd, Nom, Prenom, Droit) VALUES ("julien.terrier@edu.ece.fr","3E","Terrier","Julien","4");
INSERT INTO	Utilisateur(Email, Passwd, Nom, Prenom, Droit) VALUES ("james.ferrec@edu.ece.fr","4E","Ferrec","James","4");
INSERT INTO	Utilisateur(Email, Passwd, Nom, Prenom, Droit) VALUES ("paul.moquin@edu.ece.fr","5E","Moquin","Paul","4");
INSERT INTO	Utilisateur(Email, Passwd, Nom, Prenom, Droit) VALUES ("pierre.dupond@edu.ece.fr","6E","Dupond","Pierre","4");
INSERT INTO	Utilisateur(Email, Passwd, Nom, Prenom, Droit) VALUES ("ahmed.benallou@edu.ece.fr","7E","Benallou","Ahmed","4");
INSERT INTO	Utilisateur(Email, Passwd, Nom, Prenom, Droit) VALUES ("camille.pisto@edu.ece.fr","8E","Pisto","Camille","4");
-- Enseignants (suite)
INSERT INTO	Utilisateur(Email, Passwd, Nom, Prenom, Droit) VALUES ("amelie.prince@ece.fr","5P","Prince","Amelie","3");
INSERT INTO	Utilisateur(Email, Passwd, Nom, Prenom, Droit) VALUES ("george.maupile@ece.fr","6P","Maupile","George","3");
INSERT INTO	Utilisateur(Email, Passwd, Nom, Prenom, Droit) VALUES ("marc.alonzo@ece.fr","7P","Alonzo","Marc","3");
INSERT INTO	Utilisateur(Email, Passwd, Nom, Prenom, Droit) VALUES ("francis.daachi@ece.fr","8P","Daachi","Francis","3");
--
-- Promotions
INSERT INTO Promotion(Nom) VALUES ("2022");
INSERT INTO Promotion(Nom) VALUES ("2023");
--
-- Groupes
-- Promo 2022
INSERT INTO Groupe(Nom, Promo) VALUES ("TD1", "1");
INSERT INTO Groupe(Nom, Promo) VALUES ("TD2", "1");
-- Promo 2023
INSERT INTO Groupe(Nom, Promo) VALUES ("TD1", "2");
INSERT INTO Groupe(Nom, Promo) VALUES ("TD2", "2");
--
-- Etudiants
-- Promo 2022 TD1 Victor et Alexandre
INSERT INTO Etudiant(Id, Numero, TD) VALUES ("7","1","1");
INSERT INTO Etudiant(Id, Numero, TD) VALUES ("8","2","1");
-- Promo 2022 TD2 Julien et James
INSERT INTO Etudiant(Id, Numero, TD) VALUES ("9","3","2");
INSERT INTO Etudiant(Id, Numero, TD) VALUES ("10","4","2");
-- Promo 2023 TD1 Paul et Pierre
INSERT INTO Etudiant(Id, Numero, TD) VALUES ("11","5","3");
INSERT INTO Etudiant(Id, Numero, TD) VALUES ("12","6","3");
-- Promo 2023 TD2 Ahmed et Camille
INSERT INTO Etudiant(Id, Numero, TD) VALUES ("13","7","4");
INSERT INTO Etudiant(Id, Numero, TD) VALUES ("14","8","4");
--
-- Cours
INSERT INTO Cours(Nom) VALUES ("Informatique");
INSERT INTO Cours(Nom) VALUES ("Electronique");
INSERT INTO Cours(Nom) VALUES ("Probabilité");
INSERT INTO Cours(Nom) VALUES ("Anglais");
INSERT INTO Cours(Nom) VALUES ("Anthropologie");
INSERT INTO Cours(Nom) VALUES ("Droit du travail");
INSERT INTO Cours(Nom) VALUES ("TS2");
INSERT INTO Cours(Nom) VALUES ("Reseaux");
--
-- Type de cours
INSERT INTO Type_Cours(Nom) VALUES ("Cours interactif");
INSERT INTO Type_Cours(Nom) VALUES ("Cours magistral");
INSERT INTO Type_Cours(Nom) VALUES ("TD");
INSERT INTO Type_Cours(Nom) VALUES ("TP");
INSERT INTO Type_Cours(Nom) VALUES ("Projet");
INSERT INTO Type_Cours(Nom) VALUES ("Soutien");
--
-- Enseignant
-- Moqueur prof d'info
INSERT INTO Enseignant(Id, Cours) VALUES ("3", "1");
-- Vaillant prof d Elec
INSERT INTO Enseignant(Id, Cours) VALUES ("4", "2");
-- Souali prof de Proba
INSERT INTO Enseignant(Id, Cours) VALUES ("5", "3");
-- Benarfa prof d'anglais
INSERT INTO Enseignant(Id, Cours) VALUES ("6", "4");
-- Prince prof Anthropologie
INSERT INTO Enseignant(Id, Cours) VALUES ("15", "5");
-- Maupile prof Droit du travail
INSERT INTO Enseignant(Id, Cours) VALUES ("16", "6");
-- Alonzo prof TS2
INSERT INTO Enseignant(Id, Cours) VALUES ("17", "7");
-- Daachi prof Réseaux
INSERT INTO Enseignant(Id, Cours) VALUES ("18", "8");
-- 
-- Sites
INSERT INTO Sites(Nom) VALUES ("E1");
INSERT INTO Sites(Nom) VALUES ("E2");
INSERT INTO Sites(Nom) VALUES ("E3");
INSERT INTO Sites(Nom) VALUES ("E4");
INSERT INTO Sites(Nom) VALUES ("E5");
--
-- Salles
-- E1
INSERT INTO Salle(Nom, Capacite, Site) VALUES ("A1", "200", "1");
INSERT INTO Salle(Nom, Capacite, Site) VALUES ("A2", "180", "1");
INSERT INTO Salle(Nom, Capacite, Site) VALUES ("A3", "112", "1");
INSERT INTO Salle(Nom, Capacite, Site) VALUES ("A4", "130", "1");
-- E2
INSERT INTO Salle(Nom, Capacite, Site) VALUES ("B1", "12", "2");
INSERT INTO Salle(Nom, Capacite, Site) VALUES ("B2", "21", "2");
INSERT INTO Salle(Nom, Capacite, Site) VALUES ("B3", "24", "2");
INSERT INTO Salle(Nom, Capacite, Site) VALUES ("B4", "18", "2");
-- E3
INSERT INTO Salle(Nom, Capacite, Site) VALUES ("C1", "33", "3");
INSERT INTO Salle(Nom, Capacite, Site) VALUES ("C2", "39", "3");
INSERT INTO Salle(Nom, Capacite, Site) VALUES ("C3", "35", "3");
INSERT INTO Salle(Nom, Capacite, Site) VALUES ("C4", "42", "3");
-- E4
INSERT INTO Salle(Nom, Capacite, Site) VALUES ("D1", "36", "4");
INSERT INTO Salle(Nom, Capacite, Site) VALUES ("D2", "36", "4");
INSERT INTO Salle(Nom, Capacite, Site) VALUES ("D3", "36", "4");
INSERT INTO Salle(Nom, Capacite, Site) VALUES ("D4", "36", "4");
-- E5
INSERT INTO Salle(Nom, Capacite, Site) VALUES ("F1", "10", "5");
INSERT INTO Salle(Nom, Capacite, Site) VALUES ("F2", "15", "5");
INSERT INTO Salle(Nom, Capacite, Site) VALUES ("F3", "12", "5");
INSERT INTO Salle(Nom, Capacite, Site) VALUES ("F4", "18", "5");
--
-- Seances 
-- Semaine 22 TD1 2022
-- 26 mai
-- Seance anthropologie cours interactif de 8h30 à 10H
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22",'2020/05/26', "08:30", "10:00", "2", "5", "1");
-- Seance DDT cours magistral de 15h30 à 17H (le TD2 aussi là)
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22",'2020/05/26', "15:30", "17:00", "2", "6", "2");
-- 27 mai
-- Seance TS2 TP de 8h30 à 10H (le TD2 aussi là)
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", '2020/05/27', "08:30", "10:00", "2", "7", "4");
-- Seance elec projet le 27/05 de 12h00 à 15h15
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", '2020/05/27', "12:00", "13:30", "2", "2", "5");
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", '2020/05/27', "13:45", "15:15", "2", "2", "5");
-- Seance anglais cours interactif le 27/05 de 15h30 à 17h00
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", '2020/05/27', "15:30", "17:00", "2", "4", "1");
-- 28 mai
-- Seance proba TD le 28/05 de 8h30 à 10h00
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", '2020/05/28', "08:30", "10:00", "2", "3", "3");
-- Seance info TP le 28/05 de 10h15 à 13h30
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", '2020/05/28', "10:15", "11:45", "2", "1", "4");
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", '2020/05/28', "12:00", "13:30", "2", "1", "4");
-- Seance DDT cours magistral de 17H15 à 18h45 (le TD2 aussi là)
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", '2020/05/28', "17:15", "18:45", "2", "6", "2");
-- 29 mai
-- Seance proba cours magistral le 28/05 de 8h30 à 11h45 (le TD2 aussi là)
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", '2020/05/29', "08:30", "10:00", "2", "3", "2");
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", '2020/05/29', "10:15", "11:45", "2", "3", "2");
-- Seance Réseau en TP de 13h45 à 17h
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", '2020/05/29', "13:45", "15:15", "2", "8", "4");
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", '2020/05/29', "15:30", "17:00", "2", "8", "4");
--
-- Semaine 22 TD1 2022
-- 26/05
-- Seance anglais cours interactif le 26/05 de 13h45 à 15h15
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", '2020/05/26', "13:45", "15:15", "2", "4", "1");
-- 27/05
-- Seance info TP de 10h15 à 13h30
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", '2020/05/27', "10:15", "11:45", "2", "1", "4");
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", '2020/05/27', "12:00", "13:30", "2", "1", "4");
-- Seance proba TD de 17h15 à 18h45
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", '2020/05/27', "17:15", "18:45", "2", "3", "3");
-- 28/05
-- Seance anthropologie cours interactif de 8h30 à 10H
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", '2020/05/28', "08:30", "10:00", "2", "5", "1");
-- Seance Réseau en TP de 13h45 à 17h
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", '2020/05/28', "13:45", "15:15", "2", "8", "4");
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", '2020/05/28', "15:30", "17:00", "2", "8", "4");
-- 29/05
-- Seance Réseau en TP de 13h45 à 17h
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", '2020/05/29', "13:45", "15:15", "2", "2", "5");
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", '2020/05/29', "15:30", "17:00", "2", "2", "5");
-- 
-- La promo 2023 en projet info toute la semaine 22
-- 26/05
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", '2020/05/26', "08:30", "10:00", "2", "1", "5");
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", '2020/05/26', "10:15", "11:45", "2", "1", "5");
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", '2020/05/26', "12:00", "13:30", "2", "1", "5");
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", '2020/05/26', "13:45", "15:15", "2", "1", "5");
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", '2020/05/26', "15:30", "17:00", "2", "1", "5");
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", '2020/05/26', "17:15", "18:45", "2", "1", "5");
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", '2020/05/26', "19:00", "20:30", "2", "1", "5");
-- 27/05
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", '2020/05/27', "13:45", "15:15", "2", "1", "5");
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", '2020/05/27', "15:30", "17:00", "2", "1", "5");
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", '2020/05/27', "17:15", "18:45", "2", "1", "5");
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", '2020/05/27', "19:00", "20:30", "2", "1", "5");
-- 28/05
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", '2020/05/28', "13:45", "15:15", "2", "1", "5");
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", '2020/05/28', "15:30", "17:00", "2", "1", "5");
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", '2020/05/28', "17:15", "18:45", "2", "1", "5");
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", '2020/05/28', "19:00", "20:30", "2", "1", "5");
-- 29/05
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", '2020/05/29', "08:30", "10:00", "2", "1", "5");
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", '2020/05/29', "10:15", "11:45", "2", "1", "5");
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", '2020/05/29', "12:00", "13:30", "2", "1", "5");
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", '2020/05/29', "13:45", "15:15", "2", "1", "5");
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", '2020/05/29', "15:30", "17:00", "2", "1", "5");
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", '2020/05/29', "17:15", "18:45", "2", "1", "5");
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", '2020/05/29', "19:00", "20:30", "2", "1", "5");
--
-- semaine 23
-- 01/06
-- Seance anthropologie cours interactif de 12h à 13H30 TD1 2022
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("23", '2020/06/01', "12:00", "13:30", "2", "5", "1");
-- Seance anthropologie cours interactif de 13h45 à 15H15 TD2 2022
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("23", '2020/06/01', "13:45", "15:15", "2", "5", "1");
-- Seance anglais cours interactif  de 15h30 à 17h00 TD1 2022
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", '2020/06/01', "15:30", "17:00", "2", "4", "1");
-- Seance anglais cours interactif  de 17h15 à 18h45 TD2 2022
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", '2020/06/01', "17:15", "18:45", "2", "4", "1");
-- 02/06
-- Seance DDT cours magistral de 13h45 à 15h15 TD1 et 2 2022
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", '2020/06/02', "13:45", "15:15", "2", "6", "2");
-- 03/06
-- Seance TS2 TP de 15H30 à 17h TD1 et 2 2022
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", '2020/06/03', "15:30", "17:00", "2", "7", "4");
-- Seance proba cours magistral de 17h15 à 18h45 TD1 et 2 2022
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", '2020/06/03', "17:15", "18:45", "2", "3", "2");
--
-- Seance Enseignants
-- Info
INSERT INTO Seance_Enseignants(Seance, Enseignant) VALUES ("8", "3");
INSERT INTO Seance_Enseignants(Seance, Enseignant) VALUES ("9", "3");
INSERT INTO Seance_Enseignants(Seance, Enseignant) VALUES ("16", "3");
INSERT INTO Seance_Enseignants(Seance, Enseignant) VALUES ("17", "3");
INSERT INTO Seance_Enseignants(Seance, Enseignant) VALUES ("24", "3");
INSERT INTO Seance_Enseignants(Seance, Enseignant) VALUES ("25", "3");
INSERT INTO Seance_Enseignants(Seance, Enseignant) VALUES ("26", "3");
INSERT INTO Seance_Enseignants(Seance, Enseignant) VALUES ("27", "3");
INSERT INTO Seance_Enseignants(Seance, Enseignant) VALUES ("28", "3");
INSERT INTO Seance_Enseignants(Seance, Enseignant) VALUES ("29", "3");
INSERT INTO Seance_Enseignants(Seance, Enseignant) VALUES ("30", "3");
INSERT INTO Seance_Enseignants(Seance, Enseignant) VALUES ("31", "3");
INSERT INTO Seance_Enseignants(Seance, Enseignant) VALUES ("32", "3");
INSERT INTO Seance_Enseignants(Seance, Enseignant) VALUES ("33", "3");
INSERT INTO Seance_Enseignants(Seance, Enseignant) VALUES ("34", "3");
INSERT INTO Seance_Enseignants(Seance, Enseignant) VALUES ("35", "3");
INSERT INTO Seance_Enseignants(Seance, Enseignant) VALUES ("36", "3");
INSERT INTO Seance_Enseignants(Seance, Enseignant) VALUES ("37", "3");
INSERT INTO Seance_Enseignants(Seance, Enseignant) VALUES ("38", "3");
INSERT INTO Seance_Enseignants(Seance, Enseignant) VALUES ("39", "3");
INSERT INTO Seance_Enseignants(Seance, Enseignant) VALUES ("40", "3");
INSERT INTO Seance_Enseignants(Seance, Enseignant) VALUES ("41", "3");
INSERT INTO Seance_Enseignants(Seance, Enseignant) VALUES ("42", "3");
INSERT INTO Seance_Enseignants(Seance, Enseignant) VALUES ("43", "3");
INSERT INTO Seance_Enseignants(Seance, Enseignant) VALUES ("44", "3");
INSERT INTO Seance_Enseignants(Seance, Enseignant) VALUES ("45", "3");
--
-- Elec
INSERT INTO Seance_Enseignants(Seance, Enseignant) VALUES ("4", "4");
INSERT INTO Seance_Enseignants(Seance, Enseignant) VALUES ("5", "4");
INSERT INTO Seance_Enseignants(Seance, Enseignant) VALUES ("22", "4");
INSERT INTO Seance_Enseignants(Seance, Enseignant) VALUES ("23", "4");
-- 
-- Proba
INSERT INTO Seance_Enseignants(Seance, Enseignant) VALUES ("7", "5");
INSERT INTO Seance_Enseignants(Seance, Enseignant) VALUES ("11", "5");
INSERT INTO Seance_Enseignants(Seance, Enseignant) VALUES ("12", "5");
INSERT INTO Seance_Enseignants(Seance, Enseignant) VALUES ("18", "5");
INSERT INTO Seance_Enseignants(Seance, Enseignant) VALUES ("52", "5");
--
-- Anglais
INSERT INTO Seance_Enseignants(Seance, Enseignant) VALUES ("6", "6");
INSERT INTO Seance_Enseignants(Seance, Enseignant) VALUES ("15", "6");
INSERT INTO Seance_Enseignants(Seance, Enseignant) VALUES ("48", "6");
INSERT INTO Seance_Enseignants(Seance, Enseignant) VALUES ("49", "6");
--
-- Anthropologie
INSERT INTO Seance_Enseignants(Seance, Enseignant) VALUES ("1", "15");
INSERT INTO Seance_Enseignants(Seance, Enseignant) VALUES ("19", "15");
INSERT INTO Seance_Enseignants(Seance, Enseignant) VALUES ("46", "15");
INSERT INTO Seance_Enseignants(Seance, Enseignant) VALUES ("47", "15");
--
-- DDT
INSERT INTO Seance_Enseignants(Seance, Enseignant) VALUES ("2", "16");
INSERT INTO Seance_Enseignants(Seance, Enseignant) VALUES ("10", "16");
INSERT INTO Seance_Enseignants(Seance, Enseignant) VALUES ("50", "16");
--
-- TS2
INSERT INTO Seance_Enseignants(Seance, Enseignant) VALUES ("3", "17");
INSERT INTO Seance_Enseignants(Seance, Enseignant) VALUES ("51", "17");
--
-- Réseau
INSERT INTO Seance_Enseignants(Seance, Enseignant) VALUES ("13", "18");
INSERT INTO Seance_Enseignants(Seance, Enseignant) VALUES ("14", "18");
INSERT INTO Seance_Enseignants(Seance, Enseignant) VALUES ("20", "18");
INSERT INTO Seance_Enseignants(Seance, Enseignant) VALUES ("21", "18");
--
-- Seance Salles
-- Info
INSERT INTO Seance_Salles(Seance, Salle) VALUES ("8", "3");
INSERT INTO Seance_Salles(Seance, Salle) VALUES ("9", "3");
INSERT INTO Seance_Salles(Seance, Salle) VALUES ("16", "3");
INSERT INTO Seance_Salles(Seance, Salle) VALUES ("17", "3");
INSERT INTO Seance_Salles(Seance, Salle) VALUES ("24", "1");
INSERT INTO Seance_Salles(Seance, Salle) VALUES ("25", "1");
INSERT INTO Seance_Salles(Seance, Salle) VALUES ("26", "1");
INSERT INTO Seance_Salles(Seance, Salle) VALUES ("27", "1");
INSERT INTO Seance_Salles(Seance, Salle) VALUES ("28", "1");
INSERT INTO Seance_Salles(Seance, Salle) VALUES ("29", "1");
INSERT INTO Seance_Salles(Seance, Salle) VALUES ("30", "1");
INSERT INTO Seance_Salles(Seance, Salle) VALUES ("31", "1");
INSERT INTO Seance_Salles(Seance, Salle) VALUES ("32", "1");
INSERT INTO Seance_Salles(Seance, Salle) VALUES ("33", "1");
INSERT INTO Seance_Salles(Seance, Salle) VALUES ("34", "1");
INSERT INTO Seance_Salles(Seance, Salle) VALUES ("35", "1");
INSERT INTO Seance_Salles(Seance, Salle) VALUES ("36", "1");
INSERT INTO Seance_Salles(Seance, Salle) VALUES ("37", "1");
INSERT INTO Seance_Salles(Seance, Salle) VALUES ("38", "1");
INSERT INTO Seance_Salles(Seance, Salle) VALUES ("39", "1");
INSERT INTO Seance_Salles(Seance, Salle) VALUES ("40", "1");
INSERT INTO Seance_Salles(Seance, Salle) VALUES ("41", "1");
INSERT INTO Seance_Salles(Seance, Salle) VALUES ("42", "1");
INSERT INTO Seance_Salles(Seance, Salle) VALUES ("43", "1");
INSERT INTO Seance_Salles(Seance, Salle) VALUES ("44", "1");
INSERT INTO Seance_Salles(Seance, Salle) VALUES ("45", "1");
--
-- Elec
INSERT INTO Seance_Salles(Seance, Salle) VALUES ("4", "9");
INSERT INTO Seance_Salles(Seance, Salle) VALUES ("5", "9");
INSERT INTO Seance_Salles(Seance, Salle) VALUES ("22", "17");
INSERT INTO Seance_Salles(Seance, Salle) VALUES ("23", "17");
-- 
-- Proba
INSERT INTO Seance_Salles(Seance, Salle) VALUES ("7", "10");
INSERT INTO Seance_Salles(Seance, Salle) VALUES ("11", "10");
INSERT INTO Seance_Salles(Seance, Salle) VALUES ("12", "10");
INSERT INTO Seance_Salles(Seance, Salle) VALUES ("18", "10");
INSERT INTO Seance_Salles(Seance, Salle) VALUES ("52", "10");
--
-- Anglais
INSERT INTO Seance_Salles(Seance, Salle) VALUES ("6", "6");
INSERT INTO Seance_Salles(Seance, Salle) VALUES ("15", "6");
INSERT INTO Seance_Salles(Seance, Salle) VALUES ("48", "6");
INSERT INTO Seance_Salles(Seance, Salle) VALUES ("49", "6");
--
-- Anthropologie
INSERT INTO Seance_Salles(Seance, Salle) VALUES ("1", "17");
INSERT INTO Seance_Salles(Seance, Salle) VALUES ("19", "17");
INSERT INTO Seance_Salles(Seance, Salle) VALUES ("46", "17");
INSERT INTO Seance_Salles(Seance, Salle) VALUES ("47", "17");
--
-- DDT
INSERT INTO Seance_Salles(Seance, Salle) VALUES ("2", "16");
INSERT INTO Seance_Salles(Seance, Salle) VALUES ("10", "16");
INSERT INTO Seance_Salles(Seance, Salle) VALUES ("50", "16");
--
-- TS2
INSERT INTO Seance_Salles(Seance, Salle) VALUES ("3", "5");
INSERT INTO Seance_Salles(Seance, Salle) VALUES ("51", "5");
--
-- Réseau
INSERT INTO Seance_Salles(Seance, Salle) VALUES ("13", "5");
INSERT INTO Seance_Salles(Seance, Salle) VALUES ("14", "5");
INSERT INTO Seance_Salles(Seance, Salle) VALUES ("20", "8");
INSERT INTO Seance_Salles(Seance, Salle) VALUES ("21", "8");
--
-- Seance_Groupes
-- Info
INSERT INTO Seance_Groupes(Seance, Groupe) VALUES ("8", "1");
INSERT INTO Seance_Groupes(Seance, Groupe) VALUES ("9", "1");
INSERT INTO Seance_Groupes(Seance, Groupe) VALUES ("16", "2");
INSERT INTO Seance_Groupes(Seance, Groupe) VALUES ("17", "2");
INSERT INTO Seance_Groupes(Seance, Groupe) VALUES ("24", "3");
INSERT INTO Seance_Groupes(Seance, Groupe) VALUES ("25", "3");
INSERT INTO Seance_Groupes(Seance, Groupe) VALUES ("26", "3");
INSERT INTO Seance_Groupes(Seance, Groupe) VALUES ("27", "3");
INSERT INTO Seance_Groupes(Seance, Groupe) VALUES ("28", "3");
INSERT INTO Seance_Groupes(Seance, Groupe) VALUES ("29", "3");
INSERT INTO Seance_Groupes(Seance, Groupe) VALUES ("30", "3");
INSERT INTO Seance_Groupes(Seance, Groupe) VALUES ("31", "3");
INSERT INTO Seance_Groupes(Seance, Groupe) VALUES ("32", "3");
INSERT INTO Seance_Groupes(Seance, Groupe) VALUES ("33", "3");
INSERT INTO Seance_Groupes(Seance, Groupe) VALUES ("34", "3");
INSERT INTO Seance_Groupes(Seance, Groupe) VALUES ("35", "3");
INSERT INTO Seance_Groupes(Seance, Groupe) VALUES ("36", "3");
INSERT INTO Seance_Groupes(Seance, Groupe) VALUES ("37", "3");
INSERT INTO Seance_Groupes(Seance, Groupe) VALUES ("38", "3");
INSERT INTO Seance_Groupes(Seance, Groupe) VALUES ("39", "3");
INSERT INTO Seance_Groupes(Seance, Groupe) VALUES ("40", "3");
INSERT INTO Seance_Groupes(Seance, Groupe) VALUES ("41", "3");
INSERT INTO Seance_Groupes(Seance, Groupe) VALUES ("42", "3");
INSERT INTO Seance_Groupes(Seance, Groupe) VALUES ("43", "3");
INSERT INTO Seance_Groupes(Seance, Groupe) VALUES ("44", "3");
INSERT INTO Seance_Groupes(Seance, Groupe) VALUES ("45", "3");
--
-- Elec
INSERT INTO Seance_Groupes(Seance, Groupe) VALUES ("4", "1");
INSERT INTO Seance_Groupes(Seance, Groupe) VALUES ("5", "1");
INSERT INTO Seance_Groupes(Seance, Groupe) VALUES ("22", "2");
INSERT INTO Seance_Groupes(Seance, Groupe) VALUES ("23", "2");
-- 
-- Proba
INSERT INTO Seance_Groupes(Seance, Groupe) VALUES ("7", "1");
INSERT INTO Seance_Groupes(Seance, Groupe) VALUES ("11", "1");
INSERT INTO Seance_Groupes(Seance, Groupe) VALUES ("12", "1");
INSERT INTO Seance_Groupes(Seance, Groupe) VALUES ("18", "2");
INSERT INTO Seance_Groupes(Seance, Groupe) VALUES ("52", "2");
--
-- Anglais
INSERT INTO Seance_Groupes(Seance, Groupe) VALUES ("6", "1");
INSERT INTO Seance_Groupes(Seance, Groupe) VALUES ("15", "2");
INSERT INTO Seance_Groupes(Seance, Groupe) VALUES ("48", "1");
INSERT INTO Seance_Groupes(Seance, Groupe) VALUES ("49", "2");
--
-- Anthropologie
INSERT INTO Seance_Groupes(Seance, Groupe) VALUES ("1", "1");
INSERT INTO Seance_Groupes(Seance, Groupe) VALUES ("19", "2");
INSERT INTO Seance_Groupes(Seance, Groupe) VALUES ("46", "1");
INSERT INTO Seance_Groupes(Seance, Groupe) VALUES ("47", "2");
--
-- DDT
INSERT INTO Seance_Groupes(Seance, Groupe) VALUES ("2", "1");
INSERT INTO Seance_Groupes(Seance, Groupe) VALUES ("10", "2");
INSERT INTO Seance_Groupes(Seance, Groupe) VALUES ("50", "1");
--
-- TS2
INSERT INTO Seance_Groupes(Seance, Groupe) VALUES ("3", "1");
INSERT INTO Seance_Groupes(Seance, Groupe) VALUES ("51", "2");
--
-- Réseau
INSERT INTO Seance_Groupes(Seance, Groupe) VALUES ("13", "1");
INSERT INTO Seance_Groupes(Seance, Groupe) VALUES ("14", "1");
INSERT INTO Seance_Groupes(Seance, Groupe) VALUES ("20", "2");
INSERT INTO Seance_Groupes(Seance, Groupe) VALUES ("21", "2");
-- end