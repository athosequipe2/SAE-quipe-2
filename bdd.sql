DROP TABLE IF EXISTS BOS;
DROP TABLE IF EXISTS login;
DROP TABLE IF EXISTS Stage;
DROP TABLE IF EXISTS Commentaire;
DROP TABLE IF EXISTS Document;
DROP TABLE IF EXISTS Tuteur;
DROP TABLE IF EXISTS Etudiant;
DROP TABLE IF EXISTS Personnel;
DROP TABLE IF EXISTS Formation;
DROP TABLE IF EXISTS Entreprise;

CREATE TABLE Entreprise(
   Entreprise_ID INT,
   Nom VARCHAR(50),
   Description VARCHAR(500),
   Adresse VARCHAR(300),
   Telephone INT,
   Lieux VARCHAR(150),
   PRIMARY KEY(Entreprise_ID)
);

CREATE TABLE Tuteur(
   Tuteur_ID INT,
   Nom VARCHAR(50),
   Prenom VARCHAR(50),
   Contact VARCHAR(50),
   Entreprise_ID INT NOT NULL,
   PRIMARY KEY(Tuteur_ID),
   FOREIGN KEY(Entreprise_ID) REFERENCES Entreprise(Entreprise_ID)
);


CREATE TABLE Formation(
   Formation_ID INT,
   Departement VARCHAR(50),
   Composante VARCHAR(50),
   PRIMARY KEY(Formation_ID)
);

CREATE TABLE Personnel(
   Personnel_ID INT,
   Nom VARCHAR(50),
   Prenom VARCHAR(50),
   Mail VARCHAR(100),
   Visibility_flag BOOLEAN,
   Role VARCHAR(50),
   Formation_ID INT,
   PRIMARY KEY(Personnel_ID),
   FOREIGN KEY(Formation_ID) REFERENCES Formation(Formation_ID)
);

CREATE TABLE Etudiant(
   Student_ID INT,
   Nom VARCHAR(50),
   Prenom VARCHAR(50),
   Mail VARCHAR(100),
   Stage_detention BOOLEAN,
   Visibility_flag BOOLEAN,
   Groupe VARCHAR(50),
   Personnel_ID INT NOT NULL,
   Entreprise_ID INT NOT NULL,
   Formation_ID INT NOT NULL,
   PRIMARY KEY(Student_ID),
   FOREIGN KEY(Personnel_ID) REFERENCES Personnel(Personnel_ID),
   FOREIGN KEY(Entreprise_ID) REFERENCES Entreprise(Entreprise_ID),
   FOREIGN KEY(Formation_ID) REFERENCES Formation(Formation_ID)
);

CREATE TABLE Stage(
   Stage_ID INT,
   Mission VARCHAR(500),
   Année INT,
   Duree INT,
   Gratification BOOLEAN,
   Teletravail INT,
   Personnel_ID INT NOT NULL,
   Student_ID INT NOT NULL,
   Tuteur_ID INT NOT NULL,
   PRIMARY KEY(Stage_ID),
   FOREIGN KEY(Personnel_ID) REFERENCES Personnel(Personnel_ID),
   FOREIGN KEY(Student_ID) REFERENCES Etudiant(Student_ID),
   FOREIGN KEY(Tuteur_ID) REFERENCES Tuteur(Tuteur_ID)
);

CREATE TABLE Document(
   Document_ID INT,
   Type VARCHAR(50),
   Date_heure DATE,
   URL VARCHAR(150),
   Version INT,
   Student_ID INT NOT NULL,
   PRIMARY KEY(Document_ID),
   FOREIGN KEY(Student_ID) REFERENCES Etudiant(Student_ID)
);

CREATE TABLE BOS(
   BOS_ID INT,
   Status VARCHAR(50),
   BOS_Flag BOOLEAN,
   Document_ID INT NOT NULL,
   PRIMARY KEY(BOS_ID),
   UNIQUE(Document_ID),
   FOREIGN KEY(Document_ID) REFERENCES Document(Document_ID)
);

CREATE TABLE Commentaire(
   Commentaire_ID INT,
   Visibilite_flag INT,
   Vue_flag BOOLEAN,
   Commentaire VARCHAR(500),
   Personnel_ID INT NOT NULL,
   Document_ID INT NOT NULL,
   PRIMARY KEY(Commentaire_ID),
   FOREIGN KEY(Personnel_ID) REFERENCES Personnel(Personnel_ID),
   FOREIGN KEY(Document_ID) REFERENCES Document(Document_ID)
);

