create or replace view v_note_etudiant as
select note_etudiant.*,nom,prenom,nom_classe,nom_matiere from note_etudiant
join etudiant on etudiant.id_etudiant=note_etudiant.id_etudiant
join classe on classe.id_classe=note_etudiant.id_classe
join matiere on matiere.id_matiere = note_etudiant.id_matiere;

create or replace view v_rang_etudiant as
SELECT 
    id_etudiant,
    id_classe,
   ROUND(moyenne, 2) AS moyenne,
    DENSE_RANK() OVER (PARTITION BY id_classe ORDER BY moyenne DESC) AS rank
FROM (
    SELECT 
        id_etudiant,
        id_classe,
        AVG(note) AS moyenne
    FROM 
        note_etudiant
    GROUP BY 
        id_etudiant, id_classe
) AS subquery
ORDER BY 
    id_classe, rank asc;

create or replace view v_v_rang_etudiant as 
select v_rang_etudiant.*,nom,prenom,nom_classe from v_rang_etudiant
join etudiant on etudiant.id_etudiant=v_rang_etudiant.id_etudiant
join classe on classe.id_classe=v_rang_etudiant.id_classe
ORDER BY 
id_classe, rank asc;
