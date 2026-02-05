-- Base de données : Voyageur

-- 36. Compter le nombre total de voyageurs.
SELECT COUNT(*) AS nombre_voyageurs FROM Voyageur;

-- 37. Compter le nombre de logements par type.
SELECT type, COUNT(*) AS nombre_logements
FROM Logement
GROUP BY type;

-- 38. Compter le nombre de séjours effectués par chaque voyageur.
SELECT v.idVoyageur, v.nom, v.prenom, COUNT(s.idSejour) AS nombre_sejours
FROM Voyageur v
LEFT JOIN Sejour s ON v.idVoyageur = s.idVoyageur
GROUP BY v.idVoyageur;

-- 39. Afficher le nombre d'activités proposées par chaque logement.
SELECT l.code, l.nom, COUNT(a.codeActivite) AS nombre_activites
FROM Logement l
LEFT JOIN Activite a ON l.code = a.codeLogement
GROUP BY l.code;

-- 40. Afficher la capacité moyenne des logements.
SELECT AVG(capacite) AS capacite_moyenne FROM Logement;

-- 41. Trouver le logement ayant la capacité maximale.
SELECT * FROM Logement WHERE capacite = (SELECT MAX(capacite) FROM Logement);

-- 42. Afficher les voyageurs ayant fait au moins 2 séjours.
SELECT v.*, COUNT(s.idSejour) AS nombre_sejours
FROM Voyageur v
INNER JOIN Sejour s ON v.idVoyageur = s.idVoyageur
GROUP BY v.idVoyageur
HAVING COUNT(s.idSejour) >= 2;

-- 43. Compter combien de séjours ont eu lieu en Corse.
SELECT COUNT(*) AS sejours_en_corse
FROM Sejour s
INNER JOIN Logement l ON s.codeLogement = l.code
WHERE l.lieu = 'Corse';
