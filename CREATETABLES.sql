CREATE DATABASE IF NOT EXISTS  SPOTIFY33;
USE SPOTIFY33;
#1.Artist:
CREATE TABLE IF NOT EXISTS  artist(A_id INT(4) NOT NULL,A_name CHAR(40) NOT NULL,PRIMARY KEY(A_id));
LOAD DATA INFILE 'C:\\Users\\Melina\\Desktop\\baseis  dedomenwn\\artist.txt' INTO TABLE artist
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

#2.User:
CREATE TABLE user(U_id INT(30) NOT NULL,U_name CHAR(40) NOT NULL,U_email CHAR(40) NOT NULL,U_Bdate DATE,Gender ENUM('Female', 'Male'),PRIMARY KEY(U_id));
INSERT INTO User (U_id, U_Name, U_email, U_Bdate, Gender) VALUES (520, 'John Smith', 'john.smith@gmail.com', '1995-01-20', 'Male');
INSERT INTO User (U_id, U_Name, U_email, U_Bdate, Gender) VALUES (521, 'Jane Doe', 'jane.doe@gmail.com', '1987-03-10','Female');
INSERT INTO User (U_id, U_Name, U_email, U_Bdate, Gender) VALUES (522, 'Bob Johnson', 'bob.johnson@gmail.com','1990-06-05', 'Male');
INSERT INTO User (U_id, U_Name, U_email, U_Bdate, Gender) VALUES (523, 'Alice Williams', 'Williamw@gmail.com','1989-08-15', 'Female');
INSERT INTO User (U_id, U_Name, U_email, U_Bdate, Gender) VALUES (524, 'Mike Brown', 'Mike@gmail.com','1986-11-30', 'Male');
INSERT INTO User (U_id, U_Name, U_email, U_Bdate, Gender) VALUES (525, 'Emily Davis', 'Davis@gmail.com','1995-04-05', 'Female');
INSERT INTO User (U_id, U_Name, U_email, U_Bdate, Gender) VALUES (526, 'William Thompson', 'Thompson@gmail.com','1988-07-01', 'Male');
INSERT INTO User (U_id, U_Name, U_email, U_Bdate, Gender) VALUES (527, 'Ashley Johnson', 'Ashley@gmail.com','1987-06-13', 'Male');
INSERT INTO User (U_id, U_Name, U_email, U_Bdate, Gender) VALUES (528, 'James Rodriguez', 'James@gmail.com','1995-08-19', 'Male');
INSERT INTO User (U_id, U_Name, U_email, U_Bdate, Gender) VALUES (529, 'David Anderson', 'Anderson@gmail.com','1991-12-12', 'Male');
INSERT INTO User (U_id, U_Name, U_email, U_Bdate, Gender) VALUES (530, 'Jessica Thompson', 'Jessica@gmail.com','1992-09-04', 'Female');
INSERT INTO User (U_id, U_Name, U_email, U_Bdate, Gender) VALUES (531, 'Richard Smith', 'Smith@gmail.com','1985-01-01', 'Male');
INSERT INTO User (U_id, U_Name, U_email, U_Bdate, Gender) VALUES (532, 'Emma Williams', 'Emma@gmail.com','1988-10-09', 'Female');
INSERT INTO User (U_id, U_Name, U_email, U_Bdate, Gender) VALUES (533, 'Charles Johnson', 'Charles@gmail.com','1993-09-07', 'Male');
INSERT INTO User (U_id, U_Name, U_email, U_Bdate, Gender) VALUES (534, 'Megan Davis', 'Megan_Davia@gmail.com','1990-06-05', 'Female');
INSERT INTO User (U_id, U_Name, U_email, U_Bdate, Gender) VALUES (535, 'Edward Rodriguez', 'Edward@gmail.com','1990-06-05', 'Male');
INSERT INTO User (U_id, U_Name, U_email, U_Bdate, Gender) VALUES (536, 'Christopher Anderson', 'Christ.An@gmail.com','1990-06-05', 'Male');
INSERT INTO User (U_id, U_Name, U_email, U_Bdate, Gender) VALUES (537, 'Laura Thompson', 'Laura_Thom@gmail.com','1990-06-05', 'Female');
INSERT INTO User (U_id, U_Name, U_email, U_Bdate, Gender) VALUES (538, 'Samantha Williams', 'Sam.Williams@gmail.com','1990-06-05', 'Female');

