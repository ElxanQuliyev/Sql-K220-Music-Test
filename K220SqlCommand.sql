create table Authors(
Id int primary key identity,
Firstname nvarchar(50) not null,
Lastname nvarchar(50) not null,
Birthday date,
PhotoUrl varchar(500)
)
create table Musics (
Id int primary key identity,
Name nvarchar(100) not null,
LaunchDate date,
MusicLength int,
)

create table Author_To_Music(
Id int primary key identity,
MusicId int references Musics(Id),
AuthorId int references Authors(Id)
)
create table Genres(
Id int primary key identity,
Name nvarchar(100)
)

create table Genres_To_Music(
Id int primary key identity,
MusicId int references Musics(Id),
GenreId int references Genres(Id)
)

create table Users(
Id int primary key identity,
Firstname nvarchar(50) not null,
Lastname nvarchar(50) not null,
Birthday date,
Email varchar(50) not null,
Country nvarchar(100)
)

create table ListenMusic(
Id int primary key identity,
MusicId int references Musics(Id),
UserId int references Users(Id)
)

alter table ListenMusic
add ListenDate datetime 

insert into Authors values 
('Siruz','Memmedli','1975-02-27','https://cdn.oxu.az/uploads/W1siZiIsIjIwMTkvMDEvMjEvMTIvMzgvMDMvZDA3NGJmNDUtYTU2MC00NWY4LWE5MDAtZjE1ZWI0MDBmMWZlL1NJUlVaLTcuanBnIl0sWyJwIiwiZW5jb2RlIiwianBnIiwiLXF1YWxpdHkgODAiXSxbInAiLCJ0aHVtYiIsIjU5MHg1OTBcdTAwM2UiXV0?sha=d71e0748c289a3d2'),
('Leman','Sahbazova','1985-02-27','test.jpg'),
('Togrul','Esgerzade','1966-02-27','test2.jpg')

select * from Authors

insert into Musics values ('Yene o bag olaydi','1995-06-05',300),
('Something wrong','2002-06-05',320),
(N'Xatırla məni','2005-06-05',320),
(N'Neylədim','1995-06-05',250),
('Come in','2022-06-05',300),
('Eleddinin sirleri','2022-06-05',300)

insert into Author_To_Music values(1,1),(2,2),(2,3),(3,1),(3,3),(4,2),(5,1),(6,2),(7,2),(7,3)
select * from Musics


insert into Genres Values('Klasik'),('Jazz'),('Meyxana'),('Pop'),('Mix')
select * from Genres

insert into Users Values('Ramil','Murtuzayev','1995-06-05','ramil@gmail.com','Azerbaijan'),
(N'Rəna','Huseynova','1999-06-05','rena@gmail.com','Azerbaijan'),
(N'Vüqar','Hesenli','1996-06-05','vuqar@gmail.com','Greece'),
('Samir','Elekberli','1997-06-05','samir@gmail.com','Ukrain')

insert into ListenMusic values(1,1,'2022-06-05'),(1,2,'2022-06-05'),(3,2,'2022-07-12'),(4,2,'2022-07-12'),
(5,2,'2022-07-12'),(6,3,'2022-09-12'),(7,3,'2022-07-12'),(7,4,'2022-07-12')

--Create View ShowListenings  as
--select ms.Name,Count(lmc.MusicId)[Listen Count] from ListenMusic lmc
--Right Join Musics ms
--on lmc.MusicId=ms.Id
--Group By ms.Name

select * from ShowListenings
select * from GenreCount

--create view GenreCount as
--select gs.Name[Genre Name],Count(gtm.GenreId)[Music Count] from Genres_To_Music gtm
--Right Join Genres gs
--on gtm.GenreId=gs.Id
--Group By gs.Name

--Create Procedure SelectMusicByGenre @genreName nvarchar(50) as
--select ms.Name[Music Name],gs.Name[Genre Name] from Genres_To_Music gtm
--Join Musics ms
--on gtm.MusicId=ms.Id
--Join Genres gs
  f--on gtm.GenreId=gs.Id
--Where gs.Name=@genreName

exec SelectMusicByGenre @genreName='Pop'