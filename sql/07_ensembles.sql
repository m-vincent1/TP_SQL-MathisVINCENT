-- Base de données : Voyageur

-- 49. Afficher la liste des régions des voyageurs ou des lieux de logement (UNION).
SELECT region AS regions_ou_lieux FROM Voyageur WHERE region IS NOT NULL
UNION
SELECT lieu FROM Logement WHERE lieu IS NOT NULL;

-- 50. Afficher les régions communes aux voyageurs et aux lieux de logement (INTERSECT).
SELECT region FROM Voyageur WHERE region IS NOT NULL
INTERSECT
SELECT lieu FROM Logement WHERE lieu IS NOT NULL;

-- 51. Afficher les régions présentes chez les voyageurs mais absentes dans les lieux de logement (EXCEPT).
SELECT region FROM Voyageur WHERE region IS NOT NULL
EXCEPT
SELECT lieu FROM Logement WHERE lieu IS NOT NULL;
