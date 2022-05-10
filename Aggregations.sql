-- List the number of tracks made by each artist
SELECT artist, COUNT(*)
FROM tracks
GROUP BY artist
ORDER BY COUNT(*) DESC;

-- Average duration of tracks by genre
SELECT AVG(duration), genre
FROM tracks
GROUP BY genre
ORDER BY AVG(duration) DESC;

-- Display the minimum, maximum, and average danceability of tracks made by Queen and The Beatles
SELECT artist, MIN(danceability), MAX(danceability), AVG(danceability)
FROM tracks
WHERE artist = 'Queen' OR artist = 'The Beatles'
GROUP BY artist;

-- Number of pop music genres listed in this dataset 
SELECT COUNT(DISTINCT genre)
FROM tracks
WHERE genre LIKE '%pop%';

-- Number of tracks, highest popularity, and lowest popularity each rock music artist has achieved.
SELECT MAX(popularity), MIN(popularity), artist, genre, COUNT(*)
FROM tracks
WHERE genre LIKE '%rock%'
GROUP BY artist
ORDER BY COUNT(*) DESC;

-- a. List the number of tracks by each genre, for tracks released during 2005-2010.
SELECT genre, release_year, COUNT(*)
FROM tracks
WHERE release_year BETWEEN 2005 AND 2010
GROUP BY genre;

-- b. Restrict your result to display only genres with more than 10 tracks
SELECT genre, release_year, COUNT(*)
FROM tracks
WHERE release_year BETWEEN 2005 AND 2010
GROUP BY genre
HAVING COUNT(*) > 10;

-- List the number of tracks released by Coldplay each year
SELECT artist, release_year, COUNT(*)
FROM tracks
WHERE artist = 'Coldplay'
GROUP BY artist, release_year
ORDER BY release_year;