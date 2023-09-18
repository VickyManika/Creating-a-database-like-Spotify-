##1.Εμφάνισε τους καλλιτέχνες σε αύξουσα σειρά ανάλογα ποιος έχει τους περισσότερους followers

select distinct a.A_name,f.Followers
from artist as a, follow as f
where f.fA_id=a.A_id
order by f.Followers

##2. Το αρχικό query ήταν: ” Εμφάνισε τους καλλιτέχνες των 2 τραγουδιών με τα περισσότερα streams σε φθίνουσα σειρά”. Όμως έγινε αλλαγή για να μπορεί να επιλυθεί στην mySQL και πήρε την μορφή : Εμφάνισε όλους τους καλλιτέχνες με πάνω από 1.000.000 streams. 

SELECT Distinct(a1.A_name)
FROM artist a1
JOIN songs ON songs.S_A_id = a1.A_id
WHERE songs.S_id IN (SELECT LS_id FROM listento WHERE Streams > 1000000)

##3. Εμφάνισε τα ονόματα των άλμπουμ που είναι διαθέσιμα στο Μάρκετ “ΑD”.

select Al_name from album where AL_avail_markets LIKE '%AD%';

##4. Εμφάνισε αλφαβητικά τα ονόματα των άλμπουμ και τα ονόματα των καλλιτεχνών με release date των αλμπουμ  01.01.1958 έως 12.12.1959.

SELECT Al_name,AL_rel_date,artist.A_name
FROM album,artist
WHERE album.AL_A_id=artist.A_id and AL_rel_date BETWEEN '1958-01-01' AND '1959-12-12'
order by AL_name

##5. Εμφάνισε για τους χρήστες με ημερομηνία γέννησης το ‘95 το τραγούδι  που ακουσαν με τα περισσότερα streams και τον καλλιτέχνη του.

SELECT user.U_name, MAX(listento.Streams), artist.A_name, songs.S_name
FROM user
JOIN listento ON user.U_id = listento.LU_id
JOIN songs ON listento.LS_id = songs.S_id
JOIN artist ON artist.A_id = songs.S_A_id
WHERE user.U_Bdate like '%1995%'
GROUP BY user.U_name
HAVING MAX(listento.Streams)

##6. Το αρχικό query ήταν:”Εμφάνισε τον χρήστη που στην αγαπημένη του λίστα περιέχονται τα περισσότερα τραγούδια με genre “Rock” “. Όμως έγινε αλλαγή για να μπορεί να επιλυθεί στην mySQL και πήρε την μορφή : Εμφάνισε τον καλλιτεχνη με είδη τραγουδιών soul ή jazz 

SELECT distinct a.A_name
FROM artist as a, songs as s
WHERE (s.S_genre like '%jazz%' or s.S_genre like '%soul%') and s.S_A_id=a.A_id;

##7. Εμφάνισε αλφαβητικά μια λίστα με καλλιτέχνες που έχουν τραγούδια με Genre “Pop”.

select DISTINCT(A_name)
from artist, songs
where songs.S_genre like '%pop%'
order by A_name 

##8.Εμφάνισε το μέσο όρο συνολικής διάρκειας ακρόασης των Fav_Playlist.

SELECT AVG(SUM_durat_min)
from consists

##9.Εμφάνισε τους καλλιτέχνες που έχουν αριθμό Followers από 80,000-100,000 απο το μεγαλύτερο στον μικρότερο.

SELECT artist.A_name,Followers
FROM artist,follow
WHERE fA_id=artist.A_id and Followers BETWEEN 80000 AND 1000000
ORDER BY Followers DESC

##10. Εμφάνισε sum χρηστών, που δεν έχουν στην Fav_Playlist “pop” τραγούδια.

SELECT COUNT(U_id) FROM User
WHERE NOT EXISTS (SELECT * FROM Fav_playlist
JOIN consists ON Fav_playlist.FavP_id = consists.cFavP_id
JOIN songs ON consists.cS_id = songs.S_id
WHERE User.U_id = Fav_playlist.F_U_id AND songs.S_genre = 'pop');
