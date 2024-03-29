#GDB Blatt 07

#H1

with ZehnkampfD (Name, Disziplin, Punkte) as ( values
('Bolt', '100m', 50),
('Bolt', 'Weitsprung', 50),
('Eaton', '100m', 40),
('Eaton', 'Weitsprung', 60),
('Suarez', '100m', 60),
('Suarez', 'Weitsprung', 60),
('Behrenbruch', '100m', 30),
('Behrenbruch', 'Weitsprung', 50))

select *
from ZehnkampfD z
where z.Punkte = (
select max(z.Punkte)
from ZehnkampfD z
where Punkte not in (select z.Punkte
                	from ZehnkampfD z
                	where z.Punkte = (select max(z.Punkte)
                    from ZehnkampfD z)))

#H3
#a)
update Professoren
set rang = 'C4'
where rang = 'C3';

#b)
delete
from assistenten
where fachgebiet = 'Planetenbewegungen';

#c)
insert into vorlesungen
select (5278, 'Grundagen: Datenbanken', 4, PersNr)
from Professoren
where name = 'Curie';

insert into voraussetzung
select (vorlnr, 5278)
from Vorlesungen
where titel = 'Logik';

insert into hoeren values (28106, 5278);

#H4
#a)
create table User
	(id integer not null primary key,
     name varchar (50) not null unique)
create table follows
	(follower_id integer not null references User,
     follows_id integer not null references User)
     primary key (follower_id, follows_id)
create table likes
	(user_id integer not null references User,
    tweet_id integer not null references Tweet,
    datum timestamp not null)
    primary key (user_id, tweet_id)
create table Tweet
	(id integer not null primary key,
     userId integer null references User,
     datum timestamp not null,
     tweet_text varchar (120) not null)

#b)
create table User
	(id integer not null primary key,
     name varchar (50) not null unique)
create table follows
	(follower_id integer not null references User on delete cascade,
     follows_id integer not null references User on delete cascade)
     primary key (follower_id, follows_id)
create table likes
	(user_id integer not null references User on delete cascade,
    tweet_id integer not null references Tweet on delete cascade,
    datum timestamp not null)
    primary key (user_id, tweet_id)
create table Tweet
	(id integer not null primary key,
     userId integer null references User on delete set null,
     datum timestamp not null,
     tweet_text varchar (120) not null)

#c)
create table User
	(id integer not null primary key,
     name varchar (50) not null unique)
create table follows
	(follower_id integer not null references User on delete cascade,
     follows_id integer not null references User on delete cascade)
     primary key (follower_id, follows_id)
create table likes
	(user_id integer not null references User on delete cascade,
    tweet_id integer not null references Tweet on delete cascade,
    datum timestamp not null)
    primary key (user_id, tweet_id)
    check (exists (select *
                  from Tweet t
                  where t.id = tweet_id and t.datum <= datum))
create table Tweet
	(id integer not null primary key,
     userId integer null references User on delete set null,
     datum timestamp not null,
     tweet_text varchar (120) not null,
     check(userId is not null or tweet_text = 'removed'));