#3.Album:
CREATE TABLE IF NOT EXISTS album(Al_id varchar(40) ,Al_name varchar(120) NOT NULL, AL_total_tracks int(4), AL_rel_date date,AL_avail_markets varchar(40),AL_A_id int(20),primary key(Al_id), foreign key(AL_A_id) references artist(A_id) ON DELETE RESTRICT
ON UPDATE CASCADE);
LOAD DATA INFILE 'C:\\Users\\Melina\\Desktop\\baseis  dedomenwn\\album.txt' INTO TABLE album
FIELDS TERMINATED BY ','
ENCLOSED BY '\"'
LINES TERMINATED BY '\n';

#4.Songs:
CREATE TABLE IF NOT EXISTS songs(S_id varchar(40) NOT NULL,S_name varchar(120) NOT NULL, S_durat_ms int(10), S_genre varchar(100) NOT NULL,S_popularity int(4),S_avail_markets varchar(250),S_AL_id varchar(40) ,S_A_id int(20),primary key(S_id), foreign key(S_A_id) references artist(A_id),foreign key(S_AL_id) references album(Al_id) ON DELETE RESTRICT
ON UPDATE CASCADE);
SET foreign_key_checks = 0;
LOAD DATA INFILE 'C:\\Users\\Melina\\Desktop\\baseis  dedomenwn\\songs.txt' INTO TABLE songs
FIELDS TERMINATED BY ','
ENCLOSED BY '\"'
LINES TERMINATED BY '\n';


#5.Fav.Playlist:
CREATE TABLE IF NOT EXISTS  Fav_playlist (FavP_id INT(4) NOT NULL,F_U_id INT(3) NOT NULL,PRIMARY KEY(FavP_id),foreign key(F_U_id) references User(U_id) ON DELETE RESTRICT
ON UPDATE CASCADE);
##
LOAD DATA INFILE 'C:\\Users\\Melina\\Desktop\\baseis  dedomenwn\\Fav_Playlist.txt' INTO TABLE fav_Playlist
FIELDS TERMINATED BY ','
ENCLOSED BY '\"'
LINES TERMINATED BY '\n';


#6.Follow:
CREATE TABLE IF NOT EXISTS  follow(fU_id INT(3) NOT NULL,fA_id INT(4) NOT NULL,Followers int(20), primary key(fA_id), foreign key(fA_id) references artist(A_id), foreign key(fU_id) references User(U_id)ON DELETE RESTRICT
ON UPDATE CASCADE);
##
LOAD DATA INFILE 'C:\\Users\\Melina\\Desktop\\baseis  dedomenwn\\follow.txt' INTO TABLE follow
FIELDS TERMINATED BY ','
ENCLOSED BY '\"'
LINES TERMINATED BY '\n';

#7.Consists:
CREATE TABLE IF NOT EXISTS consists (
cS_id varchar(40) NOT NULL,
cFavP_id INT(4) NOT NULL,
SUM_durat_min int(4) NOT NULL,
PRIMARY KEY (cS_id, cFavP_id),
FOREIGN KEY (cS_id) REFERENCES songs(S_id),
FOREIGN KEY (cFavP_id) REFERENCES fav_playlist(FavP_id)
ON DELETE RESTRICT
ON UPDATE CASCADE
);
LOAD DATA INFILE 'C:\\Users\\Melina\\Desktop\\baseis  dedomenwn\\consists.txt' INTO TABLE consists
FIELDS TERMINATED BY ','
ENCLOSED BY '\"'
LINES TERMINATED BY '\n';


#8.Listento:
CREATE TABLE IF NOT EXISTS Listento (LU_id INT(3) NOT NULL, LS_id varchar(40) NOT NULL, Streams int(15) , primary key(LU_id, LS_id) , foreign key(LU_id) references user(U_id) , foreign key(LS_id) references songs(S_id)ON DELETE RESTRICT
ON UPDATE CASCADE);
LOAD DATA INFILE 'C:\\Users\\Melina\\Desktop\\baseis  dedomenwn\\Listento.txt' INTO TABLE Listento
FIELDS TERMINATED BY ','
ENCLOSED BY '\"'
LINES TERMINATED BY '\n';

##Δύο εισαγωγές(insertions):
INSERT INTO User (U_id, U_Name, U_email, U_Bdate, Gender)
VALUES (539, 'Dol Melina', 'melinadol@gmail.com', '1995-06-10', 'Female');
INSERT INTO User (U_id, U_Name, U_email, U_Bdate, Gender) 
VALUES (540,'Man Vicky', 'vickyman@gmail.com', '1996-07-01','Female');

##Δύο ενημερώσεις πινάκων(updates):
UPDATE User
SET  U_Bdate ='1987-03-10', Gender='Female'
WHERE U_id=521; 
UPDATE User
SET  U_Bdate ='1990-06-05'
WHERE U_id=522; 

##Δύο + 2 διαγραφές(deletions): 
#delete from user where U_name like '%Mel%'
#delete from user where U_id=539
#drop table artist
#drop database spotify