CREATE TABLE login(
   User_ID INT,
   Password VARCHAR(50),
   Username VARCHAR(50),
   Role BOOLEAN,
   PRIMARY KEY(User_ID)
);

INSERT INTO login (User_ID, Password, Username,Role)
 VALUES (1, 'azerty', 'admin',1);
INSERT INTO login (User_ID, Password, Username,Role)
 VALUES (2, 'qwerty', 'prof',1);
INSERT INTO login (User_ID, Password, Username,Role)
 VALUES (3, 'passw', 'secrétariat',1);
INSERT INTO login (User_ID, Password, Username,Role)
 VALUES (4, 'mdp1', 'étudiant1',0);
INSERT INTO login (User_ID, Password, Username,Role)
 VALUES (5, 'mdp2', 'étudiant2',0);
INSERT INTO login (User_ID, Password, Username,Role)
 VALUES (6, 'mdp3', 'étudiant3',0);
INSERT INTO login (User_ID, Password, Username,Role)
 VALUES (7, 'mdp4', 'étudiant4',0);
INSERT INTO login (User_ID, Password, Username,Role)
 VALUES (8, 'mdp5', 'étudiant5',0);

INSERT INTO Formation(Formation_ID, Departement, Composante) VALUES (1, 'BUT1 Informatique', 150);
INSERT INTO Formation(Formation_ID, Departement, Composante) VALUES (2, 'BUT2 Informatique', 75);
INSERT INTO Formation(Formation_ID, Departement, Composante) VALUES (3, 'Licence1 Informatique ', 200);
INSERT INTO Formation(Formation_ID, Departement, Composante) VALUES (4, 'Licence2 Informatique ', 110);
INSERT INTO Formation(Formation_ID, Departement, Composante) VALUES (5, 'BUT1 Réseaux et télécommunications', 180);
INSERT INTO Formation(Formation_ID, Departement, Composante) VALUES (6, 'BUT2 Réseaux et télécommunications', 90);
INSERT INTO Formation(Formation_ID, Departement, Composante) VALUES (7, 'BUT1 Métiers du multimédia et de l’internet', 130);
INSERT INTO Formation(Formation_ID, Departement, Composante) VALUES (8, 'BUT2 Métiers du multimédia et de l’internet', 65);

INSERT INTO Personnel(Personnel_ID, Nom, Prenom, Mail, Visibility_flag, Role, Formation_ID) VALUES (1, 'AUDIBERT', 'Laurent', 'laurent.audibert@univ-paris13.fr', 1, 'Validateur', 1);
INSERT INTO Personnel(Personnel_ID, Nom, Prenom, Mail, Visibility_flag, Role, Formation_ID) VALUES (2, 'ZARGAYOUNA','Haifa', 'haifa.zargayouna@lipn.univ-paris13.fr', 1, 'Validateur', 2);
INSERT INTO Personnel(Personnel_ID, Nom, Prenom, Mail, Visibility_flag, Role, Formation_ID) VALUES (3, 'HEBERT', 'David', 'hebert.iut@gmail.com', 1, 'Validateur', 3);
INSERT INTO Personnel(Personnel_ID, Nom, Prenom, Mail, Visibility_flag, Role, Formation_ID) VALUES (4, 'BUTELLE', 'Franck', 'franck.butelle@lipn.univ-paris13.fr', 1, 'Validateur', 4);
INSERT INTO Personnel(Personnel_ID, Nom, Prenom, Mail, Visibility_flag, Role, Formation_ID) VALUES (5, 'BACHER', 'David', 'david.bacher@lipn.univ-paris13.fr', 1, 'Enseignant', 5);
INSERT INTO Personnel(Personnel_ID, Nom, Prenom, Mail, Visibility_flag, Role, Formation_ID) VALUES (6, 'CITRON', 'Chiara', 'chiara.citron@lipn.univ-paris13.fr', 1, 'Enseignant', 6);
INSERT INTO Personnel(Personnel_ID, Nom, Prenom, Mail, Visibility_flag, Role, Formation_ID) VALUES (7, 'ABOUKINANE', 'Alain', 'alin.aboukinane@lipn.univ-paris13.fr', 1, 'Enseignant', 7);
INSERT INTO Personnel(Personnel_ID, Nom, Prenom, Mail, Visibility_flag, Role, Formation_ID) VALUES (8, 'TORTI ALCAYAGA', 'Agathe', 'aghate.torti@lipn.univ-paris13.fr', 1, 'Enseignant', 8);

