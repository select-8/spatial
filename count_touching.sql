
with ids as (
	select 
		gid, geometrytype(geom), fclass
	from 
		layers.row),
is_touching as (
	select 
		a.gid,
		count(a.geom) 
	from 
		layers.row as a, 
		layers.row as b
	where 
		st_touches(a.geom,b.geom) 
	group by 
		a.gid)
select 
	a.gid, a.fclass,
	CASE
		WHEN COALESCE(b.count,0) = 0 THEN 'detached'
		WHEN COALESCE(b.count,0) = 1 THEN 'semi-detached'
		WHEN COALESCE(b.count,0) = 2 THEN 'thatched'
	END AS house_type
	from 
		ids as a 
	left outer join 
		is_touching as b 
	on 
		(a.gid = b.gid);
