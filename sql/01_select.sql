-- ============================================================
-- TP SQL : Sélections simples (SELECT / FROM / WHERE)
-- Base de données : Voyageur
-- ============================================================

-- 1. Afficher tous les voyageurs.
SELECT * FROM Voyageur;

-- 2. Afficher le nom et la région de tous les voyageurs vivant en Corse.
SELECT nom, region FROM Voyageur WHERE region = 'Corse';

-- 3. Afficher les logements situés dans les Alpes.
SELECT * FROM Logement WHERE lieu = 'Alpes';

-- 4. Afficher le nom et le type des logements ayant une capacité supérieure à 30.
SELECT nom, type FROM Logement WHERE capacite > 30;

-- 5. Afficher les logements dont le type est Hôtel ou Gîte.
SELECT * FROM Logement WHERE type = 'Hôtel' OR type = 'Gîte';

-- 6. Afficher les voyageurs dont la région n'est pas Bretagne.
SELECT * FROM Voyageur WHERE region != 'Bretagne' OR region IS NULL;

-- 7. Afficher les séjours commençant avant le jour 20.
SELECT * FROM Sejour WHERE debut < 20;

-- 8. Afficher les activités dont la description contient le mot dériveur.
SELECT * FROM Activite WHERE description LIKE '%dériveur%';
