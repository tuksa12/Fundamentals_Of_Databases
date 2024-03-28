#GDB - Blatt Nr. 5
#________________________________________________________________________

#Hausaufgabe 1

#a)
select distinct s.name
from Studenten s, hoeren h, Vorlesungen v, Professoren p
where s.MatrNr = h.MatrNr and h.VorlNr = v.VorlNr and v.gelesenvon = p.persNr
				and p.name = 'Sokrates'

#b)
select distinct s.name
from Studenten s, Vorlesungen v, hoeren h
where v.VorlNr = h.VorlNr and h.MatrNr = s.MatrNr and s.name <> 'Fichte' and v.titel
					in (select v.titel
                   from Vorlesungen v, hoeren h, Studenten s
                   where v.VorlNr = h.VorlNr and h.MatrNr = s.MatrNr and s.name =
                  'Fichte')

#c)
select distinct a.name, a.PersNr
from Studenten s, Vorlesungen v, Professoren p, hoeren h, Assistenten a
where h.MatrNr = s.MatrNr and h.VorlNr = v.VorlNr and p.PersNr = v.gelesenvon
		and p.PersNr = a.Boss and s.Name = 'Carnap'

#d)
select distinct p.name
from Studenten s, Vorlesungen v, Professoren p, hoeren h
where h.MatrNr = s.MatrNr and h.VorlNr = v.VorlNr and p.PersNr = v.gelesenvon
		and s.Name = 'Theophrastos'

#e)
select distinct v.Titel
from Studenten s, Vorlesungen v, hoeren h
where h.MatrNr = s.MatrNr and h.VorlNr = v.VorlNr and s.Semester <= 6

#f)
with anzahl as (select count (h.MatrNr) as AnzStudenten , h.vorlNr
                from hoeren h
                group by h.VorlNr)
select v.titel, a.anzstudenten
from anzahl a, Vorlesungen v
where a.vorlnr = v.vorlnr

#Hausaufagabe 2

#a)
select avg(s.Semester)
from Studenten s

#b)
select avg(s.Semester)
from Studenten s, hoeren h, Vorlesungen v, Professoren p
where s.matrnr = h.matrnr and h.vorlnr = v.vorlnr and p.persnr = v.gelesenvon and p.name = 'Sokrates'