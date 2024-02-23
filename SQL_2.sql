#Select only the names of all Bands from the songs table
SELECT bands.name AS 'Band Name'
FROM bands;

#Select the oldest album.
SELECT * FROM albums
WHERE release_year IS NOT NULL
ORDER BY release_year
LIMIT 1;

#Get all the bands that have albums
SELECT DISTINCT bands.name AS 'Band Name'
FROM bands
JOIN albums ON bands.id = albums.band_id;

#Get all the bands that have no albums
SELECT bands.name AS 'Band Name'
FROM bands
LEFT JOIN albums ON bands.id = albums.band_id
GROUP BY albums.band_id
HAVING COUNT(albums.id) = 0;


#Get the longest album
SELECT
  albums.name as Name,
  albums.release_year as 'Release Year',
  SUM(songs.length) as 'Duration'
FROM albums
JOIN songs on albums.id = songs.album_id
GROUP BY songs.album_id
ORDER BY Duration DESC
LIMIT 1;

#Insert a record for your favorite Band and one of their Albums
INSERT INTO bands (name)
VALUES ('Favorite Band Name');

INSERT INTO albums (name, release_year, band_id)
VALUES ('Favorite Album Name', 2000, 8);

 SELECT id FROM bands
  ORDER BY id DESC LIMIT 1;

#Delete the Band and Album you added in previous question.
DELETE FROM albums
WHERE id = 19;

DELETE FROM bands
WHERE id = 8;


#get the Average length of all songs
SELECT AVG(length) as 'Average Song Duration'
FROM songs;

#Select the longest song of each album
SELECT
  albums.name AS 'Album',
  albums.release_year AS 'Release Year',
  MAX(songs.length) AS 'Duration'
FROM albums
JOIN songs ON albums.id = songs.album_id
GROUP BY songs.album_id;

#Get the number of songs for each band
SELECT
  bands.name AS 'Band',
  COUNT(songs.id) AS 'Number of Songs'
FROM bands
JOIN albums ON bands.id = albums.band_id
JOIN songs ON albums.id = songs.album_id
GROUP BY albums.band_id;
