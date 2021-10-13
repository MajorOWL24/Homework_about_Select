SELECT g.name, COUNT(*) FROM genres as g INNER JOIN performer_genre as pg ON pg.genre_id = g.id GROUP BY g.id;

SELECT COUNT(*) FROM albums as a INNER JOIN tracks as t ON t.album_id = a.id WHERE a."year of issue" BETWEEN 2019 AND 2020;

SELECT a.name, AVG(t."length of time") FROM albums as a INNER JOIN tracks as t ON t.album_id = a.id GROUP BY a.id;

SELECT p.name FROM "Performers" as p LEFT JOIN album_performer as ap ON ap.performer_id = p.id LEFT JOIN albums as a ON a.id = ap.album_id AND a."year of issue" = 2020 WHERE a.id IS NULL;

SELECT c.name FROM collection as c INNER JOIN collection_song as cs ON cs.collection_id = c.id INNER JOIN tracks as t ON t.id = cs.track_id INNER JOIN album_performer as ap ON ap.album_id = t.album_id INNER JOIN "Performers" as p ON t.album_id = ap.performer_id WHERE p.name = 'Алиса
';

SELECT c.name FROM collection as c INNER JOIN collection_song as cs ON cs.collection_id = c.id INNER JOIN tracks as t ON t.id = cs.track_id INNER JOIN album_performer as ap ON ap.album_id = t.album_id INNER JOIN performer_genre as pg ON pg.performer_id = ap.performer_id GROUP BY c.id HAVING COUNT(DISTINCT pg.genre_id) > 1;

SELECT a.name FROM albums as a INNER JOIN album_performer as ap ON ap.album_id = a.id INNER JOIN performer_genre as pg ON pg.performer_id = ap.performer_id GROUP BY a.id HAVING COUNT(pg.genre_id) > 1;

SELECT t.name FROM tracks as t LEFT JOIN collection_song as cs ON cs.track_id = t.id WHERE cs.collection_id IS NULL;

SELECT DISTINCT p.name FROM tracks as t INNER JOIN album_performer as ap ON ap.album_id = t.album_id INNER JOIN "Performers" as p ON p.id = ap.performer_id WHERE t."length of time" = (SELECT MIN("length of time") FROM tracks);

SELECT a.name FROM albums as a LEFT JOIN tracks as t ON t.album_id = a.id GROUP BY a.id HAVING COUNT(t.id) = (SELECT MIN(t.c) FROM (SELECT a.id, COUNT(t.id) as c FROM albums as a LEFT JOIN tracks as t ON t.album_id = a.id GROUP BY a.id) as t);