INSERT INTO Entreprise(Entreprise_ID, Nom, Description, Adresse, Telephone, Lieux)
    VALUES(1,'Microsoft','Developper Web','rue des chaussettes',911,'Paris');
INSERT INTO Entreprise(Entreprise_ID, Nom, Description, Adresse, Telephone, Lieux)
    VALUES(2,'SNCF','Gestion de BDD','rue des chaussettes',444,'Paris');
INSERT INTO Entreprise(Entreprise_ID, Nom, Description, Adresse, Telephone, Lieux)
    VALUES(3,'Free','Administrateur Réseaux','rue des chaussettes',777,'Paris');
INSERT INTO Entreprise(Entreprise_ID, Nom, Description, Adresse, Telephone, Lieux)
    VALUES(4,'DICE company','Developper Web','rue des pouetpouettes',667,'Montréal');
INSERT INTO Entreprise(Entreprise_ID, Nom, Description, Adresse, Telephone, Lieux)
    VALUES(5,'Google','Developper Web','rue des pouetpouettes',999,'New york');
INSERT INTO Entreprise(Entreprise_ID, Nom, Description, Adresse, Telephone, Lieux)
    VALUES(6,'Twitter','Gestion de BDD','rue des pouetpouettes',789,'Tokyo');
INSERT INTO Entreprise(Entreprise_ID, Nom, Description, Adresse, Telephone, Lieux)
    VALUES(7,'Soundcloud','Administrateur Réseaux','rue des pouetpouettes',555,'Tokyo');
INSERT INTO Entreprise(Entreprise_ID, Nom, Description, Adresse, Telephone, Lieux)
    VALUES(8,'Twitch','Administrateur Réseaux','rue des pouetpouettes',445,'Paris');

INSERT INTO Etudiant( Student_ID, Nom, Prenom, Mail, Stage_detention, Visibility_flag, Groupe, Personnel_ID, Entreprise_ID, Formation_ID)
    VALUES(12104123,'CHAMI','Bilal','bilal.chami08@gmail.com',1,1, 'Athos2022', 1, 1, 1);
INSERT INTO Etudiant( Student_ID, Nom, Prenom, Mail, Stage_detention, Visibility_flag, Groupe, Personnel_ID, Entreprise_ID, Formation_ID)
    VALUES(12104124,'Cobain','Kurt','kurtcobain@gmail.com',1,1, 'Athos2022', 2, 2, 3);
INSERT INTO Etudiant( Student_ID, Nom, Prenom, Mail, Stage_detention, Visibility_flag, Groupe, Personnel_ID, Entreprise_ID, Formation_ID)
    VALUES(12104125,'ARH','Gustav','lilpeep@gmail.com',1,0, 'Porthos2022', 1 , 2, 3);
INSERT INTO Etudiant( Student_ID, Nom, Prenom, Mail, Stage_detention, Visibility_flag, Groupe, Personnel_ID, Entreprise_ID, Formation_ID)
    VALUES(12104126,'Wrld','Juice','juicewrld999@gmail.com',1,0, 'Porthos2022', 2, 4, 1);
INSERT INTO Etudiant( Student_ID, Nom, Prenom, Mail, Stage_detention, Visibility_flag, Groupe, Personnel_ID, Entreprise_ID, Formation_ID)
    VALUES(12104127,'Ben','Sami','BenSami@gmail.com',0,1, 'Aramis2022', 1, 2, 4);
INSERT INTO Etudiant( Student_ID, Nom, Prenom, Mail, Stage_detention, Visibility_flag, Groupe, Personnel_ID, Entreprise_ID, Formation_ID)
    VALUES(12104128,'Lacy','Steve','SteveLacy@gmail.com',0,1, 'Aramis2022', 3, 4, 1);
INSERT INTO Etudiant( Student_ID, Nom, Prenom, Mail, Stage_detention, Visibility_flag, Groupe, Personnel_ID, Entreprise_ID, Formation_ID)
    VALUES(12104129,'Postic','Kevin','PosticKevin@gmail.com',0,1, 'Aramis2022', 2, 1, 3);
INSERT INTO Etudiant( Student_ID, Nom, Prenom, Mail, Stage_detention, Visibility_flag, Groupe, Personnel_ID, Entreprise_ID, Formation_ID)
    VALUES(12104130,'Truncks','Kid','KidTruncks@gmail.com',0,1, 'Aramis2022', 4, 3 ,2);

