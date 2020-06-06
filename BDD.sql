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
CREATE TABLE Seance(Id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, Semaine int NOT NULL, Date varchar(50) NOT NULL, Debut varchar(50) NOT NULL, Fin varchar(50) NOT NULL, Etat int NOT NULL, Cours INT NOT NULL, FOREIGN KEY(Cours) REFERENCES Cours(Id),  Type INT NOT NULL, FOREIGN KEY(Type) REFERENCES Type_Cours(Id));
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
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", "26/05", "0830", "1000", "2", "5", "1");
-- Seance DDT cours magistral de 15h30 à 17H (le TD2 aussi là)
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", "26/05", "1530", "1700", "2", "6", "2");
-- 27 mai
-- Seance TS2 TP de 8h30 à 10H (le TD2 aussi là)
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", "27/05", "0830", "1000", "2", "7", "4");
-- Seance elec projet le 27/05 de 12h00 à 15h15
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", "27/05", "1200", "1330", "2", "2", "5");
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", "27/05", "1345", "1515", "2", "2", "5");
-- Seance anglais cours interactif le 27/05 de 15h30 à 17h00
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", "27/05", "1530", "1700", "2", "4", "1");
-- 28 mai
-- Seance proba TD le 28/05 de 8h30 à 10h00
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", "28/05", "0830", "1000", "2", "3", "3");
-- Seance info TP le 28/05 de 10h15 à 13h30
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", "28/05", "1015", "1145", "2", "1", "4");
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", "28/05", "1200", "1330", "2", "1", "4");
-- Seance DDT cours magistral de 17H15 à 18h45 (le TD2 aussi là)
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", "26/05", "1715", "1845", "2", "6", "2");
-- 29 mai
-- Seance proba cours magistral le 28/05 de 8h30 à 11h45 (le TD2 aussi là)
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", "29/05", "0830", "1000", "2", "3", "2");
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", "29/05", "1015", "1145", "2", "3", "2");
-- Seance Réseau en TP de 13h45 à 17h
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", "29/05", "1345", "1515", "2", "8", "4");
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", "29/05", "1530", "1700", "2", "8", "4");
--
-- Semaine 22 TD1 2022
-- 26/05
-- Seance anglais cours interactif le 26/05 de 13h45 à 15h15
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", "26/05", "1345", "1515", "2", "4", "1");
-- 27/05
-- Seance info TP de 10h15 à 13h30
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", "27/05", "1015", "1145", "2", "1", "4");
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", "27/05", "1200", "1330", "2", "1", "4");
-- Seance proba TD de 8h30 à 10h00
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", "27/05", "1715", "1845", "2", "3", "3");
-- 28/05
-- Seance anthropologie cours interactif de 8h30 à 10H
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", "28/05", "0830", "1000", "2", "5", "1");
-- Seance Réseau en TP de 13h45 à 17h
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", "28/05", "1345", "1515", "2", "8", "4");
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", "28/05", "1530", "1700", "2", "8", "4");
-- 29/05
-- Seance Réseau en TP de 13h45 à 17h
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", "29/05", "1345", "1515", "2", "2", "5");
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", "29/05", "1530", "1700", "2", "2", "5");
-- 
-- La promo 2023 en projet info toute la semaine 22
-- 26/05
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", "26/05", "0830", "1000", "2", "1", "5");
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", "26/05", "1015", "1145", "2", "1", "5");
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", "26/05", "1200", "1330", "2", "1", "5");
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", "26/05", "1345", "1515", "2", "1", "5");
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", "26/05", "1530", "1700", "2", "1", "5");
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", "26/05", "1715", "1845", "2", "1", "5");
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", "26/05", "1900", "2030", "2", "1", "5");
-- 27/05
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", "27/05", "1345", "1515", "2", "1", "5");
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", "27/05", "1530", "1700", "2", "1", "5");
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", "27/05", "1715", "1845", "2", "1", "5");
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", "27/05", "1900", "2030", "2", "1", "5");
-- 28/05
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", "28/05", "1345", "1515", "2", "1", "5");
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", "28/05", "1530", "1700", "2", "1", "5");
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", "28/05", "1715", "1845", "2", "1", "5");
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", "28/05", "1900", "2030", "2", "1", "5");
-- 29/05
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", "29/05", "0830", "1000", "2", "1", "5");
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", "29/05", "1015", "1145", "2", "1", "5");
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", "29/05", "1200", "1330", "2", "1", "5");
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", "29/05", "1345", "1515", "2", "1", "5");
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", "29/05", "1530", "1700", "2", "1", "5");
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", "29/05", "1715", "1845", "2", "1", "5");
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", "29/05", "1900", "2030", "2", "1", "5");
--
-- semaine 23
-- 01/06
-- Seance anthropologie cours interactif de 12h à 13H30 TD1 2022
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("23", "01/06", "1200", "1330", "2", "5", "1");
-- Seance anthropologie cours interactif de 13h45 à 15H15 TD2 2022
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("23", "01/06", "1345", "1515", "2", "5", "1");
-- Seance anglais cours interactif  de 15h30 à 17h00 TD1 2022
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", "01/06", "1530", "1700", "2", "4", "1");
-- Seance anglais cours interactif  de 17h15 à 18h45 TD2 2022
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", "01/06", "1715", "1845", "2", "4", "1");
-- 02/06
-- Seance DDT cours magistral de 13h45 à 15h15 TD1 et 2 2022
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", "02/06", "1345", "1515", "2", "6", "2");
-- 03/06
-- Seance TS2 TP de 15H30 à 17h TD1 et 2 2022
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", "03/06", "1530", "1700", "2", "7", "4");
-- Seance proba cours magistral de 17h15 à 18h45 TD1 et 2 2022
INSERT INTO Seance(Semaine, Date, Debut, Fin, Etat, Cours, Type) VALUES ("22", "29/05", "1715", "1845", "2", "3", "2");
--
-- séances de projet d'info pour TD1 2022
INSERT INTO Seance_Groupes(Seance, Groupe) VALUES("1", "1");
INSERT INTO  Seance_Groupes(Seance, Groupe) VALUES("2", "1");
-- séances de projet d'info pour TD2 2022
INSERT INTO Seance_Groupes(Seance, Groupe) VALUES("3", "2");
INSERT INTO  Seance_Groupes(Seance, Groupe) VALUES("4", "2");
--
-- Seance Enseignants
-- Info
INSERT INTO Seance_Enseignants(Seance, Enseignant) VALUES ("1", "3");
INSERT INTO Seance_Enseignants(Seance, Enseignant) VALUES ("2", "3");
INSERT INTO Seance_Enseignants(Seance, Enseignant) VALUES ("3", "3");
INSERT INTO Seance_Enseignants(Seance, Enseignant) VALUES ("4", "3");
--
-- Seance Salles
-- Seance info projet le 27/05 de 15h30 à 17h en B1 (E2)
INSERT INTO Seance_Salles(Seance, Salle) VALUES ("1", "3");
-- Seance info projet le 27/05 de 17h15 à 18h45 en F2 (E5)
INSERT INTO Seance_Salles(Seance, Salle) VALUES ("2", "10");
-- Seance info projet le 26/05 de 8h30 à 10h en B2 (E2)
INSERT INTO Seance_Salles(Seance, Salle) VALUES ("3", "4");
-- Seance info projet le 26/05 de 10h15 à 11h45 en F1 (E5)
INSERT INTO Seance_Salles(Seance, Salle) VALUES ("4", "9");