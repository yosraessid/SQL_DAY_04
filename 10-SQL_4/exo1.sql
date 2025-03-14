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

-- 1. Utilisation de IN
-- Sélectionne les étudiants avec les ID 1, 3 et 5
SELECT * 
FROM etudiants 
WHERE id_etudiant IN (1, 3, 5);

-- 2. Utilisation de BETWEEN
-- Sélectionne les cours avec ID entre 1 et 10
SELECT * 
FROM cours 
WHERE id_cours BETWEEN 1 AND 10;

-- 3. Utilisation de LIKE
-- Sélectionne les étudiants dont le nom contient la lettre 'e'
SELECT * 
FROM etudiants 
WHERE nom LIKE '%e%';

-- 4. Utilisation de IS NULL
-- Sélectionne les étudiants qui n'ont pas d'email
SELECT * 
FROM etudiants 
WHERE email IS NULL;
