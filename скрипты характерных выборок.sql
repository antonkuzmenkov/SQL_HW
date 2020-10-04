select
	*
from 
	models

-------------

select
	model_id
	count(*)
from
	models
group by
	model_id
having count(*) > 1

----------------

select
	s.model_id
	, r.name
from
	segment s
	join SEGMENT_REQUEST_RULES r 
		on r.SEGMENT_REQUEST_RULE_ID = s.SEGMENT_REQUEST_RULE_ID

---------------

select
	s.model_id
	, r.name
from
	segment s
	left join SEGMENT_REQUEST_RULES r 
		on r.SEGMENT_REQUEST_RULE_ID = s.SEGMENT_REQUEST_RULE_ID


----------------

with cte as
(
select
	SEGMENT_REQUEST_RULE_ID
	, code
from
	SEGMENT_REQUEST_RULES 
)

select
	s.model_id
	, c.code
from
	segment s
	join cte c
		on c.SEGMENT_REQUEST_RULE_ID = s.SEGMENT_REQUEST_RULE_ID