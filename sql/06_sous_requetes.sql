-- Base de données : Voyageur

-- 44. Afficher les voyageurs ayant fait un séjour dans les Alpes (EXISTS).
SELECT v.*
FROM Voyageur v
WHERE EXISTS (
    SELECT 1
    FROM Sejour s
    INNER JOIN Logement l ON s.codeLogement = l.code
    WHERE s.idVoyageur = v.idVoyageur
    AND l.lieu = 'Alpes'
);

-- 45. Afficher les voyageurs n'ayant jamais fait de séjour en Corse (NOT EXISTS).
SELECT v.*
FROM Voyageur v
WHERE NOT EXISTS (
    SELECT 1
    FROM Sejour s
    INNER JOIN Logement l ON s.codeLogement = l.code
    WHERE s.idVoyageur = v.idVoyageur
    AND l.lieu = 'Corse'
);

-- 46. Afficher les logements où ont séjourné des voyageurs de la même région que le logement (IN).
SELECT DISTINCT l.*
FROM Logement l
WHERE l.code IN (
    SELECT s.codeLogement
    FROM Sejour s
    INNER JOIN Voyageur v ON s.idVoyageur = v.idVoyageur
    WHERE v.region = l.lieu
);

-- 47. Afficher les logements qui n'ont pas d'activités (NOT IN).
SELECT * FROM Logement
WHERE code NOT IN (SELECT DISTINCT codeLogement FROM Activite);

-- 48. Afficher les voyageurs dont le nombre de séjours est supérieur à la moyenne.
SELECT v.*, COUNT(s.idSejour) AS nombre_sejours
FROM Voyageur v
INNER JOIN Sejour s ON v.idVoyageur = s.idVoyageur
GROUP BY v.idVoyageur
HAVING COUNT(s.idSejour) > (
    SELECT AVG(nb_sejours)
    FROM (
        SELECT COUNT(*) AS nb_sejours
        FROM Sejour
        GROUP BY idVoyageur
    )
);
