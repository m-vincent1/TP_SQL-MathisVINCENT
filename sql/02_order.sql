-- ============================================================
-- TP SQL : Tri et limitation (ORDER BY / LIMIT)
-- Base de données : Voyageur
-- ============================================================

-- 9. Afficher les voyageurs triés par nom alphabétique.
SELECT * FROM Voyageur ORDER BY nom ASC;

-- 10. Afficher les logements triés par capacité décroissante.
SELECT * FROM Logement ORDER BY capacite DESC;

-- 11. Afficher les 2 logements ayant la plus grande capacité.
SELECT * FROM Logement ORDER BY capacite DESC LIMIT 2;
