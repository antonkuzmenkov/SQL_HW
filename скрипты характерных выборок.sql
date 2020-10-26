# Проверка на дубликаты
select
	model_id
	, model_group_id
	, count(*)
from
	models
group by
	model_id
	, model_group_id
having
	count(*)>1

# Обьедиение сегмента и модели

select 
	s.name
	, m.name
from
	models m
	left join segmets s 
		on m.segment_id = s.segment_id
where segment_id not in(1,2)

# Обьединение и убираем null значения

select
	s.name
	, r.name
from
	segments s
	left join SEGMENT_REQUEST_RULES r
		on s.SEGMENT_REQUEST_RULES_id = r.SEGMENT_REQUEST_RULES_id
where
	r.name is not null

# c with

with cte as
(
select
	s.name
	, r.name
from
	segments s
	left join SEGMENT_REQUEST_RULES r
		on s.SEGMENT_REQUEST_RULES_id = r.SEGMENT_REQUEST_RULES_id
)
select
	*
from 
	cte
where
	r.name is not null