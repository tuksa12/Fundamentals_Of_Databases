#c)

#H4

with facultyTotal as (select Fakultaet, count (*) as Total
                     from StudentenGF
                     group by Fakultaet),
     facultyMen as (select Fakultaet, count(*) as Men
                   from StudentenGF
                   where Geschlecht = 'M'
                   group by Fakultaet)

select facultyTotal.Fakultaet,
	(case when Men is null then 0 else men end) / (total*1.00)
    from facultyTotal left outer join facultyMen
    on facultyTotal.Fakultaet = facultyMen.Fakultaet
