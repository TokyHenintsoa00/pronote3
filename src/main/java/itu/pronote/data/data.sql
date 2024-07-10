create table etudiant
(
    id_etudiant serial primary key,
    nom varchar(50),
    prenom varchar(60)
);

INSERT INTO etudiant(nom, prenom) VALUES ('Alice', 'Ann');
INSERT INTO etudiant(nom, prenom) VALUES ('Bob', 'Ben');
INSERT INTO etudiant(nom, prenom) VALUES ('Charlie', 'Chris');
INSERT INTO etudiant(nom, prenom) VALUES ('David', 'Dana');
INSERT INTO etudiant(nom, prenom) VALUES ('Emily', 'Eric');
INSERT INTO etudiant(nom, prenom) VALUES ('Frank', 'Fiona');
INSERT INTO etudiant(nom, prenom) VALUES ('Grace', 'George');
INSERT INTO etudiant(nom, prenom) VALUES ('Harry', 'Helen');



create table classe
(
    id_classe serial primary key,
    nom_classe varchar(50)
);

insert into classe(nom_classe)
VALUES
('1ere annee'),
('2eme annee');

create table matiere
(
    id_matiere serial primary key,
    nom_matiere varchar(50)
);

INSERT INTO matiere (nom_matiere) VALUES ('Mathematics');
INSERT INTO matiere (nom_matiere) VALUES ('Physics');
INSERT INTO matiere (nom_matiere) VALUES ('Chemistry');
INSERT INTO matiere (nom_matiere) VALUES ('Biology');
INSERT INTO matiere (nom_matiere) VALUES ('Computer Science');

create table note_etudiant
(
    id_note_etudiant serial primary key,
    id_etudiant integer references etudiant(id_etudiant),
    id_classe integer references classe(id_classe),
    id_matiere integer references matiere(id_matiere),
    note numeric
);


insert into note_etudiant(id_etudiant,id_classe,id_matiere,note)
VALUES
(1,1,1,90),
(1,1,2,45),
(1,1,3,10.5),
(1,1,4,60),
(1,1,5,100),

(2,1,1,90),
(2,1,2,90),
(2,1,3,100),
(2,1,4,12),
(2,1,5,12),


(3,1,1,12),
(3,1,2,6),
(3,1,3,4),
(3,1,4,0),
(3,1,5,12),


(4,1,1,90),
(4,1,2,90),
(4,1,3,100),
(4,1,4,100),
(4,1,5,75),

(5, 2, 1, 29),
(5, 2, 2, 85),
(5, 2, 3, 47),
(5, 2, 4, 39),
(5, 2, 5, 14),

(6, 2, 1, 95),
(6, 2, 2, 76),
(6, 2, 3, 83),
(6, 2, 4, 59),
(6, 2, 5, 41),

(7, 2, 1, 65),
(7, 2, 2, 33),
(7, 2, 3, 99),
(7, 2, 4, 54),
(7, 2, 5, 26),

(8, 2, 1, 88),
(8, 2, 2, 77),
(8, 2, 3, 12),
(8, 2, 4, 67),
(8, 2, 5, 44);