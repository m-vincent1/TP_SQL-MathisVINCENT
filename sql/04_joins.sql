-- Base de données : Voyageur

-- 16. Afficher le nom des voyageurs et le nom du logement de chacun de leurs séjours.
SELECT v.nom AS voyageur_nom, l.nom AS logement_nom
FROM Voyageur v
INNER JOIN Sejour s ON v.idVoyageur = s.idVoyageur
INNER JOIN Logement l ON s.codeLogement = l.code;

-- 17. Afficher les voyageurs ayant séjourné en Corse.
SELECT DISTINCT v.*
FROM Voyageur v
INNER JOIN Sejour s ON v.idVoyageur = s.idVoyageur
INNER JOIN Logement l ON s.codeLogement = l.code
WHERE l.lieu = 'Corse';

-- 18. Afficher les voyageurs ayant séjourné dans les Alpes.
SELECT DISTINCT v.*
FROM Voyageur v
INNER JOIN Sejour s ON v.idVoyageur = s.idVoyageur
INNER JOIN Logement l ON s.codeLogement = l.code
WHERE l.lieu = 'Alpes';

-- 19. Afficher le type et le lieu des logements visités par Nicolas Bouvier.
SELECT DISTINCT l.type, l.lieu
FROM Logement l
INNER JOIN Sejour s ON l.code = s.codeLogement
INNER JOIN Voyageur v ON s.idVoyageur = v.idVoyageur
WHERE v.prenom = 'Nicolas' AND v.nom = 'Bouvier';

-- 20. Afficher les activités proposées dans les logements où Phileas Fogg a séjourné.
SELECT DISTINCT a.*
FROM Activite a
INNER JOIN Sejour s ON a.codeLogement = s.codeLogement
INNER JOIN Voyageur v ON s.idVoyageur = v.idVoyageur
WHERE v.prenom = 'Phileas' AND v.nom = 'Fogg';

-- 21. Afficher les séjours avec le nom du voyageur et le lieu du logement associé.
SELECT s.idSejour, v.nom AS voyageur_nom, l.lieu AS logement_lieu, s.debut, s.fin
FROM Sejour s
INNER JOIN Voyageur v ON s.idVoyageur = v.idVoyageur
INNER JOIN Logement l ON s.codeLogement = l.code;

-- 22. Afficher le nom des voyageurs ayant effectué au moins un séjour, ainsi que l'identifiant du séjour.
SELECT v.nom, s.idSejour
FROM Voyageur v
INNER JOIN Sejour s ON v.idVoyageur = s.idVoyageur;

-- 23. Afficher le nom des voyageurs et le nom des logements uniquement pour les séjours existants.
SELECT v.nom AS voyageur_nom, l.nom AS logement_nom
FROM Voyageur v
INNER JOIN Sejour s ON v.idVoyageur = s.idVoyageur
INNER JOIN Logement l ON s.codeLogement = l.code;

-- 24. Afficher tous les voyageurs, ainsi que leurs séjours s'ils existent.
SELECT v.*, s.idSejour, s.codeLogement, s.debut, s.fin
FROM Voyageur v
LEFT JOIN Sejour s ON v.idVoyageur = s.idVoyageur;

-- 25. Afficher les voyageurs n'ayant effectué aucun séjour.
SELECT v.*
FROM Voyageur v
LEFT JOIN Sejour s ON v.idVoyageur = s.idVoyageur
WHERE s.idSejour IS NULL;

-- 26. Afficher tous les logements, ainsi que les activités proposées (si elles existent).
SELECT l.*, a.codeActivite, a.description
FROM Logement l
LEFT JOIN Activite a ON l.code = a.codeLogement;

-- 27. Afficher tous les séjours, même si le logement associé n'existe pas.
SELECT s.*, l.nom AS logement_nom, l.lieu
FROM Sejour s
LEFT JOIN Logement l ON s.codeLogement = l.code;

-- 28. Afficher tous les voyageurs et tous les séjours, y compris ceux sans correspondance.
-- Note: SQLite ne supporte pas FULL OUTER JOIN, on utilise UNION de LEFT et RIGHT JOIN
SELECT v.*, s.idSejour, s.codeLogement, s.debut, s.fin
FROM Voyageur v
LEFT JOIN Sejour s ON v.idVoyageur = s.idVoyageur
UNION
SELECT v.*, s.idSejour, s.codeLogement, s.debut, s.fin
FROM Sejour s
LEFT JOIN Voyageur v ON s.idVoyageur = v.idVoyageur;

-- 29. Afficher les logements qui ne proposent aucune activité.
SELECT l.*
FROM Logement l
LEFT JOIN Activite a ON l.code = a.codeLogement
WHERE a.codeActivite IS NULL;

-- 30. Afficher les voyageurs qui n'ont jamais séjourné dans aucun logement.
SELECT v.*
FROM Voyageur v
LEFT JOIN Sejour s ON v.idVoyageur = s.idVoyageur
WHERE s.idSejour IS NULL;

-- 31. Donner la requête SQL permettant d'afficher :
-- Note: La question 31 semble incomplète dans l'énoncé.
SELECT v.nom AS voyageur, l.nom AS logement, l.lieu, s.debut, s.fin
FROM Voyageur v
INNER JOIN Sejour s ON v.idVoyageur = s.idVoyageur
INNER JOIN Logement l ON s.codeLogement = l.code;

-- 32. Afficher les voyageurs ayant fait un séjour dans un logement dont la capacité est supérieure à 30.
SELECT DISTINCT v.*
FROM Voyageur v
INNER JOIN Sejour s ON v.idVoyageur = s.idVoyageur
INNER JOIN Logement l ON s.codeLogement = l.code
WHERE l.capacite > 30;

-- 33. Afficher les logements qui n'ont aucune activité.
SELECT l.*
FROM Logement l
LEFT JOIN Activite a ON l.code = a.codeLogement
WHERE a.codeActivite IS NULL;

-- 34. Afficher les voyageurs n'ayant jamais séjourné dans un hôtel.
SELECT v.*
FROM Voyageur v
WHERE v.idVoyageur NOT IN (
    SELECT DISTINCT s.idVoyageur
    FROM Sejour s
    INNER JOIN Logement l ON s.codeLogement = l.code
    WHERE l.type = 'Hôtel'
);

-- 35. Afficher les logements où plusieurs voyageurs différents ont séjourné.
SELECT l.*
FROM Logement l
INNER JOIN Sejour s ON l.code = s.codeLogement
GROUP BY l.code
HAVING COUNT(DISTINCT s.idVoyageur) > 1;
