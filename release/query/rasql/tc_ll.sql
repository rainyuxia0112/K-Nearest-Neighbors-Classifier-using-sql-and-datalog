-- hint: shuffle

create table arc(ID integer, A float, B float, L string);
create table rc(ID integer, C float, D float, M string);

-- -- WITH recursive tc (A, B)
-- -- AS  (SELECT A, B FROM arc)
-- --         UNION
-- --     (SELECT tc.A, arc.B FROM tc, arc WHERE tc.B = arc.A)
-- -- SELECT A, B FROM tc


-- -- let us say k = 10 and find the label
CREATE VIEW knn(IDb, L, cou) AS
select IDb, L, count(IDa) as cou
from (
		select IDa, IDb, distance, L, rank() over(partition by IDb order by distance) as rank
	from (
		select arc.ID AS IDa, rc.ID as IDb, (A-C)*(A-C) + (B-D)*(B-D) AS distance, L
		from arc, rc
	) as merge
) as total
where rank <= 8
group by IDb, L;

SELECT ID, L, M
from rc,
(
	select k.IDb, k.L
	from knn k
	where k.cou >= ( select max(n.cou) from knn n where k.IDb = n.IDb)
) as final
where final.IDb = rc.ID;




