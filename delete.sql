delete m
from mount as m
join (
	select mm.id 
	from mount as mm
	join instance as i on mm.instance_id = i.id
	join volume as v on mm.volume_id = v.id
	where i.state = 'purged'
	and (v.data like '%"isHostPath":true%' or v.data like '%"driver":"local"%')
	limit 1000
) mx on m.id = mx.id;
