#GDB
#Blatt Nr.06

#H1
select distinct s.Name, s.MatrNr
from pruefen p, Vorlesungen v, hoeren h, Studenten s
where p.VorlNr = h.VorlNr and h.MatrNr = p.MatrNr

#H2
select h.Team, h.Kontinent
from Spieler s, Herkunft h, Einsatz e
where s.team = h.team and s.SpielerId = e.SpielerId and e.Datum in(select MAX(e.datum)
									from Einsatz e)
                                        			and e.tore in (select MAX(e.tore)
									from Einsatz e)

#H3
with total as (select s. name, sum(SWS) as TotalSWS
from Studenten s, Vorlesungen v, Hoeren h
where s.MatrNr = h.MatrNr and v.VorlNr = h.VorlNr
group by name)

select t.name
from total t
where t.totalsws > (select avg(totalsws)
                   from total)

#H4
with vorgan as (select distinct v2.VorlNr
from Vorlesungen v1, Vorlesungen v2 ,Voraussetzen vor
where v1.VorlNr = vor.vorgaenger and v2.VorlNr = vor.nachfolger)

select distinct v3.Titel, v3.VorlNr
from Vorlesungen v3, vorgan v2, Voraussetzen vor
where v2.VorlNr = vor.vorgaenger and v3.VorlNr = vor.nachfolger