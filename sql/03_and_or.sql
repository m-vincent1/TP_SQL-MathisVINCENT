-- Base de données : Voyageur

-- 12. Afficher les voyageurs habitant Corse ou Bretagne.
SELECT * FROM Voyageur WHERE region = 'Corse' OR region = 'Bretagne';

-- 13. Afficher les logements situés en Corse et de type Gîte.
SELECT * FROM Logement WHERE lieu = 'Corse' AND type = 'Gîte';

-- 14. Afficher les logements non situés en Alpes.
SELECT * FROM Logement WHERE NOT lieu = 'Alpes';

-- 15. Afficher les séjours ayant un début > 15 et une fin < 23.
SELECT * FROM Sejour WHERE debut > 15 AND fin < 23;
