-- Base de données : Voyageur

-- 52. Afficher les voyageurs et le nombre total de jours passés en séjour (fin - debut).
SELECT v.idVoyageur, v.nom, v.prenom, SUM(s.fin - s.debut) AS jours_total
FROM Voyageur v
LEFT JOIN Sejour s ON v.idVoyageur = s.idVoyageur
GROUP BY v.idVoyageur;

-- 53. Afficher la liste des voyageurs avec les activités qu'ils ont pu pratiquer
-- (en reliant Voyageur → Séjour → Logement → Activité).
SELECT DISTINCT v.nom AS voyageur_nom, v.prenom, a.codeActivite, a.description
FROM Voyageur v
INNER JOIN Sejour s ON v.idVoyageur = s.idVoyageur
INNER JOIN Logement l ON s.codeLogement = l.code
INNER JOIN Activite a ON l.code = a.codeLogement
ORDER BY v.nom, a.codeActivite;

-- 54. Trouver les logements ayant toutes les activités disponibles dans la base.
-- (HAVING COUNT(DISTINCT ...) = (SELECT COUNT(...))).
SELECT l.*
FROM Logement l
INNER JOIN Activite a ON l.code = a.codeLogement
GROUP BY l.code
HAVING COUNT(DISTINCT a.codeActivite) = (SELECT COUNT(DISTINCT codeActivite) FROM Activite);

-- 55. Afficher les voyageurs qui ont séjourné dans toutes les régions existantes.
-- (Utilise une division relationnelle)
SELECT v.*
FROM Voyageur v
WHERE NOT EXISTS (
    SELECT DISTINCT l.lieu
    FROM Logement l
    WHERE NOT EXISTS (
        SELECT 1
        FROM Sejour s
        WHERE s.idVoyageur = v.idVoyageur
        AND s.codeLogement IN (SELECT code FROM Logement WHERE lieu = l.lieu)
    )
);
