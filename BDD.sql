-- Table utilisateur 
CREATE TABLE Utilisateur(Id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, Email varchar(50) NOT NULL, Passwd varchar(50) NOT NULL, Nom varchar(50) NOT NULL, Prenom varchar(50) NOT NULL, Droit int NOT NULL);
--      Remarques : cette relation indique le droit de consultation et de mise à jour aux données de l’emploi du temps. L’attribut DROIT indique le type de droit d’accès ou/et de mise à jour aux données, comme par exemple :
--          1 pour un droit d’administrateur (service chargé de la planification) : il a le droit de consulter et de mettre à jour toutes les données de l’emploi du temps
--          2 pour un droit de référent pédagogique : il peut consulter les emplois du temps de tous les enseignants, promotions, groupes, étudiants, cours et salles MAIS ne rien mettre à jour
--          3 pour un droit d’enseignant : il ne peut consulter que son emploi du temps et le récapitulatif de ses cours sur une période - 4 pour un droit d’étudiant : il ne peut consulter que son emploi du temps et le récapitulatif de ses cours sur une période--Table CB
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
--Table Enseignant (l’enseignant est un utilisateur et peut donner plusieurs cours)
CREATE TABLE Enseignant(Id INT PRIMARY KEY NOT NULL, FOREIGN KEY(Id) REFERENCES Utilisateur(Id), Cours INT PRIMARY KEY NOT NULL, FOREIGN KEY(Cours) REFERENCES Cours(Id));
--
-- Table Site
CREATE TABLE Sites(Id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, Nom varchar(50) NOT NULL);
--
-- Table Salle
CREATE TABLE Salle(Id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, Nom varchar(50) NOT NULL, Capacite int NOT NULL, Site int NOT NULL, FOREIGN KEY(Site) REFERENCES Sites(Id));
--
-- Table Seance
CREATE TABLE Seance(Id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, Semaine int NOT NULL, Date varchar(50) NOT NULL, Debut varchar(50) NOT NULL, Fin varchar(50) NOT NULL, Etat int NOT NULL, Cours INT PRIMARY KEY NOT NULL, FOREIGN KEY(Cours) REFERENCES Cours(Id),  Type INT PRIMARY KEY NOT NULL, FOREIGN KEY(Type) REFERENCES Type_Cours(Id));
--      Remarques : 
--          l’attribut SEMAINE indique le numéro de semaine dans une année civile.
--          L’attribut ETAT indique si la séance est en cours de validation, validée ou annulée : cet attribut pourra être représenté par un numéro identifiant l’état de la séance.
--
-- Table Seance_Groupes
CREATE TABLE Seance_Groupes(Seance INT PRIMARY KEY NOT NULL, FOREIGN KEY(Seance) REFERENCES Seance(Id), Groupe INT PRIMARY KEY NOT NULL, FOREIGN KEY(Groupe) REFERENCES Groupe(Id));
--
-- Table Seance_Enseignants
CREATE TABLE Seance_Enseignants(Seance INT PRIMARY KEY NOT NULL, FOREIGN KEY(Seance) REFERENCES Seance(Id), Enseignant INT PRIMARY KEY NOT NULL, FOREIGN KEY(Enseignant) REFERENCES Enseignant(Id));
--
-- Table Seance_Salles
CREATE TABLE Seance_Salles(Seance INT PRIMARY KEY NOT NULL, FOREIGN KEY(Seance) REFERENCES Seance(Id), Salle INT PRIMARY KEY NOT NULL, FOREIGN KEY(Salle) REFERENCES Salle(Id));
--