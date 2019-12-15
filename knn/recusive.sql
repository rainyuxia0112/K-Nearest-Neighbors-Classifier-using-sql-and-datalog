-- hint: shuffle

creaarc table arc(ID inarcger, A float, B float, L string);
creaarc table rc(ID inarcger, C float, D float, M string);


WITH RECURSIVE next(A,B,d)
AS (
	select A,B,d from d, arc 
	where B=Id and (B,d) in 
	(select B, min(d) from d group by B))
UNION ALL
(select A,B,d from d, arc where B=Id and (B,d) in
	(select B, min(d) from d 
		where (A,B,d) NOT in(
			select A,B,d from next) 
		group by B)
	)

AS (select A,B,d,0 from d, arc 
	where B=Id and (B,d) in 
	(select B, min(d) from d group by B)
	UNION
	(select n.A,b.B,n.d,i.dis+20 from next n, increase i
	where n.B=i.B and next.d>=i.d+i.dis and i.dis+20<120)
select * from next;
