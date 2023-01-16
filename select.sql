--1
SELECT COUNT(name) FROM artists

--2				  
SELECT COUNT(t.name) FROM tracks t
LEFT JOIN albums a ON a.id = t.album_id
WHERE a.year >= 2019 AND a.year <= 2020		

--3
SELECT a.name, AVG(duration) FROM tracks t
LEFT JOIN albums a ON a.id = t.album_id 
GROUP BY a.name

--4(исправлено)
SELECT name FROM artists
WHERE name NOT IN (SELECT a.name FROM artist_album aa 
				   LEFT JOIN artists a ON a.id = aa.artist_id
  				   LEFT JOIN albums a2 ON a2.id = aa.album_id 
				   WHERE a2.year IN (2020))

--5
SELECT c.name, a2.name FROM tracks_collection tc 
LEFT JOIN collections c ON c.id = tc.collection_id 
LEFT JOIN tracks t ON t.id = tc.track_id 
LEFT JOIN albums a ON a.id = t.album_id 
LEFT JOIN artist_album aa ON aa.album_id = a.id 
LEFT JOIN artists a2 ON a2.id = aa.artist_id 
WHERE a2.name = ('XXXTENTACION')

--6
SELECT a.name FROM artist_album aa 
LEFT JOIN albums a ON a.id = aa.album_id  
LEFT JOIN artists a2 ON a2.id = aa.artist_id 
LEFT JOIN genre_artist ga ON ga.artist_id = a2.id
GROUP BY a.name 
HAVING COUNT(ga.genre_id) > 1 

--7
SELECT t.name, tc.collection_id FROM tracks_collection tc
LEFT JOIN tracks t ON t.id = tc.track_id
WHERE tc.collection_id = NULL

--8
SELECT a.name FROM artist_album aa
LEFT JOIN artists a ON aa.artist_id = a.id
LEFT JOIN albums a2 ON aa.album_id = a2.id
LEFT JOIN tracks t ON t.album_id = a2.id
WHERE t.duration = (SELECT MIN(duration) FROM tracks)

--9(исправлено)
SELECT a.name, COUNT(t.name)  FROM tracks t
LEFT JOIN albums a ON t.album_id = a.id 
GROUP BY a.name 
HAVING COUNT(t.name) = (SELECT MIN(count) FROM (SELECT a2.name, COUNT(t2.name)  FROM tracks t2
											    LEFT JOIN albums a2 ON t2.album_id = a2.id 
											    GROUP BY a2.name ) aaaa)
