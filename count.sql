select count(m.id)
from mount m
join instance i on m.instance_id = i.id
join volume v on m.volume_id = v.id
where i.state = 'purged'
and (v.data like '%"isHostPath":true%' or v.data like '%"driver":"local"%');
