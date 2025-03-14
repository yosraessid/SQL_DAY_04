-- Création de la base de données
CREATE DATABASE IF NOT EXISTS SQL4_DB;
USE SQL4_DB;

-- Suppression des tables si elles existent
DROP TABLE IF EXISTS etudiants;
DROP TABLE IF EXISTS cours;

-- Création des tables
CREATE TABLE etudiants (
    id_etudiant INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50),
    prenom VARCHAR(50),
    email VARCHAR(100),
    date_naissance DATE
);
CREATE TABLE cours (
    id_cours INT PRIMARY KEY AUTO_INCREMENT,
    nom_cours VARCHAR(50),
    description TEXT,
    professeur VARCHAR(50)
);

-- Insertion des données de test
INSERT INTO etudiants (nom, prenom, email, date_naissance) VALUES
('Dupont', 'Marie', 'marie@email.com', '2000-01-15'),
('Martin', 'Pierre', 'pierre@email.com', '1999-03-20'),
('Leroy', 'Sophie', NULL, '2001-07-10'),
('Bernard', 'Jean', 'jean@email.com', '2000-11-05'),
('Petit', 'Emma', 'emma@email.com', '1998-09-25'),
('Moreau', 'Lucas', NULL, '2002-04-30');
INSERT INTO cours (nom_cours, description, professeur) VALUES
('Mathématiques', 'Cours de mathématiques avancées', 'Dr. Lambert'),
('Français', 'Littérature française', 'Mme Robert'),
('Histoire', 'Histoire mondiale', 'M. Dubois'),
('Physique', 'Physique moderne', 'Dr. Martin'),
('Chimie', 'Chimie organique', NULL),
('Anglais', 'Anglais des affaires', 'Mme White'),
('Informatique', 'Programmation', 'M. Garcia'),
('Biologie', 'Sciences de la vie', 'Dr. Chen'),
('Géographie', 'Géographie mondiale', NULL),
('Philosophie', 'Introduction à la philosophie', 'M. Rousseau');



---------------------
-- 1. INNER JOIN (Étudiants inscrits à des cours)
---------------------
SELECT etudiants.nom, etudiants.prenom, cours.nom_cours
FROM etudiants
INNER JOIN inscriptions 
    ON etudiants.id_etudiant = inscriptions.id_etudiant
INNER JOIN cours 
    ON inscriptions.id_cours = cours.id_cours;

---------------------
-- 2. LEFT JOIN (Tous les cours, même sans étudiants)
---------------------
SELECT cours.nom_cours, etudiants.nom, etudiants.prenom
FROM cours
LEFT JOIN inscriptions 
    ON cours.id_cours = inscriptions.id_cours
LEFT JOIN etudiants 
    ON inscriptions.id_etudiant = etudiants.id_etudiant;

---------------------
-- 3. CROSS JOIN (Optionnel - Produit cartésien)
---------------------
SELECT *
FROM etudiants
CROSS JOIN cours;