INSERT INTO Tuteur (Tuteur_ID, Nom, Prenom ,Contact , Entreprise_ID)
 VALUES (1, 'Chami', 'Charle','Chami.Charle@gmail.com',1);
INSERT INTO Tuteur (Tuteur_ID, Nom, Prenom ,Contact , Entreprise_ID)
 VALUES (2, 'Dupont', 'Martin','Dupont.Martin@gmail.com',2);
INSERT INTO Tuteur (Tuteur_ID, Nom, Prenom ,Contact , Entreprise_ID)
 VALUES (3, 'Mouton', 'Robert','Mouton.robert@gmail.com',3);
INSERT INTO Tuteur (Tuteur_ID, Nom, Prenom ,Contact , Entreprise_ID)
 VALUES (4, 'Pierre', 'Fred','Pierre.Fred@gmail.com',4);
INSERT INTO Tuteur (Tuteur_ID, Nom, Prenom ,Contact , Entreprise_ID)
 VALUES (5, 'Jean', 'Christophe','Jean.Christophe@gmail.com',5);
INSERT INTO Tuteur (Tuteur_ID, Nom, Prenom ,Contact , Entreprise_ID)
 VALUES (6, 'Kanane', 'Melanie','Kanane.Melanie@gmail.com',6);
INSERT INTO Tuteur (Tuteur_ID, Nom, Prenom ,Contact , Entreprise_ID)
 VALUES (7, 'Messir', 'Logan','Messir.Logan@gmail.com',7);
INSERT INTO Tuteur (Tuteur_ID, Nom, Prenom ,Contact , Entreprise_ID)
 VALUES (8, 'Moufi', 'Niria','Moufi.Niria@gmail.com',8);

INSERT INTO Document (Document_ID, Type, Date_heure,URL ,Version , Student_ID)
 VALUES (1, 'CV','2001-05-01', 'https://www.modeles-de-cv.com/wp-content/uploads/2022/09/modele-cv-avec-photo.jpg',1,12104123);
INSERT INTO Document (Document_ID, Type, Date_heure,URL ,Version , Student_ID)
 VALUES (2, 'CV','2001-04-01', 'https://www.modeles-de-cv.com/wp-content/uploads/2022/09/modele-cv-avec-photo.jpg',1,12104124);
INSERT INTO Document (Document_ID, Type, Date_heure,URL ,Version , Student_ID)
 VALUES (3, 'LM','2001-06-01', 'https://cdn-images.zety.fr/pages/blog_lettre_de_motivation_simple_modele_crisp.png',1,12104127);
INSERT INTO Document (Document_ID, Type, Date_heure,URL ,Version , Student_ID)
 VALUES (4, 'CV','2001-01-01', 'https://www.modeles-de-cv.com/wp-content/uploads/2022/09/modele-cv-avec-photo.jpg',2,12104130);
INSERT INTO Document (Document_ID, Type, Date_heure,URL ,Version , Student_ID)
 VALUES (5, 'CV','2003-06-17', 'https://modele-cv.org/wp-content/uploads/doc-builder/cv/miniatures/cv-6-pink.jpg',3,12104125);
INSERT INTO Document (Document_ID, Type, Date_heure,URL ,Version , Student_ID)
 VALUES (6, 'LM','1998-05-18', 'https://jofibo.com/images/templates/modele_de_lettre_de_motivation_basic_thumbnail.png',3,12104126);
INSERT INTO Document (Document_ID, Type, Date_heure,URL ,Version , Student_ID)
 VALUES (7, 'CV','2003-03-03', 'https://cdn-images.livecareer.fr/images/lc/common/cv-templates/jt/fr/modele-cv-professionnel-1@3x.png',5,12104128);
INSERT INTO Document (Document_ID, Type, Date_heure,URL ,Version , Student_ID)
 VALUES (8, 'CV','2003-02-09', 'https://img.freepik.com/vecteurs-libre/modele-cv-minimaliste_23-2148899951.jpg',1,12104129);

INSERT INTO Commentaire (Commentaire_ID, Visibilite_flag, Vue_flag,Commentaire,Personnel_ID,Document_ID)
 VALUES (1, 0, 1,'mauvais',1,1);
INSERT INTO Commentaire (Commentaire_ID, Visibilite_flag, Vue_flag,Commentaire,Personnel_ID,Document_ID)
 VALUES (2, 0, 1,'Trés bon',1,8);
