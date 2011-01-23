select *
from Word
where CreateTime between GETDATE()-1  and GETDATE()
order by CreateTime asc--202 9 and 25 -> 200

select *
from Word
where CreateTime between GETDATE()-2  and GETDATE()-1
order by CreateTime asc --200row 8 and 24

select *
from Word
where CreateTime between GETDATE()-3 and GETDATE()-2
order by CreateTime asc --199row 7 and 23 -> 200

select *
from Word
where CreateTime between GETDATE()-4  and GETDATE()-3
order by CreateTime asc --300row

select *
from Word
where CreateTime between GETDATE()-5  and GETDATE()-4
order by CreateTime asc --100row

select *
from Word
where CreateTime between GETDATE()-6  and GETDATE()-5
order by CreateTime asc --100row

select *
from Word
where CreateTime between GETDATE()-15  and GETDATE()-6
order by CreateTime asc --101row