INSERT INTO Commentaire (Commentaire_ID, Visibilite_flag, Vue_flag,Commentaire,Personnel_ID,Document_ID)
 VALUES (3, 1, 1,'A changer',4,2);
INSERT INTO Commentaire (Commentaire_ID, Visibilite_flag, Vue_flag,Commentaire,Personnel_ID,Document_ID)
 VALUES (4, 1, 1,'A refaire',2,3);
INSERT INTO Commentaire (Commentaire_ID, Visibilite_flag, Vue_flag,Commentaire,Personnel_ID,Document_ID)
 VALUES (5, 1, 0,'A refaire',5,4);
INSERT INTO Commentaire (Commentaire_ID, Visibilite_flag, Vue_flag,Commentaire,Personnel_ID,Document_ID)
 VALUES (6, 1, 0,'A changer',6,5);
INSERT INTO Commentaire (Commentaire_ID, Visibilite_flag, Vue_flag,Commentaire,Personnel_ID,Document_ID)
 VALUES (7, 1, 1,'A mauvais',7,6);
INSERT INTO Commentaire (Commentaire_ID, Visibilite_flag, Vue_flag,Commentaire,Personnel_ID,Document_ID)
 VALUES (8, 1, 1,'Très bon',8,7);

INSERT INTO Stage (Stage_ID, Mission, Année ,Duree , Gratification,Teletravail,Personnel_ID,Student_ID,Tuteur_ID)
 VALUES (1, 'developpeur web', 2022 ,8,1,1,1,12104123,1);
INSERT INTO Stage (Stage_ID, Mission, Année ,Duree , Gratification,Teletravail,Personnel_ID,Student_ID,Tuteur_ID)
 VALUES (2, 'réseau', 2022 ,9,1,1,2,12104124,3);
INSERT INTO Stage (Stage_ID, Mission, Année ,Duree , Gratification,Teletravail,Personnel_ID,Student_ID,Tuteur_ID)
 VALUES (3, 'réseau', 2021 ,10,1,1,3,12104127,2);
INSERT INTO Stage (Stage_ID, Mission, Année ,Duree , Gratification,Teletravail,Personnel_ID,Student_ID,Tuteur_ID)
 VALUES (4, 'developpeur web', 2022 ,9,0,1,8,12104130,4);
INSERT INTO Stage (Stage_ID, Mission, Année ,Duree , Gratification,Teletravail,Personnel_ID,Student_ID,Tuteur_ID)
 VALUES (5, 'developpeur front-end', 2022 ,10,1,1,4,12104125,5);
INSERT INTO Stage (Stage_ID, Mission, Année ,Duree , Gratification,Teletravail,Personnel_ID,Student_ID,Tuteur_ID)
 VALUES (6, 'developpeur back-end', 2022 ,8,0,1,5,12104129,6);
INSERT INTO Stage (Stage_ID, Mission, Année ,Duree , Gratification,Teletravail,Personnel_ID,Student_ID,Tuteur_ID)
 VALUES (7, 'developpeur full-stack', 2022 ,8,0,1,6,12104126,7);
INSERT INTO Stage (Stage_ID, Mission, Année ,Duree , Gratification,Teletravail,Personnel_ID,Student_ID,Tuteur_ID)
 VALUES (8, 'developpeur full-stack', 2022 ,10,1,1,7,12104128,8);

INSERT INTO BOS( BOS_ID, Status, BOS_Flag, Document_ID)
 VALUES(1, 'En attente', 1, 1);
INSERT INTO BOS( BOS_ID, Status, BOS_Flag, Document_ID)
 VALUES(2, 'Validé', 1, 2);
INSERT INTO BOS( BOS_ID, Status, BOS_Flag, Document_ID)
 VALUES(3, 'Refusé', 0, 3);
INSERT INTO BOS( BOS_ID, Status, BOS_Flag, Document_ID)
 VALUES(4, 'Validé', 0, 4);
INSERT INTO BOS( BOS_ID, Status, BOS_Flag, Document_ID)
 VALUES(5, 'Validé', 1, 5);
INSERT INTO BOS( BOS_ID, Status, BOS_Flag, Document_ID)
 VALUES(6, 'En attente', 0, 6);
INSERT INTO BOS( BOS_ID, Status, BOS_Flag, Document_ID)
 VALUES(7, 'En attente', 1, 7);
INSERT INTO BOS( BOS_ID, Status, BOS_Flag, Document_ID)
 VALUES(8, 'Refusé', 0, 8);
